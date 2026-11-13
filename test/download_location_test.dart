import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/services/download_location_service.dart';
import 'package:vyplay/domain/download/download_location.dart';
import 'package:vyplay/domain/download/models/download_item.dart';

DownloadItem _item({
  String videoId = 'video-1',
  String quality = '720p',
  String? audioQuality = '128kbps',
  DownloadType type = DownloadType.videoWithAudio,
  String profile = 'default',
  DownloadStatus status = DownloadStatus.completed,
}) {
  return DownloadItem.create(
    videoId: videoId,
    title: 'Title',
    channelName: 'Channel',
    downloadType: type,
    profileName: profile,
    videoQuality: quality,
    audioQuality: audioQuality,
  )..status = status;
}

void main() {
  late Directory root;

  setUp(() async {
    root = await Directory.systemTemp.createTemp('vyplay-download-location');
  });

  tearDown(() async {
    if (await root.exists()) {
      await root.delete(recursive: true);
    }
  });

  DownloadLocationService service() => DownloadLocationService(
        defaultDirectoryProvider: () async =>
            Directory('${root.path}/app/VyPlay/Downloads'),
      );

  group('resolve', () {
    test('falls back to app storage only when nothing is configured', () async {
      final directory = await service().resolve(configuredPath: null);

      expect(directory.path, '${root.path}/app/VyPlay/Downloads');
      expect(await directory.exists(), isTrue);
    });

    test('treats a blank setting as unset', () async {
      final directory = await service().resolve(configuredPath: '   ');

      expect(directory.path, '${root.path}/app/VyPlay/Downloads');
    });

    test('uses the configured folder when it is writable', () async {
      final folder = Directory('${root.path}/chosen');
      await folder.create(recursive: true);

      final directory = await service().resolve(configuredPath: folder.path);

      expect(directory.path, folder.path);
      expect(await directory.exists(), isTrue);
    });

    test('creates a configured folder that does not exist yet', () async {
      final path = '${root.path}/new/nested';

      final directory = await service().resolve(configuredPath: path);

      expect(directory.path, path);
      expect(await directory.exists(), isTrue);
    });

    test('does not silently fall back when the configured path is unusable',
        () async {
      // A path under a regular file can never be a directory.
      final blocker = File('${root.path}/blocker')
        ..writeAsStringSync('not a folder');

      await expectLater(
        service().resolve(configuredPath: '${blocker.path}/downloads'),
        throwsA(isA<DownloadLocationFailure>()
            .having((e) => e.code, 'code', 'UNAVAILABLE')
            .having((e) => e.message, 'message', contains('Choose another'))),
      );
    });

    test('refuses a folder whose write probe fails', () async {
      final folder = Directory('${root.path}/probe-blocked');
      await folder.create(recursive: true);
      // Occupy the probe file's path with a directory so the write must fail.
      await Directory('${folder.path}/.vyplay_write_test').create();

      await expectLater(
        service().resolve(configuredPath: folder.path),
        throwsA(isA<DownloadLocationFailure>()
            .having((e) => e.code, 'code', 'NOT_WRITABLE')),
      );
    });
  });

  group('write probe', () {
    test('leaves no probe file behind on success', () async {
      final folder = Directory('${root.path}/clean');
      await folder.create(recursive: true);

      final failure = await service().probeWrite(folder);

      expect(failure, isNull);
      final leftovers = await folder
          .list()
          .where((entity) => entity.path.endsWith('.vyplay_write_test'))
          .toList();
      expect(leftovers, isEmpty);
    });

    test('reports NOT_WRITABLE when the probe cannot be written', () async {
      final folder = Directory('${root.path}/blocked');
      await folder.create(recursive: true);
      await Directory('${folder.path}/.vyplay_write_test').create();

      final failure = await service().probeWrite(folder);

      expect(failure, isNotNull);
      expect(failure!.code, 'NOT_WRITABLE');
    });
  });

  group('check', () {
    test('reports unset when no folder is configured', () async {
      final check = await service().check(configuredPath: null);

      expect(check.status, DownloadLocationStatus.unset);
      expect(check.isUsable, isTrue);
      expect(check.message, isNull);
    });

    test('reports ready for a writable folder', () async {
      final folder = Directory('${root.path}/ready');
      await folder.create(recursive: true);

      final check = await service().check(configuredPath: folder.path);

      expect(check.status, DownloadLocationStatus.ready);
      expect(check.isUsable, isTrue);
    });

    test('reports unavailable for a folder that no longer exists', () async {
      final check = await service()
          .check(configuredPath: '${root.path}/removed-sd-card/VyPlay');

      expect(check.status, DownloadLocationStatus.unavailable);
      expect(check.isUsable, isFalse);
      expect(check.message, isNotNull);
    });

    test('reports notWritable when the probe fails', () async {
      final folder = Directory('${root.path}/readonly');
      await folder.create(recursive: true);
      await Directory('${folder.path}/.vyplay_write_test').create();

      final check = await service().check(configuredPath: folder.path);

      expect(check.status, DownloadLocationStatus.notWritable);
      expect(check.isUsable, isFalse);
    });
  });

  group('request identity', () {
    test('same video, quality, type and profile are the same request', () {
      expect(isSameDownloadRequest(_item(), _item()), isTrue);
    });

    test('a different quality is a different request', () {
      expect(isSameDownloadRequest(_item(), _item(quality: '1080p')), isFalse);
    });

    test('a different download type is a different request', () {
      expect(
        isSameDownloadRequest(_item(), _item(type: DownloadType.videoOnly)),
        isFalse,
      );
    });

    test('a different profile is a different request', () {
      expect(isSameDownloadRequest(_item(), _item(profile: 'work')), isFalse);
    });
  });

  group('duplicate blocking', () {
    test('pending, running, merging, paused and completed all block', () {
      for (final status in [
        DownloadStatus.pending,
        DownloadStatus.downloading,
        DownloadStatus.merging,
        DownloadStatus.paused,
        DownloadStatus.completed,
      ]) {
        expect(blocksDuplicateRequest(status), isTrue, reason: status.name);
      }
    });

    test('failed and cancelled do not block a fresh attempt', () {
      expect(blocksDuplicateRequest(DownloadStatus.failed), isFalse);
      expect(blocksDuplicateRequest(DownloadStatus.cancelled), isFalse);
    });
  });

  group('retry eligibility', () {
    test('only failed and cancelled downloads can be retried', () {
      expect(canRetryDownload(DownloadStatus.failed), isTrue);
      expect(canRetryDownload(DownloadStatus.cancelled), isTrue);

      for (final status in [
        DownloadStatus.pending,
        DownloadStatus.downloading,
        DownloadStatus.merging,
        DownloadStatus.paused,
        DownloadStatus.completed,
      ]) {
        expect(canRetryDownload(status), isFalse, reason: status.name);
      }
    });
  });
}
