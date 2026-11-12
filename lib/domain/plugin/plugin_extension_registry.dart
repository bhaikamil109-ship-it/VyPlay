import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_contribution.dart';

export 'package:vyplay/domain/plugin/plugin_contribution.dart';

/// A contribution made by a plugin to a host extension point.
class ExtensionContribution {
  const ExtensionContribution({
    required this.pluginId,
    required this.point,
    required this.id,
    required this.handler,
    this.grantedCapabilities = const <PluginCapability>{},
  });

  final String pluginId;
  final ExtensionPoint point;
  final String id;
  final Object handler;
  final Set<PluginCapability> grantedCapabilities;

  String get key => '$pluginId:${point.id}:$id';
}

/// Registry for plugin contributions to host extension points.
/// Common aliases for compatibility with alternate naming.
typedef ExtensionRegistry = PluginExtensionRegistry;

typedef ExtensionPointRegistry = PluginExtensionRegistry;

abstract class PluginExtensionRegistry {
  /// Registers a contribution. Returns failure on invalid input or missing
  /// capability.
  PluginResult<void> register(ExtensionContribution contribution);

  /// Removes contributions for a plugin, optionally filtered by point/id.
  void unregister(
    String pluginId, {
    ExtensionPoint? point,
    String? contributionId,
  });

  /// Returns all contributions for [point].
  List<ExtensionContribution> contributions(ExtensionPoint point);

  /// Returns all contributions made by [pluginId].
  List<ExtensionContribution> contributionsByPlugin(String pluginId);

  /// Total number of registered contributions.
  int get size;
}
