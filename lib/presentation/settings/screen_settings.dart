import 'package:flutter/material.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/generated/l10n.dart';

import '../../widgets/custom_app_bar.dart';
import 'screen_watch_statistics.dart';
import 'settings_search.dart';
import 'widgets/widgets.dart';
import 'widgets/sleep_timer_section.dart';
import 'widgets/gestures_section.dart';
import 'widgets/dearrow_section.dart';
import 'widgets/bookmarks_section.dart';
import 'widgets/content_filtering_section.dart';
import 'widgets/advanced_content_filter_section.dart';
import 'widgets/mini_player_section.dart';
import 'widgets/download_preferences_section.dart';
import 'widgets/download_location_section.dart';
import 'widgets/ryd_section.dart';
import 'widgets/phase18_features_section.dart';
import 'widgets/playback_speed_section.dart';
import 'widgets/service_switch_section.dart';
import 'widgets/cookie_login_section.dart';
import 'widgets/piped_account_section.dart';

/// A real settings section paired with the words it can be searched by.
///
/// Both live here, next to each other, so adding a section means adding its
/// keywords at the same time — the search cannot silently drift from the screen
/// it searches.
class _SectionSpec {
  const _SectionSpec({
    required this.entry,
    required this.builder,
  });

  final SettingsSearchSection entry;
  final Widget Function() builder;
}

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<_SectionSpec> _sections(S locals) => [
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'common',
            title: locals.commonSettingsTitle,
            keywords: const [
              'language', 'region', 'theme', 'appearance', 'dark', 'oled',
              'amoled', 'instances', 'colour', 'color',
            ],
          ),
          builder: () => const CommonSettingsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'profiles',
            title: locals.profiles,
            keywords: const ['profile', 'account', 'switch'],
          ),
          builder: () => const ProfilesSettingsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'distraction',
            title: locals.distractionFree,
            keywords: const [
              'hide comments', 'related videos', 'distraction', 'clean',
            ],
          ),
          builder: () => const DistractionFreeSettingsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'video',
            title: 'Video',
            keywords: const [
              'quality', 'resolution', 'hls', 'history', 'picture in picture',
              'pip', 'dislikes', 'search history', 'default quality',
            ],
          ),
          builder: () => const VideoSettingsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'playback',
            title: 'Playback',
            keywords: const [
              'audio focus', 'pause on call', 'open links', 'browser',
            ],
          ),
          builder: () => const PlaybackSettingsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'sleep-timer',
            title: locals.sleepTimer,
            keywords: const ['timer', 'sleep', 'stop playback'],
          ),
          builder: () => const SleepTimerSettingsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'gestures',
            title: locals.gestureControls,
            keywords: const [
              'swipe', 'brightness', 'volume', 'seek', 'double tap', 'gesture',
            ],
          ),
          builder: () => const GesturesSettingsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'dearrow',
            title: locals.dearrow,
            keywords: const ['titles', 'thumbnails', 'sponsor', 'crowd'],
          ),
          builder: () => const DeArrowSettingsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'bookmarks',
            title: locals.playlistBookmarks,
            keywords: const ['bookmark', 'playlist', 'bookmarked'],
          ),
          builder: () => const PlaylistBookmarksSettingsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'content-filter',
            title: locals.restrictedMode,
            keywords: const ['restricted', 'filter', 'hide shorts'],
          ),
          builder: () => const ContentFilteringSettingsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'content-filter-advanced',
            title: locals.contentFilterAdvanced,
            keywords: const [
              'keywords', 'blocked channels', 'blocklist', 'paid promotions',
            ],
          ),
          builder: () => const AdvancedContentFilterSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'mini-player',
            title: locals.miniPlayer,
            keywords: const ['mini player', 'floating', 'expand'],
          ),
          builder: () => const MiniPlayerSettingsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'downloads',
            title: locals.downloadPreferences,
            keywords: const [
              'download quality', 'wifi', 'subtitles', 'auto delete', 'queue',
            ],
          ),
          builder: () => const DownloadPreferencesSettingsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'download-folder',
            title: locals.downloadLocation,
            keywords: const [
              'download folder', 'storage', 'sd card', 'save location',
              'directory', 'path',
            ],
          ),
          builder: () => const DownloadLocationSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'ryd',
            title: locals.rydTitle,
            keywords: const ['dislike', 'return youtube dislike', 'votes'],
          ),
          builder: () => const RydSettingsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'phase18',
            title: locals.phase18Features,
            keywords: const [
              'long press speed', 'original titles', 'comment filter',
              'screen lock', 'pinch to zoom', 'seekbar thumbnails',
            ],
          ),
          builder: () => const Phase18FeaturesSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'playback-speed',
            title: locals.playbackSpeed,
            keywords: const ['speed', 'rate', 'slow', 'fast'],
          ),
          builder: () => const PlaybackSpeedSettingsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'service',
            title: locals.service,
            keywords: const [
              'backend', 'youtube', 'piped', 'invidious', 'peertube', 'newpipe',
            ],
          ),
          builder: () => const ServiceSwitchSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'cookie',
            title: 'Cookie login',
            keywords: const ['cookie', 'login', 'sign in', 'restricted'],
          ),
          builder: () => const CookieLoginSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'piped-account',
            title: 'Piped account',
            keywords: const ['account', 'sync', 'subscriptions push'],
          ),
          builder: () => const PipedAccountSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'sponsorblock',
            title: locals.sponsorBlock,
            keywords: const ['sponsor', 'segments', 'skip intro', 'outro'],
          ),
          builder: () => const SponsorBlockSettingsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'backup',
            title: locals.backupRestore,
            keywords: const [
              'import', 'export', 'newpipe', 'zip', 'subscriptions', 'restore',
            ],
          ),
          builder: () => const BackupSettingsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'plugin-contributions',
            title: locals.pluginContributions,
            keywords: const ['plugin', 'extension', 'addon'],
          ),
          builder: () => const PluginContributionsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'plugin-permissions',
            title: locals.pluginPermissions,
            keywords: const ['plugin', 'permission', 'grant', 'revoke'],
          ),
          builder: () => const PluginPermissionsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'watch-statistics',
            title: 'Watch statistics',
            keywords: const ['statistics', 'stats', 'watch time', 'history'],
          ),
          builder: () => const _WatchStatisticsSection(),
        ),
        _SectionSpec(
          entry: SettingsSearchSection(
            id: 'about',
            title: locals.about,
            keywords: const ['version', 'license', 'app', 'update'],
          ),
          builder: () => const AboutSection(),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);
    final all = _sections(locals);
    final query = _query.trim();
    final entries = all.map((spec) => spec.entry).toList();
    final matchingIds =
        filterSettingsSections(entries, query).map((entry) => entry.id).toSet();
    final visible = query.isEmpty
        ? all
        : all.where((spec) => matchingIds.contains(spec.entry.id)).toList();

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            CustomAppBar(
              title: locals.settings,
            )
          ],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _searchController,
                    onChanged: (value) => setState(() => _query = value),
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: 'Search settings',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: query.isEmpty
                          ? null
                          : IconButton(
                              tooltip: 'Clear search',
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                _searchController.clear();
                                setState(() => _query = '');
                              },
                            ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      isDense: true,
                    ),
                  ),
                  if (query.isNotEmpty) ...[
                    kHeightBox8,
                    Text(
                      visible.isEmpty
                          ? 'No settings match “$query”.'
                          : '${visible.length} section'
                              '${visible.length == 1 ? '' : 's'} match “$query”.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                  kHeightBox15,
                  for (final spec in visible) ...[
                    spec.builder(),
                    if (spec != visible.last) kHeightBox15,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Entry point to the watch-statistics screen.
class _WatchStatisticsSection extends StatelessWidget {
  const _WatchStatisticsSection();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.insights_outlined),
      title: Text(
        'Watch statistics',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: const Text('Watch time, completed videos and top channels'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const ScreenWatchStatistics()),
      ),
    );
  }
}
