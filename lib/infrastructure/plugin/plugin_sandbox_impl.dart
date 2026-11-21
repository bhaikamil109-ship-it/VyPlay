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
    if (capabilities != null &&
        !capabilities.contains(PluginCapability.network)) {
      return false;
    }
    final scheme = uri.scheme.toLowerCase();
    if (scheme != 'http' && scheme != 'https') return false;
    if (uri.userInfo.isNotEmpty) return false;
    if (uri.hasPort && uri.port != (scheme == 'https' ? 443 : 80)) {
      return false;
    }

    final host = uri.host.trim().toLowerCase().replaceFirst(RegExp(r'\.$'), '');
    if (!_isValidNetworkHost(host)) return false;

    // No implicit "allow all" mode: the manifest must declare exact hosts.
    if (declaredHosts == null || declaredHosts.isEmpty) return false;
    final allowedHosts = declaredHosts
        .map((entry) => entry.trim().toLowerCase().replaceFirst(RegExp(r'\.$'), ''))
        .where(_isValidNetworkHost)
        .toSet();
    return allowedHosts.contains(host);
  }

  bool _isValidNetworkHost(String host) {
    if (host.isEmpty ||
        host.length > 253 ||
        host.contains(':') ||
        host.contains('*') ||
        host.endsWith('.')) {
      return false;
    }
    if (host == 'localhost' ||
        host.endsWith('.localhost') ||
        host.endsWith('.local') ||
        host.endsWith('.internal') ||
        host.endsWith('.test') ||
        host.endsWith('.invalid')) {
      return false;
    }
    // DNS names only: direct IPv4/IPv6 literals are not in the allowlist model.
    if (RegExp(r'^\d+(?:\.\d+){0,3}$').hasMatch(host)) return false;
    final labels = host.split('.');
    if (labels.length < 2) return false;
    final labelPattern = RegExp(r'^[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?$');
    return labels.every(labelPattern.hasMatch);
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
