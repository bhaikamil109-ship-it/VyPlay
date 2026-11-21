import 'package:archive/archive.dart';

/// The validated database payload from a NewPipe-compatible ZIP archive.
class ValidatedNewPipeBackup {
  const ValidatedNewPipeBackup({
    required this.databaseBytes,
    required this.hasPreferences,
  });

  final List<int> databaseBytes;
  final bool hasPreferences;
}

/// Validates untrusted ZIP backups before the importer writes a temporary DB.
///
/// The importer never extracts arbitrary entry paths. It only accepts a
/// single SQLite database entry and an optional bounded preferences entry.
class NewPipeBackupArchiveValidator {
  NewPipeBackupArchiveValidator._();

  static const int maxArchiveBytes = 64 * 1024 * 1024;
  static const int maxDatabaseBytes = 128 * 1024 * 1024;
  static const int maxPreferencesBytes = 1024 * 1024;
  static const int maxArchiveEntries = 128;
  static const int maxTotalUncompressedBytes =
      maxDatabaseBytes + maxPreferencesBytes + (2 * 1024 * 1024);

  static const List<int> _sqliteHeader = <int>[
    0x53, 0x51, 0x4c, 0x69, 0x74, 0x65, 0x20, 0x66,
    0x6f, 0x72, 0x6d, 0x61, 0x74, 0x20, 0x33, 0x00,
  ];

  /// Decodes and validates [zipBytes], throwing [FormatException] on invalid
  /// backup envelopes. Callers should apply the compressed-size limit before
  /// reading the ZIP into memory.
  static ValidatedNewPipeBackup decode(List<int> zipBytes) {
    if (zipBytes.isEmpty || zipBytes.length > maxArchiveBytes) {
      throw const FormatException('Backup archive size is not allowed');
    }

    final archive = ZipDecoder().decodeBytes(zipBytes);
    final files = archive.files;
    if (files.isEmpty || files.length > maxArchiveEntries) {
      throw const FormatException('Backup archive entry count is not allowed');
    }

    var totalUncompressedBytes = 0;
    for (final entry in files) {
      if (entry.size < 0) {
        throw const FormatException('Backup contains an invalid entry size');
      }
      totalUncompressedBytes += entry.size;
      if (totalUncompressedBytes > maxTotalUncompressedBytes) {
        throw const FormatException('Backup expands beyond the allowed size');
      }
    }

    final databaseEntries =
        files.where((entry) => entry.name == 'newpipe.db').toList();
    if (databaseEntries.length != 1 || !databaseEntries.single.isFile) {
      throw const FormatException(
        'Backup must contain exactly one newpipe.db file',
      );
    }

    final databaseEntry = databaseEntries.single;
    if (databaseEntry.size < _sqliteHeader.length ||
        databaseEntry.size > maxDatabaseBytes) {
      throw const FormatException('Backup database size is not allowed');
    }

    final databaseContent = databaseEntry.content;
    if (databaseContent is! List<int> ||
        databaseContent.length != databaseEntry.size ||
        databaseContent.length > maxDatabaseBytes) {
      throw const FormatException('Backup database content is incomplete');
    }

    for (var i = 0; i < _sqliteHeader.length; i++) {
      if (databaseContent[i] != _sqliteHeader[i]) {
        throw const FormatException('Backup database is not a SQLite file');
      }
    }

    final preferenceEntries =
        files.where((entry) => entry.name == 'preferences.json').toList();
    if (preferenceEntries.length > 1) {
      throw const FormatException('Backup contains duplicate preferences');
    }
    if (preferenceEntries.isNotEmpty) {
      final preferences = preferenceEntries.single;
      if (!preferences.isFile || preferences.size > maxPreferencesBytes) {
        throw const FormatException('Backup preferences size is not allowed');
      }
    }

    return ValidatedNewPipeBackup(
      databaseBytes: List<int>.unmodifiable(databaseContent),
      hasPreferences: preferenceEntries.isNotEmpty,
    );
  }
}
