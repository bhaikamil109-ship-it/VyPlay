import 'dart:async';

import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';

/// Sandboxing policy and execution guard for plugins.
///
/// The sandbox provides deny-by-default capability checks, execution timeouts,
/// argument validation helpers and resource accounting. It does not provide
/// OS-level process isolation; it is an in-process guard layer.
/// Common aliases for compatibility with alternate naming.
typedef Sandbox = PluginSandbox;

abstract class PluginSandbox {
  /// Runs [action] for [pluginId] with a timeout and error isolation.
  Future<PluginResult<T>> run<T>(
    String pluginId,
    Future<T> Function() action, {
    Duration timeout = const Duration(seconds: 5),
    Set<PluginCapability>? capabilities,
  });

  /// Whether [pluginId] may perform a network request to [uri].
  bool isNetworkAllowed(
    String pluginId,
    Uri uri, {
    Set<PluginCapability>? capabilities,
    Set<String>? declaredHosts,
  });

  /// Whether [pluginId] may read the given settings [key].
  bool isSettingReadable(String key);

  /// Capability check helper.
  bool hasCapability(
    String pluginId,
    PluginCapability capability, {
    Set<PluginCapability>? granted,
  });

  /// Throws [PluginCapabilityDenied] when [capability] is not granted.
  void requireCapability(
    String pluginId,
    PluginCapability capability, {
    Set<PluginCapability>? granted,
  });

  /// Attempts to acquire [cost] execution units for [pluginId].
  bool tryAcquire(String pluginId, {int cost = 1});

  /// Resets accounting for [pluginId].
  void reset(String pluginId);
}
