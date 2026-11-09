/// Advanced content filter preferences (NewPipe/PipePipe style).
///
/// A video is hidden when its title/channel name matches one of [keywords],
/// when its channel ID is listed in [blockedChannelIds], when [hideShorts] is
/// enabled and the entry is a Short, or when [hidePaidPromotions] is enabled
/// and the entry is a paid/promoted video.
class ContentFilterConfig {
  const ContentFilterConfig({
    required this.keywords,
    required this.blockedChannelIds,
    required this.hideShorts,
    required this.hidePaidPromotions,
  });

  const ContentFilterConfig.disabled()
      : keywords = const [],
        blockedChannelIds = const [],
        hideShorts = false,
        hidePaidPromotions = false;

  /// Keyword entries. A plain entry is matched case-insensitively as a
  /// substring; an entry wrapped in slashes (for example `/^live stream$/`) is
  /// treated as a regular expression.
  final List<String> keywords;

  /// YouTube channel IDs (for example `UCabc...`) whose videos are hidden.
  final List<String> blockedChannelIds;

  /// Hide YouTube Shorts entries in feeds.
  final bool hideShorts;

  /// Hide paid, membership-only and promoted videos.
  final bool hidePaidPromotions;

  /// Whether this filter can hide anything at all.
  bool get isEnabled =>
      keywords.any((k) => k.trim().isNotEmpty) ||
      blockedChannelIds.any((c) => c.trim().isNotEmpty) ||
      hideShorts ||
      hidePaidPromotions;

  static final RegExp _shortUrlPattern = RegExp(r'/shorts?/');

  /// Whether a feed entry should be hidden by this filter.
  bool shouldHide({
    String title = '',
    String channelId = '',
    String channelName = '',
    String url = '',
    bool? isShort,
    bool isPaidPromotion = false,
  }) {
    if (isPaidPromotion && hidePaidPromotions) return true;

    final shortById = isShort ?? false;
    if (hideShorts && (shortById || _shortUrlPattern.hasMatch(url))) {
      return true;
    }

    final normalizedChannelId = channelId.trim();
    if (normalizedChannelId.isNotEmpty) {
      for (final blocked in blockedChannelIds) {
        final id = blocked.trim();
        if (id.isEmpty) continue;
        if (id == normalizedChannelId ||
            id.endsWith('/$normalizedChannelId') ||
            normalizedChannelId.endsWith('/$id')) {
          return true;
        }
      }
    }

    final haystack = '$title $channelName'.toLowerCase().trim();
    for (final raw in keywords) {
      final keyword = raw.trim();
      if (keyword.isEmpty) continue;
      if (_matchesKeyword(haystack, keyword)) return true;
    }
    return false;
  }

  bool _matchesKeyword(String haystack, String keyword) {
    if (keyword.length > 2 && keyword.startsWith('/') && keyword.endsWith('/')) {
      final pattern = keyword.substring(1, keyword.length - 1);
      try {
        return RegExp(pattern, caseSensitive: false).hasMatch(haystack);
      } on FormatException {
        // Malformed user regex: fall back to a plain substring match instead of
        // crashing the feed.
        return haystack.contains(pattern.toLowerCase());
      }
    }
    return haystack.contains(keyword.toLowerCase());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContentFilterConfig &&
          other.hideShorts == hideShorts &&
          other.hidePaidPromotions == hidePaidPromotions &&
          _listEquals(other.keywords, keywords) &&
          _listEquals(other.blockedChannelIds, blockedChannelIds);

  @override
  int get hashCode => Object.hash(
        hideShorts,
        hidePaidPromotions,
        Object.hashAll(keywords),
        Object.hashAll(blockedChannelIds),
      );
}

bool _listEquals(List<String> a, List<String> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
