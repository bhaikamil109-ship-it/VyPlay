import 'dart:async';

import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_context.dart';
import 'package:vyplay/domain/plugin/plugin_network_host.dart';
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
    if (capabilities == null ||
        !capabilities.contains(PluginCapability.network)) {
      return false;
    }
    if (declaredHosts == null || declaredHosts.isEmpty) return false;

    // Plugins may only use HTTPS on its standard port. Reject user-info URLs,
    // IP literals and local/reserved hostnames before exact allowlist matching.
    final scheme = uri.scheme.toLowerCase();
    if (scheme != 'https') return false;
    if (uri.userInfo.isNotEmpty) return false;
    if (uri.hasPort && uri.port != 443) return false;

    final host = normalizePluginNetworkHost(uri.host);
    if (!isValidPluginNetworkHost(host)) return false;

    final allowlist = declaredHosts
        .map(normalizePluginNetworkHost)
        .where(isValidPluginNetworkHost)
        .toSet();
    return allowlist.contains(host);
  }

  @override
  bool isSettingReadable(String key) {
    // Normalize separators before checking so names such as x-api-key,
    // refresh-token and signing_key cannot bypass the sensitive-key policy.
    final normalized =
        key.trim().toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    if (normalized.isEmpty) return false;
    const sensitive = <String>[
      'token',
      'cookie',
      'password',
      'passwd',
      'secret',
      'credential',
      'auth',
      'apikey',
      'session',
      'privatekey',
      'signingkey',
      'bearer',
      'jwt',
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
