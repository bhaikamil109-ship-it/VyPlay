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

class _FakeContext implements PluginContext {
  _FakeContext(this.pluginId, this._caps);
  @override
  final String pluginId;
  final Set<PluginCapability> _caps;

  @override
  bool hasCapability(PluginCapability capability) => _caps.contains(capability);

  @override
  void requireCapability(PluginCapability capability) {
    if (!hasCapability(capability)) {
      throw PluginCapabilityDenied(pluginId, capability);
    }
  }

  @override
  void log(String message) {}
}

void main() {
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('plugin_loader_test');
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

  test('registers a valid plugin', () async {
    final store = PluginStateStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(stateStore: store, appVersion: '2.0.0');

    final plugin = _MutablePlugin(_manifest());
    final result = await loader.register(plugin);
    expect(result.isSuccess, isTrue);
    expect(loader.plugins, hasLength(1));
    expect(loader.status(plugin.manifest.id), PluginStatus.disabled);
    expect(loader.manifestErrors(plugin.manifest.id), isNull);
  });

  test('rejects duplicate plugin ids', () async {
    final store = PluginStateStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(stateStore: store, appVersion: '2.0.0');

    final first = _MutablePlugin(_manifest());
    await loader.register(first);
    final second = _MutablePlugin(_manifest());
    final result = await loader.register(second);
    expect(result.isFailure, isTrue);
    expect(result.error!.code, PluginErrorCodes.duplicateId);
    expect(loader.plugins, hasLength(1));
  });

  test('rejects invalid manifest', () async {
    final store = PluginStateStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(stateStore: store, appVersion: '2.0.0');

    final bad = _MutablePlugin(_manifest(id: ''));
    final result = await loader.register(bad);
    expect(result.isFailure, isTrue);
    expect(result.error!.code, PluginErrorCodes.invalidManifest);
  });

  test('rejects incompatible app version', () async {
    final store = PluginStateStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(stateStore: store, appVersion: '1.0.0');

    final plugin = _MutablePlugin(_manifest(minAppVersion: '2.0.0'));
    final result = await loader.register(plugin);
    expect(result.isFailure, isTrue);
    expect(result.error!.code, PluginErrorCodes.incompatibleVersion);
  });

  test('initialize success enables plugin and persists state', () async {
    final store = PluginStateStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(stateStore: store, appVersion: '2.0.0');

    final plugin = _MutablePlugin(_manifest());
    await loader.register(plugin);
    final result = await loader.initialize(
      plugin.manifest.id,
      (id, caps) => _FakeContext(id, caps),
    );
    expect(result.isSuccess, isTrue);
    expect(loader.isEnabled(plugin.manifest.id), isTrue);
    expect(loader.status(plugin.manifest.id), PluginStatus.enabled);
    expect(plugin.initialized, isTrue);

    final reloaded = await store.load();
    expect(reloaded[plugin.manifest.id], isTrue);
  });

  test('initialize failure is isolated and sets error status', () async {
    final store = PluginStateStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(stateStore: store, appVersion: '2.0.0');

    final plugin = _MutablePlugin(_manifest());
    plugin.failInit = true;
    await loader.register(plugin);
    final result = await loader.initialize(
      plugin.manifest.id,
      (id, caps) => _FakeContext(id, caps),
    );
    expect(result.isFailure, isTrue);
    expect(result.error!.code, PluginErrorCodes.initializationFailed);
    expect(loader.status(plugin.manifest.id), PluginStatus.error);
    expect(loader.isEnabled(plugin.manifest.id), isFalse);
  });

  test('dispose disables plugin', () async {
    final store = PluginStateStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(stateStore: store, appVersion: '2.0.0');

    final plugin = _MutablePlugin(_manifest());
    await loader.register(plugin);
    await loader.initialize(
      plugin.manifest.id,
      (id, caps) => _FakeContext(id, caps),
    );
    final result = await loader.dispose(plugin.manifest.id);
    expect(result.isSuccess, isTrue);
    expect(loader.status(plugin.manifest.id), PluginStatus.disabled);
    expect(plugin.disposed, isTrue);
  });

  test('setEnabled toggles plugin', () async {
    final store = PluginStateStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(stateStore: store, appVersion: '2.0.0');

    final plugin = _MutablePlugin(_manifest());
    await loader.register(plugin);
    await loader.setEnabled(plugin.manifest.id, true);
    expect(loader.isEnabled(plugin.manifest.id), isTrue);
    await loader.setEnabled(plugin.manifest.id, false);
    expect(loader.isEnabled(plugin.manifest.id), isFalse);
  });

  test('plugin() returns null for unknown id', () async {
    final store = PluginStateStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(stateStore: store, appVersion: '2.0.0');
    expect(loader.plugin('nope'), isNull);
    expect(loader.status('nope'), PluginStatus.unregistered);
  });

  test('loader denies by default when no persisted policy exists', () async {
    final store = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(
      stateStore: store,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );
    final plugin = _MutablePlugin(_manifest(capabilities: [PluginCapability.diagnostics]));
    await loader.register(plugin);

    final granted = loader.grantedCapabilities(_manifest().id);
    expect(granted, isEmpty);
    expect(granted, isNot(contains(PluginCapability.diagnostics)));
  });

  test('loader denies by default when there is no permission store', () async {
    final store = PluginStateStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(
      stateStore: store,
      appVersion: '2.0.0',
      permissionStore: null,
    );
    final plugin = _MutablePlugin(_manifest());
    await loader.register(plugin);

    final granted = loader.grantedCapabilities(_manifest().id);
    expect(granted, isEmpty);
  });

  test('loader applies a persisted grant on registration', () async {
    final store = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);
    await permissionStore.save({
      _manifest().id: {PluginCapability.diagnostics},
    });
    final loader = PluginLoaderImpl(
      stateStore: store,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );
    final plugin = _MutablePlugin(_manifest());
    await loader.register(plugin);
    expect(
      loader.grantedCapabilities(_manifest().id),
      {PluginCapability.diagnostics},
    );
  });

  test('loader applies a grant made after registration on re-enable (Apply now)', () async {
    final store = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);
    final loader = PluginLoaderImpl(
      stateStore: store,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );
    final plugin = _MutablePlugin(_manifest(capabilities: [
      PluginCapability.search,
      PluginCapability.diagnostics,
    ]));
    await loader.register(plugin);
    expect(loader.grantedCapabilities(_manifest().id), isEmpty);
    expect(loader.status(_manifest().id), PluginStatus.disabled);

    final service = PluginPermissionServiceImpl(store: permissionStore);
    await service.grant(_manifest().id, PluginCapability.search);
    expect(loader.grantedCapabilities(_manifest().id), isEmpty);

    await loader.setEnabled(_manifest().id, true);
    expect(loader.status(_manifest().id), PluginStatus.enabled);
    expect(
      loader.grantedCapabilities(_manifest().id),
      {PluginCapability.search},
    );
    expect(plugin.contextCapabilities, {PluginCapability.search});
  });

  test('loader does not grant an undeclared capability even when persisted', () async {
    final store = PluginStateStoreImpl.withDirectory(tempDir);
    final permissionStore = PluginPermissionStoreImpl.withDirectory(tempDir);
    await permissionStore.save({
      _manifest().id: {PluginCapability.network},
    });
    final loader = PluginLoaderImpl(
      stateStore: store,
      appVersion: '2.0.0',
      permissionStore: permissionStore,
    );
    final plugin = _MutablePlugin(_manifest());
    await loader.register(plugin);
    expect(
      loader.grantedCapabilities(_manifest().id),
      isEmpty,
    );
  });
}
