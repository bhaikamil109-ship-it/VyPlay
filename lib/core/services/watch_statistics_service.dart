import 'dart:developer';

import 'package:vyplay/infrastructure/database/database.dart';

/// One history row reduced to the fields statistics need.
///
/// Keeping the aggregation on this small value type means the maths can be
/// tested without a database or Drift-generated classes.
class WatchHistoryEntry {
  const WatchHistoryEntry({
    required this.videoId,
    required this.channelName,
    required this.durationSeconds,
    required this.positionSeconds,
    this.watchedAt,
  });

  final String videoId;

  /// Channel display name; empty when the row has none.
  final String channelName;

  /// Total length of the video in seconds (0 when unknown).
  final int durationSeconds;

  /// How far the user got, in seconds.
  final int positionSeconds;

  /// When the row was last watched, when the schema recorded it.
  final DateTime? watchedAt;
}

/// Watch time per channel.
class ChannelWatchStat {
  const ChannelWatchStat({
    required this.channelName,
    required this.videos,
    required this.watchedSeconds,
  });

  final String channelName;
  final int videos;
  final int watchedSeconds;
}

/// Watch time per calendar day.
class DayWatchStat {
  const DayWatchStat({
    required this.day,
    required this.videos,
    required this.watchedSeconds,
  });

  final DateTime day;
  final int videos;
  final int watchedSeconds;
}

/// Aggregated watch statistics derived from the existing history rows.
///
/// Nothing is estimated: every number comes from `local_store_videos` rows with
/// `is_history = 1`, using the recorded `playback_position`, `duration` and
/// `time` columns. Videos whose duration is unknown still count as watched
/// videos and contribute their position to watch time.
class WatchStatistics {
  const WatchStatistics({
    required this.totalVideos,
    required this.watchedSeconds,
    required this.completedVideos,
    required this.totalDurationSeconds,
    required this.perChannel,
    required this.perDay,
  });

  static const WatchStatistics empty = WatchStatistics(
    totalVideos: 0,
    watchedSeconds: 0,
    completedVideos: 0,
    totalDurationSeconds: 0,
    perChannel: [],
    perDay: [],
  );

  final int totalVideos;

  /// Sum of how far playback got, capped at each video's duration.
  final int watchedSeconds;

  /// Videos watched to at least 90% of their duration.
  final int completedVideos;

  /// Sum of known durations, for the "watched vs available" comparison.
  final int totalDurationSeconds;

  /// Top channels by watch time.
  final List<ChannelWatchStat> perChannel;

  /// Per-day totals for the most recent [days] window, oldest first.
  final List<DayWatchStat> perDay;

  bool get isEmpty => totalVideos == 0;

  /// Share of known content actually watched, 0..1.
  double get completionRatio {
    if (totalDurationSeconds <= 0) return 0;
    return (watchedSeconds / totalDurationSeconds).clamp(0.0, 1.0);
  }

  /// A video counts as complete at 90% — the last few seconds are usually
  /// credits, so requiring 100% would report almost nothing as finished.
  static const double completionThreshold = 0.9;

  static WatchStatistics fromEntries(
    Iterable<WatchHistoryEntry> entries, {
    int topChannels = 5,
    int days = 7,
    DateTime? now,
  }) {
    final rows = entries.toList();
    if (rows.isEmpty) return empty;

    var watched = 0;
    var completed = 0;
    var totalDuration = 0;

    final channelVideos = <String, int>{};
    final channelSeconds = <String, int>{};
    final dayVideos = <String, int>{};
    final daySeconds = <String, int>{};
    final dayDates = <String, DateTime>{};

    final reference = now ?? DateTime.now();
    final today = DateTime(reference.year, reference.month, reference.day);
    final windowStart = today.subtract(Duration(days: days - 1));

    for (final row in rows) {
      final position = row.positionSeconds < 0 ? 0 : row.positionSeconds;
      final duration = row.durationSeconds < 0 ? 0 : row.durationSeconds;

      // Never count more than the video's length: a resumed position can exceed
      // a stale duration and must not inflate watch time.
      final effective = duration > 0 ? (position > duration ? duration : position) : position;
      watched += effective;
      totalDuration += duration;

      if (duration > 0 && position >= duration * completionThreshold) {
        completed++;
      }

      final channel = row.channelName.trim().isEmpty
          ? 'Unknown channel'
          : row.channelName.trim();
      channelVideos[channel] = (channelVideos[channel] ?? 0) + 1;
      channelSeconds[channel] = (channelSeconds[channel] ?? 0) + effective;

      final watchedAt = row.watchedAt;
      if (watchedAt != null) {
        final day = DateTime(watchedAt.year, watchedAt.month, watchedAt.day);
        if (!day.isBefore(windowStart) && !day.isAfter(today)) {
          final key = _dayKey(day);
          dayDates[key] = day;
          dayVideos[key] = (dayVideos[key] ?? 0) + 1;
          daySeconds[key] = (daySeconds[key] ?? 0) + effective;
        }
      }
    }

    final channels = channelVideos.keys
        .map((name) => ChannelWatchStat(
              channelName: name,
              videos: channelVideos[name]!,
              watchedSeconds: channelSeconds[name]!,
            ))
        .toList()
      ..sort((a, b) {
        final byTime = b.watchedSeconds.compareTo(a.watchedSeconds);
        return byTime != 0 ? byTime : b.videos.compareTo(a.videos);
      });

    final dayKeys = dayDates.keys.toList()..sort();

    return WatchStatistics(
      totalVideos: rows.length,
      watchedSeconds: watched,
      completedVideos: completed,
      totalDurationSeconds: totalDuration,
      perChannel: channels.take(topChannels).toList(),
      perDay: [
        for (final key in dayKeys)
          DayWatchStat(
            day: dayDates[key]!,
            videos: dayVideos[key]!,
            watchedSeconds: daySeconds[key]!,
          ),
      ],
    );
  }

  static String _dayKey(DateTime day) =>
      '${day.year.toString().padLeft(4, '0')}-'
      '${day.month.toString().padLeft(2, '0')}-'
      '${day.day.toString().padLeft(2, '0')}';
}

/// Formats a duration in seconds as `1h 05m`, `5m 12s` or `42s`.
String formatWatchDuration(int seconds) {
  if (seconds <= 0) return '0s';
  final hours = seconds ~/ 3600;
  final minutes = (seconds % 3600) ~/ 60;
  final secs = seconds % 60;
  if (hours > 0) {
    return '${hours}h ${minutes.toString().padLeft(2, '0')}m';
  }
  if (minutes > 0) return '${minutes}m ${secs}s';
  return '${secs}s';
}

/// Reads the profile's history and aggregates it.
class WatchStatisticsService {
  WatchStatisticsService({Future<List<LocalStoreVideo>> Function(String profile)? historyLoader})
      : _historyLoader = historyLoader ?? _loadFromDatabase;

  final Future<List<LocalStoreVideo>> Function(String profile) _historyLoader;

  static Future<List<LocalStoreVideo>> _loadFromDatabase(String profile) =>
      AppDatabase.instance.getHistoryVideos(profile);

  /// Statistics for [profile], or [WatchStatistics.empty] when the read fails
  /// (an empty screen is honest; invented numbers are not).
  Future<WatchStatistics> load({String profile = 'default'}) async {
    try {
      final rows = await _historyLoader(profile);
      return WatchStatistics.fromEntries(
        rows.map(
          (row) => WatchHistoryEntry(
            videoId: row.videoId,
            channelName: row.uploaderName ?? '',
            durationSeconds: row.duration ?? 0,
            positionSeconds: row.playbackPosition ?? 0,
            watchedAt: row.time,
          ),
        ),
      );
    } catch (e) {
      log('[WatchStats] load failed: $e');
      return WatchStatistics.empty;
    }
  }
}
