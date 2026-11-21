import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';

/// Controlled extension API exposed to plugins.
///
/// All methods are capability-gated and deny-by-default. Implementations must
/// validate inputs and never expose database handles, cookies, tokens,
/// credentials or unrestricted filesystem access.
abstract class PluginExtensionApi {
  /// Plugin id this API instance belongs to.
  String get pluginId;

  /// Granted capabilities.
  Set<PluginCapability> get grantedCapabilities;

  /// Capability helpers.
  bool hasCapability(PluginCapability capability);
  void requireCapability(PluginCapability capability);

  /// Search content through the host. Requires [PluginCapability.search].
  Future<PluginResult<String>> search(String query);

  /// Read channel metadata/videos. Requires [PluginCapability.channel].
  Future<PluginResult<String>> channel(String channelId);

  /// Read trending/home feeds. Requires [PluginCapability.trending].
  Future<PluginResult<String>> trending({String region = ''});

  /// Resolve a media stream for playback. Requires [PluginCapability.playback].
  Future<PluginResult<String>> resolvePlayback(String videoId);

  /// Read a non-sensitive setting. Requires [PluginCapability.settingsRead].
  Future<PluginResult<String?>> readSetting(String key);

  /// Validate a destination against the plugin's exact manifest allowlist.
  /// Until a host transport is connected, permitted destinations return
  /// [PluginErrorCodes.networkUnavailable]; no request is sent.
  /// Requires [PluginCapability.network].
  Future<PluginResult<int>> networkRequest({
    required String url,
    String method = 'GET',
  });

  /// Emit a diagnostic message. Requires [PluginCapability.diagnostics].
  void log(String message);
}

/// Alias for callers using the shorter name.
typedef ExtensionApi = PluginExtensionApi;

/// Common aliases for compatibility with alternate naming.
typedef PluginApi = PluginExtensionApi;
