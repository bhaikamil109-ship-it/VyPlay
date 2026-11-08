import 'package:dartz/dartz.dart';
import 'package:vyplay/domain/core/failure/main_failure.dart';
import 'package:vyplay/domain/subscribes/models/subscribe.dart';
import 'package:vyplay/domain/trending/models/newpipe/newpipe_trending_resp.dart';
import 'package:vyplay/domain/trending/models/piped/trending_resp.dart';

abstract class HomeServices {
  Future<Either<MainFailure, List<TrendingResp>>> getHomeFeedData(
      {required List<Subscribe> channels});

  Future<Either<MainFailure, List<NewPipeTrendingResp>>> getNewPipeHomeFeedData(
      {required List<Subscribe> channels, int videosPerChannel = 10});
}
