import 'package:vyplay/domain/plugin/plugin_capability.dart';

/// Restricted execution context handed to a plugin during initialization.
///
/// The context is capability-gated and deny-by-default: a plugin may only
/// perform operations for capabilities declared in its manifest and granted by
/// the loader. Implementations must not expose database handles, cookies,
/// tokens, credentials or unrestricted filesystem access.
abstract class PluginContext {
  /// The plugin id this context belongs to.
  String get pluginId;

  /// Whether the given capability has been granted to this plugin.
  bool hasCapability(PluginCapability capability);

  /// Asserts that [capability] is granted; throws [PluginCapabilityDenied]
  /// otherwise. Implementations should call this before any privileged work.
  void requireCapability(PluginCapability capability);

  /// Emit a diagnostic message. Requires [PluginCapability.diagnostics].
  void log(String message);
}

/// Thrown when a plugin attempts an operation without the required capability.
class PluginCapabilityDenied implements Exception {
  const PluginCapabilityDenied(this.pluginId, this.capability);

  final String pluginId;
  final PluginCapability capability;

  @override
  String toString() =>
      'PluginCapabilityDenied(plugin: $pluginId, capability: ${capability.id})';
}