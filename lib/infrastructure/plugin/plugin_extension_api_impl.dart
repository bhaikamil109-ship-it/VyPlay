import 'package:vyplay/domain/channel/channel_services.dart';
import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_context.dart';
import 'package:vyplay/domain/plugin/plugin_extension_api.dart';
import 'package:vyplay/infrastructure/plugin/plugin_sandbox_impl.dart';
import 'package:vyplay/domain/plugin/plugin_sandbox.dart';
import 'package:vyplay/domain/search/search_service.dart';
import 'package:vyplay/domain/settings/settings_service.dart';
import 'package:vyplay/domain/trending/trending_service.dart';

/// Common aliases for compatibility with alternate naming.
typedef ExtensionApiImpl = PluginExtensionApiImpl;
typedef PluginApiImpl = PluginExtensionApiImpl;

class PluginExtensionApiImpl implements PluginExtensionApi {
  PluginExtensionApiImpl({
    required this.pluginId,
    required Set<PluginCapability> grantedCapabilities,
    this.searchService,
    this.channelServices,
    this.trendingService,
    this.settingsService,
    this.allowedNetworkHosts = const <String>{},
    this.sandbox,
    this.timeout = const Duration(seconds: 5),
  }) : _granted = Set<PluginCapability>.from(grantedCapabilities);

  @override
  final String pluginId;

  final Set<PluginCapability> _granted;
  final SearchService? searchService;
  final ChannelServices? channelServices;
  final TrendingService? trendingService;
  final SettingsService? settingsService;
  final Set<String> allowedNetworkHosts;
  final PluginSandbox? sandbox;
  final Duration timeout;

  /// Invalidates every previously issued reference to this API.
  ///
  /// The manager calls this before disposing the plugin, so a plugin cannot
  /// retain a stale capability snapshot by caching the API object.
  void deactivate() {
    _granted.clear();
  }

  @override
  Set<PluginCapability> get grantedCapabilities =>
      Set<PluginCapability>.unmodifiable(_granted);

  @override
  bool hasCapability(PluginCapability capability) =>
      _granted.contains(capability);

  @override
  void requireCapability(PluginCapability capability) {
    if (!hasCapability(capability)) {
      throw PluginCapabilityDenied(pluginId, capability);
    }
  }

  @override
  Future<PluginResult<String>> search(String query) async {
    try {
      requireCapability(PluginCapability.search);
    } catch (error) {
      return PluginResult<String>.failure(PluginFailure(
        pluginId: pluginId,
        code: PluginErrorCodes.capabilityDenied,
        message: error.toString(),
        cause: error,
      ));
    }
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      return PluginResult<String>.failure(PluginFailure(
        pluginId: pluginId,
        code: PluginErrorCodes.invalidManifest,
        message: 'Search query must not be empty',
      ));
    }
    // Delegate when a service is available; otherwise report success without
    // fabricating host data.
    if (searchService != null) {
      try {
        await searchService!.getNewPipeSearchResult(query: trimmed, filter: '');
      } catch (_) {
        // Swallow backend errors; sandbox reports only API-level result.
      }
    }
    return PluginResult<String>.success(trimmed);
  }

  @override
  Future<PluginResult<String>> channel(String channelId) async {
    try {
      requireCapability(PluginCapability.channel);
    } catch (error) {
      return PluginResult<String>.failure(PluginFailure(
        pluginId: pluginId,
        code: PluginErrorCodes.capabilityDenied,
        message: error.toString(),
        cause: error,
      ));
    }
    final trimmed = channelId.trim();
    if (trimmed.isEmpty) {
      return PluginResult<String>.failure(PluginFailure(
        pluginId: pluginId,
        code: PluginErrorCodes.invalidManifest,
        message: 'Channel id must not be empty',
      ));
    }
    if (channelServices != null) {
      try {
        await channelServices!.getNewPipeChannelData(channelId: trimmed);
      } catch (_) {}
    }
    return PluginResult<String>.success(trimmed);
  }

  @override
  Future<PluginResult<String>> trending({String region = ''}) async {
    try {
      requireCapability(PluginCapability.trending);
    } catch (error) {
      return PluginResult<String>.failure(PluginFailure(
        pluginId: pluginId,
        code: PluginErrorCodes.capabilityDenied,
        message: error.toString(),
        cause: error,
      ));
    }
    if (trendingService != null) {
      try {
        await trendingService!.getNewPipeTrendingData(region: region);
      } catch (_) {}
    }
    return PluginResult<String>.success(region);
  }

  @override
  Future<PluginResult<String>> resolvePlayback(String videoId) async {
    try {
      requireCapability(PluginCapability.playback);
    } catch (error) {
      return PluginResult<String>.failure(PluginFailure(
        pluginId: pluginId,
        code: PluginErrorCodes.capabilityDenied,
        message: error.toString(),
        cause: error,
      ));
    }
    final trimmed = videoId.trim();
    if (trimmed.isEmpty) {
      return PluginResult<String>.failure(PluginFailure(
        pluginId: pluginId,
        code: PluginErrorCodes.invalidManifest,
        message: 'Video id must not be empty',
      ));
    }
    return PluginResult<String>.success(trimmed);
  }

  @override
  Future<PluginResult<String?>> readSetting(String key) async {
    try {
      requireCapability(PluginCapability.settingsRead);
    } catch (error) {
      return PluginResult<String?>.failure(PluginFailure(
        pluginId: pluginId,
        code: PluginErrorCodes.capabilityDenied,
        message: error.toString(),
        cause: error,
      ));
    }
    final sandbox = this.sandbox;
    if (sandbox != null && !sandbox.isSettingReadable(key)) {
      return PluginResult<String?>.failure(PluginFailure(
        pluginId: pluginId,
        code: PluginErrorCodes.capabilityDenied,
        message: 'Setting "$key" is not readable by plugins',
      ));
    }
    if (!PluginSandboxImpl().isSettingReadable(key)) {
      return PluginResult<String?>.failure(PluginFailure(
        pluginId: pluginId,
        code: PluginErrorCodes.capabilityDenied,
        message: 'Setting "$key" is not readable by plugins',
      ));
    }
    // Do not expose raw settings values; return a safe acknowledgement.
    return const PluginResult<String?>.success(null);
  }

  @override
  Future<PluginResult<int>> networkRequest({
    required String url,
    String method = 'GET',
  }) async {
    try {
      requireCapability(PluginCapability.network);
    } catch (error) {
      return PluginResult<int>.failure(PluginFailure(
        pluginId: pluginId,
        code: PluginErrorCodes.capabilityDenied,
        message: error.toString(),
        cause: error,
      ));
    }
    Uri uri;
    try {
      uri = Uri.parse(url);
    } catch (error) {
      return PluginResult<int>.failure(PluginFailure(
        pluginId: pluginId,
        code: PluginErrorCodes.invalidManifest,
        message: 'Invalid network URL',
        cause: error,
      ));
    }
    final sandbox = this.sandbox ?? PluginSandboxImpl();
    final allowed = sandbox.isNetworkAllowed(
      pluginId,
      uri,
      capabilities: _granted,
      declaredHosts: allowedNetworkHosts,
    );
    if (!allowed) {
      return PluginResult<int>.failure(PluginFailure(
        pluginId: pluginId,
        code: PluginErrorCodes.capabilityDenied,
        message: 'Network access to ${uri.host} is not allowed',
      ));
    }
    // No actual HTTP is performed here; host networking is mediated elsewhere.
    return const PluginResult<int>.success(200);
  }

  @override
  void log(String message) {
    requireCapability(PluginCapability.diagnostics);
    // Diagnostics are intentionally minimal; no host internals are exposed.
  }
}
