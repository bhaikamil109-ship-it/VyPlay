import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxtube/infrastructure/download/ffmpeg_muxer.dart';

/// Unit tests for the FFmpeg-based video/audio merger.
///
/// The merge flow is exercised without the native FFmpeg binary: the command
/// execution is replaced through [FfmpegMuxer]'s injectable runner, and the
/// Android mux-plan channel is mocked with Flutter's test binary messenger.
/// That keeps these tests fast and deterministic while still covering the
/// parts that actually decide whether a download is reported as successful:
/// the argument list, the container choice, the exit-code handling, the
/// output-file verification and the cleanup of a failed run.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const planChannelName = 'com.fazilvk.fluxtube/muxer';

  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('vyplay_mux_test');
  });

  tearDown(() async {
    if (tempDir.existsSync()) {
      await tempDir.delete(recursive: true);
    }
  });

  /// Creates a non-empty file so the input validation passes.
  Future<String> makeInput(String name, {int bytes = 64}) async {
    final file = File('${tempDir.path}/$name');
    await file.writeAsBytes(List<int>.filled(bytes, 7));
    return file.path;
  }

  String outPath(String name) => '${tempDir.path}/$name';

  /// A runner that records the command it was given and reports [exitCode].
  ///
  /// When [createOutput] is true it also writes the output file, which is what
  /// a real successful FFmpeg run would leave behind.
  FfmpegRunner fakeRunner({
    required int exitCode,
    bool createOutput = true,
    List<String>? captured,
    String logs = '',
  }) {
    return (String command) async {
      captured?.add(command);
      if (createOutput) {
        // The output path is the last quoted token of the command.
        final match = RegExp(r'"([^"]+)"\s*$').firstMatch(command);
        if (match != null) {
          await File(match.group(1)!).writeAsBytes(List<int>.filled(32, 1));
        }
      }
      return FfmpegRunResult(exitCode: exitCode, logs: logs);
    };
  }

  group('buildCommand', () {
    final muxer = FfmpegMuxer(runner: fakeRunner(exitCode: 0));

    test('pins the first video and first audio track and stream-copies', () {
      final command = muxer.buildCommand(
        videoPath: '/tmp/v.mp4',
        audioPath: '/tmp/a.m4a',
        outputPath: '/tmp/out.mp4',
        container: 'mp4',
      );

      expect(command, contains('-map 0:v:0'));
      expect(command, contains('-map 1:a:0'));
      expect(command, contains('-c copy'));
      // Stream copy must never be replaced by a re-encode.
      expect(command, isNot(contains('-c:v libx264')));
      expect(command, isNot(contains('-c:a aac')));
    });

    test('adds +faststart for an MP4 container', () {
      final command = muxer.buildCommand(
        videoPath: '/tmp/v.mp4',
        audioPath: '/tmp/a.m4a',
        outputPath: '/tmp/out.mp4',
        container: 'mp4',
      );

      expect(command, contains('-movflags +faststart'));
    });

    test('omits +faststart for an MKV container', () {
      final command = muxer.buildCommand(
        videoPath: '/tmp/v.webm',
        audioPath: '/tmp/a.webm',
        outputPath: '/tmp/out.mkv',
        container: 'mkv',
      );

      expect(command, isNot(contains('+faststart')));
    });

    test('always passes -shortest so unequal durations are trimmed', () {
      for (final container in ['mp4', 'mkv']) {
        final command = muxer.buildCommand(
          videoPath: '/tmp/v',
          audioPath: '/tmp/a',
          outputPath: '/tmp/out.$container',
          container: container,
        );
        expect(command, contains('-shortest'), reason: 'container=$container');
      }
    });

    test('overwrites without prompting and quotes both inputs and output', () {
      final command = muxer.buildCommand(
        videoPath: '/tmp/v.mp4',
        audioPath: '/tmp/a.m4a',
        outputPath: '/tmp/out.mp4',
        container: 'mp4',
      );

      expect(command, contains('-y'));
      expect(command, contains('-i "/tmp/v.mp4"'));
      expect(command, contains('-i "/tmp/a.m4a"'));
      expect(command.trimRight(), endsWith('"/tmp/out.mp4"'));
    });

    test('escapes embedded quotes in a path', () {
      final command = muxer.buildCommand(
        videoPath: '/tmp/we"ird.mp4',
        audioPath: '/tmp/a.m4a',
        outputPath: '/tmp/out.mp4',
        container: 'mp4',
      );

      expect(command, contains(r'/tmp/we\"ird.mp4'));
    });
  });

  group('containerFromPath', () {
    final muxer = FfmpegMuxer(runner: fakeRunner(exitCode: 0));

    test('maps extensions to containers', () {
      expect(muxer.containerFromPath('/tmp/out.mp4'), 'mp4');
      expect(muxer.containerFromPath('/tmp/out.mkv'), 'mkv');
      expect(muxer.containerFromPath('/tmp/out.webm'), 'webm');
    });

    test('is case-insensitive', () {
      expect(muxer.containerFromPath('/tmp/OUT.MKV'), 'mkv');
    });

    test('defaults to mp4 for an unknown extension', () {
      expect(muxer.containerFromPath('/tmp/out.bin'), 'mp4');
      expect(muxer.containerFromPath('/tmp/noextension'), 'mp4');
    });
  });

  group('merge — success', () {
    test('returns the real output path and reports stream copy', () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a');
      final output = outPath('merged.mp4');

      final muxer = FfmpegMuxer(
        runner: fakeRunner(exitCode: 0),
        isAndroid: false,
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

    test('runs the command built for the resolved container', () async {
      final video = await makeInput('v.webm');
      final audio = await makeInput('a.webm');
      final output = outPath('merged.mkv');
      final captured = <String>[];

      final muxer = FfmpegMuxer(
        runner: fakeRunner(exitCode: 0, captured: captured),
        isAndroid: false,
      );

      await muxer.merge(
        videoPath: video,
        audioPath: audio,
        outputPath: output,
      );

      expect(captured, hasLength(1));
      expect(captured.single, contains('-map 0:v:0 -map 1:a:0'));
      expect(captured.single, isNot(contains('+faststart')));
    });

    test('deletes a stale output file before running', () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a');
      final output = outPath('merged.mp4');
      // A leftover file from an earlier attempt must not be mistaken for the
      // result of this run.
      await File(output).writeAsBytes(List<int>.filled(999, 3));

      final muxer = FfmpegMuxer(
        runner: fakeRunner(exitCode: 0),
        isAndroid: false,
      );

      final result = await muxer.merge(
        videoPath: video,
        audioPath: audio,
        outputPath: output,
      );

      expect(result.outputPath, output);
      // The fake runner writes 32 bytes; the stale 999-byte file is gone.
      expect(await File(output).length(), 32);
    });
  });

  group('merge — failure', () {
    test('throws MuxFailure carrying the exit code on a non-zero result',
        () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a');

      final muxer = FfmpegMuxer(
        runner: fakeRunner(exitCode: 1, createOutput: false, logs: 'boom'),
        isAndroid: false,
      );

      await expectLater(
        muxer.merge(
          videoPath: video,
          audioPath: audio,
          outputPath: outPath('merged.mp4'),
        ),
        throwsA(
          isA<MuxFailure>().having((e) => e.exitCode, 'exitCode', 1),
        ),
      );
    });

    test('deletes the partial output file when the merge fails', () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a');
      final output = outPath('merged.mp4');

      final muxer = FfmpegMuxer(
        // The runner writes a partial file, then reports failure — exactly the
        // case that used to leave a broken file behind.
        runner: fakeRunner(exitCode: 1, createOutput: true),
        isAndroid: false,
      );

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

      final muxer = FfmpegMuxer(
        runner: fakeRunner(exitCode: 1, createOutput: false),
        isAndroid: false,
      );

      await expectLater(
        muxer.merge(
          videoPath: video,
          audioPath: audio,
          outputPath: outPath('merged.mp4'),
        ),
        throwsA(isA<MuxFailure>()),
      );

      // Phase 5 rule: never delete the downloaded streams on a failed merge.
      expect(File(video).existsSync(), isTrue);
      expect(File(audio).existsSync(), isTrue);
    });

    test('throws when FFmpeg reports success but writes no output', () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a');

      final muxer = FfmpegMuxer(
        runner: fakeRunner(exitCode: 0, createOutput: false),
        isAndroid: false,
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
            contains('no usable output file'),
          ),
        ),
      );
    });

    test('throws when the output file is created but empty', () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a');
      final output = outPath('merged.mp4');

      final muxer = FfmpegMuxer(
        runner: (command) async {
          await File(output).writeAsBytes(const <int>[]);
          return const FfmpegRunResult(exitCode: 0);
        },
        isAndroid: false,
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
    test('rejects a missing video file without running FFmpeg', () async {
      final audio = await makeInput('a.m4a');
      var ran = false;

      final muxer = FfmpegMuxer(
        runner: (command) async {
          ran = true;
          return const FfmpegRunResult(exitCode: 0);
        },
        isAndroid: false,
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

    test('rejects an empty audio file without running FFmpeg', () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a', bytes: 0);
      var ran = false;

      final muxer = FfmpegMuxer(
        runner: (command) async {
          ran = true;
          return const FfmpegRunResult(exitCode: 0);
        },
        isAndroid: false,
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
          .setMockMethodCallHandler(
        const MethodChannel(planChannelName),
        null,
      );
    });

    void mockPlan(Object? Function(MethodCall call) handler) {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
        const MethodChannel(planChannelName),
        (call) async => handler(call),
      );
    }

    test('uses the container and output path returned by the native plan',
        () async {
      final video = await makeInput('v.webm');
      final audio = await makeInput('a.webm');
      final requested = outPath('merged.mp4');
      final retargeted = outPath('merged.mkv');
      final captured = <String>[];

      mockPlan((call) {
        expect(call.method, 'resolveMuxPlan');
        return <String, dynamic>{
          'outputPath': retargeted,
          'container': 'mkv',
        };
      });

      final muxer = FfmpegMuxer(
        runner: fakeRunner(exitCode: 0, captured: captured),
        isAndroid: true,
      );

      final result = await muxer.merge(
        videoPath: video,
        audioPath: audio,
        outputPath: requested,
      );

      // VP9 + Opus cannot live in MP4, so the native plan retargets to MKV.
      expect(result.container, 'mkv');
      expect(result.outputPath, retargeted);
      expect(captured.single, isNot(contains('+faststart')));
      expect(captured.single, contains('"$retargeted"'));
    });

    test('surfaces a plan failure instead of attempting a doomed merge',
        () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a');
      var ran = false;

      mockPlan((call) {
        throw PlatformException(
          code: 'MUX_PLAN_FAILED',
          message: 'Video stream file is missing or empty',
        );
      });

      final muxer = FfmpegMuxer(
        runner: (command) async {
          ran = true;
          return const FfmpegRunResult(exitCode: 0);
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
            contains('Video stream file is missing or empty'),
          ),
        ),
      );
      expect(ran, isFalse);
    });

    test('falls back to the extension container when the channel is absent',
        () async {
      final video = await makeInput('v.mp4');
      final audio = await makeInput('a.m4a');
      final output = outPath('merged.mp4');

      // No mock handler registered: the channel raises MissingPluginException,
      // which is what a non-Android host or a test harness looks like.
      final muxer = FfmpegMuxer(
        runner: fakeRunner(exitCode: 0),
        isAndroid: true,
      );

      final result = await muxer.merge(
        videoPath: video,
        audioPath: audio,
        outputPath: output,
      );

      expect(result.container, 'mp4');
      expect(result.outputPath, output);
    });
  });
}
