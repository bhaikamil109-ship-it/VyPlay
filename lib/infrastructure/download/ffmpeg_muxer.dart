import 'dart:developer';
import 'dart:io';

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Result of a successful video/audio merge.
class MuxResult {
  const MuxResult({
    required this.outputPath,
    required this.container,
    required this.usedStreamCopy,
  });

  /// Absolute path of the merged file that actually exists on disk.
  final String outputPath;

  /// `mp4` or `mkv`.
  final String container;

  /// True when FFmpeg copied the streams without re-encoding.
  final bool usedStreamCopy;
}

/// Thrown when the merge could not be completed.
///
/// Callers must treat this as a hard failure: a video-only file saved under
/// the requested name would look like a successful download while silently
/// dropping the audio track.
class MuxFailure implements Exception {
  MuxFailure(this.message, {this.exitCode});

  final String message;
  final int? exitCode;

  @override
  String toString() => message;
}

/// Outcome of a single FFmpeg invocation.
///
/// Only the exit code and the log tail matter to the merge flow: a non-zero
/// code means the output must be discarded, and a zero code still has to be
/// confirmed against the file on disk.
class FfmpegRunResult {
  const FfmpegRunResult({required this.exitCode, this.logs = ''});

  /// Process exit code. `0` means FFmpeg reported success.
  final int exitCode;

  /// Combined FFmpeg log output, used for diagnostics on failure.
  final String logs;

  bool get isSuccess => exitCode == 0;
}

/// Runs one FFmpeg command and reports its exit code.
///
/// This is a seam, not an abstraction for its own sake: `FFmpegKit` is a
/// static plugin API that needs the native library, so the merge flow can only
/// be exercised in a unit test if the command execution can be replaced.
typedef FfmpegRunner = Future<FfmpegRunResult> Function(String command);

/// Default runner: hands the command to `ffmpeg_kit_flutter_new`.
Future<FfmpegRunResult> runFfmpegCommand(String command) async {
  final session = await FFmpegKit.execute(command);
  final returnCode = await session.getReturnCode();
  final logs = await session.getAllLogsAsString();
  return FfmpegRunResult(
    exitCode: returnCode?.getValue() ?? -1,
    logs: logs ?? '',
  );
}

/// Merges separate video and audio streams into a single playable file.
///
/// This replaces the previous Android-only `MediaMuxer` implementation. The
/// merge now runs through FFmpeg on every platform, which means:
///   - one code path instead of an Android branch plus a desktop branch,
///   - correct handling of codec/container combinations MP4 cannot hold
///     (VP9 + Opus goes to MKV rather than producing a broken MP4),
///   - stream copy by default, so no quality is lost to re-encoding.
class FfmpegMuxer {
  FfmpegMuxer({
    MethodChannel? planChannel,
    FfmpegRunner? runner,
    bool? isAndroid,
  })  : _planChannel = planChannel ??
            const MethodChannel('com.fazilvk.fluxtube/muxer'),
        _runner = runner ?? runFfmpegCommand,
        _isAndroid = isAndroid ?? Platform.isAndroid;

  final MethodChannel _planChannel;

  /// Executes the FFmpeg command. Injectable so the merge flow is testable
  /// without the native binary.
  final FfmpegRunner _runner;

  /// Whether the native mux-plan channel should be consulted. Injectable so
  /// the Android branch is reachable from a host-platform unit test.
  final bool _isAndroid;

  /// Merges [videoPath] and [audioPath] into [outputPath].
  ///
  /// On Android the native side is asked for a mux plan first (input
  /// validation + container choice). On other platforms the container is
  /// derived from the file extensions.
  Future<MuxResult> merge({
    required String videoPath,
    required String audioPath,
    required String outputPath,
  }) async {
    final videoFile = File(videoPath);
    final audioFile = File(audioPath);

    if (!await videoFile.exists() || await videoFile.length() == 0) {
      throw MuxFailure('Video stream file is missing or empty: $videoPath');
    }
    if (!await audioFile.exists() || await audioFile.length() == 0) {
      throw MuxFailure('Audio stream file is missing or empty: $audioPath');
    }

    var targetPath = outputPath;
    var container = containerFromPath(outputPath);

    if (_isAndroid) {
      try {
        final plan = await _planChannel.invokeMapMethod<String, dynamic>(
          'resolveMuxPlan',
          <String, dynamic>{
            'videoPath': videoPath,
            'audioPath': audioPath,
            'outputPath': outputPath,
          },
        );
        if (plan != null) {
          targetPath = (plan['outputPath'] as String?) ?? outputPath;
          container = (plan['container'] as String?) ?? container;
        }
      } on PlatformException catch (e) {
        // A plan failure means the inputs are unusable; surface it rather
        // than attempting a merge that is guaranteed to fail.
        throw MuxFailure(e.message ?? 'Could not prepare the merge: ${e.code}');
      } on MissingPluginException {
        // Channel unavailable (e.g. a test harness). Fall back to the
        // extension-derived container and let FFmpeg decide.
        log('[Mux] Native mux plan channel unavailable, using $container');
      }
    }

    // Remove any stale output so a failed run cannot leave a partial file
    // that later looks like a completed download.
    final target = File(targetPath);
    if (await target.exists()) {
      await target.delete();
    }

    final command = buildCommand(
      videoPath: videoPath,
      audioPath: audioPath,
      outputPath: targetPath,
      container: container,
    );

    log('[Mux] Running: ffmpeg $command');

    final run = await _runner(command);

    if (!run.isSuccess) {
      // Never leave a half-written file behind on failure.
      if (await target.exists()) {
        await target.delete();
      }
      log('[Mux] FFmpeg failed (exit ${run.exitCode}): ${run.logs}');
      throw MuxFailure(
        'FFmpeg could not merge the video and audio streams '
        '(exit code ${run.exitCode}). The selected resolution may have no '
        'compatible audio track. Try a lower resolution, or download the '
        'streams separately.',
        exitCode: run.exitCode,
      );
    }

    // A zero exit code is not enough: confirm the file is really there and
    // non-empty before reporting success.
    if (!await target.exists() || await target.length() == 0) {
      throw MuxFailure(
        'FFmpeg reported success but produced no usable output file at '
        '$targetPath.',
      );
    }

    log('[Mux] Merge complete: $targetPath (${await target.length()} bytes)');

    return MuxResult(
      outputPath: targetPath,
      container: container,
      usedStreamCopy: true,
    );
  }

  /// Stream-copy merge. `-map` pins the first video track from the video file
  /// and the first audio track from the audio file, which is what the
  /// download pipeline always intends.
  ///
  /// Public and annotated for tests: the exact argument list is part of the
  /// contract (stream copy, `+faststart` for MP4, `-shortest`), so it is
  /// asserted directly rather than inferred from a real FFmpeg run.
  @visibleForTesting
  String buildCommand({
    required String videoPath,
    required String audioPath,
    required String outputPath,
    required String container,
  }) {
    final buffer = StringBuffer()
      ..write('-hide_banner -loglevel error ')
      ..write('-i "${_escape(videoPath)}" ')
      ..write('-i "${_escape(audioPath)}" ')
      ..write('-map 0:v:0 -map 1:a:0 ')
      ..write('-c copy ');

    if (container == 'mp4') {
      // `+faststart` moves the moov atom to the front so the file plays
      // immediately when streamed or opened by a gallery app.
      buffer.write('-movflags +faststart ');
    }

    // `-shortest` trims the longer stream so the output does not end with a
    // frozen frame or trailing silence when durations differ.
    buffer
      ..write('-shortest ')
      ..write('-y ')
      ..write('"${_escape(outputPath)}"');

    return buffer.toString();
  }

  @visibleForTesting
  String containerFromPath(String path) {
    final lower = path.toLowerCase();
    if (lower.endsWith('.mkv')) return 'mkv';
    if (lower.endsWith('.webm')) return 'webm';
    return 'mp4';
  }

  String _escape(String value) => value.replaceAll('"', r'\"');

  /// Releases FFmpegKit resources. Safe to call more than once.
  static Future<void> dispose() async {
    await FFmpegKitConfig.clearSessions();
  }
}