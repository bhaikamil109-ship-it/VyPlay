import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vyplay/domain/peertube/models/peertube_models.dart';
import 'package:vyplay/domain/peertube/peertube_instance_store.dart';

/// Small JSON-backed store for PeerTube instances.
///
/// Deliberately separate from the Drift settings table: it adds no migration,
/// cannot corrupt existing user settings, and only holds public instance URLs.
@LazySingleton(as: PeerTubeInstanceStore)
class PeerTubeInstanceStoreImpl implements PeerTubeInstanceStore {
  PeerTubeInstanceStoreImpl() : _directoryOverride = null;

  /// Test constructor that avoids the platform path provider.
  PeerTubeInstanceStoreImpl.withDirectory(Directory directory)
      : _directoryOverride = directory;

  final Directory? _directoryOverride;

  static const _fileName = 'peertube_instances.json';

  Future<File> _file() async {
    final dir = _directoryOverride ?? await getApplicationSupportDirectory();
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return File('${dir.path}/$_fileName');
  }

  @override
  Future<PeerTubeInstanceSelection> load() async {
    try {
      final file = await _file();
      if (!await file.exists()) return const PeerTubeInstanceSelection.empty();
      final raw = await file.readAsString();
      if (raw.trim().isEmpty) return const PeerTubeInstanceSelection.empty();
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return const PeerTubeInstanceSelection.empty();
      return PeerTubeInstanceSelection.fromJson(
        Map<String, dynamic>.from(decoded),
      );
    } catch (_) {
      // A corrupt or unreadable cache must never block browsing.
      return const PeerTubeInstanceSelection.empty();
    }
  }

  @override
  Future<void> save(PeerTubeInstanceSelection selection) async {
    final file = await _file();
    final temp = File('${file.path}.tmp');
    await temp.writeAsString(jsonEncode(selection.toJson()), flush: true);
    if (await file.exists()) await file.delete();
    await temp.rename(file.path);
  }
}
