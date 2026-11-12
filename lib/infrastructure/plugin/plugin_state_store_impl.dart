import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vyplay/domain/plugin/plugin_state_store.dart';

@LazySingleton(as: PluginStateStore)
class PluginStateStoreImpl implements PluginStateStore {
  PluginStateStoreImpl() : _directoryOverride = null;

  PluginStateStoreImpl.withDirectory(Directory directory)
      : _directoryOverride = directory;

  final Directory? _directoryOverride;

  static const _fileName = 'plugin_enabled_state.json';

  Future<File> _file() async {
    final dir = _directoryOverride ?? await getApplicationSupportDirectory();
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return File('${dir.path}/$_fileName');
  }

  @override
  Future<Map<String, bool>> load() async {
    try {
      final file = await _file();
      if (!await file.exists()) return <String, bool>{};
      final raw = await file.readAsString();
      if (raw.trim().isEmpty) return <String, bool>{};
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return <String, bool>{};
      final result = <String, bool>{};
      for (final entry in decoded.entries) {
        if (entry.value is bool) {
          result[entry.key.toString()] = entry.value as bool;
        }
      }
      return result;
    } catch (_) {
      return <String, bool>{};
    }
  }

  @override
  Future<void> save(Map<String, bool> enabled) async {
    final file = await _file();
    final temp = File('${file.path}.tmp');
    await temp.writeAsString(jsonEncode(enabled), flush: true);
    if (await file.exists()) await file.delete();
    await temp.rename(file.path);
  }
}