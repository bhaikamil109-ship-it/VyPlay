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

    final host = uri.host.toLowerCase();
    if (!_isValidNetworkHost(host)) return false;

    // Missing/empty allowlists are deny-by-default, never allow-all.
    if (declaredHosts == null || declaredHosts.isEmpty) return false;
    final allowlist = declaredHosts.map((entry) => entry.toLowerCase()).toSet();
    return allowlist.contains(host);
  }

  bool _isValidNetworkHost(String host) {
    if (host.isEmpty || host.length > 253) return false;
    if (host.contains(':') || host.contains('*') || host.endsWith('.')) {
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
    final labels = host.split('.');
    if (labels.length < 2) return false;
    for (final label in labels) {
      if (label.isEmpty ||
          label.length > 63 ||
          label.startsWith('-') ||
          label.endsWith('-')) {
        return false;
      }
      for (final unit in label.codeUnits) {
        final isLetter = unit >= 97 && unit <= 122;
        final isDigit = unit >= 48 && unit <= 57;
        if (!isLetter && !isDigit && unit != 45) return false;
      }
    }
    if (!labels.last.codeUnits.any((unit) => unit >= 97 && unit <= 122)) {
      return false;
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
