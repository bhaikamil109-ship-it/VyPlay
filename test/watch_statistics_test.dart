import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/services/watch_statistics_service.dart';

WatchHistoryEntry _entry({
  String videoId = 'v1',
  String channel = 'Channel A',
  int duration = 600,
  int position = 300,
  DateTime? watchedAt,
}) =>
    WatchHistoryEntry(
      videoId: videoId,
      channelName: channel,
      durationSeconds: duration,
      positionSeconds: position,
      watchedAt: watchedAt,
    );

void main() {
  final now = DateTime(2026, 11, 12, 18);

  group('formatWatchDuration', () {
    test('scales units from seconds to hours', () {
      expect(formatWatchDuration(0), '0s');
      expect(formatWatchDuration(42), '42s');
      expect(formatWatchDuration(312), '5m 12s');
      expect(formatWatchDuration(3900), '1h 05m');
      expect(formatWatchDuration(-5), '0s');
    });
  });

  group('WatchStatistics.fromEntries', () {
    test('returns the empty state for no history', () {
      final stats = WatchStatistics.fromEntries(const [], now: now);

      expect(stats.isEmpty, isTrue);
      expect(stats.totalVideos, 0);
      expect(stats.perChannel, isEmpty);
      expect(stats.perDay, isEmpty);
      expect(stats.completionRatio, 0);
    });

    test('sums watch time and counts completed videos', () {
      final stats = WatchStatistics.fromEntries([
        _entry(videoId: 'a', duration: 600, position: 600), // complete
        _entry(videoId: 'b', duration: 600, position: 550), // 91% -> complete
        _entry(videoId: 'c', duration: 600, position: 300), // half
      ], now: now);

      expect(stats.totalVideos, 3);
      expect(stats.watchedSeconds, 1450);
      expect(stats.completedVideos, 2);
      expect(stats.totalDurationSeconds, 1800);
      expect(stats.completionRatio, closeTo(1450 / 1800, 1e-9));
    });

    test('never counts more watch time than the video length', () {
      final stats = WatchStatistics.fromEntries([
        // A resume position left over from a longer source must be capped.
        _entry(duration: 100, position: 500),
      ], now: now);

      expect(stats.watchedSeconds, 100);
      expect(stats.completedVideos, 1);
    });

    test('counts videos with unknown duration without inventing runtime', () {
      final stats = WatchStatistics.fromEntries([
        _entry(duration: 0, position: 90),
      ], now: now);

      expect(stats.totalVideos, 1);
      expect(stats.watchedSeconds, 90);
      expect(stats.totalDurationSeconds, 0);
      expect(stats.completedVideos, 0);
      expect(stats.completionRatio, 0);
    });

    test('breaks watch time down per channel, busiest first', () {
      final stats = WatchStatistics.fromEntries([
        _entry(videoId: 'a', channel: 'Alpha', position: 100),
        _entry(videoId: 'b', channel: 'Beta', position: 400),
        _entry(videoId: 'c', channel: 'Beta', position: 400),
        _entry(videoId: 'd', channel: 'Alpha', position: 50),
      ], now: now);

      expect(stats.perChannel.map((c) => c.channelName), ['Beta', 'Alpha']);
      expect(stats.perChannel.first.watchedSeconds, 800);
      expect(stats.perChannel.first.videos, 2);
      expect(stats.perChannel.last.watchedSeconds, 150);
    });

    test('trims names and labels rows without a channel honestly', () {
      final stats = WatchStatistics.fromEntries([
        _entry(channel: '  ', position: 10),
        _entry(videoId: 'b', channel: ' Padded ', position: 20),
      ], now: now);

      final names = stats.perChannel.map((c) => c.channelName).toList();
      expect(names, contains('Unknown channel'));
      expect(names, contains('Padded'));
    });

    test('limits the channel list to the requested top N', () {
      final stats = WatchStatistics.fromEntries([
        for (var i = 0; i < 8; i++)
          _entry(videoId: 'v$i', channel: 'Channel $i', position: i * 10),
      ], now: now, topChannels: 3);

      expect(stats.perChannel.length, 3);
      expect(stats.perChannel.first.channelName, 'Channel 7');
    });

    test('groups days inside the window, oldest first, skipping older rows', () {
      final stats = WatchStatistics.fromEntries([
        _entry(videoId: 'a', position: 60, watchedAt: DateTime(2026, 11, 12, 9)),
        _entry(videoId: 'b', position: 120, watchedAt: DateTime(2026, 11, 12, 20)),
        _entry(videoId: 'c', position: 30, watchedAt: DateTime(2026, 11, 10, 12)),
        // Outside the 7-day window ending today.
        _entry(videoId: 'd', position: 999, watchedAt: DateTime(2026, 10, 1)),
        // Future-dated rows are ignored too.
        _entry(videoId: 'e', position: 999, watchedAt: DateTime(2026, 12, 1)),
      ], now: now);

      expect(stats.perDay.length, 2);
      expect(stats.perDay.first.day, DateTime(2026, 11, 10));
      expect(stats.perDay.first.videos, 1);
      expect(stats.perDay.first.watchedSeconds, 30);
      expect(stats.perDay.last.day, DateTime(2026, 11, 12));
      expect(stats.perDay.last.videos, 2);
      expect(stats.perDay.last.watchedSeconds, 180);
    });

    test('rows with no timestamp still count in totals but not per day', () {
      final stats = WatchStatistics.fromEntries([
        _entry(videoId: 'a', position: 60),
      ], now: now);

      expect(stats.totalVideos, 1);
      expect(stats.perDay, isEmpty);
    });
  });

  group('WatchStatisticsService', () {
    test('falls back to the empty state when the history read fails', () async {
      final service = WatchStatisticsService(
        historyLoader: (profile) => Future.error(StateError('db closed')),
      );

      final stats = await service.load(profile: 'default');

      expect(stats.isEmpty, isTrue);
      expect(stats.totalVideos, 0);
    });
  });
}
