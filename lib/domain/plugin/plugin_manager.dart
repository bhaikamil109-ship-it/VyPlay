import 'package:vyplay/domain/plugin/plugin_capability.dart'
    as pc; // borrowed to avoid type-name clash
import 'package:vyplay/domain/plugin/plugin_extension_api.dart';
import 'package:vyplay/domain/plugin/plugin_extension_registry.dart';
import 'package:vyplay/domain/plugin/plugin.dart';

/// Orchestrates plugin registration, initialization, permissions and
/// extension contributions.
abstract class PluginManager {
  Future<PluginResult<void>> register(Plugin plugin);

  Future<PluginResult<void>> initialize(String id);

  Future<PluginResult<void>> setEnabled(String id, bool enabled);

  Future<PluginResult<void>> dispose(String id);

  Future<void> disposeAll();

  List<Plugin> get plugins;

  Plugin? plugin(String id);

  PluginStatus status(String id);

  PluginExtensionApi extensionApi(String id);

  List<ExtensionContribution> contributions(ExtensionPoint point);

  /// Capabilities granted to a plugin (after permission policy).
  Set<pc.PluginCapability> grantedCapabilities(String id);
}
