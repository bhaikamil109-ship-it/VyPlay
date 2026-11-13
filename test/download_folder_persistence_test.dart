// Regression tests for persisting the user's download folder.
//
// The SAF picker returns a `content://` tree URI, not a filesystem path. Before
// this test existed, `SettingImpl.setDownloadFolderPath` wrapped whatever it was
// given in a `Directory` and called `create()`, which throws for a content URI;
// the failure was swallowed into a `Left`, so the Settings screen appeared to
// save a folder that was never stored and downloads kept going to app storage.
//
// These tests drive the real Drift schema with an in-memory executor, matching
// the pattern used by test/settings_persistence_test.dart.

import 'dart:ffi';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/open.dart' as sqlite_open;
import 'package:sqlite3/sqlite3.dart' as sqlite3;
import 'package:vyplay/core/settings.dart';
import 'package:vyplay/infrastructure/database/database.dart';
import 'package:vyplay/infrastructure/settings/setting_impl.dart';

const _treeUri =
    'content://com.android.externalstorage.documents/tree/primary%3AVyPlay';

void main() {
  late AppDatabase db;
  late SettingImpl settings;
  late Directory temp;

  setUpAll(() {
    // Bare Linux hosts often ship only `libsqlite3.so.0`.
    if (Platform.isLinux) {
      sqlite_open.open.overrideFor(sqlite_open.OperatingSystem.linux, () {
        for (final candidate in const ['libsqlite3.so', 'libsqlite3.so.0']) {
          try {
            return DynamicLibrary.open(candidate);
          } on ArgumentError {
            continue;
          }
        }
        throw StateError('No libsqlite3 shared library found');
      });
    }
  });

  setUp(() {
    db = AppDatabase.forTesting(
      NativeDatabase.opened(sqlite3.sqlite3.openInMemory()),
    );
    settings = SettingImpl(db: db);
    temp = Directory.systemTemp.createTempSync('vyplay-folder-persist');
  });

  tearDown(() async {
    await db.close();
    if (temp.existsSync()) temp.deleteSync(recursive: true);
  });

  test('a SAF tree URI is stored verbatim and survives a re-read', () async {
    final result = await settings.setDownloadFolderPath(path: _treeUri);

    expect(result.isRight(), isTrue);
    expect(result.getOrElse(() => null), _treeUri);
    expect(await db.getSetting(downloadFolderPathKey), _treeUri);

    // Simulates the next launch: the bloc reads the raw setting on startup.
    final reloaded = await settings.getDownloadFolderPath();
    expect(reloaded.getOrElse(() => null), _treeUri);
  });

  test('a whitespace-padded URI is trimmed before it is stored', () async {
    await settings.setDownloadFolderPath(path: '  $_treeUri  ');

    expect(await db.getSetting(downloadFolderPathKey), _treeUri);
  });

  test('clearing the folder empties the setting', () async {
    await settings.setDownloadFolderPath(path: _treeUri);

    final cleared = await settings.setDownloadFolderPath(path: null);

    expect(cleared.isRight(), isTrue);
    expect(cleared.getOrElse(() => 'unexpected'), isNull);
    expect(await db.getSetting(downloadFolderPathKey), '');
    expect(
      (await settings.getDownloadFolderPath()).getOrElse(() => 'unexpected'),
      isNull,
    );
  });

  test('a plain path is still created and stored as a path', () async {
    final folder = '${temp.path}/chosen/VyPlay';

    final result = await settings.setDownloadFolderPath(path: folder);

    expect(result.getOrElse(() => null), folder);
    expect(Directory(folder).existsSync(), isTrue);
    expect(await db.getSetting(downloadFolderPathKey), folder);
  });
}
