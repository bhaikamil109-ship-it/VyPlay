import 'dart:developer' as developer;

import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_context.dart';

class PluginContextImpl implements PluginContext {
  PluginContextImpl({
    required this.pluginId,
    required Set<PluginCapability> grantedCapabilities,
  }) : _granted = Set<PluginCapability>.from(grantedCapabilities);

  @override
  final String pluginId;

  final Set<PluginCapability> _granted;

  @override
  bool hasCapability(PluginCapability capability) => _granted.contains(capability);

  @override
  void requireCapability(PluginCapability capability) {
    if (!hasCapability(capability)) {
      throw PluginCapabilityDenied(pluginId, capability);
    }
  }

  @override
  void log(String message) {
    requireCapability(PluginCapability.diagnostics);
    developer.log(message, name: 'plugin:$pluginId');
  }
}