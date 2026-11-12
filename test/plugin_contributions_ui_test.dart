import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vyplay/core/di/injectable.dart';
import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_context.dart';
import 'package:vyplay/domain/plugin/plugin_extension_registry.dart';
import 'package:vyplay/domain/plugin/plugin_manifest.dart';
import 'package:vyplay/domain/plugin/plugin_manager.dart';
import 'package:vyplay/domain/plugin/plugin_permission.dart';
import 'package:vyplay/domain/plugin/plugin_sandbox.dart';
import 'package:vyplay/domain/plugin/plugin_state_store.dart';
import 'package:vyplay/generated/l10n.dart';
import 'package:vyplay/infrastructure/plugin/plugin_extension_registry_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_loader_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_manager_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_permission_service_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_sandbox_impl.dart';
import 'package:vyplay/presentation/settings/sub_screens/plugin_permissions_screen.dart';
import 'package:vyplay/presentation/settings/widgets/plugin_contributions_section.dart';

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
  _Harness(this.manager, this.registry);

  final PluginManager manager;
  final PluginExtensionRegistry registry;
}

void _clearDi() {
  void remove<T extends Object>() {
    if (getIt.isRegistered<T>()) getIt.unregister<T>();
  }

  remove<PluginManager>();
  remove<PluginPermissionService>();
  remove<PluginSandbox>();
  remove<PluginPermissionStore>();
  remove<PluginStateStore>();
  remove<PluginExtensionRegistry>();
}

_Harness _boot({Map<String, Set<PluginCapability>>? grants}) {
  _clearDi();
  final permissionStore = _MemoryPermissionStore(grants);
  final registry = PluginExtensionRegistryImpl();
  final sandbox = PluginSandboxImpl();
  final manager = PluginManagerImpl(
    loader: PluginLoaderImpl(
      stateStore: _MemoryStateStore(),
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    ),
    registry: registry,
    sandbox: sandbox,
  );

  getIt.registerSingleton<PluginStateStore>(_MemoryStateStore());
  getIt.registerSingleton<PluginPermissionStore>(permissionStore);
  getIt.registerSingleton<PluginSandbox>(sandbox);
  getIt.registerSingleton<PluginExtensionRegistry>(registry);
  getIt.registerSingleton<PluginPermissionService>(
    PluginPermissionServiceImpl(store: permissionStore),
  );
  getIt.registerSingleton<PluginManager>(manager);

  return _Harness(manager, registry);
}

PluginManifest _manifest({
  List<PluginContributionSpec> contributions = const [],
  List<PluginCapability> capabilities = const [PluginCapability.settingsRead],
}) {
  return PluginManifest(
    id: _pluginId,
    name: 'Diag Plugin',
    version: '1.0.0',
    description: 'contributions ui test plugin',
    provider: 'test',
    platforms: const ['android'],
    capabilities: capabilities,
    minAppVersion: '1.0.0',
    contributions: contributions,
  );
}

Future<void> _pumpSection(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      locale: const Locale('en'),
      supportedLocales: const [Locale('en')],
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const Scaffold(
        body: SingleChildScrollView(child: PluginContributionsSection()),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  tearDown(_clearDi);

  testWidgets('shows the empty state when nothing is published',
      (tester) async {
    _boot();
    await _pumpSection(tester);

    expect(find.text('Plugin contributions'), findsOneWidget);
    expect(find.text('No plugin contributions available yet.'), findsOneWidget);
  });

  testWidgets('renders a published contribution with plugin, point and id',
      (tester) async {
    final harness = _boot(grants: {
      _pluginId: {PluginCapability.settingsRead},
    });
    await harness.manager.register(_Plugin(_manifest(contributions: const [
      PluginContributionSpec(point: ExtensionPoint.settingsSection, id: 'main'),
    ])));
    await harness.manager.initialize(_pluginId);

    await _pumpSection(tester);

    expect(find.text('Diag Plugin'), findsOneWidget);
    expect(find.text('settings.section'), findsOneWidget);
    expect(find.text('main'), findsOneWidget);
    expect(find.text('No plugin contributions available yet.'), findsNothing);
  });

  testWidgets('renders every published point for a plugin', (tester) async {
    final harness = _boot(grants: {
      _pluginId: {PluginCapability.settingsRead, PluginCapability.diagnostics},
    });
    await harness.manager.register(_Plugin(_manifest(
      capabilities: const [
        PluginCapability.settingsRead,
        PluginCapability.diagnostics,
      ],
      contributions: const [
        PluginContributionSpec(point: ExtensionPoint.settingsSection, id: 'main'),
        PluginContributionSpec(point: ExtensionPoint.diagnostics, id: 'report'),
        PluginContributionSpec(point: ExtensionPoint.menuItem, id: 'open'),
      ],
    )));
    await harness.manager.initialize(_pluginId);

    await _pumpSection(tester);

    expect(find.text('settings.section'), findsOneWidget);
    expect(find.text('diagnostics'), findsOneWidget);
    expect(find.text('ui.menu'), findsOneWidget);
  });

  testWidgets('does not list a contribution whose capability is denied',
      (tester) async {
    // No grants at all: deny-by-default keeps the gated contribution out.
    final harness = _boot();
    await harness.manager.register(_Plugin(_manifest(contributions: const [
      PluginContributionSpec(point: ExtensionPoint.settingsSection, id: 'main'),
    ])));
    await harness.manager.initialize(_pluginId);

    await _pumpSection(tester);

    expect(harness.registry.size, 0);
    expect(find.text('settings.section'), findsNothing);
    expect(find.text('No plugin contributions available yet.'), findsOneWidget);
  });

  testWidgets('tapping a contribution opens that plugin permissions screen',
      (tester) async {
    final harness = _boot(grants: {
      _pluginId: {PluginCapability.settingsRead},
    });
    await harness.manager.register(_Plugin(_manifest(contributions: const [
      PluginContributionSpec(point: ExtensionPoint.settingsSection, id: 'main'),
    ])));
    await harness.manager.initialize(_pluginId);

    await _pumpSection(tester);
    expect(find.byType(PluginPermissionsScreen), findsNothing);

    await tester.tap(find.text('Diag Plugin'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.byType(PluginPermissionsScreen), findsOneWidget);
    expect(find.text('SEARCH'), findsNothing);
    expect(find.text('Read settings'), findsOneWidget);
  });
}
