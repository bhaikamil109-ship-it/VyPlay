import 'dart:developer';
import 'dart:io';

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

  /// `mp4`, `webm` or `ogg`.
  final String container;

  /// True when the muxer copied the streams without re-encoding.
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

/// Runs the native FFmpegKit remux (with the NewPipe writer fallback) and reports the output path.
///
/// This is a seam, not an abstraction for its own sake: the merge runs in
/// native Android code through NewPipe's pure-Java muxers, so the flow can only
/// be exercised in a unit test if the channel call can be replaced.
typedef NativeMuxRunner = Future<Map<String, dynamic>> Function({
  required String videoPath,
  required String audioPath,
  required String outputPath,
});

/// Method channel that carries the muxer calls to the Android side.
/// The channel name and argument contract remain unchanged.
const MethodChannel muxerChannel =
    MethodChannel('com.kamil.vyplay/muxer');

/// Default runner: asks the native NewPipe muxer to merge the two streams.
Future<Map<String, dynamic>> runNativeMux({
  required String videoPath,
  required String audioPath,
  required String outputPath,
}) async {
  final result = await muxerChannel.invokeMapMethod<String, dynamic>(
    'mergeStreams',
    <String, dynamic>{
      'videoPath': videoPath,
      'audioPath': audioPath,
      'outputPath': outputPath,
    },
  );
  if (result == null) {
    throw MuxFailure('The native muxer returned no result.');
  }
  return result;
}

/// Merges separate video and audio streams into a single playable file.
///
/// The merge runs in native Android code through the pure-Java muxers vendored
/// from NewPipe 0.29.1 (`org.schabi.newpipe.streams`), so no FFmpeg binary is
/// involved. That means:
///   - the container is chosen from the real stream headers, not the file
///     extension, so a VP9 + Opus pair is written as WebM instead of a broken
///     MP4,
///   - the audio track is located explicitly rather than assumed to be index 0,
///   - the streams are copied, never re-encoded, so no quality is lost.
class StreamMuxer {
  StreamMuxer({
    NativeMuxRunner? runner,
    bool? isAndroid,
  })  : _runner = runner ?? runNativeMux,
        _isAndroid = isAndroid ?? Platform.isAndroid;

  /// Executes the native merge. Injectable so the merge flow is testable
  /// without the Android runtime.
  final NativeMuxRunner _runner;

  /// Whether the native muxer is reachable. Injectable so the Android branch is
  /// reachable from a host-platform unit test.
  final bool _isAndroid;

  /// Merges [videoPath] and [audioPath] into [outputPath].
  ///
  /// Returns the path that was actually written, which may differ from
  /// [outputPath] when the stream codecs require a different container.
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

    if (!_isAndroid) {
      throw MuxFailure(
        'Merging video and audio streams requires the Android native muxer.',
      );
    }

    // Remove any stale output so a failed run cannot leave a partial file that
    // later looks like a completed download.
    final requested = File(outputPath);
    if (await requested.exists()) {
      await requested.delete();
    }

    log('[Mux] Merging $videoPath + $audioPath -> $outputPath');

    final Map<String, dynamic> result;
    try {
      result = await _runner(
        videoPath: videoPath,
        audioPath: audioPath,
        outputPath: outputPath,
      );
    } on PlatformException catch (e) {
      // Never leave a half-written file behind on failure.
      await _deleteQuietly(requested);
      throw MuxFailure(
        e.message ??
            'The native muxer could not merge the video and audio streams '
                '(${e.code}).',
      );
    } on MissingPluginException {
      await _deleteQuietly(requested);
      throw MuxFailure(
        'The native muxer is unavailable on this build, so the video and '
        'audio streams could not be merged.',
      );
    }

    final targetPath = (result['outputPath'] as String?) ?? outputPath;
    final container =
        (result['container'] as String?) ?? containerFromPath(targetPath);

    // A successful native call is not enough: confirm the file is really there
    // and non-empty before reporting success.
    final target = File(targetPath);
    if (!await target.exists() || await target.length() == 0) {
      await _deleteQuietly(target);
      throw MuxFailure(
        'The muxer reported success but produced no usable output file at '
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

  @visibleForTesting
  String containerFromPath(String path) {
    final lower = path.toLowerCase();
    if (lower.endsWith('.mkv')) return 'mkv';
    if (lower.endsWith('.webm')) return 'webm';
    if (lower.endsWith('.ogg') || lower.endsWith('.opus')) return 'ogg';
    return 'mp4';
  }

  Future<void> _deleteQuietly(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
      }
    } on FileSystemException catch (e) {
      log('[Mux] Could not remove ${file.path}: $e');
    }
  }
}
