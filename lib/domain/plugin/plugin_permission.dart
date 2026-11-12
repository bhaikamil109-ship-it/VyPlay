import 'package:vyplay/domain/plugin/plugin_capability.dart';

/// Persists granted capabilities per plugin.
abstract class PluginPermissionStore {
  /// Returns a map of plugin id -> granted capabilities.
  Future<Map<String, Set<PluginCapability>>> load();

  /// Persists granted capabilities for all plugins.
  Future<void> save(Map<String, Set<PluginCapability>> grants);
}/// Manages user-granted capabilities for plugins.
abstract class PluginPermissionService {
  /// Returns the capabilities granted to [pluginId] under the current
  /// persisted permission policy.
  ///
  /// Deny-by-default: when no persisted policy exists for [pluginId],
  /// no declared capabilities are granted. When a persisted policy exists,
  /// only the intersection of the persisted grants and [declared]
  /// capabilities is returned — the user can only ever grant capabilities
  /// the plugin declared.
  Future<Set<PluginCapability>> grantedCapabilities(
    String pluginId, {
      Set<PluginCapability> declared = const <PluginCapability>{},
    });

  /// Grants [capability] to [pluginId].
  Future<void> grant(String pluginId, PluginCapability capability);

  /// Revokes [capability] from [pluginId].
  Future<void> revoke(String pluginId, PluginCapability capability);

  /// Resets [pluginId] to no persisted policy.
  Future<void> reset(String pluginId);

  /// Returns all persisted grants.
  Future<Map<String, Set<PluginCapability>>> loadAll();
}
