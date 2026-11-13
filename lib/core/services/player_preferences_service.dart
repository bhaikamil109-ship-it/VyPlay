import 'dart:convert';
import 'dart:developer';

import 'package:vyplay/infrastructure/database/database.dart';

/// Player preferences that the playback widgets read themselves.
///
/// Everything lives in the existing `settings_entries` key/value table (the
/// same store the download folder uses): one value per profile, no schema
/// change, therefore no Drift migration. Reads and writes are injectable so the
/// parsing, clamping and defaulting rules are testable without a database.
class PlayerPreferencesService {
  PlayerPreferencesService({
    Future<String?> Function(String key)? read,
    Future<void> Function(String key, String value)? write,
  })  : _read = read ?? _dbRead,
        _write = write ?? _dbWrite;

  /// "Compress silent passages" (ExoPlayer's skip-silence feature).
  static const String skipSilenceKey = 'skip-silence-enabled';

  /// Audio-only playback: video output is disabled, audio continues.
  static const String audioOnlyKey = 'audio-only-mode';

  /// JSON map of channelKey -> playback speed.
  static const String channelSpeedKey = 'channel-speed-map';

  /// JSON map of videoId -> last position in seconds.
  static const String resumePositionKey = 'resume-positions';

  /// Speeds offered by the player sheet; anything outside is clamped.
  static const double minSpeed = 0.25;
  static const double maxSpeed = 3.0;

  /// Upper bound on remembered entries so the JSON never grows without limit.
  static const int maxRememberedEntries = 200;

  final Future<String?> Function(String key) _read;
  final Future<void> Function(String key, String value) _write;

  static Future<String?> _dbRead(String key) async {
    try {
      return await AppDatabase.instance.getSetting(key);
    } catch (e) {
      log('[PlayerPrefs] read($key) failed: $e');
      return null;
    }
  }

  static Future<void> _dbWrite(String key, String value) async {
    try {
      await AppDatabase.instance.setSetting(key, value);
    } catch (e) {
      log('[PlayerPrefs] write($key) failed: $e');
    }
  }

  // ---------------------------------------------------------------- booleans

  Future<bool> _readBool(String key) async {
    try {
      return await _read(key) == 'true';
    } catch (e) {
      log('[PlayerPrefs] $key read failed: $e');
      return false;
    }
  }

  Future<void> _writeBool(String key, bool value) async {
    try {
      await _write(key, value ? 'true' : 'false');
    } catch (e) {
      log('[PlayerPrefs] $key write failed: $e');
    }
  }

  /// Off by default: it changes how the video sounds, so it must be explicit.
  Future<bool> isSkipSilenceEnabled() => _readBool(skipSilenceKey);

  Future<bool> setSkipSilenceEnabled(bool enabled) async {
    await _writeBool(skipSilenceKey, enabled);
    return enabled;
  }

  /// Off by default.
  Future<bool> isAudioOnlyEnabled() => _readBool(audioOnlyKey);

  Future<bool> setAudioOnlyEnabled(bool enabled) async {
    await _writeBool(audioOnlyKey, enabled);
    return enabled;
  }

  // ------------------------------------------------------------- JSON helpers

  Future<Map<String, dynamic>> _readJsonMap(String key) async {
    try {
      final raw = await _read(key);
      if (raw == null || raw.isEmpty) return <String, dynamic>{};
      final decoded = jsonDecode(raw);
      if (decoded is Map) return decoded.map((k, v) => MapEntry('$k', v));
      return <String, dynamic>{};
    } catch (e) {
      // Corrupt JSON must never break playback.
      log('[PlayerPrefs] $key is not valid JSON: $e');
      return <String, dynamic>{};
    }
  }

  Future<void> _writeJsonMap(String key, Map<String, dynamic> value) async {
    try {
      await _write(key, jsonEncode(value));
    } catch (e) {
      log('[PlayerPrefs] $key write failed: $e');
    }
  }

  /// Keeps only the newest [maxRememberedEntries] entries of a map.
  static Map<String, dynamic> _bounded(Map<String, dynamic> map) {
    if (map.length <= maxRememberedEntries) return map;
    final entries = map.entries.toList();
    return Map.fromEntries(entries.sublist(entries.length - maxRememberedEntries));
  }

  /// Clamps a speed into the range both playback engines accept.
  static double clampSpeed(double speed) =>
      speed.clamp(minSpeed, maxSpeed).toDouble();

  // ---------------------------------------------------------- per-channel speed

  /// Speed remembered for [channelKey], or null when the channel has none.
  ///
  /// A null return is what lets the caller fall back to the global default
  /// instead of overwriting it.
  Future<double?> channelSpeed(String channelKey) async {
    if (channelKey.trim().isEmpty) return null;
    final map = await _readJsonMap(channelSpeedKey);
    final value = map[channelKey];
    if (value is num) return clampSpeed(value.toDouble());
    return null;
  }

  /// Stores (or clears, when [speed] is null) the speed for one channel.
  Future<void> setChannelSpeed(String channelKey, double? speed) async {
    if (channelKey.trim().isEmpty) return;
    final map = await _readJsonMap(channelSpeedKey);
    if (speed == null) {
      map.remove(channelKey);
    } else {
      map[channelKey] = clampSpeed(speed);
    }
    await _writeJsonMap(channelSpeedKey, _bounded(map));
  }

  /// Every remembered channel speed, for debugging and tests.
  Future<Map<String, double>> allChannelSpeeds() async {
    final map = await _readJsonMap(channelSpeedKey);
    return {
      for (final entry in map.entries)
        if (entry.value is num) entry.key: clampSpeed((entry.value as num).toDouble()),
    };
  }

  // ----------------------------------------------------------- resume position

  /// Seconds to resume [videoId] from, or null when there is nothing saved.
  Future<int?> resumePosition(String videoId) async {
    if (videoId.trim().isEmpty) return null;
    final map = await _readJsonMap(resumePositionKey);
    final value = map[videoId];
    if (value is num && value > 0) return value.toInt();
    return null;
  }

  /// Remembers the position for [videoId] in the background isolate too.
  Future<void> saveResumePosition(String videoId, int seconds) async {
    if (videoId.trim().isEmpty) return;
    final map = await _readJsonMap(resumePositionKey);
    if (seconds <= 0) {
      map.remove(videoId);
    } else {
      map[videoId] = seconds;
    }
    await _writeJsonMap(resumePositionKey, _bounded(map));
  }

  Future<void> clearResumePosition(String videoId) async {
    if (videoId.trim().isEmpty) return;
    final map = await _readJsonMap(resumePositionKey);
    if (map.remove(videoId) == null) return;
    await _writeJsonMap(resumePositionKey, map);
  }
}
