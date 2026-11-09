import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:vyplay/core/api_client.dart';
import 'package:vyplay/domain/watch/models/ryd_votes.dart';

/// Return YouTube Dislike integration.
///
/// YouTube no longer exposes dislike counts through its own APIs, so services
/// such as Piped/Invidious/NewPipe usually report 0. When the watch screen has
/// no usable dislike count this service fetches the community-maintained count
/// from <https://returnyoutubedislikeapi.com> once per video and caches it.
class ReturnYoutubeDislikeService {
  static ReturnYoutubeDislikeService? _instance;

  factory ReturnYoutubeDislikeService() =>
      _instance ??= ReturnYoutubeDislikeService._();

  ReturnYoutubeDislikeService._();

  static const String baseUrl = 'https://returnyoutubedislikeapi.com';

  final Map<String, RydVotes?> _cache = {};
  final Map<String, Future<RydVotes?>> _pending = {};

  /// Cached votes for a video, or null when they were never fetched.
  RydVotes? cached(String videoId) => _cache[videoId];

  /// Fetches the votes for [videoId]. Returns null on any network/API failure;
  /// failures are cached so a broken video does not retry on every rebuild.
  Future<RydVotes?> fetchVotes(String videoId) {
    if (videoId.trim().isEmpty) return Future.value(null);
    if (_cache.containsKey(videoId)) return Future.value(_cache[videoId]);
    return _pending[videoId] ??= _fetch(videoId);
  }

  Future<RydVotes?> _fetch(String videoId) async {
    try {
      final response = await ApiClient.dio.get<Map<String, dynamic>>(
        '$baseUrl/votes',
        queryParameters: {'videoId': videoId},
        options: Options(
          receiveTimeout: const Duration(seconds: 5),
          sendTimeout: const Duration(seconds: 5),
        ),
      );
      final data = response.data;
      final votes = data == null ? null : RydVotes.fromJson(data);
      _cache[videoId] = votes;
      return votes;
    } catch (e) {
      log('[RYD] Failed to fetch votes for $videoId: $e');
      _cache[videoId] = null;
      return null;
    } finally {
      _pending.remove(videoId);
    }
  }
}
