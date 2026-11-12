import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_context.dart';
import 'package:vyplay/domain/plugin/plugin_extension_registry.dart';
import 'package:vyplay/domain/plugin/plugin_manifest.dart';
import 'package:vyplay/domain/plugin/plugin_manager.dart';
import 'package:vyplay/domain/plugin/plugin_permission.dart';
import 'package:vyplay/domain/plugin/plugin_state_store.dart';
import 'package:vyplay/infrastructure/plugin/plugin_extension_registry_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_loader_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_manager_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_permission_service_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_sandbox_impl.dart';

const String _pluginId = 'com.example.contrib';

class _MemoryStateStore implements PluginStateStore {
  _MemoryStateStore([Map<String, bool>? initial]) : data = {...?initial};

  final Map<String, bool> data;

  @override
  Future<Map<String, bool>> load() async => Map<String, bool>.from(data);

  @override
  Future<void> save(Map<String, bool> enabled) async => data.addAll(enabled);
}

class _MemoryPermissionStore implements PluginPermissionStore {
  _MemoryPermissionStore([Map<String, Set<PluginCapability>>? initial])
      : data = {
          for (final entry in (initial ?? const {}).entries)
            entry.key: <PluginCapability>{...entry.value},
        };

  final Map<String, Set<PluginCapability>> data;

  @override
  Future<Map<String, Set<PluginCapability>>> load() async => {
        for (final entry in data.entries)
          entry.key: <PluginCapability>{...entry.value},
      };

  @override
  Future<void> save(Map<String, Set<PluginCapability>> grants) async {
    data.clear();
    for (final entry in grants.entries) {
      data[entry.key] = <PluginCapability>{...entry.value};
    }
  }
}

class _Plugin implements Plugin {
  _Plugin(this.manifest);

  @override
  final PluginManifest manifest;

  PluginStatus _status = PluginStatus.unregistered;

  @override
  PluginStatus get status => _status;

  @override
  Future<PluginResult<void>> initialize(PluginContext context) async {
    _status = PluginStatus.enabled;
    return const PluginResult<void>.success(null);
  }

  @override
  Future<PluginResult<void>> dispose() async {
    _status = PluginStatus.disabled;
    return const PluginResult<void>.success(null);
  }
}

class _Harness {
  _Harness(this.manager, this.registry, this.permissionStore,
      this.permissionService);

  final PluginManager manager;
  final PluginExtensionRegistry registry;
  final _MemoryPermissionStore permissionStore;
  final PluginPermissionService permissionService;
}

_Harness _harness({
  Map<String, bool>? enabled,
  Map<String, Set<PluginCapability>>? grants,
}) {
  final stateStore = _MemoryStateStore(enabled);
  final permissionStore = _MemoryPermissionStore(grants);
  final registry = PluginExtensionRegistryImpl();
  final manager = PluginManagerImpl(
    loader: PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    ),
    registry: registry,
    sandbox: PluginSandboxImpl(),
  );
  return _Harness(
    manager,
    registry,
    permissionStore,
    PluginPermissionServiceImpl(store: permissionStore),
  );
}

PluginManifest _manifest({
  List<PluginCapability> capabilities = const [
    PluginCapability.settingsRead,
    PluginCapability.diagnostics,
  ],
  List<PluginContributionSpec> contributions = const [],
}) {
  return PluginManifest(
    id: _pluginId,
    name: 'Contrib Plugin',
    version: '1.0.0',
    description: 'contribution test plugin',
    provider: 'test',
    platforms: const ['android'],
    capabilities: capabilities,
    minAppVersion: '1.0.0',
    contributions: contributions,
  );
}

const List<PluginContributionSpec> _allContributions = [
  PluginContributionSpec(point: ExtensionPoint.settingsSection, id: 'main'),
  PluginContributionSpec(point: ExtensionPoint.diagnostics, id: 'report'),
  PluginContributionSpec(point: ExtensionPoint.menuItem, id: 'open'),
];

Set<String> _keys(List<ExtensionContribution> contributions) =>
    contributions.map((contribution) => contribution.key).toSet();

void main() {
  group('PluginManifest contributions', () {
    test('defaults to no contributions and round-trips them through JSON', () {
      expect(_manifest().contributions, isEmpty);
      expect(_manifest().validate(), isEmpty);

      final json = _manifest(contributions: _allContributions).toJson();
      final restored = PluginManifest.fromJson(
        Map<String, dynamic>.from(json),
      );

      expect(
        restored.contributions.map((contribution) => contribution.key),
        _allContributions.map((contribution) => contribution.key),
      );
    });

    test('skips contributions that target an unknown extension point', () {
      final restored = PluginManifest.fromJson(<String, dynamic>{
        'id': _pluginId,
        'name': 'Contrib Plugin',
        'version': '1.0.0',
        'description': 'd',
        'provider': 'test',
        'platforms': const ['android'],
        'capabilities': const ['settings.read'],
        'minAppVersion': '1.0.0',
        'contributions': const [
          {'point': 'not.a.point', 'id': 'x'},
          {'point': 'settings.section', 'id': 'main'},
        ],
      });

      expect(restored.contributions, hasLength(1));
      expect(restored.contributions.single.id, 'main');
    });

    test('rejects duplicate contribution declarations', () {
      final errors = _manifest(contributions: const [
        PluginContributionSpec(point: ExtensionPoint.menuItem, id: 'open'),
        PluginContributionSpec(point: ExtensionPoint.menuItem, id: 'open'),
      ]).validate();

      expect(errors, contains('Duplicate contribution "ui.menu:open"'));
    });

    test('rejects a contribution whose capability is not declared', () {
      final errors = _manifest(
        capabilities: const [PluginCapability.diagnostics],
        contributions: const [
          PluginContributionSpec(point: ExtensionPoint.settingsSection, id: 'main'),
        ],
      ).validate();

      expect(
        errors.any((error) => error.contains('does not declare the settings.read')),
        isTrue,
        reason: 'errors were: $errors',
      );
    });

    test('rejects an empty contribution id', () {
      final errors = _manifest(contributions: const [
        PluginContributionSpec(point: ExtensionPoint.menuItem, id: '  '),
      ]).validate();

      expect(errors, contains('Contribution id must not be empty'));
    });
  });

  group('PluginManager contribution wiring', () {
    test('enabling a plugin publishes its gated contributions', () async {
      final harness = _harness(grants: {
        _pluginId: {PluginCapability.settingsRead, PluginCapability.diagnostics},
      });
      await harness.manager.register(_Plugin(_manifest(contributions: _allContributions)));

      expect(harness.registry.size, 0);

      await harness.manager.initialize(_pluginId);

      expect(harness.registry.size, 3);
      expect(
        _keys(harness.registry.contributions(ExtensionPoint.settingsSection)),
        {'$_pluginId:settings.section:main'},
      );
      expect(
        _keys(harness.registry.contributions(ExtensionPoint.diagnostics)),
        {'$_pluginId:diagnostics:report'},
      );
      expect(
        _keys(harness.registry.contributions(ExtensionPoint.menuItem)),
        {'$_pluginId:ui.menu:open'},
      );
    });

    test(
        'deny-by-default withholds gated contributions but keeps capability-free points',
        () async {
      final harness = _harness();
      await harness.manager.register(_Plugin(_manifest(contributions: _allContributions)));
      await harness.manager.initialize(_pluginId);

      // settings.read and diagnostics were never granted, so only ui.menu
      // (which requires no capability) is published.
      expect(harness.registry.size, 1);
      expect(_keys(harness.registry.contributions(ExtensionPoint.menuItem)),
          {'$_pluginId:ui.menu:open'});
      expect(
        harness.registry.contributions(ExtensionPoint.settingsSection),
        isEmpty,
      );
      expect(harness.registry.contributions(ExtensionPoint.diagnostics), isEmpty);
    });

    test('a plugin that declares no contributions registers nothing', () async {
      final harness = _harness(grants: {
        _pluginId: {PluginCapability.settingsRead},
      });
      await harness.manager.register(_Plugin(_manifest()));
      await harness.manager.initialize(_pluginId);

      expect(harness.registry.size, 0);
      expect(harness.registry.contributionsByPlugin(_pluginId), isEmpty);
    });

    test('disabling a plugin removes its contributions', () async {
      final harness = _harness(grants: {
        _pluginId: {PluginCapability.settingsRead, PluginCapability.diagnostics},
      });
      await harness.manager.register(_Plugin(_manifest(contributions: _allContributions)));
      await harness.manager.initialize(_pluginId);
      expect(harness.registry.size, 3);

      await harness.manager.setEnabled(_pluginId, false);

      expect(harness.registry.size, 0);
      expect(harness.registry.contributionsByPlugin(_pluginId), isEmpty);
    });

    test('re-enabling does not duplicate contributions', () async {
      final harness = _harness(grants: {
        _pluginId: {PluginCapability.settingsRead, PluginCapability.diagnostics},
      });
      await harness.manager.register(_Plugin(_manifest(contributions: _allContributions)));

      await harness.manager.setEnabled(_pluginId, true);
      await harness.manager.setEnabled(_pluginId, false);
      await harness.manager.setEnabled(_pluginId, true);

      expect(harness.registry.size, 3);
    });

    test('disposeAll removes every contribution', () async {
      final harness = _harness(grants: {
        _pluginId: {PluginCapability.settingsRead, PluginCapability.diagnostics},
      });
      await harness.manager.register(_Plugin(_manifest(contributions: _allContributions)));
      await harness.manager.initialize(_pluginId);
      expect(harness.registry.size, 3);

      await harness.manager.disposeAll();

      expect(harness.registry.size, 0);
    });

    test('a plugin restored as enabled publishes contributions on register',
        () async {
      final harness = _harness(
        enabled: {_pluginId: true},
        grants: {_pluginId: {PluginCapability.settingsRead}},
      );

      await harness.manager.register(
        _Plugin(_manifest(contributions: _allContributions)),
      );

      expect(harness.manager.status(_pluginId), PluginStatus.enabled);
      expect(
        _keys(harness.registry.contributions(ExtensionPoint.settingsSection)),
        {'$_pluginId:settings.section:main'},
      );
      // diagnostics was not granted, so it stays withheld.
      expect(harness.registry.contributions(ExtensionPoint.diagnostics), isEmpty);
    });

    test('granting a capability later publishes the withheld contribution on reload',
        () async {
      final harness = _harness();
      await harness.manager.register(_Plugin(_manifest(contributions: _allContributions)));
      await harness.manager.initialize(_pluginId);

      expect(harness.registry.size, 1);
      expect(harness.registry.contributions(ExtensionPoint.diagnostics), isEmpty);

      await harness.permissionService
          .grant(_pluginId, PluginCapability.diagnostics);
      await harness.manager.setEnabled(_pluginId, false);
      await harness.manager.setEnabled(_pluginId, true);

      expect(
        _keys(harness.registry.contributions(ExtensionPoint.diagnostics)),
        {'$_pluginId:diagnostics:report'},
      );
      // settings.read is still denied.
      expect(harness.registry.contributions(ExtensionPoint.settingsSection), isEmpty);
    });
  });
}
