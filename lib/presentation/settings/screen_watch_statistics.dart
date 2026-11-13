import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/services/watch_statistics_service.dart';
import 'package:vyplay/widgets/custom_app_bar.dart';

/// Watch time and counts for the current profile.
///
/// Every number is aggregated from `local_store_videos` rows flagged as history
/// (`WatchStatisticsService`); the screen has no sample or placeholder data. A
/// profile with no history shows the empty state instead of zeroed cards that
/// look like real numbers.
class ScreenWatchStatistics extends StatefulWidget {
  const ScreenWatchStatistics({super.key});

  @override
  State<ScreenWatchStatistics> createState() => _ScreenWatchStatisticsState();
}

class _ScreenWatchStatisticsState extends State<ScreenWatchStatistics> {
  late Future<WatchStatistics> _future;
  String? _profile;
  bool _initialised = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final profile = context.watch<SettingsBloc>().state.currentProfile;
    if (_initialised && _profile == profile) return;
    _profile = profile;
    _initialised = true;
    _future = WatchStatisticsService().load(profile: profile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(title: 'Watch statistics'),
      ),
      body: FutureBuilder<WatchStatistics>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final stats = snapshot.data ?? WatchStatistics.empty;
          if (stats.isEmpty) {
            return _EmptyState();
          }
          return ListView(
            padding: const EdgeInsets.all(kPadding16),
            children: [
              _TotalsCard(stats: stats),
              kHeightBox16,
              if (stats.perChannel.isNotEmpty) ...[
                Text(
                  'Most watched channels',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                kHeightBox8,
                for (final channel in stats.perChannel)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.person_outline),
                    title: Text(channel.channelName),
                    subtitle: Text(
                      '${channel.videos} video${channel.videos == 1 ? '' : 's'}',
                    ),
                    trailing: Text(
                      formatWatchDuration(channel.watchedSeconds),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                kHeightBox16,
              ],
              if (stats.perDay.isNotEmpty) ...[
                Text(
                  'Last 7 days',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                kHeightBox8,
                for (final day in stats.perDay.reversed)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    leading: const Icon(Icons.calendar_today_outlined, size: 18),
                    title: Text(_formatDay(day.day)),
                    subtitle: Text(
                      '${day.videos} video${day.videos == 1 ? '' : 's'}',
                    ),
                    trailing: Text(formatWatchDuration(day.watchedSeconds)),
                  ),
              ],
            ],
          );
        },
      ),
    );
  }

  static String _formatDay(DateTime day) =>
      '${day.day.toString().padLeft(2, '0')}/'
      '${day.month.toString().padLeft(2, '0')}/${day.year}';
}

class _TotalsCard extends StatelessWidget {
  const _TotalsCard({required this.stats});

  final WatchStatistics stats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(kPadding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Watch time', style: theme.textTheme.titleMedium),
            kHeightBox8,
            Text(
              formatWatchDuration(stats.watchedSeconds),
              style: theme.textTheme.headlineMedium,
            ),
            kHeightBox12,
            Text('${stats.totalVideos} videos in history'),
            Text('${stats.completedVideos} watched to the end'),
            if (stats.totalDurationSeconds > 0) ...[
              kHeightBox12,
              LinearProgressIndicator(value: stats.completionRatio),
              kHeightBox4,
              Text(
                '${(stats.completionRatio * 100).toStringAsFixed(0)}% of '
                '${formatWatchDuration(stats.totalDurationSeconds)} known runtime',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
                    padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.insights_outlined, size: 40),
            kHeightBox12,
            Text(
              'No watch history yet',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            kHeightBox4,
            Text(
              'Watch a video and your watch time will appear here.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
