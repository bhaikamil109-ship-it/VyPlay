import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/infrastructure/settings/newpipe_backup_archive.dart';

void main() {
  const databaseEntry = 'newpipe.db';
  const preferencesEntry = 'preferences.json';

  final sqliteHeader = <int>[
    0x53, 0x51, 0x4c, 0x69, 0x74, 0x65, 0x20, 0x66,
    0x6f, 0x72, 0x6d, 0x61, 0x74, 0x20, 0x33, 0x00,
  ];

  List<int> buildBackup({
    bool withDb = true,
    bool withPrefs = true,
    List<int>? dbBytes,
    int extraEntries = 0,
  }) {
    final archive = Archive();
    if (withDb) {
      final bytes = dbBytes ?? <int>[...sqliteHeader, 1, 2, 3, 4];
      archive.addFile(ArchiveFile(databaseEntry, bytes.length, bytes));
    }
    if (withPrefs) {
      final body = utf8.encode(jsonEncode(<String, dynamic>{'profile': 'work'}));
      archive.addFile(ArchiveFile(preferencesEntry, body.length, body));
    }
    for (var i = 0; i < extraEntries; i++) {
      archive.addFile(ArchiveFile('extra-$i.txt', 1, <int>[0x61]));
    }
    return ZipEncoder().encode(archive);
  }

  group('NewPipe backup validation', () {
    test('accepts a valid SQLite backup with optional preferences', () {
      final backup = NewPipeBackupArchiveValidator.decode(buildBackup());

      expect(backup.databaseBytes, <int>[...sqliteHeader, 1, 2, 3, 4]);
      expect(backup.hasPreferences, isTrue);
    });

    test('accepts a valid database without preferences', () {
      final backup = NewPipeBackupArchiveValidator.decode(
        buildBackup(withPrefs: false),
      );

      expect(backup.databaseBytes.take(16), sqliteHeader);
      expect(backup.hasPreferences, isFalse);
    });

    test('rejects archives that do not contain the required database', () {
      expect(
        () => NewPipeBackupArchiveValidator.decode(
          buildBackup(withDb: false),
        ),
        throwsFormatException,
      );
      expect(
        () => NewPipeBackupArchiveValidator.decode(
          ZipEncoder().encode(Archive()),
        ),
        throwsFormatException,
      );
    });

    test('rejects random and truncated ZIP data', () {
      final garbage = List<int>.generate(64, (i) => (i * 37) % 256);
      final full = buildBackup();
      final truncated = full.sublist(0, full.length ~/ 2);

      expect(
        () => NewPipeBackupArchiveValidator.decode(garbage),
        throwsFormatException,
      );
      expect(
        () => NewPipeBackupArchiveValidator.decode(truncated),
        throwsFormatException,
      );
    });

    test('rejects database data without the SQLite file signature', () {
      expect(
        () => NewPipeBackupArchiveValidator.decode(
          buildBackup(dbBytes: List<int>.filled(32, 0)),
        ),
        throwsFormatException,
      );
    });

    test('rejects archives with too many entries', () {
      expect(
        () => NewPipeBackupArchiveValidator.decode(
          buildBackup(
            extraEntries:
                NewPipeBackupArchiveValidator.maxArchiveEntries,
          ),
        ),
        throwsFormatException,
      );
    });

    test('rejects compressed input above the configured size limit', () {
      expect(
        () => NewPipeBackupArchiveValidator.decode(
          List<int>.filled(
            NewPipeBackupArchiveValidator.maxArchiveBytes + 1,
            0,
          ),
        ),
        throwsFormatException,
      );
    });
  });
}
