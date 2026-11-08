// Settings persistence tests.
//
// VyPlay stores its settings in the Drift (SQLite) `settings_entries` table,
// not in SharedPreferences — `SettingImpl` reads and writes through
// `AppDatabase.getSetting` / `setSetting`. These tests therefore drive the
// real schema and the real queries against an in-memory executor, which is
// the closest thing to "SharedPreferences.setMockInitialValues" for this
// storage layer: no device, no file on disk, no plugin channel.
//
// What is covered:
//   * defaults when nothing has been saved yet
//   * a saved value is what comes back on the next read
//   * corrupt / invalid values fall back to a safe default
//   * type mismatch (a bool stored where an int is expected, etc.)
//   * reset / clear puts the defaults back
//   * the upsert path does not duplicate rows

import 'dart:ffi';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/open.dart' as sqlite_open;
import 'package:sqlite3/sqlite3.dart' as sqlite3;
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/core/settings.dart';
import 'package:vyplay/infrastructure/database/database.dart';

/// The same defaults `SettingImpl.initializeSettings()` seeds, kept here so a
/// test can assert against them without booting the whole DI graph.
const Map<String, String> kSettingsDefaults = {
  selectedDefaultLanguage: 'en',
  selectedDefaultQuality: '720p',
  selectedDefaultRegion: 'IN',
  selectedTheme: 'system',
  historyVisibility: 'true',
  dislikeVisibility: 'false',
  hlsPlayer: 'false',
  commentsVisibility: 'false',
  relatedVideoVisibility: 'false',
  pipDisabled: 'false',
  homeFeedModeKey: 'feedOrTrending',
  videoFitModeKey: 'contain',
  skipIntervalKey: '10',
  openLinksInBrowserKey: 'false',
  audioFocusEnabledKey: 'true',
  sponsorBlockEnabledKey: 'false',
  subtitleSizeKey: '32.0',
  autoPipEnabledKey: 'true',
};

/// Reads a setting the way `SettingImpl._getOrDefault` does: missing means
/// "seed the default and hand it back".
Future<String> readOrDefault(AppDatabase db, String name) async {
  final value = await db.getSetting(name);
  if (value == null) {
    final fallback = kSettingsDefaults[name]!;
    await db.setSetting(name, fallback);
    return fallback;
  }
  return value;
}

/// The typed readers the settings bloc uses, with the same fallbacks.
bool readBool(String? raw, {required bool fallback}) {
  if (raw == null) return fallback;
  if (raw == 'true') return true;
  if (raw == 'false') return false;
  return fallback; // corrupt value
}

int readInt(String? raw, {required int fallback}) {
  if (raw == null) return fallback;
  return int.tryParse(raw) ?? fallback;
}

double readDouble(String? raw, {required double fallback}) {
  if (raw == null) return fallback;
  return double.tryParse(raw) ?? fallback;
}

String readTheme(String? raw) {
  if (raw == 'dark') return 'dark';
  if (raw == 'light') return 'light';
  return 'system';
}

void main() {
  late AppDatabase db;

  setUpAll(() {
    // Linux CI images often ship only the runtime soname (`libsqlite3.so.0`)
    // without the `-dev` symlink `libsqlite3.so`. Point the loader at whichever
    // one exists so the suite runs on a bare host as well as on a dev box.
    if (Platform.isLinux) {
      sqlite_open.open.overrideFor(sqlite_open.OperatingSystem.linux, () {
        for (final candidate in const [
          'libsqlite3.so',
          'libsqlite3.so.0',
        ]) {
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
  });

  tearDown(() async {
    await db.close();
  });

  group('defaults when nothing has been saved', () {
    test('an untouched database returns null for every setting', () async {
      for (final name in kSettingsDefaults.keys) {
        expect(await db.getSetting(name), isNull,
            reason: '$name should not exist yet');
      }
    });

    test('readOrDefault seeds and returns the documented default', () async {
      expect(await readOrDefault(db, selectedDefaultQuality), '720p');
      expect(await readOrDefault(db, selectedTheme), 'system');
      expect(await readOrDefault(db, skipIntervalKey), '10');
      expect(await readOrDefault(db, subtitleSizeKey), '32.0');
    });

    test('seeding is idempotent — a second read does not change the value',
        () async {
      final first = await readOrDefault(db, selectedDefaultRegion);
      final second = await readOrDefault(db, selectedDefaultRegion);
      expect(first, 'IN');
      expect(second, 'IN');
    });

    test('typed readers fall back when the row is absent', () {
      expect(readBool(null, fallback: true), isTrue);
      expect(readBool(null, fallback: false), isFalse);
      expect(readInt(null, fallback: 10), 10);
      expect(readDouble(null, fallback: 32.0), 32.0);
      expect(readTheme(null), 'system');
    });
  });

  group('save then load', () {
    test('a saved string comes back unchanged', () async {
      await db.setSetting(selectedDefaultQuality, '1080p');
      expect(await db.getSetting(selectedDefaultQuality), '1080p');
    });

    test('a saved bool round-trips through the typed reader', () async {
      await db.setSetting(historyVisibility, 'false');
      final raw = await db.getSetting(historyVisibility);
      expect(readBool(raw, fallback: true), isFalse);
    });

    test('a saved int round-trips through the typed reader', () async {
      await db.setSetting(skipIntervalKey, '30');
      final raw = await db.getSetting(skipIntervalKey);
      expect(readInt(raw, fallback: 10), 30);
    });

    test('a saved double round-trips through the typed reader', () async {
      await db.setSetting(subtitleSizeKey, '48.5');
      final raw = await db.getSetting(subtitleSizeKey);
      expect(readDouble(raw, fallback: 32.0), 48.5);
    });

    test('saving the same key twice overwrites instead of duplicating',
        () async {
      await db.setSetting(selectedTheme, 'dark');
      await db.setSetting(selectedTheme, 'light');

      expect(await db.getSetting(selectedTheme), 'light');

      final rows = await db.select(db.settingsEntries).get();
      expect(rows.where((r) => r.name == selectedTheme).length, 1,
          reason: 'the unique index on name must keep a single row');
    });

    test('many settings persist independently', () async {
      await db.setSetting(selectedDefaultLanguage, 'hi');
      await db.setSetting(selectedDefaultRegion, 'US');
      await db.setSetting(autoPipEnabledKey, 'false');

      expect(await db.getSetting(selectedDefaultLanguage), 'hi');
      expect(await db.getSetting(selectedDefaultRegion), 'US');
      expect(await db.getSetting(autoPipEnabledKey), 'false');
    });

    test('a value survives a fresh read of the same database', () async {
      await db.setSetting(videoFitModeKey, 'cover');
      // Simulate the app reading it again on a later screen.
      final again = await db.getSetting(videoFitModeKey);
      expect(again, 'cover');
    });
  });

  group('corrupt / invalid values fall back safely', () {
    test('a non-boolean string falls back to the default bool', () async {
      await db.setSetting(historyVisibility, 'yes-please');
      final raw = await db.getSetting(historyVisibility);
      expect(readBool(raw, fallback: true), isTrue);
    });

    test('a non-numeric string falls back to the default int', () async {
      await db.setSetting(skipIntervalKey, 'ten');
      final raw = await db.getSetting(skipIntervalKey);
      expect(readInt(raw, fallback: 10), 10);
    });

    test('a non-numeric string falls back to the default double', () async {
      await db.setSetting(subtitleSizeKey, 'large');
      final raw = await db.getSetting(subtitleSizeKey);
      expect(readDouble(raw, fallback: 32.0), 32.0);
    });

    test('an unknown theme name falls back to system', () async {
      await db.setSetting(selectedTheme, 'neon');
      final raw = await db.getSetting(selectedTheme);
      expect(readTheme(raw), 'system');
    });

    test('an empty string is not treated as a valid bool', () async {
      await db.setSetting(autoPipEnabledKey, '');
      final raw = await db.getSetting(autoPipEnabledKey);
      expect(readBool(raw, fallback: true), isTrue);
    });

    test('a null value is stored and read back as null', () async {
      await db.setSetting(selectedDefaultQuality, null);
      expect(await db.getSetting(selectedDefaultQuality), isNull);
    });
  });

  group('type mismatch handling', () {
    test('a bool stored where an int is expected falls back', () async {
      await db.setSetting(skipIntervalKey, 'true');
      final raw = await db.getSetting(skipIntervalKey);
      expect(readInt(raw, fallback: 10), 10);
    });

    test('an int stored where a bool is expected falls back', () async {
      await db.setSetting(hlsPlayer, '1');
      final raw = await db.getSetting(hlsPlayer);
      expect(readBool(raw, fallback: false), isFalse);
    });

    test('a double stored where an int is expected falls back', () async {
      await db.setSetting(skipIntervalKey, '10.5');
      final raw = await db.getSetting(skipIntervalKey);
      expect(readInt(raw, fallback: 10), 10);
    });

    test('an int stored where a double is expected is accepted', () async {
      await db.setSetting(subtitleSizeKey, '40');
      final raw = await db.getSetting(subtitleSizeKey);
      expect(readDouble(raw, fallback: 32.0), 40.0);
    });

    test('a list-shaped value is not silently coerced to a bool', () async {
      await db.setSetting(sponsorBlockEnabledKey, 'sponsor,intro');
      final raw = await db.getSetting(sponsorBlockEnabledKey);
      expect(readBool(raw, fallback: false), isFalse);
    });
  });

  group('reset / clear restores defaults', () {
    test('deleting a row makes the next read return the default', () async {
      await db.setSetting(selectedDefaultQuality, '2160p');
      expect(await db.getSetting(selectedDefaultQuality), '2160p');

      await (db.delete(db.settingsEntries)
            ..where((t) => t.name.equals(selectedDefaultQuality)))
          .go();

      expect(await db.getSetting(selectedDefaultQuality), isNull);
      expect(await readOrDefault(db, selectedDefaultQuality), '720p');
    });

    test('clearing every row puts all defaults back', () async {
      await db.setSetting(selectedDefaultQuality, '144p');
      await db.setSetting(selectedTheme, 'dark');
      await db.setSetting(skipIntervalKey, '60');

      await db.delete(db.settingsEntries).go();

      final rows = await db.select(db.settingsEntries).get();
      expect(rows, isEmpty);

      expect(await readOrDefault(db, selectedDefaultQuality), '720p');
      expect(await readOrDefault(db, selectedTheme), 'system');
      expect(await readOrDefault(db, skipIntervalKey), '10');
    });

    test('a reset followed by a save keeps the new value', () async {
      await db.setSetting(selectedTheme, 'dark');
      await db.delete(db.settingsEntries).go();
      await db.setSetting(selectedTheme, 'light');

      expect(await db.getSetting(selectedTheme), 'light');
    });
  });

  group('enum-backed settings', () {
    test('the YouTube service round-trips by enum name', () async {
      await db.setSetting(youtubeService, YouTubeServices.newpipe.name);
      expect(await db.getSetting(youtubeService), 'newpipe');

      await db.setSetting(youtubeService, YouTubeServices.piped.name);
      expect(await db.getSetting(youtubeService), 'piped');
    });

    test('an unknown service name is preserved verbatim for the caller',
        () async {
      // The bloc decides the fallback; storage must not silently rewrite it.
      await db.setSetting(youtubeService, 'invidious');
      expect(await db.getSetting(youtubeService), 'invidious');
    });

    test('the home feed mode round-trips by enum name', () async {
      await db.setSetting(homeFeedModeKey, HomeFeedMode.feedOrTrending.name);
      expect(await db.getSetting(homeFeedModeKey), 'feedOrTrending');
    });
  });

  group('profile list persistence', () {
    test('a comma-joined profile list round-trips', () async {
      await db.setSetting(profilesListKey, 'default,work,kids');
      final raw = await db.getSetting(profilesListKey);
      expect(raw!.split(','), ['default', 'work', 'kids']);
    });

    test('an absent profile list falls back to the default profile', () async {
      final raw = await db.getSetting(profilesListKey);
      final profiles = (raw == null || raw.isEmpty) ? ['default'] : raw.split(',');
      expect(profiles, ['default']);
    });
  });
}
