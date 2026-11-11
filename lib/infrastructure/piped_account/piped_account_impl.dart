import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vyplay/core/api_client.dart';
import 'package:vyplay/core/strings.dart';
import 'package:vyplay/domain/core/failure/main_failure.dart';
import 'package:vyplay/domain/piped_account/models/piped_account_models.dart';
import 'package:vyplay/domain/piped_account/piped_account_service.dart';

@LazySingleton(as: PipedAccountService)
class PipedAccountImpl implements PipedAccountService {
  String _url(String path) {
    final base = BaseUrl.kBaseUrl;
    return base.endsWith('/') ? '$base$path' : '$base/$path';
  }

  Options _authOptions(String token) => Options(
        headers: {'Authorization': token},
      );

  MainFailure _failure(DioException e) {
    final code = e.response?.statusCode;
    if (code == 401 || code == 403) {
      return MainFailure.serverError(
        statusCode: code,
        message: 'Piped authentication failed',
      );
    }
    if (code == 404) return const MainFailure.notFound();
    if (code == 429) return const MainFailure.rateLimited();
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return const MainFailure.timeout();
    }
    return MainFailure.serverError(
      statusCode: code,
      message: e.response?.data?.toString() ?? e.message,
    );
  }

  @override
  Future<Either<MainFailure, String>> register({
    required String username,
    required String password,
  }) async {
    try {
      final response = await ApiClient.dio.post(
        _url('register'),
        data: {'username': username, 'password': password},
      );
      final token = (response.data as Map?)?['token'] as String?;
      if (token == null || token.isEmpty) {
        return const Left(MainFailure.parseError(message: 'Missing token'));
      }
      return Right(token);
    } on DioException catch (e) {
      return Left(_failure(e));
    } catch (e) {
      return Left(MainFailure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, String>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await ApiClient.dio.post(
        _url('login'),
        data: {'username': username, 'password': password},
      );
      final token = (response.data as Map?)?['token'] as String?;
      if (token == null || token.isEmpty) {
        return const Left(MainFailure.parseError(message: 'Missing token'));
      }
      return Right(token);
    } on DioException catch (e) {
      return Left(_failure(e));
    } catch (e) {
      return Left(MainFailure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, bool>> logout({required String token}) async {
    try {
      await ApiClient.dio.post(_url('logout'), options: _authOptions(token));
      return const Right(true);
    } on DioException catch (e) {
      return Left(_failure(e));
    } catch (e) {
      return Left(MainFailure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, List<PipedSubscription>>> getSubscriptions({
    required String token,
  }) async {
    try {
      final response = await ApiClient.dio.get(
        _url('subscriptions'),
        options: _authOptions(token),
      );
      final data = response.data;
      if (data is! List) {
        return const Left(MainFailure.parseError(message: 'Expected a list'));
      }
      final subscriptions = data
          .whereType<Map>()
          .map((e) => PipedSubscription.fromJson(Map<String, dynamic>.from(e)))
          .where((e) => e.id.isNotEmpty)
          .toList();
      return Right(subscriptions);
    } on DioException catch (e) {
      return Left(_failure(e));
    } catch (e) {
      return Left(MainFailure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, bool>> subscribe({
    required String token,
    required String channelId,
  }) async {
    try {
      await ApiClient.dio.post(
        _url('subscribe'),
        data: {'channelId': channelId},
        options: _authOptions(token),
      );
      return const Right(true);
    } on DioException catch (e) {
      return Left(_failure(e));
    } catch (e) {
      return Left(MainFailure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, bool>> unsubscribe({
    required String token,
    required String channelId,
  }) async {
    try {
      await ApiClient.dio.post(
        _url('unsubscribe'),
        data: {'channelId': channelId},
        options: _authOptions(token),
      );
      return const Right(true);
    } on DioException catch (e) {
      return Left(_failure(e));
    } catch (e) {
      return Left(MainFailure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, List<PipedPlaylist>>> getPlaylists({
    required String token,
  }) async {
    try {
      final response = await ApiClient.dio.get(
        _url('user/playlists'),
        options: _authOptions(token),
      );
      final data = response.data;
      if (data is! List) {
        return const Left(MainFailure.parseError(message: 'Expected a list'));
      }
      final playlists = data
          .whereType<Map>()
          .map((e) => PipedPlaylist.fromJson(Map<String, dynamic>.from(e)))
          .where((e) => e.id.isNotEmpty)
          .toList();
      return Right(playlists);
    } on DioException catch (e) {
      return Left(_failure(e));
    } catch (e) {
      return Left(MainFailure.unknown(message: e.toString()));
    }
  }
}
