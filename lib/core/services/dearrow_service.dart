import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:vyplay/core/di/injectable.dart';
import 'package:vyplay/domain/settings/settings_service.dart';

/// DeArrow service - provides crowd-sourced, less clickbait titles and
/// thumbnails for videos.
///
/// Uses the official public endpoints:
///  * branding (titles + thumbnail timestamps): https://sponsor.ajay.app/api/branding
///  * thumbnail renderer: https://dearrow-thumb.ajay.app/api/v1/getThumbnail
///
/// Responses are memoised per video id and concurrent requests for the same
/// video are de-duplicated, since the same video can appear in many cards.
class DeArrowService {
  static DeArrowService? _instance;
  factory DeArrowService() => _instance ??= DeArrowService._();

  DeArrowService._();

  static const String _brandingUrl = 'https://sponsor.ajay.app/api/branding';
  static const String _thumbnailUrl =
      'https://dearrow-thumb.ajay.app/api/v1/getThumbnail';

  /// Upper bound for the in-memory cache so long sessions stay bounded.
  static const int _maxCacheEntries = 500;

  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 8),
      receiveTimeout: const Duration(seconds: 8),
    ),
  );

  final Map<String, DeArrowResult?> _cache = {};
  final Map<String, Future<DeArrowResult?>> _inFlight = {};

  bool _enabled = false;

  /// Whether the user enabled DeArrow in settings.
  bool get enabled => _enabled;

  set enabled(bool value) {
    _enabled = value;
    if (!value) _cache.clear();
  }

  /// Reads the persisted DeArrow preference into the service flag.
  Future<void> syncFromSettings() async {
    try {
      final result = await getIt<SettingsService>().isDeArrowEnabled();
      enabled = result.fold((_) => false, (value) => value);
    } catch (e) {
      log('[DeArrow] Could not read preference: $e');
    }
  }

  /// Returns the branding data for [videoId], or null when DeArrow has nothing
  /// to offer (or the request failed). Never throws.
  Future<DeArrowResult?> getBranding(String videoId) {
    if (videoId.isEmpty) return Future.value(null);

    if (_cache.containsKey(videoId)) {
      return Future.value(_cache[videoId]);
    }

    final pending = _inFlight[videoId];
    if (pending != null) return pending;

    final request = _fetch(videoId).whenComplete(() {
      _inFlight.remove(videoId);
    });
    _inFlight[videoId] = request;
    return request;
  }

  Future<DeArrowResult?> _fetch(String videoId) async {
    try {
      final response = await _dio.get<dynamic>(
        _brandingUrl,
        queryParameters: {'videoID': videoId},
      );

      final data = response.data;
      if (data is! Map) {
        _store(videoId, null);
        return null;
      }

      final title = _pickBestTitle(data['titles']);
      final timestamp = _pickBestThumbnail(data['thumbnails']);

      final result = DeArrowResult(
        title: title,
        thumbnailUrl: timestamp == null
            ? null
            : '$_thumbnailUrl?videoID=${Uri.encodeQueryComponent(videoId)}'
                '&time=$timestamp',
      );

      final value = result.isEmpty ? null : result;
      _store(videoId, value);
      return value;
    } catch (e) {
      // Network failures are expected (offline, rate limits); cache the miss so
      // repeated cards do not hammer the endpoint.
      log('[DeArrow] Branding request failed for $videoId: $e');
      _store(videoId, null);
      return null;
    }
  }

  void _store(String videoId, DeArrowResult? value) {
    if (_cache.length >= _maxCacheEntries) {
      _cache.remove(_cache.keys.first);
    }
    _cache[videoId] = value;
  }

  static Map<dynamic, dynamic>? _pickBest(List<dynamic>? raw) {
    if (raw == null) return null;

    final entries = raw
        .whereType<Map>()
        .where((entry) => entry['original'] != true)
        .toList();

    if (entries.isEmpty) return null;

    // Community-locked submissions win; otherwise the most voted entry.
    final locked = entries.where((entry) => entry['locked'] == true);
    if (locked.isNotEmpty) return locked.first;

    entries.sort((a, b) => _votes(b).compareTo(_votes(a)));
    return entries.first;
  }

  static double _votes(Map<dynamic, dynamic> entry) {
    final votes = entry['votes'];
    return votes is num ? votes.toDouble() : 0;
  }

  static String? _pickBestTitle(List<dynamic>? raw) {
    final best = _pickBest(raw);
    if (best == null) return null;
    final title = best['title'];
    if (title is! String || title.trim().isEmpty) return null;
    return title;
  }

  static String? _pickBestThumbnail(List<dynamic>? raw) {
    final best = _pickBest(raw);
    if (best == null) return null;
    final timestamp = best['timestamp'];
    if (timestamp is num && timestamp >= 0) return timestamp.toString();
    return null;
  }
}

class DeArrowResult {
  const DeArrowResult({this.title, this.thumbnailUrl});

  /// Crowd-sourced replacement title, when available.
  final String? title;

  /// Fully qualified DeArrow thumbnail URL, when available.
  final String? thumbnailUrl;

  bool get isEmpty => title == null && thumbnailUrl == null;
  bool get isNotEmpty => !isEmpty;
}
