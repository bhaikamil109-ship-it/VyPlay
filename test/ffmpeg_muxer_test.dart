@TestOn('vm')
library;

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/infrastructure/download/ffmpeg_muxer.dart';
import 'package:vyplay/infrastructure/download/stream_muxer.dart'
    show NativeMuxRunner;

/// Unit tests for the NewPipe-based video/audio merger.
///
/// The merge now runs in native Android code through the pure-Java muxers
/// vendored from NewPipe 0.29.1, exposed by [StreamMuxer]. Rather than
/// invoking a binary, the flow crosses the `com.kamil.vyplay/muxer` method
/// channel, so a host-platform unit test exercises it by replacing that channel
/// with [TestDefaultBinaryMessengerBinding] and, where the contract being
/// described is the runner rather than the channel, by providing a
/// [NativeMuxRunner] via [StreamMuxer]'s constructor.
///
/// Coverage stays focused on the choice points that decide whether a download
/// is reported as successful: input validation, the wrapper around the native
/// call, the binary-messenger exceptions the native side can raise, the
/// post-merge output verification, the cleanup of a failed or partial run, and
/// the pre-deletion of a stale output file.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('vyplay_mux_test');
  });

  tearDown(() async {
    if (tempDir.existsSync()) {
      await tempDir.delete(recursive: true);
    }
  });

  /// The method channel used by the native merge.
  final muxerChannel = const MethodChannel('com.kamil.vyplay/muxer');

  /// Creates a non-empty file so the input validation passes.
  Future<String> makeInput(String name, {int bytes = 64}) async {
    final file = File('${tempDir.path}/$name');
    await file.writeAsBytes(List<int>.filled(bytes, 7));
    return file.path;
  }

  String outPath(String name) => '${tempDir.path}/$name';

  /// Returns a runner that writes a 32-byte output file and returns a native
  /// map. When [returnOutputPath] is provided the runner writes to and reports
  /// that path regardless of the path [merge] passes it; otherwise it follows
  /// the path [merge] gives it. [container] and [extras] are forwarded verbatim
  /// so call sites can simulate an arbitrary native plan without touching the
  /// method channel.
  NativeMuxRunner makeNativeRunner({
    String? returnOutputPath,
    String? container,
    Map<String, dynamic>? extras,
  }) {
    return ({
      required String videoPath,
      required String audioPath,
      required String outputPath,
    }) async {
      final target = returnOutputPath ?? outputPath;
      await File(target).writeAsBytes(List<int>.filled(32, 1));
      return <String, dynamic>{
        if (returnOutputPath != null) 'outputPath': returnOutputPath,
        if (container != null) 'container': container,
        if (extras != null) ...extras,
      };
    };
  }

  group('merge — success path', () {
    test('delegates to the native runner and returns the real output',
        () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a');
      final output = outPath('merged.mp4');

      final muxer = StreamMuxer(
        runner: makeNativeRunner(
          returnOutputPath: output,
          container: 'mp4',
        ),
        isAndroid: true,
      );

      final result = await muxer.merge(
        videoPath: video,
        audioPath: audio,
        outputPath: output,
      );

      expect(result.outputPath, output);
      expect(result.container, 'mp4');
      expect(result.usedStreamCopy, isTrue);
      expect(File(output).existsSync(), isTrue);
    });

    test('deletes a stale output file before running the merge', () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a');
      final output = outPath('merged.mp4');

      // A leftover file from an earlier attempt must not be mistaken for the
      // result of this run.
      await File(output).writeAsBytes(List<int>.filled(999, 3));

      final muxer = StreamMuxer(
        runner: makeNativeRunner(
          returnOutputPath: output,
          container: 'mp4',
        ),
        isAndroid: true,
      );

      final result = await muxer.merge(
        videoPath: video,
        audioPath: audio,
        outputPath: output,
      );

      expect(result.outputPath, output);
      // The native runner writes 32 bytes; the stale 999-byte file is gone.
      expect(await File(output).length(), 32);
    });

    test('writes the output to the native plan path, not the requested one',
        () async {
      final video = await makeInput('v.webm');
      final audio = await makeInput('a.webm');
      final requested = outPath('merged.mp4');
      final retargeted = outPath('merged.mkv');

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(muxerChannel, (call) async {
        expect(call.method, 'mergeStreams');
        await File(retargeted).writeAsBytes(List<int>.filled(32, 1));
        return <String, dynamic>{
          'outputPath': retargeted,
          'container': 'mkv',
        };
      });
      final muxer = StreamMuxer(isAndroid: true);

      final result = await muxer.merge(
        videoPath: video,
        audioPath: audio,
        outputPath: requested,
      );

      // VP9 + Opus cannot live in MP4, so the native plan retargets to MKV.
      expect(result.container, 'mkv');
      expect(result.outputPath, retargeted);
      expect(File(retargeted).existsSync(), isTrue);
    });
  });

  group('merge — failure path', () {
    test(
        'throws MuxFailure with no output on a null plan result', () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a');

      final muxer = StreamMuxer(
        runner: ({
          required String videoPath,
          required String audioPath,
          required String outputPath,
        }) async =>
            throw PlatformException(
              code: 'MUX_NO_RESULT',
              message: 'The native muxer returned no result.',
            ),
        isAndroid: true,
      );

      await expectLater(
        muxer.merge(
          videoPath: video,
          audioPath: audio,
          outputPath: outPath('merged.mp4'),
        ),
        throwsA(
          isA<MuxFailure>().having(
            (e) => e.message,
            'message',
            contains('The native muxer returned no result.'),
          ),
        ),
      );
    });

    test('deletes the partial output file when the native plan raises an error',
        () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a');
      final output = outPath('merged.mp4');

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(muxerChannel, (call) async {
        await File(output).writeAsBytes(List<int>.filled(12, 1));
        throw PlatformException(code: 'MUX_PLAN_FAILED');
      });
      final muxer = StreamMuxer(isAndroid: true);

      await expectLater(
        muxer.merge(
          videoPath: video,
          audioPath: audio,
          outputPath: output,
        ),
        throwsA(isA<MuxFailure>()),
      );

      expect(File(output).existsSync(), isFalse);
    });

    test('keeps the source streams intact when the merge fails', () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a');

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(muxerChannel, (call) async {
        throw PlatformException(code: 'MUX_PLAN_FAILED');
      });
      final muxer = StreamMuxer(isAndroid: true);

      await expectLater(
        muxer.merge(
          videoPath: video,
          audioPath: audio,
          outputPath: outPath('merged.mp4'),
        ),
        throwsA(isA<MuxFailure>()),
      );

      // The download streams are never deleted on a merge failure.
      expect(File(video).existsSync(), isTrue);
      expect(File(audio).existsSync(), isTrue);
    });

    test('throws when the native plan reports success but writes no output',
        () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a');

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(muxerChannel, (call) async {
        // The native plan says everything is fine but produces no output.
        return <String, dynamic>{};
      });
      final muxer = StreamMuxer(isAndroid: true);

      await expectLater(
        muxer.merge(
          videoPath: video,
          audioPath: audio,
          outputPath: outPath('merged.mp4'),
        ),
        throwsA(
          isA<MuxFailure>().having(
            (e) => e.message,
            'message',
            contains('no usable output file'),
          ),
        ),
      );
    });

    test('throws when the output file is created but empty', () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a');
      final output = outPath('merged.mp4');

      final muxer = StreamMuxer(
        runner: ({
          required String videoPath,
          required String audioPath,
          required String outputPath,
        }) async {
          await File(output).writeAsBytes(const <int>[]);
          return {'outputPath': output, 'container': 'mp4'};
        },
        isAndroid: true,
      );

      await expectLater(
        muxer.merge(
          videoPath: video,
          audioPath: audio,
          outputPath: output,
        ),
        throwsA(isA<MuxFailure>()),
      );
    });
  });

  group('merge — input validation', () {
    test('rejects a missing video file without calling the native runner',
        () async {
      final audio = await makeInput('a.m4a');
      var ran = false;

      final muxer = StreamMuxer(
        runner: ({
          required String videoPath,
          required String audioPath,
          required String outputPath,
        }) async {
          ran = true;
          return {'outputPath': outPath('merged.mp4'), 'container': 'mp4'};
        },
        isAndroid: true,
      );

      await expectLater(
        muxer.merge(
          videoPath: outPath('missing.mp4'),
          audioPath: audio,
          outputPath: outPath('merged.mp4'),
        ),
        throwsA(
          isA<MuxFailure>().having(
            (e) => e.message,
            'message',
            contains('Video stream file is missing'),
          ),
        ),
      );
      expect(ran, isFalse);
    });

    test('rejects an empty audio file without calling the native runner',
        () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a', bytes: 0);
      var ran = false;

      final muxer = StreamMuxer(
        runner: ({
          required String videoPath,
          required String audioPath,
          required String outputPath,
        }) async {
          ran = true;
          return {'outputPath': outPath('merged.mp4'), 'container': 'mp4'};
        },
        isAndroid: true,
      );

      await expectLater(
        muxer.merge(
          videoPath: video,
          audioPath: audio,
          outputPath: outPath('merged.mp4'),
        ),
        throwsA(
          isA<MuxFailure>().having(
            (e) => e.message,
            'message',
            contains('Audio stream file is missing'),
          ),
        ),
      );
      expect(ran, isFalse);
    });
  });

  group('merge — Android mux plan channel', () {
    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(muxerChannel, null);
    });

    test('uses the container and output path returned by the native plan',
        () async {
      final video = await makeInput('v.webm');
      final audio = await makeInput('a.webm');
      final requested = outPath('merged.mp4');
      final retargeted = outPath('merged.mkv');

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(muxerChannel, (call) async {
        expect(call.method, 'mergeStreams');
        await File(retargeted).writeAsBytes(List<int>.filled(32, 1));
        return <String, dynamic>{
          'outputPath': retargeted,
          'container': 'mkv',
        };
      });
      final muxer = StreamMuxer(isAndroid: true);

      final result = await muxer.merge(
        videoPath: video,
        audioPath: audio,
        outputPath: requested,
      );

      expect(result.container, 'mkv');
      expect(result.outputPath, retargeted);
      expect(File(retargeted).existsSync(), isTrue);
    });

    test('surfaces a plan failure instead of attempting a doomed merge',
        () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a');

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(muxerChannel, (call) async {
        throw PlatformException(
          code: 'MUX_PLAN_FAILED',
          message: 'Video stream file is missing or empty',
        );
      });
      final muxer = StreamMuxer(isAndroid: true);

      await expectLater(
        muxer.merge(
          videoPath: video,
          audioPath: audio,
          outputPath: outPath('merged.mp4'),
        ),
        throwsA(
          isA<MuxFailure>().having(
            (e) => e.message,
            'message',
            contains('Video stream file is missing or empty'),
          ),
        ),
      );
    });

    test('throws MuxFailure when the native muxer is unavailable on Android',
        () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a');

      // No real channel handler is available, so the call raises
      // MissingPluginException — the merge must translate that into a
      // MuxFailure rather than crashing.
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(muxerChannel, (call) async {
        throw MissingPluginException();
      });
      final muxer = StreamMuxer(isAndroid: true);

      await expectLater(
        muxer.merge(
          videoPath: video,
          audioPath: audio,
          outputPath: outPath('merged.mp4'),
        ),
        throwsA(
          isA<MuxFailure>().having(
            (e) => e.message,
            'message',
            contains('The native muxer is unavailable'),
          ),
        ),
      );
    });
  });

  group('containerFromPath (visibleForTesting)', () {
    test('maps extensions to containers', () {
      final muxer = StreamMuxer(isAndroid: false);
      expect(muxer.containerFromPath('/tmp/out.mp4'), 'mp4');
      expect(muxer.containerFromPath('/tmp/out.mkv'), 'mkv');
      expect(muxer.containerFromPath('/tmp/out.webm'), 'webm');
    });

    test('is case-insensitive', () {
      final muxer = StreamMuxer(isAndroid: false);
      expect(muxer.containerFromPath('/tmp/OUT.MKV'), 'mkv');
    });

    test('defaults to mp4 for an unknown extension', () {
      final muxer = StreamMuxer(isAndroid: false);
      expect(muxer.containerFromPath('/tmp/out.bin'), 'mp4');
      expect(muxer.containerFromPath('/tmp/noextension'), 'mp4');
    });
  });
}
