/// Capability granted to a plugin.
///
/// Capabilities are deny-by-default: a plugin receives only the capabilities
/// explicitly declared in its [PluginManifest] and granted by the loader.
enum PluginCapability {
  /// Search content through the host application.
  search,

  /// Read channel metadata and videos.
  channel,

  /// Read trending/home feeds.
  trending,

  /// Resolve and play media streams.
  playback,

  /// Read non-sensitive application settings.
  settingsRead,

  /// Perform network requests to declared hosts only.
  network,

  /// Report diagnostics to the host.
  diagnostics,
}

/// Human-readable, stable identifiers for capabilities.
extension PluginCapabilityX on PluginCapability {
  String get id {
    switch (this) {
      case PluginCapability.search:
        return 'search';
      case PluginCapability.channel:
        return 'channel';
      case PluginCapability.trending:
        return 'trending';
      case PluginCapability.playback:
        return 'playback';
      case PluginCapability.settingsRead:
        return 'settings.read';
      case PluginCapability.network:
        return 'network';
      case PluginCapability.diagnostics:
        return 'diagnostics';
    }
  }

  static PluginCapability? tryParse(String value) {
    for (final capability in PluginCapability.values) {
      if (capability.id == value) return capability;
    }
    return null;
  }
}