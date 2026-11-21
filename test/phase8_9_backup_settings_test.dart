import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/infrastructure/settings/newpipe_backup_archive.dart';

List<int> _archiveWithSettings(Object settings) {
  final archive = Archive();
  const sqliteHeader = <int>[
    0x53, 0x51, 0x4c, 0x69, 0x74, 0x65, 0x20, 0x66,
    0x6f, 0x72, 0x6d, 0x61, 0x74, 0x20, 0x33, 0x00,
  ];
  archive.addFile(ArchiveFile('newpipe.db', sqliteHeader.length, sqliteHeader));
  final bytes = utf8.encode(jsonEncode({'vyplay_settings': settings}));
  archive.addFile(ArchiveFile('preferences.json', bytes.length, bytes));
  return ZipEncoder().encode(archive)!;
}

void main() {
  group('VyPlay ZIP settings restore validation', () {
    test('accepts only known non-secret settings', () {
      final backup = NewPipeBackupArchiveValidator.decode(
        _archiveWithSettings({
          'theme': 'oled',
          'mobile-data-quality': '360',
          'youtube-cookie': 'must-not-import',
        }),
      );

      expect(backup.vyplaySettings, {
        'selectedTheme': isNot('oled'),
      }.isEmpty ? isEmpty : contains('theme'));
      expect(backup.vyplaySettings['mobile-data-quality'], '360');
      expect(backup.vyplaySettings.containsKey('youtube-cookie'), isFalse);
    });

    test('rejects malformed preferences values', () {
      expect(
        () => NewPipeBackupArchiveValidator.decode(
          _archiveWithSettings({'mobile-data-quality': 360}),
        ),
        throwsFormatException,
      );
    });

    test('rejects non-object preference documents', () {
      final archive = Archive();
      const header = <int>[
        0x53,0x51,0x4c,0x69,0x74,0x65,0x20,0x66,
        0x6f,0x72,0x6d,0x61,0x74,0x20,0x33,0x00,
      ];
      archive.addFile(ArchiveFile('newpipe.db', header.length, header));
      final bytes=utf8.encode('[]');
      archive.addFile(ArchiveFile('preferences.json', bytes.length, bytes));
      expect(
        () => NewPipeBackupArchiveValidator.decode(ZipEncoder().encode(archive)!),
        throwsFormatException,
      );
    });
  });
}
