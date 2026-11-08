import 'package:dartz/dartz.dart';
import 'package:vyplay/domain/core/failure/main_failure.dart';
import 'package:vyplay/domain/saved/models/local_store.dart';

abstract class SavedServices {
  Future<Either<MainFailure, List<LocalStoreVideoInfo>>> addVideoInfo(
      {required LocalStoreVideoInfo videoInfo, String profileName = 'default'});
  Future<Either<MainFailure, List<LocalStoreVideoInfo>>> getVideoInfoList(
      {String profileName = 'default'});
  Future<Either<MainFailure, List<LocalStoreVideoInfo>>> deleteVideoInfo(
      {required String id, String profileName = 'default'});
  Future<Either<MainFailure, LocalStoreVideoInfo>> checkVideoInfo(
      {required String id, String profileName = 'default'});
}
