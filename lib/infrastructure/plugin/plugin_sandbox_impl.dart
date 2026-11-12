import 'dart:async';

import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_context.dart';
import 'package:vyplay/domain/plugin/plugin_sandbox.dart';

/// Common aliases for compatibility with alternate naming.
typedef SandboxImpl = PluginSandboxImpl;

class PluginSandboxImpl implements PluginSandbox {
  PluginSandboxImpl({this.maxCallsPerWindow = 1000});

  final int maxCallsPerWindow;
  final Map<String, int> _callCounts = <String, int>{};

  @override
  Future<PluginResult<T>> run<T>(
    String pluginId,
    Future<T> Function() action, {
    Duration timeout = const Duration(seconds: 5),
    Set<PluginCapability>? capabilities,
  }) async {
    if (!tryAcquire(pluginId)) {
      return PluginResult<T>.failure(PluginFailure(
        pluginId: pluginId,
        code: PluginErrorCodes.initializationFailed,
        message: 'Plugin call limit exceeded',
      ));
    }
    try {
      final value = await action().timeout(timeout);
      return PluginResult<T>.success(value);
    } on TimeoutException catch (error) {
      return PluginResult<T>.failure(PluginFailure(
        pluginId: pluginId,
        code: PluginErrorCodes.initializationFailed,
        message: 'Plugin execution timed out after ${timeout.inMilliseconds}ms',
        cause: error,
      ));
    } catch (error) {
      return PluginResult<T>.failure(PluginFailure(
        pluginId: pluginId,
        code: PluginErrorCodes.initializationFailed,
        message: error.toString(),
        cause: error,
      ));
    }
  }

  @override
  bool isNetworkAllowed(
    String pluginId,
    Uri uri, {
    Set<PluginCapability>? capabilities,
    Set<String>? declaredHosts,
  }) {
    if (capabilities != null && !capabilities.contains(PluginCapability.network)) {
      return false;
    }
    final scheme = uri.scheme.toLowerCase();
    if (scheme != 'http' && scheme != 'https') return false;
    final host = uri.host.trim().toLowerCase();
    if (host.isEmpty) return false;
    if (host == 'localhost' ||
        host == '::1' ||
        host.startsWith('127.') ||
        host.startsWith('10.') ||
        host.startsWith('192.168.') ||
        host.startsWith('169.254.') ||
        host.startsWith('172.16.') ||
        host.startsWith('172.17.') ||
        host.startsWith('172.18.') ||
        host.startsWith('172.19.') ||
        host.startsWith('172.2') ||
        host.startsWith('172.30.') ||
        host.startsWith('172.31.')) {
      return false;
    }
    if (declaredHosts != null && declaredHosts.isNotEmpty) {
      return declaredHosts.map((h) => h.toLowerCase()).contains(host);
    }
    return true;
  }

  @override
  bool isSettingReadable(String key) {
    final normalized = key.trim().toLowerCase();
    if (normalized.isEmpty) return false;
    const sensitive = <String>[
      'token',
      'cookie',
      'password',
      'secret',
      'credential',
      'auth',
      'apikey',
      'api_key',
      'session',
    ];
    for (final marker in sensitive) {
      if (normalized.contains(marker)) return false;
    }
    return true;
  }

  @override
  bool hasCapability(
    String pluginId,
    PluginCapability capability, {
    Set<PluginCapability>? granted,
  }) {
    if (granted == null) return false;
    return granted.contains(capability);
  }

  @override
  void requireCapability(
    String pluginId,
    PluginCapability capability, {
    Set<PluginCapability>? granted,
  }) {
    if (!hasCapability(pluginId, capability, granted: granted)) {
      throw PluginCapabilityDenied(pluginId, capability);
    }
  }

  @override
  bool tryAcquire(String pluginId, {int cost = 1}) {
    final current = _callCounts[pluginId] ?? 0;
    if (current + cost > maxCallsPerWindow) return false;
    _callCounts[pluginId] = current + cost;
    return true;
  }

  @override
  void reset(String pluginId) {
    _callCounts.remove(pluginId);
  }
}
