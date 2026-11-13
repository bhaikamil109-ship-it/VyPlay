/// One settings section that the search can match.
///
/// A section, not an individual switch: the Settings screen is built from
/// section widgets (`CommonSettingsSection`, `DownloadLocationSection`, …) and
/// the search filters exactly those, so a match always leads to the real
/// control instead of a parallel list that could drift out of date.
class SettingsSearchSection {
  const SettingsSearchSection({
    required this.id,
    required this.title,
    this.keywords = const [],
  });

  /// Stable identifier; the screen maps it to the real section widget.
  final String id;

  /// The section's own visible title (same localization the section renders).
  final String title;

  /// Extra searchable words: the switches inside the section, plus the usual
  /// synonyms a user might type instead of the official label.
  final List<String> keywords;

  /// Everything this section can be found by.
  String get searchableText => '$title ${keywords.join(' ')}'.toLowerCase();
}

/// Splits a query into lowercase tokens; blank input yields no tokens.
List<String> settingsSearchTokens(String query) => query
    .toLowerCase()
    .trim()
    .split(RegExp(r'\s+'))
    .where((token) => token.isNotEmpty)
    .toList();

/// Sections matching [query].
///
/// An empty query returns every section unchanged. Every token must appear in
/// the section's title or keywords, so "download folder" narrows to the
/// download-location section while "download" alone matches both download
/// sections.
List<SettingsSearchSection> filterSettingsSections(
  List<SettingsSearchSection> sections,
  String query,
) {
  final tokens = settingsSearchTokens(query);
  if (tokens.isEmpty) return sections;
  return sections
      .where((section) =>
          tokens.every((token) => section.searchableText.contains(token)))
      .toList();
}

/// True when [query] is a real search (not just whitespace).
bool isActiveSettingsQuery(String query) => settingsSearchTokens(query).isNotEmpty;
