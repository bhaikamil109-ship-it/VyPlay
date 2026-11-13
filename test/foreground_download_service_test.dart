import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/services/foreground_download_service.dart';

/// Records channel calls and answers with [reply].
class _Recorder {
  final List<MapEntry<String, Map<String, Object?>?>> calls = [];

  Future<Object?> call(String method, Map<String, Object?>? args) async {
    calls.add(MapEntry(method, args));
    return true;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('notification text', () {
    test('is singular, plural and idle', () {
      expect(ForegroundDownloadService.textFor(1), 'Downloading 1 video');
      expect(ForegroundDownloadService.textFor(3), 'Downloading 3 videos');
      expect(ForegroundDownloadService.textFor(0), 'Finishing downloads');
    });
  });

  group('channel contract', () {
    test('start sends the active count and text', () async {
      final recorder = _Recorder();
      final service = ForegroundDownloadService(
        invoke: recorder.call,
        isAndroid: true,
      );

      expect(await service.start(activeCount: 2), isTrue);

      expect(recorder.calls.single.key, 'start');
      expect(recorder.calls.single.value, {
        'count': 2,
        'text': 'Downloading 2 videos',
      });
    });

    test('start honours an explicit text override', () async {
      final recorder = _Recorder();
      final service = ForegroundDownloadService(
        invoke: recorder.call,
        isAndroid: true,
      );

      await service.start(activeCount: 1, text: 'Merging video and audio');

      expect(recorder.calls.single.value!['text'], 'Merging video and audio');
    });

    test('update and stop reach the native side', () async {
      final recorder = _Recorder();
      final service = ForegroundDownloadService(
        invoke: recorder.call,
        isAndroid: true,
      );

      await service.update(activeCount: 3);
      await service.stop();

      expect(recorder.calls.map((c) => c.key), ['update', 'stop']);
      expect(recorder.calls.first.value!['count'], 3);
    });
  });

  group('degradation', () {
    test('is a no-op off Android', () async {
      var called = false;
      final service = ForegroundDownloadService(
        invoke: (method, args) async {
          called = true;
          return true;
        },
        isAndroid: false,
      );

      expect(await service.start(activeCount: 1), isFalse);
      expect(await service.update(activeCount: 1), isFalse);
      await service.stop();
      expect(await service.isRunning(), isFalse);
      expect(called, isFalse);
    });

    test('a missing native handler never throws', () async {
      final service = ForegroundDownloadService(
        invoke: (method, args) async => throw MissingPluginException(),
        isAndroid: true,
      );

      expect(await service.start(activeCount: 1), isFalse);
      expect(await service.update(activeCount: 1), isFalse);
      await service.stop();
      expect(await service.isRunning(), isFalse);
    });

    test('a rejected start (background restriction) is reported, not thrown',
        () async {
      final service = ForegroundDownloadService(
        invoke: (method, args) async => throw PlatformException(
          code: 'FOREGROUND_SERVICE_START_NOT_ALLOWED',
          message: 'not allowed in background',
        ),
        isAndroid: true,
      );

      expect(await service.start(activeCount: 1), isFalse);
    });

    test('isRunning reflects the native answer', () async {
      final running = ForegroundDownloadService(
        invoke: (method, args) async => true,
        isAndroid: true,
      );
      final stopped = ForegroundDownloadService(
        invoke: (method, args) async => false,
        isAndroid: true,
      );

      expect(await running.isRunning(), isTrue);
      expect(await stopped.isRunning(), isFalse);
    });
  });
}
