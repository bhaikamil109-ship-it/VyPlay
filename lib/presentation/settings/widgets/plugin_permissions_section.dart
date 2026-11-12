import 'package:flutter/material.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/di/injectable.dart';
import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_manager.dart';
import 'package:vyplay/presentation/settings/sub_screens/plugin_permissions_screen.dart';
import 'package:vyplay/generated/l10n.dart';

class PluginPermissionsSection extends StatelessWidget {
  const PluginPermissionsSection({super.key});

  PluginManager _manager(BuildContext context) {
    return getIt<PluginManager>();
  }

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);
    final manager = _manager(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.bug_report),
            const SizedBox(width: kPadding12),
            Expanded(
              child: Text(
                locals.pluginPermissions,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
        kHeightBox4,
        Text(
          locals.pluginPermissionsDescription,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        kHeightBox12,
        if (manager.plugins.isEmpty)
          _EmptyState(locals: locals)
        else
          _PluginList(manager: manager, locals: locals),
        kHeightBox12,
      ],
    );
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
              Icons.bug_report_outlined,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: kPadding12),
            Expanded(
              child: Text(
                locals.pluginPermissionsNone,
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

class _PluginList extends StatelessWidget {
  const _PluginList({required this.manager, required this.locals});

  final PluginManager manager;
  final S locals;

  @override
  Widget build(BuildContext context) {
    final plugins = manager.plugins;

    return Column(
      children: [
        for (final plugin in plugins)
          _PluginTile(
            plugin: plugin,
            manager: manager,
            locals: locals,
          ),
      ],
    );
  }
}

class _PluginTile extends StatelessWidget {
  const _PluginTile({
    required this.plugin,
    required this.manager,
    required this.locals,
  });

  final Plugin plugin;
  final PluginManager manager;
  final S locals;

  @override
  Widget build(BuildContext context) {
    final manifest = plugin.manifest;
    final status = manager.status(manifest.id);
    final granted = manager.grantedCapabilities(manifest.id);
    final declared = Set<PluginCapability>.from(manifest.capabilities);
    final denied = declared.difference(granted);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => _openPermissions(context, manifest.id),
          borderRadius: BorderRadius.circular(kRadius12),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kPadding12,
              vertical: kPadding8,
            ),
            child: Row(
              children: [
                Icon(
                  _statusIcon(status),
                  size: 24,
                  color: _statusColor(status, Theme.of(context)),
                ),
                const SizedBox(width: kPadding12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        manifest.name,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        '${manifest.provider} · ${manifest.version}',
                        style:
                            Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                      ),
                    ],
                  ),
                ),
                _PermissionSummary(
                  grantedCount: granted.length,
                  deniedCount: denied.length,
                  declaredCount: declared.length,
                  locals: locals,
                ),
                Icon(
                  Icons.chevron_right,
                  color:
                      Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _openPermissions(BuildContext context, String pluginId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PluginPermissionsScreen(pluginId: pluginId),
        fullscreenDialog: false,
      ),
    );
  }

  IconData _statusIcon(PluginStatus status) {
    return switch (status) {
      PluginStatus.enabled => Icons.check_circle,
      PluginStatus.disabled => Icons.cancel,
      PluginStatus.error => Icons.error,
      PluginStatus.registered => Icons.info_outline,
      PluginStatus.initializing => Icons.hourglass_top,
      PluginStatus.unregistered => Icons.help_outline,
    };
  }

  Color _statusColor(PluginStatus status, ThemeData theme) {
    return switch (status) {
      PluginStatus.enabled => theme.colorScheme.primary,
      PluginStatus.disabled => theme.colorScheme.onSurfaceVariant,
      PluginStatus.error => theme.colorScheme.error,
      _ => theme.colorScheme.onSurfaceVariant,
    };
  }
}

class _PermissionSummary extends StatelessWidget {
  const _PermissionSummary({
    required this.grantedCount,
    required this.deniedCount,
    required this.declaredCount,
    required this.locals,
  });

  final int grantedCount;
  final int deniedCount;
  final int declaredCount;
  final S locals;

  @override
  Widget build(BuildContext context) {
    final chip = Chip(
      label: Text(
        grantedCount == declaredCount
            ? locals.pluginPermissionsAllGranted
            : '$grantedCount/$declaredCount ${locals.pluginPermissionsGranted}',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: grantedCount == declaredCount
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
      ),
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const EdgeInsets.symmetric(horizontal: kPadding4),
    );

    if (deniedCount > 0) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          chip,
          const SizedBox(width: kPadding8),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: kPadding4,
              vertical: kPadding4,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(kRadius8),
            ),
            child: Text(
              '$deniedCount ${locals.pluginPermissionsDenied}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
            ),
          ),
        ],
      );
    }

    return chip;
  }
}
