import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/services/download_location_service.dart';
import 'package:vyplay/core/services/saf_storage_service.dart';
import 'package:vyplay/domain/download/download_location.dart';
import 'package:vyplay/domain/download/saf_directory.dart';

const _treeUri = 'content://com.android.externalstorage.documents/tree/primary%3AVyPlay';

/// Builds a service whose channel calls are answered by [handler].
SafStorageService service(
  Future<Object?> Function(String method, Map<String, Object?>? args) handler,
) =>
    SafStorageService(invoke: handler);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SafDirectory', () {
    test('recognises tree URIs and rejects paths', () {
      expect(SafDirectory.isTreeUri(_treeUri), isTrue);
      expect(SafDirectory.isTreeUri('CONTENT://x'), isTrue);
      expect(SafDirectory.isTreeUri('/storage/emulated/0/VyPlay'), isFalse);
      expect(SafDirectory.isTreeUri(''), isFalse);
      expect(SafDirectory.isTreeUri(null), isFalse);
    });

    test('only a ready folder is usable', () {
      expect(
        const SafDirectory(uri: _treeUri, displayName: 'VyPlay').isUsable,
        isTrue,
      );
      expect(
        const SafDirectory(
          uri: _treeUri,
          displayName: 'VyPlay',
          status: SafDirectoryStatus.notWritable,
          message: 'read only',
        ).isUsable,
        isFalse,
      );
    });
  });

  group('pickDirectory', () {
    test('maps a ready payload', () async {
      final picked = await service((method, args) async {
        expect(method, 'pickDirectory');
        return {
          'uri': _treeUri,
          'displayName': 'VyPlay',
          'status': 'ready',
        };
      }).pickDirectory();

      expect(picked, isNotNull);
      expect(picked!.uri, _treeUri);
      expect(picked.displayName, 'VyPlay');
      expect(picked.status, SafDirectoryStatus.ready);
      expect(picked.isUsable, isTrue);
    });

    test('returns null when the user cancels the picker', () async {
      final picked = await service((method, args) async => null).pickDirectory();

      expect(picked, isNull);
    });

    test('keeps the notWritable status and reason', () async {
      final picked = await service((method, args) async => {
            'uri': _treeUri,
            'displayName': 'Read only card',
            'status': 'notWritable',
            'message': 'The folder is not writable.',
          }).pickDirectory();

      expect(picked!.status, SafDirectoryStatus.notWritable);
      expect(picked.isUsable, isFalse);
      expect(picked.message, contains('not writable'));
    });

    test('turns a denied permission into a user-facing exception', () async {
      final svc = service((method, args) async {
        throw PlatformException(
          code: 'PERMISSION_DENIED',
          message: 'The folder permission could not be kept.',
        );
      });

      await expectLater(
        svc.pickDirectory(),
        throwsA(isA<SafStorageException>()
            .having((e) => e.code, 'code', 'PERMISSION_DENIED')
            .having((e) => e.message, 'message', contains('permission'))),
      );
    });
  });

  group('checkDirectory', () {
    test('reports a removed SD card as unavailable', () async {
      final check = await service((method, args) async {
        expect(method, 'checkDirectory');
        expect(args, {'uri': _treeUri});
        return {
          'uri': _treeUri,
          'displayName': 'VyPlay',
          'status': 'unavailable',
          'message': 'This folder is no longer available. Pick another one.',
        };
      }).checkDirectory(_treeUri);

      expect(check!.status, SafDirectoryStatus.unavailable);
      expect(check.message, contains('no longer available'));
    });

    test('never throws when the platform rejects the call', () async {
      final check = await service((method, args) async {
        throw PlatformException(code: 'BOOM', message: 'resolver died');
      }).checkDirectory(_treeUri);

      expect(check!.status, SafDirectoryStatus.unavailable);
      expect(check.message, 'resolver died');
    });

    test('ignores plain paths without touching the channel', () async {
      var called = false;
      final check = await service((method, args) async {
        called = true;
        return null;
      }).checkDirectory('/storage/emulated/0/VyPlay');

      expect(check, isNull);
      expect(called, isFalse);
    });
  });

  group('copyIntoTree', () {
    test('returns the created document', () async {
      final document = await service((method, args) async {
        expect(method, 'copyIntoTree');
        expect(args!['sourcePath'], '/tmp/video.mp4');
        expect(args['fileName'], 'Song.mp4');
        return {
          'uri': '$_treeUri/document/primary%3AVyPlay%2FSong.mp4',
          'displayName': 'Song.mp4',
          'displayPath': 'VyPlay/Song.mp4',
        };
      }).copyIntoTree(
        treeUri: _treeUri,
        sourcePath: '/tmp/video.mp4',
        fileName: 'Song.mp4',
        mimeType: 'video/mp4',
      );

      expect(document.displayName, 'Song.mp4');
      expect(document.uri, contains('/document/'));
      expect(document.displayPath, 'VyPlay/Song.mp4');
    });

    test('surfaces a failed copy so the caller keeps the local file', () async {
      final svc = service((method, args) async {
        throw PlatformException(code: 'COPY_FAILED', message: 'disk full');
      });

      await expectLater(
        svc.copyIntoTree(
          treeUri: _treeUri,
          sourcePath: '/tmp/video.mp4',
          fileName: 'Song.mp4',
        ),
        throwsA(isA<SafStorageException>()
            .having((e) => e.message, 'message', contains('disk full'))),
      );
    });
  });

  group('grants and documents', () {
    test('persistedDirectories maps the native list', () async {
      final directories = await service((method, args) async => [
            {'uri': _treeUri, 'displayName': 'VyPlay'},
          ]).persistedDirectories();

      expect(directories, hasLength(1));
      expect(directories.first.displayName, 'VyPlay');
    });

    test('releaseDirectory reports success', () async {
      expect(
        await service((method, args) async => true).releaseDirectory(_treeUri),
        isTrue,
      );
    });

    test('deleteDocument refuses non-content paths', () async {
      var called = false;
      final deleted = await service((method, args) async {
        called = true;
        return true;
      }).deleteDocument('/storage/emulated/0/VyPlay/Song.mp4');

      expect(deleted, isFalse);
      expect(called, isFalse);
    });

    test('openDocument reports a missing handler instead of throwing', () async {
      final opened = await service((method, args) async {
        throw PlatformException(code: 'NO_HANDLER', message: 'none');
      }).openDocument(_treeUri);

      expect(opened, isFalse);
    });
  });

  group('DownloadLocationService with a SAF folder', () {
    late Directory root;

    setUp(() async {
      root = await Directory.systemTemp.createTemp('vyplay-saf-location');
    });

    tearDown(() async {
      if (await root.exists()) await root.delete(recursive: true);
    });

    DownloadLocationService location(
      Future<Object?> Function(String method, Map<String, Object?>? args) handler,
    ) =>
        DownloadLocationService(
          defaultDirectoryProvider: () async =>
              Directory('${root.path}/app/VyPlay/Downloads'),
          safService: service(handler),
        );

    test('stages downloads locally and verifies the tree grant first', () async {
      final directory = await location((method, args) async => {
            'status': 'ready',
            'displayName': 'VyPlay',
          }).resolve(configuredPath: _treeUri);

      expect(directory.path, '${root.path}/app/VyPlay/Downloads');
      expect(await directory.exists(), isTrue);
    });

    test('refuses to start when the folder was removed', () async {
      await expectLater(
        location((method, args) async => {
              'status': 'unavailable',
              'message': 'This folder is no longer available. Pick another one.',
            }).resolve(configuredPath: _treeUri),
        throwsA(isA<DownloadLocationFailure>()
            .having((e) => e.code, 'code', 'UNAVAILABLE')),
      );
    });

    test('reports a read-only folder as NOT_WRITABLE', () async {
      await expectLater(
        location((method, args) async => {
              'status': 'notWritable',
              'message': 'The folder is not writable.',
            }).resolve(configuredPath: _treeUri),
        throwsA(isA<DownloadLocationFailure>()
            .having((e) => e.code, 'code', 'NOT_WRITABLE')),
      );
    });

    test('check maps SAF statuses onto the Settings statuses', () async {
      final ready = await location((method, args) async => {
            'status': 'ready',
          }).check(configuredPath: _treeUri);
      expect(ready.status, DownloadLocationStatus.ready);
      expect(ready.isUsable, isTrue);

      final notWritable = await location((method, args) async => {
            'status': 'notWritable',
            'message': 'read only',
          }).check(configuredPath: _treeUri);
      expect(notWritable.status, DownloadLocationStatus.notWritable);
      expect(notWritable.message, 'read only');
    });

    test('publishToTree is a no-op for plain paths', () async {
      final document = await location((method, args) async {
        fail('the channel must not be used for a plain path');
      }).publishToTree(
        configuredPath: '/storage/emulated/0/VyPlay',
        localPath: '/tmp/video.mp4',
        fileName: 'video.mp4',
      );

      expect(document, isNull);
    });

    test('publishToTree copies into the chosen tree', () async {
      final document = await location((method, args) async {
        expect(method, 'copyIntoTree');
        return {
          'uri': '$_treeUri/document/x',
          'displayName': 'video.mp4',
        };
      }).publishToTree(
        configuredPath: _treeUri,
        localPath: '/tmp/video.mp4',
        fileName: 'video.mp4',
      );

      expect(document!.uri, contains('/document/x'));
    });
  });
}
