import 'package:dartz/dartz.dart';
import 'package:vyplay/domain/core/failure/main_failure.dart';
import 'package:vyplay/domain/piped_account/models/piped_account_models.dart';

/// Piped account API. Endpoints are taken from the official Piped-Backend
/// routes: `/register`, `/login`, `/logout`, `/subscriptions`, `/subscribe`,
/// `/unsubscribe` and `/user/playlists`.
abstract class PipedAccountService {
  Future<Either<MainFailure, String>> register({
    required String username,
    required String password,
  });

  Future<Either<MainFailure, String>> login({
    required String username,
    required String password,
  });

  Future<Either<MainFailure, bool>> logout({required String token});

  Future<Either<MainFailure, List<PipedSubscription>>> getSubscriptions({
    required String token,
  });

  Future<Either<MainFailure, bool>> subscribe({
    required String token,
    required String channelId,
  });

  Future<Either<MainFailure, bool>> unsubscribe({
    required String token,
    required String channelId,
  });

  Future<Either<MainFailure, List<PipedPlaylist>>> getPlaylists({
    required String token,
  });
}
