import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_loader.dart';
import 'package:vyplay/domain/plugin/plugin_permission.dart';
import 'package:vyplay/domain/plugin/plugin_state_store.dart';
import 'package:vyplay/infrastructure/plugin/plugin_context_impl.dart';

import 'package:injectable/injectable.dart';

/// Default [PluginLoader] implementation.
///
/// Plugins are registered at compile time via [register]. No remote code is
/// downloaded or executed. Manifests are validated before registration.
@LazySingleton(as: PluginLoader)
class PluginLoaderImpl implements PluginLoader {
  PluginLoaderImpl({
    required PluginStateStore stateStore,
    String appVersion = '1.0.0',
    PluginPermissionStore? permissionStore,
  })  : _stateStore = stateStore,
        _appVersion = appVersion,
        _permissionStore = permissionStore;

  final PluginStateStore _stateStore;
  final String _appVersion;
  final PluginPermissionStore? _permissionStore;

  final List<Plugin> _plugins = <Plugin>[];
  final Map<String, PluginStatus> _status = <String, PluginStatus>{};
  final Map<String, Set<PluginCapability>> _granted =
      <String, Set<PluginCapability>>{};
  final Map<String, List<String>> _errors = <String, List<String>>{};

  Map<String, bool> _enabledState = <String, bool>{};
  bool _stateLoaded = false;

  Future<void> _ensureStateLoaded() async {
    if (_stateLoaded) return;
    _enabledState = await _stateStore.load();
    _stateLoaded = true;
  }

  static int _compareVersions(String a, String b) {
    final aParts = a.split('.').map((e) => int.tryParse(e) ?? 0).toList();
    final bParts = b.split('.').map((e) => int.tryParse(e) ?? 0).toList();
    final length = aParts.length > bParts.length ? aParts.length : bParts.length;
    for (var i = 0; i < length; i++) {
      final av = i < aParts.length ? aParts[i] : 0;
      final bv = i < bParts.length ? bParts[i] : 0;
      if (av != bv) return av.compareTo(bv);
    }
    return 0;
  }

  /// Returns the capabilities granted to [pluginId] under the current
  /// persisted permission policy.
  ///
  /// Deny-by-default: when no persisted policy exists for [pluginId] (or
  /// there is no [PluginPermissionStore] at all), no declared capabilities
  /// are granted. When a persisted policy exists, only the intersection of
  /// the persisted grants and the declared capabilities is granted — the
  /// user can only ever grant capabilities the plugin declared.
  Future<Set<PluginCapability>> _computeGranted(
      String pluginId, Set<PluginCapability> declared) async {
    if (_permissionStore == null) {
      // No store at all → no policy → deny everything.
      return <PluginCapability>{};
    }
    final grants = await _permissionStore.load();
    if (!grants.containsKey(pluginId)) {
      // No persisted policy for this plugin → deny everything.
      return <PluginCapability>{};
    }
    // Only declared capabilities the user actually granted.
    return declared.intersection(grants[pluginId]!);
  }

  @override
  Future<PluginResult<void>> register(Plugin plugin) async {
    await _ensureStateLoaded();
    final manifest = plugin.manifest;
    final validationErrors = manifest.validate();
    if (validationErrors.isNotEmpty) {
      _errors[manifest.id] = validationErrors;
      _status[manifest.id] = PluginStatus.error;
      return PluginResult<void>.failure(PluginFailure(
        pluginId: manifest.id,
        code: PluginErrorCodes.invalidManifest,
        message: validationErrors.join('; '),
      ));
    }

    // Duplicate id check.
    if (_plugins.any((p) => p.manifest.id == manifest.id)) {
      _errors[manifest.id] = const ['Duplicate plugin id'];
      _status[manifest.id] = PluginStatus.error;
      return PluginResult<void>.failure(PluginFailure(
        pluginId: manifest.id,
        code: PluginErrorCodes.duplicateId,
        message: 'A plugin with id "${manifest.id}" is already registered',
      ));
    }

    // Version compatibility check.
    if (_compareVersions(manifest.minAppVersion, _appVersion) > 0) {
      _errors[manifest.id] = [
        'Requires app version ${manifest.minAppVersion}, current $_appVersion',
      ];
      _status[manifest.id] = PluginStatus.error;
      return PluginResult<void>.failure(PluginFailure(
        pluginId: manifest.id,
        code: PluginErrorCodes.incompatibleVersion,
        message:
            'Plugin requires app version ${manifest.minAppVersion} (current $_appVersion)',
      ));
    }

    _plugins.add(plugin);
    _errors.remove(manifest.id);
    _status[manifest.id] = PluginStatus.registered;

    // Permission policy: deny all declared capabilities by default.
    // A persisted user grant is required before a capability is granted,
    // and only declared capabilities are ever grantable.
    final declaredCapabilities = Set<PluginCapability>.from(manifest.capabilities);
    final granted = await _computeGranted(manifest.id, declaredCapabilities);
    _granted[manifest.id] = granted;

    // Restore persisted enabled state (default disabled for safety).
    final persisted = _enabledState[manifest.id];
    if (persisted == true) {
      // Attempt initialization; failures are isolated.
      await initialize(manifest.id, (id, caps) {
        return PluginContextImpl(pluginId: id, grantedCapabilities: caps);
      });
    } else {
      _status[manifest.id] = PluginStatus.disabled;
    }
    return const PluginResult<void>.success(null);
  }

  @override
  List<Plugin> get plugins => List<Plugin>.unmodifiable(_plugins);

  @override
  Plugin? plugin(String id) {
    for (final plugin in _plugins) {
      if (plugin.manifest.id == id) return plugin;
    }
    return null;
  }

  @override
  PluginStatus status(String id) => _status[id] ?? PluginStatus.unregistered;

  @override
  List<String>? manifestErrors(String id) => _errors[id];

  @override
  Future<PluginResult<void>> initialize(
    String id,
    PluginContextFactory contextFactory,
  ) async {
    await _ensureStateLoaded();
    final plugin = this.plugin(id);
    if (plugin == null) {
      return PluginResult<void>.failure(PluginFailure(
        pluginId: id,
        code: PluginErrorCodes.notEnabled,
        message: 'Plugin not registered',
      ));
    }
    if (_status[id] == PluginStatus.enabled) {
      return const PluginResult<void>.success(null);
    }
    _status[id] = PluginStatus.initializing;
    // Re-read the persisted permission policy so any grants/revokes made
    // since registration (via the permission service) are applied to this
    // plugin's context on re-enable / reload.
    final declared =
        Set<PluginCapability>.from(plugin.manifest.capabilities);
    final granted = await _computeGranted(id, declared);
    _granted[id] = granted;
    final context = contextFactory(id, granted);
    try {
      final result = await plugin.initialize(context);
      if (result.isFailure) {
        _status[id] = PluginStatus.error;
        _errors[id] = [result.error!.message];
        return PluginResult<void>.failure(result.error!);
      }
      _status[id] = PluginStatus.enabled;
      _enabledState[id] = true;
      await _stateStore.save(Map<String, bool>.from(_enabledState));
      return const PluginResult<void>.success(null);
    } catch (error) {
      _status[id] = PluginStatus.error;
      _errors[id] = [error.toString()];
      return PluginResult<void>.failure(PluginFailure(
        pluginId: id,
        code: PluginErrorCodes.initializationFailed,
        message: error.toString(),
        cause: error,
      ));
    }
  }

  @override
  Future<PluginResult<void>> dispose(String id) async {
    final plugin = this.plugin(id);
    if (plugin == null) {
      return PluginResult<void>.failure(PluginFailure(
        pluginId: id,
        code: PluginErrorCodes.notEnabled,
        message: 'Plugin not registered',
      ));
    }
    try {
      final result = await plugin.dispose();
      if (result.isFailure) {
        _status[id] = PluginStatus.error;
        return PluginResult<void>.failure(result.error!);
      }
      _status[id] = PluginStatus.disabled;
      _enabledState[id] = false;
      await _stateStore.save(Map<String, bool>.from(_enabledState));
      return const PluginResult<void>.success(null);
    } catch (error) {
      _status[id] = PluginStatus.error;
      return PluginResult<void>.failure(PluginFailure(
        pluginId: id,
        code: PluginErrorCodes.disposalFailed,
        message: error.toString(),
        cause: error,
      ));
    }
  }

  @override
  Future<PluginResult<void>> setEnabled(String id, bool enabled) async {
    if (enabled) {
      return initialize(id, (pluginId, caps) {
        return PluginContextImpl(pluginId: pluginId, grantedCapabilities: caps);
      });
    }
    return dispose(id);
  }

  @override
  bool isEnabled(String id) => _status[id] == PluginStatus.enabled;

  @override
  Set<PluginCapability> grantedCapabilities(String id) =>
      Set<PluginCapability>.from(_granted[id] ?? const <PluginCapability>{});
}