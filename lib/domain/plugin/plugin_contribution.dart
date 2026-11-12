/// Extension points a plugin may contribute to, and the declarative
/// description of one such contribution.
///
/// A contribution is *declaration only*: a manifest never carries executable
/// code. The host registers the declaration and resolves the behaviour for the
/// extension point itself, gated by the capability the point requires.
library;

import 'package:vyplay/domain/plugin/plugin_capability.dart';

/// Host extension points that plugins may contribute to.
enum ExtensionPoint {
  searchProvider,
  channelProvider,
  trendingProvider,
  playbackProvider,
  settingsSection,
  menuItem,
  diagnostics,
}

extension ExtensionPointX on ExtensionPoint {
  String get id {
    switch (this) {
      case ExtensionPoint.searchProvider:
        return 'search.provider';
      case ExtensionPoint.channelProvider:
        return 'channel.provider';
      case ExtensionPoint.trendingProvider:
        return 'trending.provider';
      case ExtensionPoint.playbackProvider:
        return 'playback.provider';
      case ExtensionPoint.settingsSection:
        return 'settings.section';
      case ExtensionPoint.menuItem:
        return 'ui.menu';
      case ExtensionPoint.diagnostics:
        return 'diagnostics';
    }
  }

  static ExtensionPoint? tryParse(String value) {
    for (final point in ExtensionPoint.values) {
      if (point.id == value) return point;
    }
    return null;
  }

  /// Capability required to contribute to this point.
  PluginCapability? get requiredCapability {
    switch (this) {
      case ExtensionPoint.searchProvider:
        return PluginCapability.search;
      case ExtensionPoint.channelProvider:
        return PluginCapability.channel;
      case ExtensionPoint.trendingProvider:
        return PluginCapability.trending;
      case ExtensionPoint.playbackProvider:
        return PluginCapability.playback;
      case ExtensionPoint.settingsSection:
        return PluginCapability.settingsRead;
      case ExtensionPoint.menuItem:
        return null;
      case ExtensionPoint.diagnostics:
        return PluginCapability.diagnostics;
    }
  }
}

/// A contribution declared by a plugin manifest.
///
/// The declaration says *what* the plugin offers and *where*; the host decides
/// how to render or call it. Registration is always gated on
/// [ExtensionPoint.requiredCapability] being actually granted to the plugin, so
/// denying a capability silently withholds the matching contributions.
class PluginContributionSpec {
  const PluginContributionSpec({
    required this.point,
    required this.id,
  });

  final ExtensionPoint point;
  final String id;

  /// Stable key used for duplicate detection.
  String get key => '${point.id}:$id';

  Map<String, dynamic> toJson() => <String, dynamic>{
        'point': point.id,
        'id': id,
      };

  /// Returns `null` when the point is unknown, so newer manifests stay
  /// loadable by older hosts.
  static PluginContributionSpec? tryFromJson(Map<String, dynamic> json) {
    final point = ExtensionPointX.tryParse(json['point']?.toString() ?? '');
    if (point == null) return null;
    return PluginContributionSpec(
      point: point,
      id: json['id']?.toString() ?? '',
    );
  }

  @override
  String toString() => 'PluginContributionSpec($key)';
}
