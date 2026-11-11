import 'package:dartz/dartz.dart';
import 'package:vyplay/domain/core/failure/main_failure.dart';
import 'package:vyplay/domain/peertube/models/peertube_models.dart';

/// PeerTube data access used by the application layer.
abstract class PeerTubeRepository {
  Future<Either<MainFailure, PeerTubeInstanceConfig>> getConfig(
    String instanceUrl,
  );

  Future<Either<MainFailure, PeerTubeVideoPage>> getVideos({
    required String instanceUrl,
    required int start,
    required int count,
    String sort = '-publishedAt',
  });

  Future<Either<MainFailure, PeerTubeVideoPage>> searchVideos({
    required String instanceUrl,
    required String query,
    required int start,
    required int count,
    String sort = '-match',
  });

  Future<Either<MainFailure, PeerTubeVideo>> getVideo({
    required String instanceUrl,
    required String uuid,
  });

  Future<Either<MainFailure, PeerTubeChannel>> getChannel({
    required String instanceUrl,
    required String handle,
  });

  Future<Either<MainFailure, PeerTubeVideoPage>> getChannelVideos({
    required String instanceUrl,
    required String handle,
    required int start,
    int count = 20,
  });
}
