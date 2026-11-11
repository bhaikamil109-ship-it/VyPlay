import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vyplay/domain/core/failure/main_failure.dart';
import 'package:vyplay/domain/peertube/models/peertube_models.dart';
import 'package:vyplay/domain/peertube/peertube_api.dart';
import 'package:vyplay/domain/peertube/peertube_repository.dart';
import 'package:vyplay/infrastructure/peertube/peertube_api_impl.dart';

@LazySingleton(as: PeerTubeRepository)
class PeerTubeRepositoryImpl implements PeerTubeRepository {
  PeerTubeRepositoryImpl(this._api);

  final PeerTubeApi _api;

  @override
  Future<Either<MainFailure, PeerTubeInstanceConfig>> getConfig(
    String instanceUrl,
  ) =>
      _call(() => _api.getConfig(instanceUrl));

  @override
  Future<Either<MainFailure, PeerTubeVideoPage>> getVideos({
    required String instanceUrl,
    required int start,
    required int count,
    String sort = '-publishedAt',
  }) =>
      _call(() => _api.getVideos(
            instanceUrl: instanceUrl,
            start: start,
            count: count,
            sort: sort,
          ));

  @override
  Future<Either<MainFailure, PeerTubeVideoPage>> searchVideos({
    required String instanceUrl,
    required String query,
    required int start,
    required int count,
    String sort = '-match',
  }) =>
      _call(() => _api.searchVideos(
            instanceUrl: instanceUrl,
            query: query,
            start: start,
            count: count,
            sort: sort,
          ));

  @override
  Future<Either<MainFailure, PeerTubeVideo>> getVideo({
    required String instanceUrl,
    required String uuid,
  }) =>
      _call(() => _api.getVideo(instanceUrl: instanceUrl, uuid: uuid));

  @override
  Future<Either<MainFailure, PeerTubeChannel>> getChannel({
    required String instanceUrl,
    required String handle,
  }) =>
      _call(() => _api.getChannel(instanceUrl: instanceUrl, handle: handle));

  @override
  Future<Either<MainFailure, PeerTubeVideoPage>> getChannelVideos({
    required String instanceUrl,
    required String handle,
    required int start,
    int count = 20,
  }) =>
      _call(() => _api.getChannelVideos(
            instanceUrl: instanceUrl,
            handle: handle,
            start: start,
            count: count,
          ));

  Future<Either<MainFailure, T>> _call<T>(Future<T> Function() body) async {
    try {
      return Right(await body());
    } catch (error) {
      return Left(peerTubeFailure(error));
    }
  }
}
