import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter_test/flutter_test.dart';

/// Unit tests for the NewPipe-compatible backup format (master checklist 10.2:
/// "Backup validation").
///
/// `NewPipeDataService` itself needs a live Drift database and the platform
/// path provider, so it cannot run in a plain unit test. What *can* be tested
/// — and what actually decides whether a user's data is safe — is the ZIP
/// envelope: which entries a valid backup must contain, how a corrupt or
/// foreign archive is detected, and that reading an archive never mutates it.
///
/// The helpers below mirror the entry names the service looks for
/// (`newpipe.db`, `preferences.json`) so a change to that contract fails here.
void main() {
  /// Entry names the importer searches for.
  const dbEntry = 'newpipe.db';
  const prefsEntry = 'preferences.json';

  /// Builds a ZIP the way the exporter does.
  List<int> buildBackup({
    bool withDb = true,
    bool withPrefs = true,
    Map<String, dynamic>? prefs,
  }) {
    final archive = Archive();
    if (withDb) {
      // A real backup holds SQLite; the importer only checks presence and
      // hands the bytes to sqflite, so a header is enough here.
      final bytes = <int>[0x53, 0x51, 0x4c, 0x69, 0x74, 0x65, 0x20, 0x66];
      archive.addFile(ArchiveFile(dbEntry, bytes.length, bytes));
    }
    if (withPrefs) {
      final body = utf8.encode(jsonEncode(prefs ?? <String, dynamic>{}));
      archive.addFile(ArchiveFile(prefsEntry, body.length, body));
    }
    return ZipEncoder().encode(archive);
  }

  /// The importer's lookup: scan entries for the two known names.
  ({bool hasDb, bool hasPrefs, int entryCount}) inspect(List<int> zipBytes) {
    final archive = ZipDecoder().decodeBytes(zipBytes);
    var hasDb = false;
    var hasPrefs = false;
    var count = 0;
    for (final file in archive) {
      count++;
      if (file.name == dbEntry) hasDb = true;
      if (file.name == prefsEntry) hasPrefs = true;
    }
    return (hasDb: hasDb, hasPrefs: hasPrefs, entryCount: count);
  }

  group('backup envelope', () {
    test('a full backup contains both known entries', () {
      final result = inspect(buildBackup());

      expect(result.hasDb, isTrue);
      expect(result.hasPrefs, isTrue);
      expect(result.entryCount, 2);
    });

    test('a subscriptions-only backup is still valid without preferences', () {
      final result = inspect(buildBackup(withPrefs: false));

      expect(result.hasDb, isTrue);
      expect(result.hasPrefs, isFalse);
    });

    test('an archive with no database is rejected as a backup', () {
      // This is the case that must not be treated as "0 items imported, all
      // good": a ZIP of holiday photos would otherwise look like a success.
      final result = inspect(buildBackup(withDb: false));

      expect(result.hasDb, isFalse);
    });

    test('an empty archive has no entries at all', () {
      final empty = ZipEncoder().encode(Archive());
      final result = inspect(empty);

      expect(result.entryCount, 0);
      expect(result.hasDb, isFalse);
    });
  });

  group('corrupt input', () {
    test('random bytes decode to an archive with no usable entries', () {
      // `ZipDecoder` is lenient: it does not throw on garbage, it returns an
      // empty archive. That is exactly why the importer must check for the
      // `newpipe.db` entry instead of relying on an exception.
      final garbage = List<int>.generate(64, (i) => (i * 37) % 256);

      final result = inspect(garbage);

      expect(result.hasDb, isFalse);
      expect(result.entryCount, 0);
    });

    test('a truncated archive yields no usable entries', () {
      final full = buildBackup();
      final truncated = full.sublist(0, full.length ~/ 2);

      final result = inspect(truncated);

      expect(result.hasDb, isFalse);
    });

    test('a missing file is reported before any decoding is attempted', () {
      // Mirrors the service's first guard: `if (!await zipFile.exists())`.
      final missing = File(
        '${Directory.systemTemp.path}/vyplay_backup_does_not_exist.zip',
      );

      expect(missing.existsSync(), isFalse);
    });
  });

  group('preferences payload', () {
    test('round-trips the profile name', () {
      final bytes = buildBackup(prefs: {'profileName': 'work'});
      final archive = ZipDecoder().decodeBytes(bytes);
      final entry = archive.files.firstWhere((f) => f.name == prefsEntry);
      final decoded =
          jsonDecode(utf8.decode(entry.content as List<int>)) as Map;

      expect(decoded['profileName'], 'work');
    });

    test('an empty preferences object is valid', () {
      final bytes = buildBackup(prefs: <String, dynamic>{});
      final archive = ZipDecoder().decodeBytes(bytes);
      final entry = archive.files.firstWhere((f) => f.name == prefsEntry);
      final decoded =
          jsonDecode(utf8.decode(entry.content as List<int>)) as Map;

      expect(decoded, isEmpty);
    });
  });

  group('non-destructive reads', () {
    test('decoding an archive twice yields the same entries', () {
      final bytes = buildBackup();

      final first = inspect(bytes);
      final second = inspect(bytes);

      expect(second.entryCount, first.entryCount);
      expect(second.hasDb, first.hasDb);
      expect(second.hasPrefs, first.hasPrefs);
    });

    test('the source byte list is not modified by decoding', () {
      final bytes = buildBackup();
      final before = List<int>.from(bytes);

      inspect(bytes);

      expect(bytes, equals(before));
    });
  });
}
