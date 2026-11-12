import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_context.dart';

/// Factory that builds a restricted [PluginContext] for a plugin.
typedef PluginContextFactory = PluginContext Function(
  String pluginId,
  Set<PluginCapability> grantedCapabilities,
);

/// Controlled plugin registration and loading.
///
/// Plugins are compile-time registered only. No remote executable code is
/// loaded. Implementations must validate manifests, reject duplicates and
/// incompatible versions, and isolate initialization failures.
abstract class PluginLoader {
  /// Registers a compile-time plugin. Throws [PluginFailure] on validation
  /// failure, duplicate id or incompatible version.
  Future<PluginResult<void>> register(Plugin plugin);

  /// Returns all registered plugins.
  List<Plugin> get plugins;

  /// Returns a registered plugin by id, or null.
  Plugin? plugin(String id);

  /// Status of a registered plugin.
  PluginStatus status(String id);

  /// Manifest validation errors for a plugin id, or null if registered.
  List<String>? manifestErrors(String id);

  /// Initializes a registered plugin using the provided context factory.
  Future<PluginResult<void>> initialize(
    String id,
    PluginContextFactory contextFactory,
  );

  /// Disposes a registered plugin.
  Future<PluginResult<void>> dispose(String id);

  /// Enables or disables a registered plugin, persisting state.
  Future<PluginResult<void>> setEnabled(String id, bool enabled);

  /// Whether a plugin is currently enabled.
  bool isEnabled(String id);

  /// Capabilities granted to a plugin (after permission policy).
  Set<PluginCapability> grantedCapabilities(String id);
}