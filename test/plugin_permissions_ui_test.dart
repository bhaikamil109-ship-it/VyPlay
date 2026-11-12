import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vyplay/core/di/injectable.dart';
import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_context.dart';
import 'package:vyplay/domain/plugin/plugin_manager.dart';
import 'package:vyplay/domain/plugin/plugin_manifest.dart';
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
import 'package:vyplay/presentation/settings/widgets/plugin_permissions_section.dart';

/// These tests must never touch `dart:io`. `testWidgets` runs its body inside a
/// fake-async zone, and a real file-system `Future` never completes there, so
/// awaiting `PluginStateStoreImpl` / `PluginPermissionStoreImpl` deadlocks the
/// test before the first frame (the historical "pumpWidget hang"). All stores
/// below are in-memory fakes that complete on a microtask.
const String _pluginId = 'com.example.diag';

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

class _TestPlugin implements Plugin {
  _TestPlugin({this.failDispose = false});

  final bool failDispose;
  PluginStatus _status = PluginStatus.unregistered;
  Set<PluginCapability> sessionCapabilities = <PluginCapability>{};
  int initializeCount = 0;

  @override
  final PluginManifest manifest = const PluginManifest(
    id: _pluginId,
    name: 'Diag Plugin',
    version: '1.0.0',
    description: 'diagnostic test plugin',
    provider: 'test',
    platforms: ['android'],
    capabilities: [PluginCapability.search, PluginCapability.diagnostics],
    minAppVersion: '1.0.0',
  );

  @override
  PluginStatus get status => _status;

  @override
  Future<PluginResult<void>> initialize(PluginContext context) async {
    initializeCount++;
    sessionCapabilities = {
      for (final capability in manifest.capabilities)
        if (context.hasCapability(capability)) capability,
    };
    _status = PluginStatus.enabled;
    return const PluginResult<void>.success(null);
  }

  @override
  Future<PluginResult<void>> dispose() async {
    if (failDispose) {
      return PluginResult<void>.failure(PluginFailure(
        pluginId: _pluginId,
        code: 'dispose_failed',
        message: 'dispose boom',
      ));
    }
    _status = PluginStatus.disabled;
    return const PluginResult<void>.success(null);
  }
}

class _Harness {
  _Harness({
    required this.stateStore,
    required this.permissionStore,
    required this.manager,
    required this.service,
  });

  final _MemoryStateStore stateStore;
  final _MemoryPermissionStore permissionStore;
  final PluginManager manager;
  final PluginPermissionService service;
}

void _clearDi() {
  void remove<T extends Object>() {
    if (getIt.isRegistered<T>()) {
      getIt.unregister<T>();
    }
  }

  remove<PluginManager>();
  remove<PluginPermissionService>();
  remove<PluginSandbox>();
  remove<PluginPermissionStore>();
  remove<PluginStateStore>();
}

/// Wires a fresh, isolated in-memory plugin stack into GetIt.
Future<_Harness> _boot({
  Map<String, bool>? enabled,
  Map<String, Set<PluginCapability>>? grants,
}) async {
  _clearDi();

  final stateStore = _MemoryStateStore(enabled);
  final permissionStore = _MemoryPermissionStore(grants);
  final loader = PluginLoaderImpl(
    stateStore: stateStore,
    appVersion: '2.0.0',
    permissionStore: permissionStore,
  );
  final sandbox = PluginSandboxImpl();
  final manager = PluginManagerImpl(
    loader: loader,
    registry: PluginExtensionRegistryImpl(),
    sandbox: sandbox,
  );
  final service = PluginPermissionServiceImpl(store: permissionStore);

  getIt.registerSingleton<PluginStateStore>(stateStore);
  getIt.registerSingleton<PluginPermissionStore>(permissionStore);
  getIt.registerSingleton<PluginSandbox>(sandbox);
  getIt.registerSingleton<PluginPermissionService>(service);
  getIt.registerSingleton<PluginManager>(manager);

  return _Harness(
    stateStore: stateStore,
    permissionStore: permissionStore,
    manager: manager,
    service: service,
  );
}

Future<void> _pump(WidgetTester tester, Widget home) async {
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
      home: home,
    ),
  );
  // Let the screen's asynchronous permissions load complete and rebuild.
  await tester.pump();
  await tester.pump();
}

Widget _sectionHost() => const Scaffold(
      body: SingleChildScrollView(child: PluginPermissionsSection()),
    );

Finder _capabilityRow(String label) =>
    find.ancestor(of: find.text(label), matching: find.byType(InkWell)).first;

Switch _switchFor(WidgetTester tester, String label) => tester.widget<Switch>(
      find.descendant(of: _capabilityRow(label), matching: find.byType(Switch)),
    );

Future<void> _tapSwitch(WidgetTester tester, String label) async {
  await tester.tap(
    find.descendant(of: _capabilityRow(label), matching: find.byType(Switch)),
  );
  await tester.pump();
  await tester.pump();
}

Future<void> _tapApplyNow(WidgetTester tester) async {
  final button = find.text('Apply now');
  await tester.ensureVisible(button);
  await tester.pump();
  await tester.tap(button);
  await tester.pump();
  await tester.pump();
}

void main() {
  tearDown(_clearDi);

  group('PluginPermissionsSection', () {
    testWidgets('shows empty state when no plugins are registered',
        (tester) async {
      await _boot();
      await _pump(tester, _sectionHost());

      expect(find.text('No plugins installed yet.'), findsOneWidget);
      expect(find.text('Diag Plugin'), findsNothing);
    });

    testWidgets('lists a registered plugin with granted/denied summary',
        (tester) async {
      final harness = await _boot();
      await harness.manager.register(_TestPlugin());
      await _pump(tester, _sectionHost());

      expect(find.text('Diag Plugin'), findsOneWidget);
      expect(find.text('test · 1.0.0'), findsOneWidget);
      // Deny-by-default: both declared capabilities are denied on first run.
      expect(find.text('0/2 granted'), findsOneWidget);
      expect(find.text('2 denied'), findsOneWidget);
    });

    testWidgets('shows denied badge when a declared capability is revoked',
        (tester) async {
      final harness = await _boot(grants: {
        _pluginId: {PluginCapability.search},
      });
      await harness.manager.register(_TestPlugin());
      await _pump(tester, _sectionHost());

      expect(find.text('1/2 granted'), findsOneWidget);
      expect(find.text('1 denied'), findsOneWidget);
    });

    testWidgets('tapping a plugin tile opens the permissions screen',
        (tester) async {
      final harness = await _boot();
      await harness.manager.register(_TestPlugin());
      await _pump(tester, _sectionHost());

      expect(find.byType(PluginPermissionsScreen), findsNothing);

      await tester.tap(find.text('Diag Plugin'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));

      expect(find.byType(PluginPermissionsScreen), findsOneWidget);
      expect(find.text('Search content'), findsWidgets);
      expect(find.byType(Switch), findsNWidgets(2));
    });
  });

  group('PluginPermissionsScreen', () {
    testWidgets('shows declared capabilities with granted/denied icons',
        (tester) async {
      final harness = await _boot();
      await harness.manager.register(_TestPlugin());
      await _pump(tester, const PluginPermissionsScreen(pluginId: _pluginId));

      expect(find.text('SEARCH'), findsOneWidget);
      expect(find.text('Search content'), findsOneWidget);
      expect(find.text('DIAGNOSTICS'), findsOneWidget);
      expect(find.text('Diagnostics'), findsOneWidget);
      expect(find.byType(Switch), findsNWidgets(2));
      expect(
        tester.widgetList<Switch>(find.byType(Switch)).map((s) => s.value),
        everyElement(isFalse),
      );
      // Denied capabilities are called out.
      expect(find.text('Restricted capabilities'), findsOneWidget);
    });

    testWidgets(
        'deny-by-default: undeclared capabilities are not listed or toggleable',
        (tester) async {
      final harness = await _boot();
      await harness.manager.register(_TestPlugin());
      await _pump(tester, const PluginPermissionsScreen(pluginId: _pluginId));

      // Playback is a real capability the plugin never declared.
      expect(find.text('Playback'), findsNothing);
      expect(find.text('PLAYBACK'), findsNothing);
      // Only the two declared capabilities have rows (and switches).
      expect(find.byType(Switch), findsNWidgets(2));
      expect(find.text('Not declared by this plugin'), findsNothing);
    });

    testWidgets('granting a revoked capability persists and shows as granted',
        (tester) async {
      final harness = await _boot();
      await harness.manager.register(_TestPlugin());
      await _pump(tester, const PluginPermissionsScreen(pluginId: _pluginId));

      expect(_switchFor(tester, 'Search content').value, isFalse);

      await _tapSwitch(tester, 'Search content');

      expect(harness.permissionStore.data[_pluginId], {PluginCapability.search});
      expect(_switchFor(tester, 'Search content').value, isTrue);
      expect(_switchFor(tester, 'Diagnostics').value, isFalse);
    });

    testWidgets('revoking a capability persists and shows as denied',
        (tester) async {
      final harness = await _boot(grants: {
        _pluginId: {PluginCapability.search, PluginCapability.diagnostics},
      });
      await harness.manager.register(_TestPlugin());
      await _pump(tester, const PluginPermissionsScreen(pluginId: _pluginId));

      expect(_switchFor(tester, 'Search content').value, isTrue);

      await _tapSwitch(tester, 'Search content');

      expect(harness.permissionStore.data[_pluginId],
          {PluginCapability.diagnostics});
      expect(_switchFor(tester, 'Search content').value, isFalse);
      expect(_switchFor(tester, 'Diagnostics').value, isTrue);
    });

    testWidgets('enabled plugin shows reload-required hint after permission change',
        (tester) async {
      final plugin = _TestPlugin();
      final harness = await _boot(enabled: {_pluginId: true});
      await harness.manager.register(plugin);
      expect(harness.manager.status(_pluginId), PluginStatus.enabled);

      await _pump(tester, const PluginPermissionsScreen(pluginId: _pluginId));
      expect(find.text('Permission change requires reload'), findsNothing);

      await _tapSwitch(tester, 'Search content');

      expect(find.text('Permission change requires reload'), findsOneWidget);
      expect(_switchFor(tester, 'Search content').value, isTrue);
      // The running plugin keeps its old (empty) session capabilities.
      expect(harness.manager.grantedCapabilities(_pluginId), isEmpty);
      expect(plugin.sessionCapabilities, isEmpty);
    });

    testWidgets('apply-now disables then re-enables and applies permissions',
        (tester) async {
      final plugin = _TestPlugin();
      final harness = await _boot(enabled: {_pluginId: true});
      await harness.manager.register(plugin);
      await _pump(tester, const PluginPermissionsScreen(pluginId: _pluginId));

      await _tapSwitch(tester, 'Search content');
      expect(find.text('Permission change requires reload'), findsOneWidget);
      expect(harness.manager.grantedCapabilities(_pluginId), isEmpty);

      await _tapApplyNow(tester);
      await tester.pump(const Duration(milliseconds: 350));

      expect(harness.manager.status(_pluginId), PluginStatus.enabled);
      expect(harness.manager.grantedCapabilities(_pluginId),
          {PluginCapability.search});
      expect(plugin.sessionCapabilities, {PluginCapability.search});
      expect(find.text('Plugin permissions applied.'), findsOneWidget);
      expect(find.text('Permission change requires reload'), findsNothing);
    });

    testWidgets('error banner appears when reload fails and can be dismissed',
        (tester) async {
      final plugin = _TestPlugin(failDispose: true);
      final harness = await _boot(enabled: {_pluginId: true});
      await harness.manager.register(plugin);
      await _pump(tester, const PluginPermissionsScreen(pluginId: _pluginId));

      await _tapSwitch(tester, 'Search content');
      expect(find.text('Permission change requires reload'), findsOneWidget);

      await _tapApplyNow(tester);

      expect(find.textContaining('Could not disable plugin'), findsOneWidget);

      final dismiss = find.widgetWithText(TextButton, 'Cancel');
      await tester.ensureVisible(dismiss);
      await tester.pump();
      await tester.tap(dismiss);
      await tester.pump();

      expect(find.textContaining('Could not disable plugin'), findsNothing);
    });

    testWidgets('permission state persists across a reload of the screen',
        (tester) async {
      final harness = await _boot();
      await harness.manager.register(_TestPlugin());
      await _pump(tester, const PluginPermissionsScreen(pluginId: _pluginId));

      await _tapSwitch(tester, 'Search content');
      expect(harness.permissionStore.data[_pluginId], {PluginCapability.search});

      // Tear the screen down completely, then open a fresh instance.
      await tester.pumpWidget(const SizedBox.shrink());
      await _pump(tester, const PluginPermissionsScreen(pluginId: _pluginId));

      expect(_switchFor(tester, 'Search content').value, isTrue);
      expect(_switchFor(tester, 'Diagnostics').value, isFalse);
    });

    testWidgets('refresh indicator re-reads current state', (tester) async {
      final harness = await _boot();
      await harness.manager.register(_TestPlugin());
      await _pump(tester, const PluginPermissionsScreen(pluginId: _pluginId));

      expect(_switchFor(tester, 'Diagnostics').value, isFalse);

      // Policy changed outside this screen (another surface granted it).
      await harness.service.grant(_pluginId, PluginCapability.diagnostics);

      await tester.fling(
        find.byType(CustomScrollView),
        const Offset(0, 300),
        1000,
      );
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));

      expect(_switchFor(tester, 'Diagnostics').value, isTrue);
    });
  });
}
