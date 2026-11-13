import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/presentation/settings/settings_search.dart';

/// Mirrors the sections the Settings screen registers, so the matcher is tested
/// against the same shape of data the real screen feeds it.
const _sections = [
  SettingsSearchSection(
    id: 'common',
    title: 'Common settings',
    keywords: ['language', 'region', 'theme', 'appearance', 'dark', 'oled'],
  ),
  SettingsSearchSection(
    id: 'downloads',
    title: 'Download preferences',
    keywords: ['download quality', 'wifi', 'subtitles', 'auto delete', 'queue'],
  ),
  SettingsSearchSection(
    id: 'download-folder',
    title: 'Download location',
    keywords: ['download folder', 'storage', 'sd card', 'path'],
  ),
  SettingsSearchSection(
    id: 'playback-speed',
    title: 'Playback speed',
    keywords: ['speed', 'rate', 'slow', 'fast'],
  ),
  SettingsSearchSection(
    id: 'watch-statistics',
    title: 'Watch statistics',
    keywords: ['statistics', 'stats', 'watch time', 'history'],
  ),
  SettingsSearchSection(
    id: 'service',
    title: 'Service',
    keywords: ['backend', 'piped', 'invidious', 'peertube'],
  ),
];

List<String> _idsFor(String query) =>
    filterSettingsSections(_sections, query).map((s) => s.id).toList();

void main() {
  test('an empty query returns every section in order', () {
    expect(_idsFor(''), _sections.map((s) => s.id).toList());
    expect(_idsFor('   '), _sections.map((s) => s.id).toList());
    expect(isActiveSettingsQuery(''), isFalse);
    expect(isActiveSettingsQuery('  '), isFalse);
    expect(isActiveSettingsQuery('theme'), isTrue);
  });

  test('matches the section title', () {
    expect(_idsFor('speed'), contains('playback-speed'));
    expect(_idsFor('playback'), ['playback-speed']);
    expect(_idsFor('statistics'), ['watch-statistics']);
  });

  test('matches keywords, not only titles', () {
    expect(_idsFor('oled'), ['common']);
    expect(_idsFor('sd card'), ['download-folder']);
    expect(_idsFor('peertube'), ['service']);
    expect(_idsFor('stats'), ['watch-statistics']);
  });

  test('is case insensitive and trims surrounding space', () {
    expect(_idsFor('  DOWNLOAD  '), ['downloads', 'download-folder']);
    expect(_idsFor('Theme'), ['common']);
  });

  test('narrows with every whitespace-separated token', () {
    // "download" alone matches both download sections...
    expect(_idsFor('download'), ['downloads', 'download-folder']);
    // ...and the second word picks exactly one.
    expect(_idsFor('download folder'), ['download-folder']);
    expect(_idsFor('download quality'), ['downloads']);
  });

  test('matches tokens across title and keywords together', () {
    // "location" is in the title, "storage" only in the keywords.
    expect(_idsFor('location storage'), ['download-folder']);
  });

  test('reports no matches for text that is not in the settings tree', () {
    expect(_idsFor('zzzz'), isEmpty);
    expect(_idsFor('download zzzz'), isEmpty);
    expect(filterSettingsSections(_sections, 'zzzz'), isEmpty);
  });

  test('a single letter matches only sections that contain it', () {
    // 'q' only appears inside "Download quality"'s keyword list.
    expect(_idsFor('q'), ['downloads']);
  });
}
