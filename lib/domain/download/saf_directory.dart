/// A folder the user picked with Android's Storage Access Framework.
///
/// The selection is stored as a `content://` tree URI, never as a filesystem
/// path: on Android 11+ the path is neither writable nor guaranteed to keep
/// pointing at that folder after a reboot or an SD-card unmount.
class SafDirectory {
  const SafDirectory({
    required this.uri,
    required this.displayName,
    this.status = SafDirectoryStatus.ready,
    this.message,
  });

  /// The tree URI, e.g. `content://…/tree/primary%3AVyPlay`.
  final String uri;

  /// Human-readable folder name shown in Settings.
  final String displayName;

  final SafDirectoryStatus status;

  /// Why the folder cannot be used, when it cannot.
  final String? message;

  bool get isUsable => status == SafDirectoryStatus.ready;

  /// Whether [value] is a SAF document/tree URI rather than a plain path.
  static bool isTreeUri(String? value) =>
      value != null && value.toLowerCase().startsWith('content://');

  SafDirectory copyWith({
    String? uri,
    String? displayName,
    SafDirectoryStatus? status,
    String? message,
  }) =>
      SafDirectory(
        uri: uri ?? this.uri,
        displayName: displayName ?? this.displayName,
        status: status ?? this.status,
        message: message ?? this.message,
      );
}

/// Whether a picked SAF folder can currently be written to.
enum SafDirectoryStatus {
  /// Grant is held and a real probe document was written and deleted.
  ready,

  /// Folder exists but rejects writes (read-only card, full volume).
  notWritable,

  /// Grant revoked, SD card removed, or folder deleted.
  unavailable,
}

/// A file that was published into the user's chosen folder.
class SafDocument {
  const SafDocument({
    required this.uri,
    required this.displayName,
    this.displayPath,
  });

  final String uri;
  final String displayName;

  /// `Folder/filename` for a user-facing "saved to" message.
  final String? displayPath;
}
