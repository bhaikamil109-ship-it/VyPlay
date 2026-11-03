import 'dart:developer';
import 'dart:io';

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit_config.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
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

/// Merges separate video and audio streams into a single playable file.
///
/// This replaces the previous Android-only `MediaMuxer` implementation. The
/// merge now runs through FFmpeg on every platform, which means:
///   - one code path instead of an Android branch plus a desktop branch,
///   - correct handling of codec/container combinations MP4 cannot hold
///     (VP9 + Opus goes to MKV rather than producing a broken MP4),
///   - stream copy by default, so no quality is lost to re-encoding.
class FfmpegMuxer {
  FfmpegMuxer({MethodChannel? planChannel})
      : _planChannel = planChannel ??
            const MethodChannel('com.fazilvk.fluxtube/muxer');

  final MethodChannel _planChannel;

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
    var container = _containerFromPath(outputPath);

    if (Platform.isAndroid) {
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

    final command = _buildCommand(
      videoPath: videoPath,
      audioPath: audioPath,
      outputPath: targetPath,
      container: container,
    );

    log('[Mux] Running: ffmpeg $command');

    final session = await FFmpegKit.execute(command);
    final returnCode = await session.getReturnCode();
    final logs = await session.getAllLogsAsString();

    if (!ReturnCode.isSuccess(returnCode)) {
      // Never leave a half-written file behind on failure.
      if (await target.exists()) {
        await target.delete();
      }
      final code = returnCode?.getValue();
      log('[Mux] FFmpeg failed (exit $code): $logs');
      throw MuxFailure(
        'FFmpeg could not merge the video and audio streams '
        '(exit code $code). The selected resolution may have no compatible '
        'audio track. Try a lower resolution, or download the streams '
        'separately.',
        exitCode: code,
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
  String _buildCommand({
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

  String _containerFromPath(String path) {
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
