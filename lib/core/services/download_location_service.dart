import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:vyplay/core/services/saf_storage_service.dart';
import 'package:vyplay/domain/download/download_location.dart';
import 'package:vyplay/domain/download/saf_directory.dart';

/// Resolves and verifies the folder downloads are written to.
///
/// Responsibilities kept here on purpose:
///  * a user-selected folder wins, but only after a real write probe,
///  * a folder that cannot be used throws [DownloadLocationFailure] instead of
///    falling back to app storage,
///  * the fallback is used only when the user has not chosen a folder.
///
/// The probe is a real create/append/delete cycle because `exists()` is not
/// evidence of write access: on scoped storage a directory can resolve while
/// every write throws `EPERM`.
class DownloadLocationService {
  DownloadLocationService({
    Future<Directory> Function()? defaultDirectoryProvider,
    this.probeFileName = '.vyplay_write_test',
    SafStorageService? safService,
  })  : _defaultDirectoryProvider =
            defaultDirectoryProvider ?? _appDownloadsDirectory,
        _saf = safService ?? SafStorageService();

  /// Injectable so tests can point at a temp directory.
  final Future<Directory> Function() _defaultDirectoryProvider;

  /// Used when the selection is a SAF tree instead of a filesystem path.
  final SafStorageService _saf;

  /// Whether [value] is an Android SAF tree/document URI.
  static bool isTreeUri(String? value) => SafDirectory.isTreeUri(value);

  /// Name of the temporary probe file; deleted immediately after the write.
  final String probeFileName;

  static const String defaultFolderName = 'VyPlay/Downloads';

  static Future<Directory> _appDownloadsDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    return Directory('${appDir.path}/$defaultFolderName');
  }

  /// Resolves the directory a download should be written to.
  ///
  /// Throws [DownloadLocationFailure] when the user has chosen a folder and it
  /// cannot be used. Never silently substitutes another directory.
  Future<Directory> resolve({String? configuredPath}) async {
    final selected = configuredPath?.trim();
    if (selected == null || selected.isEmpty) {
      return _ensureDefaultDirectory();
    }

    // A SAF tree cannot be streamed into with a random-access writer: the
    // document is only reachable through a ContentResolver stream, and Dio
    // needs seekable files for resume and for the mux step. So downloads stage
    // in app storage and are published into the tree when they finish (see
    // DownloadImpl._publishToSelectedTree). The grant is still verified here so
    // a removed SD card or revoked permission fails before the transfer starts.
    if (SafDirectory.isTreeUri(selected)) {
      final check = await _saf.checkDirectory(selected);
      if (check == null) {
        throw const DownloadLocationFailure(
          'The download folder is no longer available. '
          'Choose another folder in Settings › Download location.',
          code: 'UNAVAILABLE',
        );
      }
      if (!check.isUsable) {
        throw DownloadLocationFailure(
          check.message ??
              'The download folder is not writable. '
                  'Choose another folder in Settings › Download location.',
          code: check.status == SafDirectoryStatus.notWritable
              ? 'NOT_WRITABLE'
              : 'UNAVAILABLE',
        );
      }
      return _ensureDefaultDirectory();
    }

    final directory = Directory(selected);
    var exists = await directory.exists();
    if (!exists) {
      // A freshly picked folder may not exist yet; creating it is fine. A
      // folder that vanished (SD card removed) can still fail here, which is
      // exactly the case that must surface an error.
      try {
        await directory.create(recursive: true);
        exists = await directory.exists();
      } on FileSystemException catch (e) {
        throw DownloadLocationFailure(
          'The download folder is no longer available '
          '(${e.osError?.message ?? e.message}). '
          'Choose another folder in Settings › Download location.',
          code: 'UNAVAILABLE',
        );
      }
      if (!exists) {
        throw const DownloadLocationFailure(
          'The download folder is no longer available. '
          'Choose another folder in Settings › Download location.',
          code: 'UNAVAILABLE',
        );
      }
    }

    final probeError = await probeWrite(directory);
    if (probeError != null) throw probeError;
    return directory;
  }

  /// Default app-private folder, created if needed.
  Future<Directory> _ensureDefaultDirectory() async {
    final directory = await _defaultDirectoryProvider();
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    return directory;
  }

  /// Writes a small probe file into [directory] and removes it.
  ///
  /// Returns null when the folder is writable, or a [DownloadLocationFailure]
  /// describing why it is not.
  Future<DownloadLocationFailure?> probeWrite(Directory directory) async {
    final probe = File('${directory.path}/$probeFileName');
    try {
      await probe.writeAsString('vyplay-write-probe', flush: true);
      if (!await probe.exists()) {
        return const DownloadLocationFailure(
          'The download folder did not accept a test file. '
          'Choose another folder in Settings › Download location.',
          code: 'NOT_WRITABLE',
        );
      }
    } on FileSystemException catch (e) {
      log('[DownloadLocation] Probe failed for ${directory.path}: $e');
      return DownloadLocationFailure(
        'The download folder is not writable '
        '(${e.osError?.message ?? e.message}). '
        'Choose another folder in Settings › Download location.',
        code: 'NOT_WRITABLE',
      );
    } finally {
      try {
        if (await probe.exists()) await probe.delete();
      } on FileSystemException {
        // Leaving a 19-byte probe behind must never fail the check.
      }
    }
    return null;
  }

  /// Copies a finished local file into the configured SAF tree.
  ///
  /// Returns null when the selection is a plain path, which needs no publish
  /// step. Throws [SafStorageException] when the copy fails so the caller can
  /// keep the local file instead of losing the download.
  Future<SafDocument?> publishToTree({
    required String? configuredPath,
    required String localPath,
    required String fileName,
    String? mimeType,
  }) {
    if (!SafDirectory.isTreeUri(configuredPath)) return Future.value(null);
    return _saf.copyIntoTree(
      treeUri: configuredPath!.trim(),
      sourcePath: localPath,
      fileName: fileName,
      mimeType: mimeType,
    );
  }

  /// Removes a document that lives in a SAF tree.
  Future<bool> deleteTreeDocument(String uri) => _saf.deleteDocument(uri);

  /// Non-throwing status check for the Settings UI.
  Future<DownloadLocationCheck> check({String? configuredPath}) async {
    final selected = configuredPath?.trim();
    if (selected == null || selected.isEmpty) {
      return const DownloadLocationCheck.unset();
    }

    if (SafDirectory.isTreeUri(selected)) {
      final check = await _saf.checkDirectory(selected);
      if (check == null) {
        return const DownloadLocationCheck(
          status: DownloadLocationStatus.unavailable,
          message: 'This folder is no longer available. Pick another one.',
        );
      }
      return DownloadLocationCheck(
        status: switch (check.status) {
          SafDirectoryStatus.ready => DownloadLocationStatus.ready,
          SafDirectoryStatus.notWritable => DownloadLocationStatus.notWritable,
          SafDirectoryStatus.unavailable => DownloadLocationStatus.unavailable,
        },
        message: check.message,
      );
    }

    final directory = Directory(selected);
    if (!await directory.exists()) {
      return const DownloadLocationCheck(
        status: DownloadLocationStatus.unavailable,
        message: 'This folder is no longer available. Pick another one.',
      );
    }

    final failure = await probeWrite(directory);
    if (failure != null) {
      return DownloadLocationCheck(
        status: DownloadLocationStatus.notWritable,
        message: failure.message,
      );
    }
    return const DownloadLocationCheck(
      status: DownloadLocationStatus.ready,
      message: null,
    );
  }
}
