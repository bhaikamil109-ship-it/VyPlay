import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/services/download_location_service.dart';
import 'package:vyplay/core/services/saf_storage_service.dart';
import 'package:vyplay/domain/download/download_location.dart';
import 'package:vyplay/domain/download/saf_directory.dart';
import 'package:vyplay/generated/l10n.dart';

/// Lets the user move downloads to a folder of their choice, including a
/// removable/SD card directory.
///
/// The folder is chosen with Android's Storage Access Framework, because that
/// is the only way an app can write into a shared folder on Android 11+: the
/// returned tree URI is persisted, probed with a real write and only then
/// saved. A folder that became unwritable or disappeared is reported here
/// instead of being silently swapped for app storage further down the pipeline.
class DownloadLocationSection extends StatefulWidget {
  const DownloadLocationSection({super.key});

  @override
  State<DownloadLocationSection> createState() =>
      _DownloadLocationSectionState();
}

class _DownloadLocationSectionState extends State<DownloadLocationSection> {
  final DownloadLocationService _service = DownloadLocationService();
  final SafStorageService _saf = SafStorageService();

  DownloadLocationCheck? _check;
  bool _checking = false;
  String? _checkedPath;

  /// Folder name for a SAF selection, e.g. "VyPlay" instead of a raw URI.
  String? _displayName;

  static bool _isTree(String? path) => SafDirectory.isTreeUri(path);

  Future<void> _refreshCheck(String? path, {bool force = false}) async {
    if (!force && _checkedPath == path && _check != null) return;
    if (!mounted) return;
    setState(() {
      _checking = true;
      _checkedPath = path;
    });

    final result = await _service.check(configuredPath: path);
    String? displayName;
    if (_isTree(path)) {
      displayName = (await _saf.checkDirectory(path!))?.displayName;
    }

    if (!mounted) return;
    setState(() {
      _check = result;
      _checking = false;
      if (displayName != null) _displayName = displayName;
    });
  }

  /// Opens the system folder picker and saves the result once it probes clean.
  Future<void> _pickFolder() async {
    final locals = S.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final settingsBloc = context.read<SettingsBloc>();

    SafDirectory? picked;
    try {
      picked = await _saf.pickDirectory();
    } on SafStorageException catch (e) {
      // Denied permission, missing picker activity, revoked grant: say why and
      // leave the previously working folder untouched.
      if (!mounted) return;
      messenger.showSnackBar(
        SnackBar(
          content: Text(e.message),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (!mounted) return;
    // User backed out of the picker; nothing to change.
    if (picked == null) return;

    setState(() {
      _displayName = picked!.displayName;
      _checkedPath = picked.uri;
      _check = DownloadLocationCheck(
        status: switch (picked.status) {
          SafDirectoryStatus.ready => DownloadLocationStatus.ready,
          SafDirectoryStatus.notWritable => DownloadLocationStatus.notWritable,
          SafDirectoryStatus.unavailable => DownloadLocationStatus.unavailable,
        },
        message: picked.message,
      );
    });

    if (!picked.isUsable) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            picked.message ?? locals.downloadFolderRejected,
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    settingsBloc.add(SettingsEvent.downloadFolderChanged(path: picked.uri));
    messenger.showSnackBar(
      SnackBar(
        content: Text(locals.downloadFolderSaved),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _reset(BuildContext context) async {
    final path = _checkedPath;
    context
        .read<SettingsBloc>()
        .add(const SettingsEvent.downloadFolderChanged());

    // Give the persisted grant back; keeping it would leave an invisible
    // permission attached to the app after the user asked to reset.
    if (_isTree(path)) {
      await _saf.releaseDirectory(path!);
    }

    if (!mounted) return;
    setState(() {
      _check = const DownloadLocationCheck.unset();
      _checkedPath = null;
      _displayName = null;
    });
  }

  Widget _statusRow(BuildContext context, S locals) {
    final theme = Theme.of(context);
    final check = _check;

    if (_checking) {
      return Row(
        children: [
          const SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(width: kPadding8),
          Text(locals.recheckFolder, style: theme.textTheme.bodySmall),
        ],
      );
    }

    if (check == null || check.status == DownloadLocationStatus.unset) {
      return const SizedBox.shrink();
    }

    final isReady = check.status == DownloadLocationStatus.ready;
    final color = isReady ? theme.colorScheme.primary : theme.colorScheme.error;
    final text = switch (check.status) {
      DownloadLocationStatus.ready => locals.downloadFolderReady,
      DownloadLocationStatus.notWritable => locals.downloadFolderNotWritable,
      DownloadLocationStatus.unavailable => locals.downloadFolderUnavailable,
      DownloadLocationStatus.unset => '',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              isReady ? Icons.check_circle_outline : Icons.error_outline,
              size: 18,
              color: color,
            ),
            const SizedBox(width: kPadding8),
            Expanded(
              child: Text(
                text,
                style: theme.textTheme.bodySmall?.copyWith(color: color),
              ),
            ),
          ],
        ),
        if (!isReady && check.message != null) ...[
          kHeightBox4,
          Text(
            check.message!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.downloadFolderPath != current.downloadFolderPath,
      builder: (context, state) {
        final path = state.downloadFolderPath;
        final isTree = _isTree(path);
        final folderLabel = isTree
            ? (_displayName ?? 'Selected folder')
            : (path ?? locals.appStorageDefault);

        // Check once per path change, after this frame, so the status line
        // reflects reality without probing storage during build.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted && _checkedPath != path) _refreshCheck(path);
        });

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.folder_outlined),
                const SizedBox(width: kPadding12),
                Expanded(
                  child: Text(
                    locals.downloadLocation,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            kHeightBox4,
            Text(
              locals.downloadLocationDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            kHeightBox8,
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                isTree ? Icons.sd_card_outlined : Icons.folder,
                size: 20,
              ),
              title: Text(locals.currentFolder),
              subtitle: Text(
                folderLabel,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (path != null) _statusRow(context, locals),
            kHeightBox8,
            Wrap(
              spacing: kPadding8,
              runSpacing: kPadding8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                FilledButton.tonalIcon(
                  onPressed: _pickFolder,
                  icon: const Icon(Icons.folder_open, size: 18),
                  label: Text(locals.changeFolder),
                ),
                if (path != null)
                  TextButton(
                    onPressed: () => _refreshCheck(path, force: true),
                    child: Text(locals.recheckFolder),
                  ),
                if (path != null)
                  TextButton(
                    onPressed: () => _reset(context),
                    child: Text(locals.resetToDefault),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
