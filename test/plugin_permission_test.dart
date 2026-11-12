import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_context.dart';
import 'package:vyplay/domain/plugin/plugin_manifest.dart';
import 'package:vyplay/infrastructure/plugin/plugin_loader_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_permission_service_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_permission_store_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_state_store_impl.dart';

void main() {
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('plugin_permission_test');
  });

  tearDown(() async {
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  PluginManifest _manifest({String id = 'com.example.plugin', List<PluginCapability> capabilities = const [
    PluginCapability.search,
    PluginCapability.diagnostics,
  ]}) {
    return PluginManifest(
      id: id,
      name: 'Plugin',
      version: '1.0.0',
      description: 'desc',
      provider: 'test',
      platforms: const ['android'],
      capabilities: capabilities,
      minAppVersion: '1.0.0',
    );
  }

  test('store round-trips grants', () async {
    final store = PluginPermissionStoreImpl.withDirectory(tempDir);
    await store.save({
      'p': {PluginCapability.search, PluginCapability.diagnostics},
    });
    final loaded = await store.load();
    expect(loaded['p'], contains(PluginCapability.search));
    expect(loaded['p'], contains(PluginCapability.diagnostics));
  });

  test('service denies by default when no persisted policy exists', () async {
    final store = PluginPermissionStoreImpl.withDirectory(tempDir);
    final service = PluginPermissionServiceImpl(store: store);
    final granted = await service.grantedCapabilities(
      'p',
      declared: {PluginCapability.search, PluginCapability.channel},
    );
    // No saved policy → zero granted, even for declared capabilities.
    expect(granted, isEmpty);
    expect(granted, isNot(contains(PluginCapability.search)));
    expect(granted, isNot(contains(PluginCapability.channel)));
  });

  test('service grants nothing for a second plugin with no policy', () async {
    final store = PluginPermissionStoreImpl.withDirectory(tempDir);
    final service = PluginPermissionServiceImpl(store: store);
    // Give plugin 'a' an explicit grant.
    await service.grant('a', PluginCapability.search);
    // Plugin 'b' has no policy → still denied.
    final b = await service.grantedCapabilities(
      'b',
      declared: {PluginCapability.search, PluginCapability.diagnostics},
    );
    expect(b, isEmpty);
    expect(b, isNot(contains(PluginCapability.search)));
  });

  test('service grants persisted capabilities only', () async {
    final store = PluginPermissionStoreImpl.withDirectory(tempDir);
    final service = PluginPermissionServiceImpl(store: store);
    await service.grant('p', PluginCapability.search);
    // Persisted grant for 'search' only.
    var granted = await service.grantedCapabilities(
      'p',
      declared: {PluginCapability.search, PluginCapability.channel},
    );
    expect(granted, {PluginCapability.search});
    expect(granted, isNot(contains(PluginCapability.channel)));

    // Revoke 'search' → nothing left.
    await service.revoke('p', PluginCapability.search);
    granted = await service.grantedCapabilities(
      'p',
      declared: {PluginCapability.search, PluginCapability.channel},
    );
    expect(granted, isEmpty);

    // Grant 'diagnostics' (also declared) → only diagnostics.
    await service.grant('p', PluginCapability.diagnostics);
    granted = await service.grantedCapabilities(
      'p',
      declared: {PluginCapability.search, PluginCapability.diagnostics},
    );
    expect(granted, {PluginCapability.diagnostics});
    expect(granted, isNot(contains(PluginCapability.search)));
  });

  test('service never grants an undeclared capability', () async {
    final store = PluginPermissionStoreImpl.withDirectory(tempDir);
    final service = PluginPermissionServiceImpl(store: store);
    // The store can persist any capability string, but the service only
    // returns the intersection with the declared set.
    await service.grant('p', PluginCapability.network);
    final granted = await service.grantedCapabilities(
      'p',
      declared: {PluginCapability.search},
    );
    // 'network' is not declared → not returned.
    expect(granted, isEmpty);
    expect(granted, isNot(contains(PluginCapability.network)));
    expect(granted, isNot(contains(PluginCapability.search)));
  });

  test('service reset removes policy (deny-by-default restored)', () async {
    final store = PluginPermissionStoreImpl.withDirectory(tempDir);
    final service = PluginPermissionServiceImpl(store: store);
    await service.grant('p', PluginCapability.search);
    await service.reset('p');
    final granted = await service.grantedCapabilities(
      'p',
      declared: {PluginCapability.search, PluginCapability.channel},
    );
    expect(granted, isEmpty);
    expect(granted, isNot(contains(PluginCapability.search)));
  });

  test('service persists grant/revoke', () async {
    final store = PluginPermissionStoreImpl.withDirectory(tempDir);
    final service = PluginPermissionServiceImpl(store: store);
    await service.grant('p', PluginCapability.search);
    var granted = await service.grantedCapabilities(
      'p',
      declared: {PluginCapability.search, PluginCapability.channel},
    );
    expect(granted, contains(PluginCapability.search));

    await service.revoke('p', PluginCapability.search);
    granted = await service.grantedCapabilities(
      'p',
      declared: {PluginCapability.search, PluginCapability.channel},
    );
    expect(granted, isNot(contains(PluginCapability.search)));
  });

  test('service reset removes policy', () async {
    final store = PluginPermissionStoreImpl.withDirectory(tempDir);
    final service = PluginPermissionServiceImpl(store: store);
    await service.grant('p', PluginCapability.search);
    await service.reset('p');
    final all = await service.loadAll();
    expect(all.containsKey('p'), isFalse);
  });

  test('loader applies persisted permission policy', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);
    await permissionStore.save({
      'com.example.plugin': {PluginCapability.diagnostics},
    });

    final loader = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );

    final plugin = _MutablePermissionPlugin(_manifest());
    final result = await loader.register(plugin);
    expect(result.isSuccess, isTrue);

    // Persisted grant intersected with declared capabilities.
    expect(
      loader.grantedCapabilities('com.example.plugin'),
      {PluginCapability.diagnostics},
    );
  });

  test('loader denies by default when no persisted policy exists', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);

    final loader = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );

    final plugin = _MutablePermissionPlugin(_manifest());
    await loader.register(plugin);

    // No saved policy -> zero granted, even though the plugin declared them.
    final granted = loader.grantedCapabilities('com.example.plugin');
    expect(granted, isEmpty);
    expect(
      granted,
      isNot(contains(PluginCapability.search)),
    );
    expect(
      granted,
      isNot(contains(PluginCapability.diagnostics)),
    );
  });

  test('loader denies by default when there is no permission store', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);

    final loader = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: null,
    );

    final plugin = _MutablePermissionPlugin(_manifest());
    await loader.register(plugin);

    // No store at all -> no policy -> deny everything.
    final granted = loader.grantedCapabilities('com.example.plugin');
    expect(granted, isEmpty);
  });

  test('loader enforces: only declared capabilities can be granted', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);

    // Persist a grant for an UNDECLARED capability (the store accepts any).
    await permissionStore.save({
      'com.example.plugin': {PluginCapability.network},
    });

    final loader = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );

    final plugin = _MutablePermissionPlugin(_manifest());
    await loader.register(plugin);

    // 'network' is not declared -> not granted; declared set is empty
    // for this plugin's manifest, so nothing is granted.
    final granted = loader.grantedCapabilities('com.example.plugin');
    expect(granted, isEmpty);
    expect(granted, isNot(contains(PluginCapability.network)));
  });

  test('loader applies a grant made after registration on re-enable (Apply now)', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);

    final loader = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );

    final plugin = _MutablePermissionPlugin(_manifest(
      capabilities: [
        PluginCapability.search,
        PluginCapability.diagnostics,
      ],
    ));
    await loader.register(plugin);
    // Default: no policy -> nothing granted; plugin is disabled (no persisted
    // enabled state).
    expect(loader.grantedCapabilities('com.example.plugin'), isEmpty);
    expect(loader.status('com.example.plugin'), PluginStatus.disabled);

    // User grants 'search' via the permission service (persisted to store).
    final service = PluginPermissionServiceImpl(store: permissionStore);
    await service.grant('com.example.plugin', PluginCapability.search);

    // Before reload, the loader still shows nothing (policy read at register).
    expect(loader.grantedCapabilities('com.example.plugin'), isEmpty);

    // Re-enable (the screen's "Apply now"): initialize re-reads the store.
    await loader.setEnabled('com.example.plugin', true);
    expect(loader.status('com.example.plugin'), PluginStatus.enabled);

    // Now the loader reflects the persisted grant.
    final granted = loader.grantedCapabilities('com.example.plugin');
    expect(granted, {PluginCapability.search});
    expect(granted, isNot(contains(PluginCapability.diagnostics)));

    // The plugin's context received 'search'.
    expect(plugin.contextCapabilities, {PluginCapability.search});
  });

  test('loader re-reads store on re-enable after a revoke (Apply now)', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);
    await permissionStore.save({
      'com.example.plugin': {PluginCapability.search},
    });

    final loader = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );

    final plugin = _MutablePermissionPlugin(_manifest(
      capabilities: [PluginCapability.search],
    ));
    await loader.register(plugin);
    // Persisted grant applied at registration.
    expect(
      loader.grantedCapabilities('com.example.plugin'),
      {PluginCapability.search},
    );

    // User revokes 'search' via the service.
    final service = PluginPermissionServiceImpl(store: permissionStore);
    await service.revoke('com.example.plugin', PluginCapability.search);

    // Before reload, loader still shows the old grant.
    expect(
      loader.grantedCapabilities('com.example.plugin'),
      {PluginCapability.search},
    );

    // Re-enable: initialize re-reads the store -> empty.
    await loader.setEnabled('com.example.plugin', true);
    expect(
      loader.grantedCapabilities('com.example.plugin'),
      isEmpty,
    );
    expect(plugin.contextCapabilities, isEmpty);
  });

  test('loader does not grant an undeclared capability even after it is persisted', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);

    final loader = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );

    final plugin = _MutablePermissionPlugin(_manifest(
      capabilities: [PluginCapability.search],
    ));
    await loader.register(plugin);

    // Persist an undeclared capability directly in the store.
    await permissionStore.save({
      'com.example.plugin': {PluginCapability.network},
    });

    // Re-enable: initialize re-reads the store, but 'network' is not
    // declared, so the intersection is empty.
    await loader.setEnabled('com.example.plugin', true);
    expect(
      loader.grantedCapabilities('com.example.plugin'),
      isEmpty,
    );
    expect(plugin.contextCapabilities, isEmpty);
    expect(
      plugin.contextCapabilities,
      isNot(contains(PluginCapability.network)),
    );
  });

  test('loader preserves an existing explicit grant when no new policy exists', () async {
    final stateStore = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);

    // First loader: register with a persisted grant.
    await permissionStore.save({
      'com.example.plugin': {PluginCapability.diagnostics},
    });
    final loaderA = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );
    final pluginA = _MutablePermissionPlugin(_manifest());
    await loaderA.register(pluginA);
    expect(
      loaderA.grantedCapabilities('com.example.plugin'),
      {PluginCapability.diagnostics},
    );

    // Second loader (fresh read of the same store) sees the same grant.
    final loaderB = PluginLoaderImpl(
      stateStore: stateStore,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );
    // A different plugin id, no policy -> denied.
    final pluginB = _MutablePermissionPlugin(_manifest(id: 'other'));
    await loaderB.register(pluginB);
    expect(loaderB.grantedCapabilities('other'), isEmpty);
  });
}

class _MutablePermissionPlugin implements Plugin {
  _MutablePermissionPlugin(this._manifest);

  final PluginManifest _manifest;
  PluginStatus _status = PluginStatus.unregistered;
  final Set<PluginCapability> _contextCapabilities = <PluginCapability>{};

  @override
  PluginManifest get manifest => _manifest;

  @override
  PluginStatus get status => _status;

  @override
  Future<PluginResult<void>> initialize(PluginContext context) async {
    _status = PluginStatus.enabled;
    _contextCapabilities
      ..clear()
      ..addAll(_manifest.capabilities.where((cap) => context.hasCapability(cap)));
    return const PluginResult<void>.success(null);
  }

  @override
  Future<PluginResult<void>> dispose() async {
    _status = PluginStatus.disabled;
    return const PluginResult<void>.success(null);
  }

  Set<PluginCapability> get contextCapabilities =>
      Set<PluginCapability>.from(_contextCapabilities);
}
