import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:vyplay/domain/download/saf_directory.dart';

/// Dart side of the `com.kamil.vyplay/saf` channel.
///
/// Every write into a user-picked folder goes through here because
/// `ContentResolver` streams are the only supported way to create files in a
/// folder chosen with `ACTION_OPEN_DOCUMENT_TREE` on Android 11+.
///
/// The channel call is injectable so the mapping from native payloads to
/// domain objects is testable without a device.
class SafStorageService {
  SafStorageService({Future<Object?> Function(String method, Map<String, Object?>? args)? invoke})
      : _invoke = invoke ?? _platformInvoke;

  static const MethodChannel channel = MethodChannel('com.kamil.vyplay/saf');

  final Future<Object?> Function(String method, Map<String, Object?>? args) _invoke;

  static Future<Object?> _platformInvoke(
    String method,
    Map<String, Object?>? args,
  ) =>
      channel.invokeMethod<Object?>(method, args);

  /// Opens the system folder picker.
  ///
  /// Returns null when the user backed out, and a folder carrying
  /// `unavailable`/`notWritable` when the pick landed somewhere unusable.
  Future<SafDirectory?> pickDirectory() async {
    try {
      final result = await _invoke('pickDirectory', null);
      return _toDirectory(result);
    } on PlatformException catch (e) {
      throw SafStorageException(
        e.message ?? 'The folder picker could not be opened.',
        code: e.code,
      );
    } on MissingPluginException {
      throw const SafStorageException(
        'Choosing a folder is not available on this build.',
        code: 'UNAVAILABLE',
      );
    }
  }

  /// Tree grants the app still holds after a restart.
  Future<List<SafDirectory>> persistedDirectories() async {
    try {
      final result = await _invoke('persistedDirectories', null);
      if (result is! List) return const [];
      return result
          .whereType<Map>()
          .map((entry) => _toDirectory(entry))
          .whereType<SafDirectory>()
          .toList();
    } on PlatformException {
      return const [];
    } on MissingPluginException {
      return const [];
    }
  }

  /// Re-probes a stored tree URI.
  ///
  /// Never throws: a folder that cannot be reached is reported as
  /// `unavailable`, which is what Settings needs to show.
  Future<SafDirectory?> checkDirectory(String uri) async {
    if (!SafDirectory.isTreeUri(uri)) return null;
    try {
      final result = await _invoke('checkDirectory', {'uri': uri});
      return _toDirectory(result, fallbackUri: uri);
    } on PlatformException catch (e) {
      return SafDirectory(
        uri: uri,
        displayName: 'Selected folder',
        status: SafDirectoryStatus.unavailable,
        message: e.message ?? 'This folder could not be checked.',
      );
    } on MissingPluginException {
      return SafDirectory(
        uri: uri,
        displayName: 'Selected folder',
        status: SafDirectoryStatus.unavailable,
        message: 'Choosing a folder is not available on this build.',
      );
    }
  }

  /// Gives the grant back; used by "Reset to app storage".
  Future<bool> releaseDirectory(String uri) async {
    try {
      final result = await _invoke('releaseDirectory', {'uri': uri});
      return result == true;
    } on PlatformException {
      return false;
    } on MissingPluginException {
      return false;
    }
  }

  /// Copies a finished local file into the chosen tree.
  ///
  /// Throws [SafStorageException] when the copy fails, so the caller can keep
  /// the local file instead of losing the download.
  Future<SafDocument> copyIntoTree({
    required String treeUri,
    required String sourcePath,
    required String fileName,
    String? mimeType,
  }) async {
    try {
      final result = await _invoke('copyIntoTree', {
        'treeUri': treeUri,
        'sourcePath': sourcePath,
        'fileName': fileName,
        'mimeType': mimeType,
      });
      if (result is! Map) {
        throw const SafStorageException(
          'The folder did not accept the file.',
          code: 'COPY_FAILED',
        );
      }
      return SafDocument(
        uri: result['uri'] as String? ?? treeUri,
        displayName: result['displayName'] as String? ?? fileName,
        displayPath: result['displayPath'] as String?,
      );
    } on PlatformException catch (e) {
      throw SafStorageException(
        e.message ?? 'The file could not be written to the chosen folder.',
        code: e.code,
      );
    } on MissingPluginException {
      throw const SafStorageException(
        'Writing to the chosen folder is not available on this build.',
        code: 'UNAVAILABLE',
      );
    }
  }

  /// Deletes a document the app created in a tree.
  Future<bool> deleteDocument(String uri) async {
    if (!SafDirectory.isTreeUri(uri)) return false;
    try {
      final result = await _invoke('deleteDocument', {'uri': uri});
      return result == true;
    } on PlatformException {
      return false;
    } on MissingPluginException {
      return false;
    }
  }

  /// Opens a document with the system handler.
  Future<bool> openDocument(String uri, {String? mimeType}) async {
    if (!SafDirectory.isTreeUri(uri)) return false;
    try {
      final result = await _invoke('openDocument', {
        'uri': uri,
        'mimeType': mimeType,
      });
      return result == true;
    } on PlatformException catch (e) {
      log('[SafStorage] open failed: ${e.message}');
      return false;
    } on MissingPluginException {
      return false;
    }
  }

  /// Shares a document through the system chooser.
  Future<bool> shareDocument(String uri, {String? mimeType}) async {
    if (!SafDirectory.isTreeUri(uri)) return false;
    try {
      final result = await _invoke('shareDocument', {
        'uri': uri,
        'mimeType': mimeType,
      });
      return result == true;
    } on PlatformException catch (e) {
      log('[SafStorage] share failed: ${e.message}');
      return false;
    } on MissingPluginException {
      return false;
    }
  }

  /// Maps a native payload to a [SafDirectory].
  SafDirectory? _toDirectory(Object? payload, {String? fallbackUri}) {
    if (payload is! Map) return null;
    final uri = payload['uri'] as String? ?? fallbackUri;
    if (uri == null || uri.isEmpty) return null;

    final status = switch (payload['status']) {
      'ready' => SafDirectoryStatus.ready,
      'notWritable' => SafDirectoryStatus.notWritable,
      'unavailable' => SafDirectoryStatus.unavailable,
      _ => SafDirectoryStatus.ready,
    };

    return SafDirectory(
      uri: uri,
      displayName: payload['displayName'] as String? ?? 'Selected folder',
      status: status,
      message: payload['message'] as String?,
    );
  }
}

/// A SAF operation failed with a message that is safe to show to the user.
class SafStorageException implements Exception {
  const SafStorageException(this.message, {this.code});

  final String message;
  final String? code;

  @override
  String toString() => message;
}
