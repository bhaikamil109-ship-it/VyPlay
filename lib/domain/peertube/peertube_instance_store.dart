import 'package:vyplay/domain/peertube/models/peertube_models.dart';

/// Persists the user's PeerTube instance list and selection.
abstract class PeerTubeInstanceStore {
  Future<PeerTubeInstanceSelection> load();

  Future<void> save(PeerTubeInstanceSelection selection);
}
