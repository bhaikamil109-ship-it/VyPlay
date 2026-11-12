import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/di/injectable.dart';
import 'package:vyplay/domain/plugin/plugin_extension_registry.dart';
import 'package:vyplay/domain/plugin/plugin_manager.dart';
import 'package:vyplay/generated/l10n.dart';
import 'package:vyplay/presentation/settings/sub_screens/plugin_permissions_screen.dart';

import 'circular_icon.dart';

/// App bar entry point for `menuItem` contributions published by plugins.
///
/// Renders nothing when no plugin publishes a menu item, so the app bar of an
/// install without plugins is unchanged. Only *published* contributions are
/// listed: the registry withholds any contribution whose required capability
/// has not been granted, and removes them when a plugin is disabled.
class PluginMenuContributionsButton extends StatelessWidget {
  const PluginMenuContributionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final registry = getIt<PluginExtensionRegistry>();
    final contributions = registry.contributions(ExtensionPoint.menuItem);
    if (contributions.isEmpty) {
      return const SizedBox.shrink();
    }

    final manager = getIt<PluginManager>();
    final locals = S.of(context);

    String label(ExtensionContribution contribution) {
      final manifest = manager.plugin(contribution.pluginId)?.manifest;
      return manifest?.name ?? contribution.pluginId;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PopupMenuButton<ExtensionContribution>(
          tooltip: locals.pluginMenuContributions,
          onSelected: (contribution) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) =>
                    PluginPermissionsScreen(pluginId: contribution.pluginId),
              ),
            );
          },
          itemBuilder: (context) => [
            for (final contribution in contributions)
              PopupMenuItem<ExtensionContribution>(
                value: contribution,
                child: Row(
                  children: [
                    const Icon(Icons.extension, size: 20),
                    const SizedBox(width: kPadding12),
                    Expanded(
                      child: Text(
                        label(contribution),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: kPadding8),
                    Text(
                      contribution.id,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
          ],
          child: const CircularIcon(icon: CupertinoIcons.ellipsis),
        ),
        kWidthBox10,
      ],
    );
  }
}
