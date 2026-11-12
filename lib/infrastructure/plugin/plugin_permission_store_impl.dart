import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_permission.dart';

@LazySingleton(as: PluginPermissionStore)
class PluginPermissionStoreImpl implements PluginPermissionStore {
  PluginPermissionStoreImpl() : _directoryOverride = null;

  PluginPermissionStoreImpl.withDirectory(Directory directory)
      : _directoryOverride = directory;

  final Directory? _directoryOverride;

  static const _fileName = 'plugin_permissions.json';

  Future<File> _file() async {
    final dir = _directoryOverride ?? await getApplicationSupportDirectory();
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return File('${dir.path}/$_fileName');
  }

  @override
  Future<Map<String, Set<PluginCapability>>> load() async {
    try {
      final file = await _file();
      if (!await file.exists()) return <String, Set<PluginCapability>>{};
      final raw = await file.readAsString();
      if (raw.trim().isEmpty) return <String, Set<PluginCapability>>{};
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return <String, Set<PluginCapability>>{};
      final result = <String, Set<PluginCapability>>{};
      for (final entry in decoded.entries) {
        final caps = <PluginCapability>{};
        if (entry.value is List) {
          for (final item in entry.value as List) {
            final parsed = PluginCapabilityX.tryParse(item?.toString() ?? '');
            if (parsed != null) caps.add(parsed);
          }
        }
        result[entry.key.toString()] = caps;
      }
      return result;
    } catch (_) {
      return <String, Set<PluginCapability>>{};
    }
  }

  @override
  Future<void> save(Map<String, Set<PluginCapability>> grants) async {
    final file = await _file();
    final temp = File('${file.path}.tmp');
    final encoded = <String, List<String>>{};
    for (final entry in grants.entries) {
      encoded[entry.key] =
          entry.value.map((capability) => capability.id).toList(growable: false);
    }
    await temp.writeAsString(jsonEncode(encoded), flush: true);
    if (await file.exists()) await file.delete();
    await temp.rename(file.path);
  }
}
