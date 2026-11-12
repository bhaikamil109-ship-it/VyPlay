import 'package:flutter/material.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/di/injectable.dart';
import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_manifest.dart';
import 'package:vyplay/domain/plugin/plugin_manager.dart';
import 'package:vyplay/domain/plugin/plugin_permission.dart';
import 'package:vyplay/generated/l10n.dart';

class PluginPermissionsScreen extends StatefulWidget {
  const PluginPermissionsScreen({super.key, required this.pluginId});

  final String pluginId;

  @override
  State<PluginPermissionsScreen> createState() =>
      _PluginPermissionsScreenState();
}

class _PluginPermissionsScreenState extends State<PluginPermissionsScreen> {
  PluginManager get _manager => getIt<PluginManager>();
  PluginPermissionService get _permissions => getIt<PluginPermissionService>();

  bool _loading = true;
  bool _showReloadHint = false;
  bool _reloading = false;
  String? _lastError;
  Set<PluginCapability> _grantedState = <PluginCapability>{};

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  /// Loads the persisted permission policy for this plugin.
  ///
  /// The screen shows the *policy* (what the user granted), not the running
  /// plugin's session grants: an already-enabled plugin keeps its previous
  /// capabilities until it is disabled and re-enabled, which is what the
  /// reload hint explains.
  Future<void> _refresh() async {
    final manifest = _manager.plugin(widget.pluginId)?.manifest;
    if (manifest == null) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _reloading = false;
      });
      return;
    }
    final declared = Set<PluginCapability>.from(manifest.capabilities);
    final granted = await _permissions.grantedCapabilities(
      widget.pluginId,
      declared: declared,
    );
    if (!mounted) return;
    setState(() {
      _grantedState = granted;
      _loading = false;
      _reloading = false;
    });
  }

  PluginManifest _manifest() {
    final plugin = _manager.plugin(widget.pluginId);
    if (plugin == null) {
      throw FallthroughError();
    }
    return plugin.manifest;
  }

  Set<PluginCapability> get _declared =>
      Set<PluginCapability>.from(_manifest().capabilities);

  Set<PluginCapability> get _granted => _grantedState;

  Set<PluginCapability> get _denied => _declared.difference(_granted);

  Future<void> _toggle(PluginCapability capability, bool grant) async {
    setState(() {
      _lastError = null;
      _reloading = true;
    });

    try {
      if (grant) {
        await _permissions.grant(widget.pluginId, capability);
      } else {
        await _permissions.revoke(widget.pluginId, capability);
      }
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _lastError = 'Could not update permission: ${error.toString()}';
        _reloading = false;
      });
      return;
    }

    if (!mounted) return;

    final needsReload =
        _manager.status(widget.pluginId) == PluginStatus.enabled;
    if (needsReload) {
      setState(() {
        _showReloadHint = true;
      });
    }

    // Re-read the persisted policy so the toggle reflects the change even for
    // a plugin that is not running yet (those show no reload hint).
    await _refresh();
  }

  Future<void> _applyReload() async {
    final id = widget.pluginId;

    setState(() {
      _reloading = true;
      _lastError = null;
    });

    PluginResult<void>? disabled;
    PluginResult<void>? enabled;

    try {
      disabled = await _manager.setEnabled(id, false);
    } catch (error) {
      disabled = PluginResult<void>.failure(PluginFailure(
        pluginId: id,
        code: 'reload_error',
        message: error.toString(),
      ));
    }

    if (disabled.isFailure == true) {
      if (!mounted) return;
      setState(() {
        _lastError =
            'Could not disable plugin: ${disabled!.error!.message}';
        _reloading = false;
      });
      return;
    }

    try {
      enabled = await _manager.setEnabled(id, true);
    } catch (error) {
      enabled = PluginResult<void>.failure(PluginFailure(
        pluginId: id,
        code: 'reload_error',
        message: error.toString(),
      ));
    }

    if (enabled.isFailure == true) {
      if (!mounted) return;
      setState(() {
        _lastError =
            'Could not re-enable plugin: ${enabled!.error!.message}';
        _reloading = false;
      });
      return;
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(S.of(context).pluginPermissionsReloaded),
        duration: const Duration(seconds: 2),
      ),
    );

    if (!mounted) return;
    setState(() {
      _showReloadHint = false;
      _reloading = false;
    });
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_manifest().name),
        leading: const BackButton(),
      ),
      body: PopScope(
        canPop: true,
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: _buildBody(locals),
        ),
      ),
    );
  }

  Widget _buildBody(S locals) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    final manifest = _manifest();

    return CustomScrollView(
      slivers: [
        _SliverPluginHeader(manifest: manifest, locals: locals),
        const SliverToBoxAdapter(child: kHeightBox12),
        if (_declared.isNotEmpty)
          SliverToBoxAdapter(
            child: _PermissionScopeSummary(
              declared: _declared,
              granted: _granted,
              denied: _denied,
              locals: locals,
            ),
          ),
        const SliverToBoxAdapter(child: kHeightBox12),
        if (_denied.isNotEmpty)
          SliverToBoxAdapter(child: _DeniedSection(locals: locals)),
        if (_denied.isNotEmpty)
          const SliverToBoxAdapter(child: kHeightBox8),
        _CapabilityList(
          declared: _declared,
          granted: _granted,
          locals: locals,
          onToggle: _toggle,
          isLoading: _reloading,
        ),
        const SliverToBoxAdapter(child: kHeightBox12),
        if (_showReloadHint)
          SliverToBoxAdapter(
            child: _ReloadSection(
              locals: locals,
              onApply: _applyReload,
            ),
          ),
        if (_lastError != null)
          SliverToBoxAdapter(
            child: _ErrorBanner(
              context: context,
              message: _lastError!,
              onDismiss: () => setState(() => _lastError = null),
            ),
          ),
        const SliverToBoxAdapter(child: kHeightBox12),
      ],
    );
  }
}

class _SliverPluginHeader extends StatelessWidget {
  const _SliverPluginHeader({required this.manifest, required this.locals});

  final PluginManifest manifest;
  final S locals;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(kPadding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  size: 20,
                ),
                const SizedBox(width: kPadding8),
                Expanded(
                  child: Text(
                    '${locals.pluginInfo} · ${manifest.id}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
            kHeightBox4,
            Text(
              manifest.description,
              style: theme.textTheme.bodySmall,
            ),
            kHeightBox4,
            Text(
              '${manifest.provider} · v${manifest.version}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PermissionScopeSummary extends StatelessWidget {
  const _PermissionScopeSummary({
    required this.declared,
    required this.granted,
    required this.denied,
    required this.locals,
  });

  final Set<PluginCapability> declared;
  final Set<PluginCapability> granted;
  final Set<PluginCapability> denied;
  final S locals;

  @override
  Widget build(BuildContext context) {
    final isDefault = declared.length == granted.length &&
        declared.difference(granted).isEmpty;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(kPadding12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isDefault
                      ? Icons.check_circle_outline
                      : Icons.admin_panel_settings,
                  size: 20,
                  color: isDefault
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: kPadding8),
                Expanded(
                  child: Text(
                    isDefault
                        ? locals.pluginPermissionsDefaultPolicy
                        : locals.pluginPermissionsCustomPolicy,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            kHeightBox4,
            Text(
              isDefault
                  ? locals.pluginPermissionsDefaultDescription
                  : locals.pluginPermissionsCustomDescription,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeniedSection extends StatelessWidget {
  const _DeniedSection({required this.locals});

  final S locals;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.errorContainer,
      child: Padding(
        padding: const EdgeInsets.all(kPadding12),
        child: Row(
          children: [
            const Icon(
              Icons.warning_amber_rounded,
            ),
            const SizedBox(width: kPadding12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    locals.pluginPermissionsRestricted,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onErrorContainer,
                    ),
                  ),
                  kHeightBox4,
                  Text(
                    locals.pluginPermissionsRestrictedDescription,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onErrorContainer
                          .withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CapabilityList extends StatelessWidget {
  const _CapabilityList({
    required this.declared,
    required this.granted,
    required this.locals,
    required this.onToggle,
    required this.isLoading,
  });

  final Set<PluginCapability> declared;
  final Set<PluginCapability> granted;
  final S locals;
  final void Function(PluginCapability, bool) onToggle;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final capabilities = _sortedCapabilities(declared);
    if (capabilities.isEmpty) {
      return SliverToBoxAdapter(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(kPadding16),
            child: Center(
              child: Text(
                locals.pluginPermissionsNoneDeclared,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final capability = capabilities[index];
          final isGranted = granted.contains(capability);
          final canToggle = declared.contains(capability);

          return _CapabilityTile(
            capability: capability,
            isGranted: isGranted,
            canToggle: canToggle,
            locals: locals,
            onToggle: canToggle
                ? (grant) => onToggle(capability, grant)
                : (_) {},
            isLoading: isLoading && canToggle,
          );
        },
        childCount: capabilities.length,
      ),
    );
  }

  List<PluginCapability> _sortedCapabilities(
      Set<PluginCapability> set) {
    return set.toList()..sort((a, b) => a.id.compareTo(b.id));
  }
}

class _CapabilityTile extends StatelessWidget {
  const _CapabilityTile({
    required this.capability,
    required this.isGranted,
    required this.canToggle,
    required this.locals,
    required this.onToggle,
    required this.isLoading,
  });

  final PluginCapability capability;
  final bool isGranted;
  final bool canToggle;
  final S locals;
  final void Function(bool) onToggle;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap:
          canToggle && !isLoading ? () => onToggle(!isGranted) : null,
      borderRadius: BorderRadius.circular(kRadius12),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kPadding12,
          vertical: kPadding8,
        ),
        child: Row(
          children: [
            Icon(
              isGranted ? Icons.check_circle : Icons.cancel,
              size: 20,
              color: isGranted
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: kPadding12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    capability.name.toUpperCase(),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  kHeightBox4,
                  Text(
                    _label(),
                    style: theme.textTheme.bodyMedium,
                  ),
                  if (!canToggle) ...[
                    kHeightBox4,
                    Text(
                      locals.pluginPermissionsNotDeclared,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (canToggle && !isLoading)
              Switch(
                value: isGranted,
                onChanged: (value) => onToggle(!isGranted),
              ),
            if (isLoading)
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
          ],
        ),
      ),
    );
  }

  String _label() {
    return switch (capability) {
      PluginCapability.search => locals.pluginCapabilitySearch,
      PluginCapability.channel => locals.pluginCapabilityChannel,
      PluginCapability.trending => locals.pluginCapabilityTrending,
      PluginCapability.playback => locals.pluginCapabilityPlayback,
      PluginCapability.settingsRead => locals.pluginCapabilitySettingsRead,
      PluginCapability.network => locals.pluginCapabilityNetwork,
      PluginCapability.diagnostics => locals.pluginCapabilityDiagnostics,
    };
  }
}

class _ReloadSection extends StatelessWidget {
  const _ReloadSection({
    required this.locals,
    required this.onApply,
  });

  final S locals;
  final VoidCallback onApply;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(kPadding12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.info_outline,
                ),
                const SizedBox(width: kPadding12),
                Expanded(
                  child: Text(
                    locals.pluginPermissionsReloadRequiredTitle,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
            kHeightBox4,
            Text(
              locals.pluginPermissionsReloadRequiredDescription,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onPrimaryContainer
                    .withValues(alpha: 0.85),
              ),
            ),
            kHeightBox12,
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: onApply,
                icon: const Icon(Icons.replay),
                label: Text(locals.pluginPermissionsApplyNow),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({
    required this.context,
    required this.message,
    required this.onDismiss,
  });

  final BuildContext context;
  final String message;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locals = S.of(context);

    return Card(
      color: theme.colorScheme.errorContainer,
      child: Padding(
        padding: const EdgeInsets.all(kPadding12),
        child: Row(
          children: [
            const Icon(
              Icons.error_outline,
            ),
            const SizedBox(width: kPadding12),
            Expanded(
              child: Text(
                message,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onErrorContainer,
                ),
              ),
            ),
            TextButton(
              onPressed: onDismiss,
              child: Text(locals.cancel),
            ),
          ],
        ),
      ),
    );
  }
}

class FallthroughError implements Exception {}
