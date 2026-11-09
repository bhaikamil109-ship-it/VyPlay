enum YouTubeServices {
  newpipe, // Primary service - direct extraction via NewPipe Extractor (Android only)
  piped,
  explode,
  invidious,
  bilibili, // Bilibili video support - enable for Bilibili content
}

enum ApiStatus {
  initial,
  loading,
  loaded,
  error,
}

/// Download quality preference
enum DownloadQuality {
  low,
  medium,
  high,
}

/// Restricted mode filtering strictness
enum RestrictedModeFilterLevel {
  standard,
  strict,
}

/// Home feed display mode
enum HomeFeedMode {
  /// Show subscription feed if available, otherwise trending
  feedOrTrending,
  /// Always show subscription feed only (empty if no subscriptions)
  feedOnly,
  /// Always show trending videos only
  trendingOnly,
}
