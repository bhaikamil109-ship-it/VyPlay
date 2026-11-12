import 'package:injectable/injectable.dart';
import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_extension_registry.dart';

/// Common aliases for compatibility with alternate naming.
typedef ExtensionRegistryImpl = PluginExtensionRegistryImpl;
typedef ExtensionPointRegistryImpl = PluginExtensionRegistryImpl;

@LazySingleton(as: PluginExtensionRegistry)
class PluginExtensionRegistryImpl implements PluginExtensionRegistry {
  final List<ExtensionContribution> _contributions =
      <ExtensionContribution>[];

  @override
  PluginResult<void> register(ExtensionContribution contribution) {
    if (contribution.pluginId.trim().isEmpty) {
      return PluginResult<void>.failure(PluginFailure(
        pluginId: contribution.pluginId,
        code: PluginErrorCodes.invalidManifest,
        message: 'Plugin id must not be empty',
      ));
    }
    if (contribution.id.trim().isEmpty) {
      return PluginResult<void>.failure(PluginFailure(
        pluginId: contribution.pluginId,
        code: PluginErrorCodes.invalidManifest,
        message: 'Contribution id must not be empty',
      ));
    }
    final required = contribution.point.requiredCapability;
    if (required != null &&
        !contribution.grantedCapabilities.contains(required)) {
      return PluginResult<void>.failure(PluginFailure(
        pluginId: contribution.pluginId,
        code: PluginErrorCodes.capabilityDenied,
        message:
            'Missing capability ${required.id} for ${contribution.point.id}',
      ));
    }
    if (_contributions.any((c) => c.key == contribution.key)) {
      return PluginResult<void>.failure(PluginFailure(
        pluginId: contribution.pluginId,
        code: PluginErrorCodes.duplicateId,
        message: 'Contribution "${contribution.key}" already registered',
      ));
    }
    _contributions.add(contribution);
    return const PluginResult<void>.success(null);
  }

  @override
  void unregister(
    String pluginId, {
    ExtensionPoint? point,
    String? contributionId,
  }) {
    _contributions.removeWhere((contribution) {
      if (contribution.pluginId != pluginId) return false;
      if (point != null && contribution.point != point) return false;
      if (contributionId != null && contribution.id != contributionId) {
        return false;
      }
      return true;
    });
  }

  @override
  List<ExtensionContribution> contributions(ExtensionPoint point) {
    return _contributions
        .where((contribution) => contribution.point == point)
        .toList(growable: false);
  }

  @override
  List<ExtensionContribution> contributionsByPlugin(String pluginId) {
    return _contributions
        .where((contribution) => contribution.pluginId == pluginId)
        .toList(growable: false);
  }

  @override
  int get size => _contributions.length;
}
