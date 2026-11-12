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
import 'package:vyplay/presentation/home/widgets/plugin_menu_contributions_button.dart';
import 'package:vyplay/presentation/settings/sub_screens/plugin_permissions_screen.dart';

const String _pluginId = 'com.example.menu';

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

PluginManager _boot() {
  _clearDi();
  final permissionStore = _MemoryPermissionStore();
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
  return manager;
}

PluginManifest _manifest({String id = _pluginId}) => PluginManifest(
      id: id,
      name: 'Menu Plugin',
      version: '1.0.0',
      description: 'menu contribution test',
      provider: 'test',
      platforms: const ['android'],
      capabilities: const [PluginCapability.diagnostics],
      minAppVersion: '1.0.0',
      contributions: const [
        PluginContributionSpec(point: ExtensionPoint.menuItem, id: 'open'),
      ],
    );

Future<void> _pumpAppBar(WidgetTester tester) async {
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('host'),
          actions: const [PluginMenuContributionsButton()],
        ),
        body: const SizedBox.shrink(),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  tearDown(_clearDi);

  testWidgets('renders nothing when no plugin publishes a menu item',
      (tester) async {
    _boot();
    await _pumpAppBar(tester);

    expect(find.byType(PopupMenuButton<ExtensionContribution>), findsNothing);
  });

  testWidgets('renders a menu button for a published menu item',
      (tester) async {
    final manager = _boot();
    await manager.register(_Plugin(_manifest()));
    await manager.initialize(_pluginId);

    await _pumpAppBar(tester);

    expect(find.byType(PopupMenuButton<ExtensionContribution>), findsOneWidget);
  });

  testWidgets('lists the contribution with plugin name and id', (tester) async {
    final manager = _boot();
    await manager.register(_Plugin(_manifest()));
    await manager.initialize(_pluginId);
    await _pumpAppBar(tester);

    await tester.tap(find.byType(PopupMenuButton<ExtensionContribution>));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Menu Plugin'), findsOneWidget);
    expect(find.text('open'), findsOneWidget);
  });

  testWidgets('selecting a menu item opens that plugin permissions screen',
      (tester) async {
    final manager = _boot();
    await manager.register(_Plugin(_manifest()));
    await manager.initialize(_pluginId);
    await _pumpAppBar(tester);

    await tester.tap(find.byType(PopupMenuButton<ExtensionContribution>));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    await tester.tap(find.text('Menu Plugin'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.byType(PluginPermissionsScreen), findsOneWidget);
  });

  testWidgets('the button disappears when the plugin is disabled',
      (tester) async {
    final manager = _boot();
    await manager.register(_Plugin(_manifest()));
    await manager.initialize(_pluginId);
    await _pumpAppBar(tester);
    expect(find.byType(PopupMenuButton<ExtensionContribution>), findsOneWidget);

    await manager.setEnabled(_pluginId, false);
    await tester.pumpWidget(const SizedBox.shrink());
    await _pumpAppBar(tester);

    expect(find.byType(PopupMenuButton<ExtensionContribution>), findsNothing);
  });
}
