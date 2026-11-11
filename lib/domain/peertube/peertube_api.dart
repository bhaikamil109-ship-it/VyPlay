import 'package:vyplay/domain/peertube/models/peertube_models.dart';

/// Official PeerTube REST API used by the app.
///
/// All methods are anonymous. OAuth is intentionally not part of Phase 5.
abstract class PeerTubeApi {
  Future<PeerTubeInstanceConfig> getConfig(String instanceUrl);

  Future<PeerTubeVideoPage> getVideos({
    required String instanceUrl,
    required int start,
    required int count,
    required String sort,
  });

  Future<PeerTubeVideoPage> searchVideos({
    required String instanceUrl,
    required String query,
    required int start,
    required int count,
    required String sort,
  });

  Future<PeerTubeVideo> getVideo({
    required String instanceUrl,
    required String uuid,
  });

  Future<PeerTubeChannel> getChannel({
    required String instanceUrl,
    required String handle,
  });

  Future<PeerTubeVideoPage> getChannelVideos({
    required String instanceUrl,
    required String handle,
    required int start,
    required int count,
  });
}
