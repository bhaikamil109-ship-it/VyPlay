import 'package:vyplay/core/enums.dart';

/// Playlist bookmark preferences.
class BookmarksConfig {
  const BookmarksConfig({
    required this.enabled,
    required this.selectedPlaylists,
  });

  final bool enabled;
  final List<String> selectedPlaylists;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookmarksConfig &&
          other.enabled == enabled &&
          _listEquals(other.selectedPlaylists, selectedPlaylists);

  @override
  int get hashCode => Object.hash(enabled, Object.hashAll(selectedPlaylists));
}

/// Restricted mode preferences.
class RestrictedModeConfig {
  const RestrictedModeConfig({
    required this.enabled,
    required this.filterLevel,
  });

  final bool enabled;
  final RestrictedModeFilterLevel filterLevel;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestrictedModeConfig &&
          other.enabled == enabled &&
          other.filterLevel == filterLevel;

  @override
  int get hashCode => Object.hash(enabled, filterLevel);
}

/// Mini player preferences.
class MiniPlayerConfig {
  const MiniPlayerConfig({
    required this.enabled,
    required this.autoExpand,
    required this.tapToExpand,
    required this.doubleTapToExpand,
  });

  final bool enabled;
  final bool autoExpand;
  final bool tapToExpand;
  final bool doubleTapToExpand;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MiniPlayerConfig &&
          other.enabled == enabled &&
          other.autoExpand == autoExpand &&
          other.tapToExpand == tapToExpand &&
          other.doubleTapToExpand == doubleTapToExpand;

  @override
  int get hashCode =>
      Object.hash(enabled, autoExpand, tapToExpand, doubleTapToExpand);
}

/// Download preferences.
class DownloadPreferencesConfig {
  const DownloadPreferencesConfig({
    required this.downloadQuality,
    required this.includeSubtitles,
    required this.overWifiOnly,
    required this.autoDelete,
    required this.autoDeleteDays,
  });

  final DownloadQuality downloadQuality;
  final bool includeSubtitles;
  final bool overWifiOnly;
  final bool autoDelete;
  final int autoDeleteDays;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownloadPreferencesConfig &&
          other.downloadQuality == downloadQuality &&
          other.includeSubtitles == includeSubtitles &&
          other.overWifiOnly == overWifiOnly &&
          other.autoDelete == autoDelete &&
          other.autoDeleteDays == autoDeleteDays;

  @override
  int get hashCode => Object.hash(downloadQuality, includeSubtitles,
      overWifiOnly, autoDelete, autoDeleteDays);
}

bool _listEquals(List<String> a, List<String> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
