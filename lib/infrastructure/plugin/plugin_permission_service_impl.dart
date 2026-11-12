import 'package:injectable/injectable.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_permission.dart';

@LazySingleton(as: PluginPermissionService)
class PluginPermissionServiceImpl implements PluginPermissionService {
  PluginPermissionServiceImpl({required PluginPermissionStore store})
      : _store = store;

  final PluginPermissionStore _store;

  @override
  Future<Set<PluginCapability>> grantedCapabilities(
    String pluginId, {
    Set<PluginCapability> declared = const <PluginCapability>{},
  }) async {
    final grants = await _store.load();
    if (grants.containsKey(pluginId)) {
      // Persisted user grants intersected with declared capabilities.
      return grants[pluginId]!.intersection(declared);
    }
    // No persisted policy — deny all declared capabilities by default.
    // The user must explicitly grant each capability.
    return <PluginCapability>{};
  }

  @override
  Future<void> grant(String pluginId, PluginCapability capability) async {
    final grants = await _store.load();
    final current = grants[pluginId] ?? <PluginCapability>{};
    grants[pluginId] = {...current, capability};
    await _store.save(grants);
  }

  @override
  Future<void> revoke(String pluginId, PluginCapability capability) async {
    final grants = await _store.load();
    final current = grants[pluginId] ?? <PluginCapability>{};
    current.remove(capability);
    grants[pluginId] = current;
    await _store.save(grants);
  }

  @override
  Future<void> reset(String pluginId) async {
    final grants = await _store.load();
    grants.remove(pluginId);
    await _store.save(grants);
  }

  @override
  Future<Map<String, Set<PluginCapability>>> loadAll() => _store.load();
}
