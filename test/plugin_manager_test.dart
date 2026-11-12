import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_context.dart';
import 'package:vyplay/domain/plugin/plugin_extension_registry.dart';

import 'package:vyplay/domain/plugin/plugin_manifest.dart';
import 'package:vyplay/infrastructure/plugin/plugin_extension_registry_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_loader_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_manager_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_permission_service_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_permission_store_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_sandbox_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_state_store_impl.dart';

class _MutablePlugin implements Plugin {
  _MutablePlugin(this._manifest);

  final PluginManifest _manifest;
  bool failInit = false;
  PluginStatus _status = PluginStatus.unregistered;
  bool initialized = false;
  bool disposed = false;
  final Set<PluginCapability> _contextCapabilities = <PluginCapability>{};

  @override
  PluginManifest get manifest => _manifest;

  @override
  PluginStatus get status => _status;

  void setStatus(PluginStatus value) => _status = value;

  @override
  Future<PluginResult<void>> initialize(PluginContext context) async {
    if (failInit) throw StateError('init boom');
    initialized = true;
    _status = PluginStatus.enabled;
    _contextCapabilities
      ..clear()
      ..addAll(_manifest.capabilities.where((cap) => context.hasCapability(cap)));
    return const PluginResult<void>.success(null);
  }

  @override
  Future<PluginResult<void>> dispose() async {
    disposed = true;
    _status = PluginStatus.disabled;
    return const PluginResult<void>.success(null);
  }

  Set<PluginCapability> get contextCapabilities =>
      Set<PluginCapability>.from(_contextCapabilities);
}

void main() {
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('plugin_manager_test');
  });

  tearDown(() async {
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  PluginManifest _manifest({
    String id = 'com.example.plugin',
    String version = '1.0.0',
    String minAppVersion = '1.0.0',
    List<PluginCapability> capabilities = const [PluginCapability.diagnostics],
  }) {
    return PluginManifest(
      id: id,
      name: 'Plugin $id',
      version: version,
      description: 'desc',
      provider: 'test',
      platforms: const ['android'],
      capabilities: capabilities,
      minAppVersion: minAppVersion,
    );
  }

  PluginManifest _otherManifest() => PluginManifest(
        id: 'com.other.plugin',
        name: 'Other',
        version: '1.0.0',
        description: 'desc',
        provider: 'test',
        platforms: const ['android'],
        capabilities: const [PluginCapability.search, PluginCapability.diagnostics],
        minAppVersion: '1.0.0',
      );

  test('registers and initializes plugin', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );
    final registry = PluginExtensionRegistryImpl();
    final sandbox = PluginSandboxImpl();
    final manager = PluginManagerImpl(
      loader: loader,
      registry: registry,
      sandbox: sandbox,
    );

    final plugin = _MutablePlugin(_manifest());
    final reg = await manager.register(plugin);
    expect(reg.isSuccess, isTrue);

    final init = await manager.initialize(plugin.manifest.id);
    expect(init.isSuccess, isTrue);
    expect(manager.status(plugin.manifest.id), PluginStatus.enabled);
    expect(plugin.initialized, isTrue);

    final api = manager.extensionApi(plugin.manifest.id);
    expect(api.pluginId, plugin.manifest.id);
  });

  test('manager denies by default when no persisted policy exists', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );
    final registry = PluginExtensionRegistryImpl();
    final sandbox = PluginSandboxImpl();
    final manager = PluginManagerImpl(
      loader: loader,
      registry: registry,
      sandbox: sandbox,
    );

    final plugin = _MutablePlugin(_manifest(capabilities: [
      PluginCapability.search,
      PluginCapability.diagnostics,
    ]));
    await manager.register(plugin);

    final granted = manager.grantedCapabilities(plugin.manifest.id);
    expect(granted, isEmpty);
    expect(granted, isNot(contains(PluginCapability.search)));
    expect(granted, isNot(contains(PluginCapability.diagnostics)));
  });

  test('manager applies a persisted grant on registration', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);
    await permissionStore.save({
      _manifest().id: {PluginCapability.diagnostics},
    });
    final loader = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );
    final registry = PluginExtensionRegistryImpl();
    final sandbox = PluginSandboxImpl();
    final manager = PluginManagerImpl(
      loader: loader,
      registry: registry,
      sandbox: sandbox,
    );

    final plugin = _MutablePlugin(_manifest());
    await manager.register(plugin);

    expect(
      manager.grantedCapabilities(plugin.manifest.id),
      {PluginCapability.diagnostics},
    );
  });

  test('manager grants nothing for a second plugin with no policy', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);
    await permissionStore.save({
      _manifest(capabilities: [PluginCapability.search, PluginCapability.diagnostics])
          .id: {PluginCapability.search},
    });
    final loader = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );
    final registry = PluginExtensionRegistryImpl();
    final sandbox = PluginSandboxImpl();
    final manager = PluginManagerImpl(
      loader: loader,
      registry: registry,
      sandbox: sandbox,
    );

    await manager.register(_MutablePlugin(_manifest(capabilities: [
      PluginCapability.search,
      PluginCapability.diagnostics,
    ])));
    final granted = manager.grantedCapabilities(
      _manifest(capabilities: [
        PluginCapability.search,
        PluginCapability.diagnostics,
      ]).id,
    );
    expect(granted, {PluginCapability.search});

    final otherPlugin = _MutablePlugin(_otherManifest());
    await manager.register(otherPlugin);
    final otherGranted = manager.grantedCapabilities(_otherManifest().id);
    expect(otherGranted, isEmpty);
    expect(otherGranted, isNot(contains(PluginCapability.search)));
  });

  test('manager does not grant an undeclared capability even when persisted', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);
    await permissionStore.save({
      _manifest().id: {PluginCapability.network},
    });
    final loader = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );
    final registry = PluginExtensionRegistryImpl();
    final sandbox = PluginSandboxImpl();
    final manager = PluginManagerImpl(
      loader: loader,
      registry: registry,
      sandbox: sandbox,
    );

    final plugin = _MutablePlugin(_manifest());
    await manager.register(plugin);

    final granted = manager.grantedCapabilities(plugin.manifest.id);
    expect(granted, isEmpty);
    expect(granted, isNot(contains(PluginCapability.network)));
  });

  test('manager grants persisted capabilities only (Apply now reload)', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );
    final registry = PluginExtensionRegistryImpl();
    final sandbox = PluginSandboxImpl();
    final manager = PluginManagerImpl(
      loader: loader,
      registry: registry,
      sandbox: sandbox,
    );

    final plugin = _MutablePlugin(_manifest(capabilities: [
      PluginCapability.search,
      PluginCapability.channel,
      PluginCapability.diagnostics,
    ]));
    await manager.register(plugin);

    final service = PluginPermissionServiceImpl(store: permissionStore);
    await service.grant(plugin.manifest.id, PluginCapability.search);

    expect(manager.grantedCapabilities(plugin.manifest.id), isEmpty);

    await service.grant(plugin.manifest.id, PluginCapability.diagnostics);
    expect(manager.grantedCapabilities(plugin.manifest.id), isEmpty);

    await service.revoke(plugin.manifest.id, PluginCapability.search);
    expect(manager.grantedCapabilities(plugin.manifest.id), isEmpty);

    await manager.setEnabled(plugin.manifest.id, true);
    expect(manager.status(plugin.manifest.id), PluginStatus.enabled);
    final granted2 = manager.grantedCapabilities(plugin.manifest.id);
    expect(granted2, {PluginCapability.diagnostics});
    expect(granted2, isNot(contains(PluginCapability.search)));
    expect(granted2, isNot(contains(PluginCapability.channel)));
    expect(plugin.contextCapabilities, {PluginCapability.diagnostics});
  });

  test('manager applies a grant made after registration on re-enable (Apply now)', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );
    final registry = PluginExtensionRegistryImpl();
    final sandbox = PluginSandboxImpl();
    final manager = PluginManagerImpl(
      loader: loader,
      registry: registry,
      sandbox: sandbox,
    );

    final plugin = _MutablePlugin(_manifest(capabilities: [
      PluginCapability.search,
      PluginCapability.diagnostics,
    ]));
    await manager.register(plugin);
    expect(manager.grantedCapabilities(plugin.manifest.id), isEmpty);
    expect(manager.status(plugin.manifest.id), PluginStatus.disabled);

    final service = PluginPermissionServiceImpl(store: permissionStore);
    await service.grant(plugin.manifest.id, PluginCapability.search);

    expect(manager.grantedCapabilities(plugin.manifest.id), isEmpty);

    final initResult = await manager.setEnabled(plugin.manifest.id, true);
    expect(initResult.isSuccess, isTrue);
    expect(manager.status(plugin.manifest.id), PluginStatus.enabled);

    final granted = manager.grantedCapabilities(plugin.manifest.id);
    expect(granted, {PluginCapability.search});
    expect(granted, isNot(contains(PluginCapability.diagnostics)));
    expect(plugin.contextCapabilities, {PluginCapability.search});
  });

  test('manager re-reads store on re-enable after a revoke (Apply now)', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);
    await permissionStore.save({
      _manifest(capabilities: [PluginCapability.search]).id: {PluginCapability.search},
    });
    final loader = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );
    final registry = PluginExtensionRegistryImpl();
    final sandbox = PluginSandboxImpl();
    final manager = PluginManagerImpl(
      loader: loader,
      registry: registry,
      sandbox: sandbox,
    );

    final plugin = _MutablePlugin(_manifest(capabilities: [PluginCapability.search]));
    await manager.register(plugin);
    expect(manager.grantedCapabilities(plugin.manifest.id), {PluginCapability.search});

    final service = PluginPermissionServiceImpl(store: permissionStore);
    await service.revoke(plugin.manifest.id, PluginCapability.search);

    expect(manager.grantedCapabilities(plugin.manifest.id), {PluginCapability.search});

    await manager.setEnabled(plugin.manifest.id, true);
    expect(manager.grantedCapabilities(plugin.manifest.id), isEmpty);
    expect(plugin.contextCapabilities, isEmpty);
  });

  test('setEnabled false disposes', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );
    final registry = PluginExtensionRegistryImpl();
    final sandbox = PluginSandboxImpl();
    final manager = PluginManagerImpl(
      loader: loader,
      registry: registry,
      sandbox: sandbox,
    );

    final plugin = _MutablePlugin(_manifest());
    await manager.register(plugin);
    await manager.initialize(plugin.manifest.id);
    plugin.failInit = false;
    await manager.setEnabled(plugin.manifest.id, false);
    expect(manager.status(plugin.manifest.id), PluginStatus.disabled);
    expect(plugin.disposed, isTrue);
  });

  test('disposeAll disposes all plugins', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );
    final registry = PluginExtensionRegistryImpl();
    final sandbox = PluginSandboxImpl();
    final manager = PluginManagerImpl(
      loader: loader,
      registry: registry,
      sandbox: sandbox,
    );

    final plugin = _MutablePlugin(_manifest());
    await manager.register(plugin);
    await manager.initialize(plugin.manifest.id);
    await manager.disposeAll();
    expect(manager.status(plugin.manifest.id), PluginStatus.disabled);
  });

  test('contributions delegates to registry', () {
    final manager = PluginManagerImpl(
      loader: PluginLoaderImpl(
        stateStore: PluginStateStoreImpl.withDirectory(tempDir),
        appVersion: '2.0.0',
      ),
      registry: PluginExtensionRegistryImpl(),
      sandbox: PluginSandboxImpl(),
    );
    expect(manager.contributions(ExtensionPoint.menuItem), isEmpty);
  });
}
