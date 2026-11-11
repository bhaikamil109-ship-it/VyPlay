import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vyplay/core/api_client.dart';
import 'package:vyplay/domain/core/failure/main_failure.dart';
import 'package:vyplay/domain/peertube/models/peertube_models.dart';
import 'package:vyplay/domain/peertube/peertube_api.dart';

/// Official PeerTube REST endpoints.
///
/// Public endpoints only: `/api/v1/config`, `/api/v1/videos`,
/// `/api/v1/search/videos`, `/api/v1/videos/{uuid}` and
/// `/api/v1/video-channels/{handle}[/videos]`.
@LazySingleton(as: PeerTubeApi)
class PeerTubeApiImpl implements PeerTubeApi {
  @override
  Future<PeerTubeInstanceConfig> getConfig(String instanceUrl) async {
    final json = await _getJson(instanceUrl, '/api/v1/config');
    return PeerTubeInstanceConfig.fromJson(json, instanceUrl);
  }

  @override
  Future<PeerTubeVideoPage> getVideos({
    required String instanceUrl,
    required int start,
    required int count,
    required String sort,
  }) async {
    final json = await _getJson(
      instanceUrl,
      '/api/v1/videos',
      query: {
        'start': start,
        'count': count,
        'sort': sort,
        'nsfw': 'false',
      },
    );
    return PeerTubeVideoPage.fromJson(json, instanceUrl, start: start);
  }

  @override
  Future<PeerTubeVideoPage> searchVideos({
    required String instanceUrl,
    required String query,
    required int start,
    required int count,
    required String sort,
  }) async {
    final json = await _getJson(
      instanceUrl,
      '/api/v1/search/videos',
      query: {
        'search': query,
        'start': start,
        'count': count,
        'sort': sort,
        'nsfw': 'false',
      },
    );
    return PeerTubeVideoPage.fromJson(json, instanceUrl, start: start);
  }

  @override
  Future<PeerTubeVideo> getVideo({
    required String instanceUrl,
    required String uuid,
  }) async {
    final json = await _getJson(
      instanceUrl,
      '/api/v1/videos/${Uri.encodeComponent(uuid)}',
    );
    return PeerTubeVideo.fromJson(json, instanceUrl);
  }

  @override
  Future<PeerTubeChannel> getChannel({
    required String instanceUrl,
    required String handle,
  }) async {
    final json = await _getJson(
      instanceUrl,
      '/api/v1/video-channels/${Uri.encodeComponent(handle)}',
    );
    return PeerTubeChannel.fromJson(json, instanceUrl);
  }

  @override
  Future<PeerTubeVideoPage> getChannelVideos({
    required String instanceUrl,
    required String handle,
    required int start,
    required int count,
  }) async {
    final json = await _getJson(
      instanceUrl,
      '/api/v1/video-channels/${Uri.encodeComponent(handle)}/videos',
      query: {'start': start, 'count': count, 'sort': '-publishedAt'},
    );
    return PeerTubeVideoPage.fromJson(json, instanceUrl, start: start);
  }

  Future<Map<String, dynamic>> _getJson(
    String instanceUrl,
    String path, {
    Map<String, dynamic>? query,
  }) async {
    final base = instanceUrl.endsWith('/')
        ? instanceUrl.substring(0, instanceUrl.length - 1)
        : instanceUrl;
    try {
      final response = await ApiClient.dio.get(
        '$base$path',
        queryParameters: query,
      );
      final status = response.statusCode ?? 0;
      if (status >= 200 && status < 300) {
        final data = response.data;
        if (data is Map) return Map<String, dynamic>.from(data);
        if (data is String) {
          final decoded = jsonDecode(data);
          if (decoded is Map) return Map<String, dynamic>.from(decoded);
        }
        throw const FormatException('Expected a JSON object');
      }
      throw _failureForStatus(status, response.statusMessage);
    } on DioException catch (e) {
      throw _failureForDio(e);
    }
  }

  Exception _failureForStatus(int status, String? message) {
    if (status == 401 || status == 403) {
      return PeerTubeApiException(
        MainFailure.serverError(
          statusCode: status,
          message: 'This instance does not allow anonymous access',
        ),
      );
    }
    if (status == 404) {
      return const PeerTubeApiException(MainFailure.notFound());
    }
    if (status == 429) {
      return const PeerTubeApiException(MainFailure.rateLimited());
    }
    return PeerTubeApiException(
      MainFailure.serverError(
        statusCode: status,
        message: message ?? 'PeerTube request failed',
      ),
    );
  }

  Exception _failureForDio(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return const PeerTubeApiException(MainFailure.timeout());
    }
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.badCertificate) {
      return PeerTubeApiException(
        MainFailure.networkError(message: e.message),
      );
    }
    final status = e.response?.statusCode;
    if (status != null) {
      return _failureForStatus(status, e.message);
    }
    return PeerTubeApiException(
      MainFailure.unknown(message: e.message ?? 'PeerTube request failed'),
    );
  }
}

/// Carries a [MainFailure] out of the API layer.
class PeerTubeApiException implements Exception {
  const PeerTubeApiException(this.failure);

  final MainFailure failure;

  @override
  String toString() => 'PeerTubeApiException($failure)';
}

/// Converts an API exception into the app's standard failure type.
MainFailure peerTubeFailure(Object error) {
  if (error is PeerTubeApiException) return error.failure;
  if (error is FormatException) {
    return MainFailure.parseError(message: error.message);
  }
  return MainFailure.unknown(message: error.toString());
}
