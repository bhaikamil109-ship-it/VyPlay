import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/generated/l10n.dart';

/// Lets the user move downloads to a folder of their choice, including a
/// removable/SD card directory.
class DownloadLocationSection extends StatelessWidget {
  const DownloadLocationSection({super.key});

  Future<void> _pickFolder(BuildContext context) async {
    final path = await FilePicker.platform.getDirectoryPath();
    if (path == null || path.trim().isEmpty) return;
    if (!context.mounted) return;
    context
        .read<SettingsBloc>()
        .add(SettingsEvent.downloadFolderChanged(path: path));
  }

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.downloadFolderPath != current.downloadFolderPath,
      builder: (context, state) {
        final path = state.downloadFolderPath;
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
              leading: const Icon(Icons.folder, size: 20),
              title: Text(locals.currentFolder),
              subtitle: Text(path ?? locals.appStorageDefault),
            ),
            Wrap(
              spacing: kPadding8,
              runSpacing: kPadding8,
              children: [
                FilledButton.tonalIcon(
                  onPressed: () => _pickFolder(context),
                  icon: const Icon(Icons.folder_open, size: 18),
                  label: Text(locals.changeFolder),
                ),
                if (path != null)
                  TextButton(
                    onPressed: () {
                      context.read<SettingsBloc>().add(
                            const SettingsEvent.downloadFolderChanged(),
                          );
                    },
                    child: Text(locals.resetToDefault),
                  ),
              ],
            ),
            FutureBuilder<List<Directory>?>(
              future: getExternalStorageDirectories(),
              builder: (context, snapshot) {
                final dirs = (snapshot.data ?? const <Directory>[])
                    .where((dir) => dir.path != path)
                    .toList();
                if (dirs.isEmpty) return const SizedBox.shrink();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHeightBox8,
                    Text(
                      locals.sdCardStorage,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    kHeightBox8,
                    Wrap(
                      spacing: kPadding8,
                      runSpacing: kPadding8,
                      children: [
                        for (final dir in dirs)
                          ActionChip(
                            avatar: const Icon(Icons.sd_card, size: 18),
                            label: Text(dir.path),
                            onPressed: () {
                              context.read<SettingsBloc>().add(
                                    SettingsEvent.downloadFolderChanged(
                                      path: '${dir.path}/VyPlay',
                                    ),
                                  );
                            },
                          ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
