import 'package:vyplay/domain/plugin/plugin_context.dart';
import 'package:vyplay/domain/plugin/plugin_manifest.dart';

/// Lifecycle status of a plugin.
enum PluginStatus {
  unregistered,
  registered,
  initializing,
  enabled,
  disabled,
  error,
}

/// A plugin is a compile-time-registered declarative module.
///
/// Plugins must not perform arbitrary code loading. All privileged access goes
/// through the [PluginContext] provided during [initialize].
abstract class Plugin {
  /// Declarative metadata describing this plugin.
  PluginManifest get manifest;

  /// Current lifecycle status.
  PluginStatus get status;

  /// Initialize the plugin with a restricted context.
  ///
  /// Implementations must not throw; failures should be reported via
  /// [PluginFailure] and reflected in [status].
  Future<PluginResult<void>> initialize(PluginContext context);

  /// Dispose of resources acquired during initialization.
  Future<PluginResult<void>> dispose();
}

/// Result wrapper for plugin operations.
class PluginResult<T> {
  const PluginResult.success(this.value) : error = null;
  const PluginResult.failure(this.error) : value = null;

  final T? value;
  final PluginFailure? error;

  bool get isSuccess => error == null;
  bool get isFailure => error != null;
}

/// Failure reported by a plugin or the loader.
class PluginFailure {
  const PluginFailure({
    required this.pluginId,
    required this.code,
    required this.message,
    this.cause,
  });

  final String pluginId;
  final String code;
  final String message;
  final Object? cause;

  @override
  String toString() => 'PluginFailure($pluginId, $code, $message)';
}

/// Stable error codes for plugin failures.
class PluginErrorCodes {
  const PluginErrorCodes._();

  static const String invalidManifest = 'invalid_manifest';
  static const String duplicateId = 'duplicate_id';
  static const String incompatibleVersion = 'incompatible_version';
  static const String initializationFailed = 'initialization_failed';
  static const String capabilityDenied = 'capability_denied';
  static const String notEnabled = 'not_enabled';
  static const String disposalFailed = 'disposal_failed';
}