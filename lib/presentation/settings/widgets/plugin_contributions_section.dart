import 'package:flutter/material.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/di/injectable.dart';
import 'package:vyplay/domain/plugin/plugin_extension_registry.dart';
import 'package:vyplay/domain/plugin/plugin_manager.dart';
import 'package:vyplay/generated/l10n.dart';
import 'package:vyplay/presentation/settings/sub_screens/plugin_permissions_screen.dart';

/// Lists the extension contributions that plugins have published to the host.
///
/// Only *published* contributions are shown: the registry withholds any
/// contribution whose required capability has not been granted, so this list
/// automatically reflects deny-by-default permissions. Contributions are
/// declarations — the host decides how each extension point is rendered.
class PluginContributionsSection extends StatelessWidget {
  const PluginContributionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);
    final registry = getIt<PluginExtensionRegistry>();
    final manager = getIt<PluginManager>();
    final contributions = publishedContributions(registry);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.extension),
            const SizedBox(width: kPadding12),
            Expanded(
              child: Text(
                locals.pluginContributions,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
        kHeightBox4,
        Text(
          locals.pluginContributionsDescription,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        kHeightBox12,
        if (contributions.isEmpty)
          _EmptyState(locals: locals)
        else
          for (final contribution in contributions)
            _ContributionTile(
              contribution: contribution,
              manager: manager,
              locals: locals,
            ),
        kHeightBox12,
      ],
    );
  }

  /// Every contribution currently registered in the host, across all points.
  @visibleForTesting
  static List<ExtensionContribution> publishedContributions(
    PluginExtensionRegistry registry,
  ) {
    final all = <ExtensionContribution>[];
    for (final point in ExtensionPoint.values) {
      all.addAll(registry.contributions(point));
    }
    all.sort((a, b) => a.key.compareTo(b.key));
    return all;
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.locals});

  final S locals;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(kPadding12),
        child: Row(
          children: [
            Icon(
              Icons.extension_outlined,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: kPadding12),
            Expanded(
              child: Text(
                locals.pluginContributionsNone,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContributionTile extends StatelessWidget {
  const _ContributionTile({
    required this.contribution,
    required this.manager,
    required this.locals,
  });

  final ExtensionContribution contribution;
  final PluginManager manager;
  final S locals;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final manifest = manager.plugin(contribution.pluginId)?.manifest;
    final title = manifest?.name ?? contribution.pluginId;

    return InkWell(
      onTap: () => _openPermissions(context),
      borderRadius: BorderRadius.circular(kRadius12),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kPadding12,
          vertical: kPadding8,
        ),
        child: Row(
          children: [
            Icon(
              _iconFor(contribution.point),
              size: 24,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: kPadding12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    contribution.point.id,
                    style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
            Chip(
              label: Text(
                contribution.id,
                style: theme.textTheme.bodySmall,
              ),
              visualDensity: VisualDensity.compact,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: const EdgeInsets.symmetric(horizontal: kPadding4),
            ),
            Icon(
              Icons.chevron_right,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }

  void _openPermissions(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PluginPermissionsScreen(pluginId: contribution.pluginId),
        fullscreenDialog: false,
      ),
    );
  }

  IconData _iconFor(ExtensionPoint point) {
    switch (point) {
      case ExtensionPoint.searchProvider:
        return Icons.search;
      case ExtensionPoint.channelProvider:
        return Icons.account_circle_outlined;
      case ExtensionPoint.trendingProvider:
        return Icons.trending_up;
      case ExtensionPoint.playbackProvider:
        return Icons.play_circle_outline;
      case ExtensionPoint.settingsSection:
        return Icons.settings_suggest_outlined;
      case ExtensionPoint.menuItem:
        return Icons.menu;
      case ExtensionPoint.diagnostics:
        return Icons.monitor_heart_outlined;
    }
  }
}
