import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/infrastructure/plugin/plugin_context_impl.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_extension_api.dart';
import 'package:vyplay/domain/plugin/plugin_extension_registry.dart';
import 'package:vyplay/domain/plugin/plugin_loader.dart';
import 'package:vyplay/domain/plugin/plugin_manager.dart';
import 'package:vyplay/domain/plugin/plugin_sandbox.dart';
import 'package:vyplay/infrastructure/plugin/plugin_extension_api_impl.dart';

/// Common aliases for compatibility with alternate naming.
typedef PluginHostImpl = PluginManagerImpl;

class PluginManagerImpl implements PluginManager {
  PluginManagerImpl({
    required this.loader,
    required this.registry,
    required this.sandbox,
  });

  final PluginLoader loader;
  final PluginExtensionRegistry registry;
  final PluginSandbox sandbox;

  final Map<String, PluginExtensionApi> _apis = <String, PluginExtensionApi>{};

  PluginExtensionApi _createExtensionApi(String id) {
    final plugin = loader.plugin(id);
    if (plugin == null) {
      throw StateError('Plugin $id is not registered');
    }
    return PluginExtensionApiImpl(
      pluginId: id,
      grantedCapabilities: loader.grantedCapabilities(id),
      allowedNetworkHosts: plugin.manifest.networkHosts,
      sandbox: sandbox,
    );
  }

  @override
  Future<PluginResult<void>> register(Plugin plugin) async {
    final result = await loader.register(plugin);
    if (result.isSuccess) {
      _apis[plugin.manifest.id] = _createExtensionApi(plugin.manifest.id);
      _syncContributions(plugin.manifest.id);
    }
    return result;
  }

  @override
  Future<PluginResult<void>> initialize(String id) async {
    if (loader.plugin(id) == null) {
      return PluginResult<void>.failure(PluginFailure(
        pluginId: id,
        code: PluginErrorCodes.notEnabled,
        message: 'Plugin not registered',
      ));
    }
    final result = await loader.initialize(id, (pluginId, caps) {
      return PluginContextImpl(
        pluginId: pluginId,
        grantedCapabilities: caps,
      );
    });
    if (result.isSuccess) {
      // Loader refreshes grants on every enable. Refresh the API too.
      _apis[id] = _createExtensionApi(id);
      _syncContributions(id);
    } else {
      _apis.remove(id);
    }
    return result;
  }

  @override
  Future<PluginResult<void>> setEnabled(String id, bool enabled) async {
    if (enabled) {
      return initialize(id);
    }
    return dispose(id);
  }

  @override
  Future<PluginResult<void>> dispose(String id) async {
    final result = await loader.dispose(id);
    // A disabled plugin must not retain an API with previously granted access.
    _apis.remove(id);
    _syncContributions(id);
    return result;
  }

  @override
  Future<void> disposeAll() async {
    for (final plugin in List<Plugin>.from(loader.plugins)) {
      await dispose(plugin.manifest.id);
    }
  }

  /// Mirrors the plugin's declared contributions into the host registry.
  ///
  /// The registry entries are rebuilt from scratch on every lifecycle change,
  /// so a disable/re-enable cycle cannot duplicate them, and the capability
  /// gate uses the *granted* set (deny-by-default) rather than the
  /// capabilities the plugin merely declared.
  void _syncContributions(String id) {
    registry.unregister(id);
    if (loader.status(id) != PluginStatus.enabled) return;
    final plugin = loader.plugin(id);
    if (plugin == null) return;
    final granted = loader.grantedCapabilities(id);
    for (final spec in plugin.manifest.contributions) {
      registry.register(ExtensionContribution(
        pluginId: id,
        point: spec.point,
        id: spec.id,
        handler: spec,
        grantedCapabilities: granted,
      ));
    }
  }

  @override
  List<Plugin> get plugins => loader.plugins;

  @override
  Plugin? plugin(String id) => loader.plugin(id);

  @override
  PluginStatus status(String id) => loader.status(id);

  @override
  Set<PluginCapability> grantedCapabilities(String id) =>
      loader.grantedCapabilities(id);

  @override
  PluginExtensionApi extensionApi(String id) {
    if (loader.status(id) != PluginStatus.enabled) {
      throw StateError('Plugin $id is not enabled');
    }
    final api = _apis[id];
    if (api == null) {
      throw StateError('Plugin $id has no active extension API');
    }
    return api;
  }

  @override
  List<ExtensionContribution> contributions(ExtensionPoint point) =>
      registry.contributions(point);
}
