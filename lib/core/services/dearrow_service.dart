import 'dart:developer';

import 'package:dio/dio.dart';

/// DeArrow service - provides better (less clickbait) titles and thumbnails
/// Based on LibreTube's DeArrow integration
class DeArrowService {
  static DeArrowService? _instance;
  factory DeArrowService() => _instance ??= DeArrowService._();

  DeArrowService._();

  static const String _baseUrl = 'https://dearrow.8484.nl/';
  static const String _apiVersion = 'v1';

  /// Get DeArrow-enhanced title for a video
  /// Returns null if DeArrow data is not available
  Future<String?> getTitle(String videoId, {String? originalTitle}) async {
    try {
      final url = Uri.parse('$_baseUrl/$_apiVersion/title/$videoId').toString();
      final response = await Dio().get(url);

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data as Map<String, dynamic>?;
        if (data != null && data.containsKey('title')) {
          final dearrowTitle = data['title'] as String?;
          // Use DeArrow title if available and different from original
          if (dearrowTitle != null && dearrowTitle.isNotEmpty) {
            log('[DeArrow] Got enhanced title for $videoId');
            return dearrowTitle;
          }
        }
      }
      return originalTitle;
    } catch (e) {
      log('[DeArrow] Error fetching title: $e');
      return null;
    }
  }

  /// Get DeArrow-enhanced thumbnail URL
  /// Returns null if DeArrow thumbnail is not available
  Future<String?> getThumbnail(String videoId, {String? originalThumbnail}) async {
    try {
      final url = Uri.parse('$_baseUrl/$_apiVersion/thumbnail/$videoId').toString();
      final response = await Dio().get(url);

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data as Map<String, dynamic>?;
        if (data != null && data.containsKey('url')) {
          final thumbnailUrl = data['url'] as String?;
          if (thumbnailUrl != null && thumbnailUrl.isNotEmpty) {
            log('[DeArrow] Got enhanced thumbnail for $videoId');
            return thumbnailUrl;
          }
        }
      }
      return originalThumbnail;
    } catch (e) {
      log('[DeArrow] Error fetching thumbnail: $e');
      return null;
    }
  }

  /// Get both title and thumbnail for a video
  Future<DeArrowResult> getEnhancedData(String videoId, {String? originalTitle, String? originalThumbnail}) async {
    final titleResult = getTitle(videoId, originalTitle: originalTitle);
    final thumbnailResult = getThumbnail(videoId, originalThumbnail: originalThumbnail);

    final results = await Future.wait([titleResult, thumbnailResult]);

    return DeArrowResult(
      title: results[0] as String?,
      thumbnailUrl: results[1] as String?,
      usedDearrow: results[0] != null || results[1] != null,
    );
  }
}

class DeArrowResult {
  final String? title;
  final String? thumbnailUrl;
  final bool usedDearrow;

  DeArrowResult({this.title, this.thumbnailUrl, required this.usedDearrow});
}
