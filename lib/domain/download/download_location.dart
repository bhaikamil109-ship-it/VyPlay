import 'models/download_item.dart';

/// Where downloads are written.
///
/// A user selection is stored as an absolute path. If the folder later becomes
/// unwritable or disappears (SD card removed, folder deleted, permission
/// revoked) resolution fails loudly instead of quietly writing somewhere else:
/// silently relocating a download is the one behaviour users cannot recover
/// from, because the file is not where they told VyPlay to put it.
class DownloadLocation {
  const DownloadLocation({this.path, this.defaultPath});

  /// The folder the user chose, or null when they have not chosen one.
  final String? path;

  /// The app-private fallback, always available.
  final String? defaultPath;

  bool get isUserSelected => path != null && path!.trim().isNotEmpty;

  /// Path shown in Settings: the selection, or the default when unset.
  String? get displayPath =>
      isUserSelected ? path!.trim() : defaultPath;

  DownloadLocation copyWith({String? path, String? defaultPath}) =>
      DownloadLocation(
        path: path ?? this.path,
        defaultPath: defaultPath ?? this.defaultPath,
      );
}

/// Why a configured download folder could not be used.
///
/// The message is user-facing and is shown on the failed download and in
/// Settings; [code] is stable so callers can branch without parsing text.
class DownloadLocationFailure implements Exception {
  const DownloadLocationFailure(this.message, {required this.code});

  /// `UNAVAILABLE` — the folder does not exist and could not be created.
  /// `NOT_WRITABLE` — the folder exists but a probe write failed.
  final String code;
  final String message;

  @override
  String toString() => message;
}

/// State of a configured folder, for the Settings section.
enum DownloadLocationStatus {
  /// No folder chosen; downloads go to app storage.
  unset,

  /// Folder exists and passed a write probe.
  ready,

  /// Folder exists but cannot be written to.
  notWritable,

  /// Folder is gone (removed SD card, deleted folder, revoked grant).
  unavailable,
}

/// Result of checking a configured folder without throwing.
class DownloadLocationCheck {
  const DownloadLocationCheck({required this.status, required this.message});

  const DownloadLocationCheck.unset()
      : status = DownloadLocationStatus.unset,
        message = null;

  final DownloadLocationStatus status;
  final String? message;

  bool get isUsable =>
      status == DownloadLocationStatus.unset ||
      status == DownloadLocationStatus.ready;
}

/// Whether two requests describe the same download, i.e. the same video, at
/// the same quality, for the same profile and download type.
///
/// Used to refuse a second copy before a transfer starts. Quality is part of
/// the identity on purpose: a 1080p download and a 720p download of the same
/// video are different files the user may legitimately want.
bool isSameDownloadRequest(DownloadItem a, DownloadItem b) {
  return a.videoId == b.videoId &&
      a.profileName == b.profileName &&
      a.downloadType == b.downloadType &&
      a.videoQuality == b.videoQuality &&
      a.audioQuality == b.audioQuality;
}

/// Statuses that count as "this download already exists", so a duplicate is
/// refused. Failed and cancelled rows do not block a fresh attempt.
bool blocksDuplicateRequest(DownloadStatus status) {
  switch (status) {
    case DownloadStatus.pending:
    case DownloadStatus.downloading:
    case DownloadStatus.merging:
    case DownloadStatus.paused:
    case DownloadStatus.completed:
      return true;
    case DownloadStatus.failed:
    case DownloadStatus.cancelled:
      return false;
  }
}

/// Whether a failed or cancelled download can be retried.
///
/// Paused downloads resume, and completed ones are done; only the two terminal
/// failure states restart from the beginning.
bool canRetryDownload(DownloadStatus status) {
  return status == DownloadStatus.failed ||
      status == DownloadStatus.cancelled;
}
