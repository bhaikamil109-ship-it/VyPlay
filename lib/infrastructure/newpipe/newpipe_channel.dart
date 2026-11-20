import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:vyplay/domain/channel/models/newpipe/newpipe_channel_resp.dart';
import 'package:vyplay/domain/search/models/newpipe/newpipe_search_resp.dart';
import 'package:vyplay/domain/trending/models/newpipe/newpipe_trending_resp.dart';
import 'package:vyplay/domain/watch/models/newpipe/newpipe_comments_resp.dart';
import 'package:vyplay/domain/watch/models/newpipe/newpipe_watch_resp.dart';

/// Platform channel for communicating with NewPipe Extractor on Android.
/// This service is Android-only. On iOS, it returns unavailable.
class NewPipeChannel {
  static const _channel = MethodChannel('com.kamil.vyplay/newpipe');

  // Cache for stream URLs with TTL (5 minutes)
  static final Map<String, _CachedStreamInfo> _streamCache = {};
  static const _cacheTtl = Duration(minutes: 5);
  static String _activeServiceId = 'newpipe';

  /// Routes native extractor requests to YouTube or Bilibili.
  static void setActiveService(String serviceId) {
    final next = serviceId == 'bilibili' ? 'bilibili' : 'newpipe';
    if (_activeServiceId != next) {
      _activeServiceId = next;
      _streamCache.clear();
    }
  }

  static String get activeServiceId => _activeServiceId;
  static String _cacheKey(String videoId) => '$_activeServiceId:$videoId';

  /// Check if NewPipe Extractor is available on this platform.
  /// Returns true on Android, false on iOS/other platforms.
  static Future<bool> get isAvailable async {
    if (!Platform.isAndroid) {
      return false;
    }
    try {
      final result = await _channel.invokeMethod<bool>('isAvailable');
      return result ?? false;
    } on PlatformException {
      return false;
    } on MissingPluginException {
      return false;
    }
  }

  /// Set (or clear) the YouTube cookie used by the native extractor.
  static Future<void> setCookie(String? cookie) async {
    if (!Platform.isAndroid) return;
    try {
      await _channel.invokeMethod<bool>(
        'setCookie',
        {'cookie': cookie ?? ''},
      );
      _streamCache.clear();
    } catch (_) {
      // Cookie support is best-effort; extraction still works without it.
    }
  }

  /// Get video stream info including metadata and stream URLs
  static Future<NewPipeWatchResp> getStreamInfo(String videoId) async {
    try {
      final result = await _channel.invokeMethod<String>(
        'getStreamInfo',
        {'id': videoId, 'serviceId': _activeServiceId},
      );
      if (result == null) {
        throw PlatformException(
          code: 'NULL_RESULT',
          message: 'No data returned from NewPipe Extractor',
        );
      }
      final json = jsonDecode(result) as Map<String, dynamic>;
      final resp = NewPipeWatchResp.fromJson(json);
      // Cache the result
      _streamCache[_cacheKey(videoId)] = _CachedStreamInfo(resp, DateTime.now());
      return resp;
    } on PlatformException catch (e) {
      throw Exception('Failed to get stream info: ${e.message}');
    }
  }

  /// Get video stream info fast (essential data only - no related videos).
  /// Use this for faster initial playback. Fetches related videos separately.
  /// Falls back to regular getStreamInfo if fast method is not available.
  static Future<NewPipeWatchResp> getStreamInfoFast(String videoId) async {
    // Check cache first
    final cached = _streamCache[videoId];
    if (cached != null && !cached.isExpired(_cacheTtl)) {
      return cached.data;
    }

    try {
      final result = await _channel.invokeMethod<String>(
        'getStreamInfoFast',
        {'id': videoId, 'serviceId': _activeServiceId},
      );
      if (result == null) {
        throw PlatformException(
          code: 'NULL_RESULT',
          message: 'No data returned from NewPipe Extractor',
        );
      }
      final json = jsonDecode(result) as Map<String, dynamic>;
      final resp = NewPipeWatchResp.fromJson(json);
      // Cache the result
      _streamCache[videoId] = _CachedStreamInfo(resp, DateTime.now());
      return resp;
    } on MissingPluginException {
      // Fall back to regular getStreamInfo if fast method is not available
      // This can happen if native code hasn't been rebuilt
      return getStreamInfo(videoId);
    } on PlatformException catch (e) {
      throw Exception('Failed to get stream info: ${e.message}');
    }
  }

  /// Get cached stream info if available and not expired
  static NewPipeWatchResp? getCachedStreamInfo(String videoId) {
    final cached = _streamCache[videoId];
    if (cached != null && !cached.isExpired(_cacheTtl)) {
      return cached.data;
    }
    return null;
  }

  /// Pre-fetch stream info for a video (e.g., from thumbnails)
  static Future<void> prefetchStreamInfo(String videoId) async {
    // Check if already cached
    final cached = _streamCache[videoId];
    if (cached != null && !cached.isExpired(_cacheTtl)) {
      return;
    }

    try {
      await getStreamInfoFast(videoId);
    } catch (_) {
      // Silently fail for prefetch - it's just an optimization
    }
  }

  /// Clear expired cache entries
  static void clearExpiredCache() {
    _streamCache.removeWhere((_, cached) => cached.isExpired(_cacheTtl));
  }

  /// Clear all cache
  static void clearCache() {
    _streamCache.clear();
  }

  /// Drop every cached copy of [videoId]'s stream info, on both sides of the
  /// channel.
  ///
  /// The native handler keeps its own 5-minute `StreamInfo` cache, and a
  /// `StreamInfo` carries the already-resolved Googlevideo URLs. Refreshing a
  /// stream therefore has to invalidate that cache first, otherwise the
  /// "fresh" extraction returns the same expired URL.
  static Future<void> invalidateStreamInfo(String videoId) async {
    _streamCache.remove(_cacheKey(videoId));
    if (!Platform.isAndroid) return;
    try {
      await _channel.invokeMethod<bool>(
        'clearStreamCache',
        {'id': videoId, 'serviceId': _activeServiceId},
      );
    } catch (_) {
      // Best-effort: an older native build may not expose the method yet. The
      // Dart-side cache is still cleared, which is the part this class owns.
    }
  }

  /// Get trending videos for a specific region
  static Future<List<NewPipeTrendingResp>> getTrending(String region) async {
    try {
      final result = await _channel.invokeMethod<String>(
        'getTrending',
        {'region': region, 'serviceId': _activeServiceId},
      );
      if (result == null) {
        throw PlatformException(
          code: 'NULL_RESULT',
          message: 'No data returned from NewPipe Extractor',
        );
      }
      final json = jsonDecode(result) as Map<String, dynamic>;
      final videos = json['videos'] as List<dynamic>?;
      if (videos == null) return [];
      return videos
          .map((v) => NewPipeTrendingResp.fromJson(v as Map<String, dynamic>))
          .toList();
    } on PlatformException catch (e) {
      throw Exception('Failed to get trending: ${e.message}');
    }
  }

  /// Get Shorts from a channel's dedicated Shorts tab.
  ///
  /// This is the real Shorts data source: it reads the channel's `/shorts`
  /// tab through the NewPipe channel-tab extractor, instead of treating a
  /// fixed search query as a Shorts feed. [channelId] is a channel handle
  /// (e.g. `@MrBeast`) or a channel URL.
  static Future<NewPipeSearchResp> getShorts({
    required String channelId,
    String? nextPage,
  }) async {
    try {
      final result = await _channel.invokeMethod<String>(
        'getShorts',
        {
          'channelId': channelId,
          'serviceId': _activeServiceId,
          if (nextPage != null) 'nextPage': nextPage,
        },
      );
      if (result == null) {
        throw PlatformException(
          code: 'NULL_RESULT',
          message: 'No data returned from NewPipe Extractor',
        );
      }
      final json = jsonDecode(result) as Map<String, dynamic>;
      return NewPipeSearchResp.fromJson(json);
    } on PlatformException catch (e) {
      throw Exception('Failed to get shorts: ${e.message}');
    }
  }

  /// Search for videos, channels, or playlists
  static Future<NewPipeSearchResp> search({
    required String query,
    required String filter,
    String? nextPage,
  }) async {
    try {
      final result = await _channel.invokeMethod<String>(
        'search',
        {
          'query': query,
          'filter': filter,
          'serviceId': _activeServiceId,
          if (nextPage != null) 'nextPage': nextPage,
        },
      );
      if (result == null) {
        throw PlatformException(
          code: 'NULL_RESULT',
          message: 'No data returned from NewPipe Extractor',
        );
      }
      final json = jsonDecode(result) as Map<String, dynamic>;
      return NewPipeSearchResp.fromJson(json);
    } on PlatformException catch (e) {
      throw Exception('Failed to search: ${e.message}');
    }
  }

  /// Get search suggestions for autocomplete
  static Future<List<String>> getSearchSuggestions(String query) async {
    try {
      final result = await _channel.invokeMethod<String>(
        'getSearchSuggestions',
        {'query': query, 'serviceId': _activeServiceId},
      );
      if (result == null) return [];
      final json = jsonDecode(result) as List<dynamic>;
      return json.map((s) => s.toString()).toList();
    } on PlatformException catch (e) {
      throw Exception('Failed to get suggestions: ${e.message}');
    }
  }

  /// Get channel info and videos
  static Future<NewPipeChannelResp> getChannel(String channelId) async {
    try {
      final result = await _channel.invokeMethod<String>(
        'getChannel',
        {'id': channelId, 'serviceId': _activeServiceId},
      );
      if (result == null) {
        throw PlatformException(
          code: 'NULL_RESULT',
          message: 'No data returned from NewPipe Extractor',
        );
      }
      final json = jsonDecode(result) as Map<String, dynamic>;
      return NewPipeChannelResp.fromJson(json);
    } on PlatformException catch (e) {
      throw Exception('Failed to get channel: ${e.message}');
    }
  }

  /// Get comments for a video
  static Future<NewPipeCommentsResp> getComments(String videoId) async {
    try {
      final result = await _channel.invokeMethod<String>(
        'getComments',
        {'id': videoId, 'serviceId': _activeServiceId},
      );
      if (result == null) {
        throw PlatformException(
          code: 'NULL_RESULT',
          message: 'No data returned from NewPipe Extractor',
        );
      }
      final json = jsonDecode(result) as Map<String, dynamic>;
      return NewPipeCommentsResp.fromJson(json);
    } on PlatformException catch (e) {
      throw Exception('Failed to get comments: ${e.message}');
    }
  }

  /// Get more comments (pagination)
  static Future<NewPipeCommentsResp> getMoreComments({
    required String videoId,
    required String nextPage,
  }) async {
    try {
      final result = await _channel.invokeMethod<String>(
        'getMoreComments',
        {
          'id': videoId,
          'serviceId': _activeServiceId,
          'nextPage': nextPage,
        },
      );
      if (result == null) {
        throw PlatformException(
          code: 'NULL_RESULT',
          message: 'No data returned from NewPipe Extractor',
        );
      }
      final json = jsonDecode(result) as Map<String, dynamic>;
      return NewPipeCommentsResp.fromJson(json);
    } on PlatformException catch (e) {
      throw Exception('Failed to get more comments: ${e.message}');
    }
  }

  /// Get comment replies
  static Future<NewPipeCommentsResp> getCommentReplies({
    required String videoId,
    required String repliesPage,
  }) async {
    try {
      final result = await _channel.invokeMethod<String>(
        'getCommentReplies',
        {
          'id': videoId,
          'serviceId': _activeServiceId,
          'repliesPage': repliesPage,
        },
      );
      if (result == null) {
        throw PlatformException(
          code: 'NULL_RESULT',
          message: 'No data returned from NewPipe Extractor',
        );
      }
      final json = jsonDecode(result) as Map<String, dynamic>;
      return NewPipeCommentsResp.fromJson(json);
    } on PlatformException catch (e) {
      throw Exception('Failed to get comment replies: ${e.message}');
    }
  }

  /// Get channel tab content (shorts, playlists, etc.) by tab URL
  static Future<NewPipeChannelResp> getChannelTab(
    String tabUrl, {
    String? tabId,
    List<String>? contentFilters,
  }) async {
    try {
      final result = await _channel.invokeMethod<String>(
        'getChannelTab',
        {
          'url': tabUrl,
          'serviceId': _activeServiceId,
          if (tabId != null) 'id': tabId,
          if (contentFilters != null) 'contentFilters': contentFilters,
        },
      );
      if (result == null) {
        throw PlatformException(
          code: 'NULL_RESULT',
          message: 'No data returned from NewPipe Extractor',
        );
      }
      final json = jsonDecode(result) as Map<String, dynamic>;
      return NewPipeChannelResp.fromJson(json);
    } on PlatformException catch (e) {
      throw Exception('Failed to get channel tab: ${e.message}');
    }
  }

  /// Get more channel tab content (pagination)
  static Future<NewPipeChannelResp> getChannelTabWithPagination(
    String tabUrl, {
    required String nextPage,
    String? tabId,
    List<String>? contentFilters,
  }) async {
    try {
      final result = await _channel.invokeMethod<String>(
        'getChannelTab',
        {
          'url': tabUrl,
          'serviceId': _activeServiceId,
          if (tabId != null) 'id': tabId,
          if (contentFilters != null) 'contentFilters': contentFilters,
          'nextPage': nextPage,
        },
      );
      if (result == null) {
        throw PlatformException(
          code: 'NULL_RESULT',
          message: 'No data returned from NewPipe Extractor',
        );
      }
      final json = jsonDecode(result) as Map<String, dynamic>;
      return NewPipeChannelResp.fromJson(json);
    } on PlatformException catch (e) {
      throw Exception('Failed to get more channel tab content: ${e.message}');
    }
  }
}

/// Cache entry for stream info with timestamp
class _CachedStreamInfo {
  final NewPipeWatchResp data;
  final DateTime timestamp;

  _CachedStreamInfo(this.data, this.timestamp);

  bool isExpired(Duration ttl) {
    return DateTime.now().difference(timestamp) > ttl;
  }
}
