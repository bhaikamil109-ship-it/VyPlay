import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_extension_registry.dart';
import 'package:vyplay/infrastructure/plugin/plugin_extension_registry_impl.dart';

void main() {
  group('PluginExtensionRegistry', () {
    test('registers contribution with capability', () {
      final registry = PluginExtensionRegistryImpl();
      final contribution = ExtensionContribution(
        pluginId: 'p',
        point: ExtensionPoint.searchProvider,
        id: 'main',
        handler: Object(),
        grantedCapabilities: const {PluginCapability.search},
      );
      final result = registry.register(contribution);
      expect(result.isSuccess, isTrue);
      expect(registry.size, 1);
      expect(registry.contributions(ExtensionPoint.searchProvider), hasLength(1));
    });

    test('rejects missing capability', () {
      final registry = PluginExtensionRegistryImpl();
      final contribution = ExtensionContribution(
        pluginId: 'p',
        point: ExtensionPoint.searchProvider,
        id: 'main',
        handler: Object(),
        grantedCapabilities: const {},
      );
      final result = registry.register(contribution);
      expect(result.isFailure, isTrue);
      expect(result.error!.code, PluginErrorCodes.capabilityDenied);
    });

    test('rejects duplicate contribution', () {
      final registry = PluginExtensionRegistryImpl();
      final contribution = ExtensionContribution(
        pluginId: 'p',
        point: ExtensionPoint.searchProvider,
        id: 'main',
        handler: Object(),
        grantedCapabilities: const {PluginCapability.search},
      );
      registry.register(contribution);
      final result = registry.register(contribution);
      expect(result.isFailure, isTrue);
      expect(result.error!.code, PluginErrorCodes.duplicateId);
    });

    test('rejects empty ids', () {
      final registry = PluginExtensionRegistryImpl();
      final contribution = ExtensionContribution(
        pluginId: '',
        point: ExtensionPoint.menuItem,
        id: '',
        handler: Object(),
      );
      final result = registry.register(contribution);
      expect(result.isFailure, isTrue);
    });

    test('unregister by plugin', () {
      final registry = PluginExtensionRegistryImpl();
      registry.register(ExtensionContribution(
        pluginId: 'p',
        point: ExtensionPoint.menuItem,
        id: 'm1',
        handler: Object(),
      ));
      registry.register(ExtensionContribution(
        pluginId: 'p',
        point: ExtensionPoint.menuItem,
        id: 'm2',
        handler: Object(),
      ));
      registry.unregister('p');
      expect(registry.size, 0);
    });

    test('unregister filtered by point and id', () {
      final registry = PluginExtensionRegistryImpl();
      registry.register(ExtensionContribution(
        pluginId: 'p',
        point: ExtensionPoint.menuItem,
        id: 'm1',
        handler: Object(),
      ));
      registry.register(ExtensionContribution(
        pluginId: 'p',
        point: ExtensionPoint.menuItem,
        id: 'm2',
        handler: Object(),
      ));
      registry.unregister('p', contributionId: 'm1');
      expect(registry.size, 1);
      expect(registry.contributionsByPlugin('p').first.id, 'm2');
    });

    test('contributionsByPlugin', () {
      final registry = PluginExtensionRegistryImpl();
      registry.register(ExtensionContribution(
        pluginId: 'p1',
        point: ExtensionPoint.diagnostics,
        id: 'd1',
        handler: Object(),
        grantedCapabilities: const {PluginCapability.diagnostics},
      ));
      expect(registry.contributionsByPlugin('p1'), hasLength(1));
      expect(registry.contributionsByPlugin('nope'), isEmpty);
    });

    test('extension point parsing', () {
      expect(ExtensionPointX.tryParse('ui.menu'), ExtensionPoint.menuItem);
      expect(ExtensionPointX.tryParse('nope'), isNull);
    });
  });
}
