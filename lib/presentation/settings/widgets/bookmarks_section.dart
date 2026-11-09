import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/generated/l10n.dart';

class PlaylistBookmarksSettingsSection extends StatelessWidget {
  const PlaylistBookmarksSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.bookmarksConfig != current.bookmarksConfig,
      builder: (context, state) {
        final config = state.bookmarksConfig;
        final isEnabled = config?.enabled ?? false;
        final selectedPlaylists = config?.selectedPlaylists ?? <String>[];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.bookmark),
                const SizedBox(width: kPadding12),
                Expanded(
                  child: Text(
                    locals.playlistBookmarks,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Switch(
                  value: isEnabled,
                  onChanged: (value) {
                    context
                        .read<SettingsBloc>()
                        .add(SettingsEvent.bookmarksToggled(enabled: value));
                  },
                ),
              ],
            ),
            kHeightBox4,
            Text(
              locals.playlistBookmarksDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            kHeightBox12,
            if (isEnabled) ...[
              Text(
                locals.selectedPlaylists,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              kHeightBox8,
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => const PlaylistBookmarkSheet(),
                    );
                  },
                  icon: const Icon(Icons.playlist_play),
                  label: Text(locals.managePlaylists),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: kPadding12),
                  ),
                ),
              ),
              kHeightBox8,
              if (selectedPlaylists.isEmpty)
                Text(
                  locals.noPlaylistsSelected,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                )
              else
                ...selectedPlaylists.map(
                  (playlist) => Padding(
                    padding: const EdgeInsets.only(bottom: kPadding4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.playlist_play,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: kPadding8),
                        Expanded(
                          child: Text(
                            playlist,
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
            kHeightBox12,
          ],
        );
      },
    );
  }
}

class PlaylistBookmarkSheet extends StatelessWidget {
  const PlaylistBookmarkSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.bookmarksConfig != current.bookmarksConfig,
      builder: (context, state) {
        final config = state.bookmarksConfig;
        final selectedPlaylists = config?.selectedPlaylists ?? <String>[];

        return Dismissible(
          key: const Key('playlist_bookmark_sheet'),
          onDismissed: (_) => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.all(kPadding16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).selectPlaylists,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                kHeightBox16,
                // Sample playlist items for demo
                _buildPlaylistTile(
                  context,
                  'Liked Videos',
                  selectedPlaylists.contains('liked'),
                  'liked',
                  selectedPlaylists,
                ),
                _buildPlaylistTile(
                  context,
                  'Watch Later',
                  selectedPlaylists.contains('watch_later'),
                  'watch_later',
                  selectedPlaylists,
                ),
                _buildPlaylistTile(
                  context,
                  'Favorites',
                  selectedPlaylists.contains('favorites'),
                  'favorites',
                  selectedPlaylists,
                ),
                _buildPlaylistTile(
                  context,
                  'Downloads',
                  selectedPlaylists.contains('downloads'),
                  'downloads',
                  selectedPlaylists,
                ),
                const SizedBox(height: kPadding16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.bookmarksApplied(
                              selectedPlaylists: selectedPlaylists.toList(),
                            ),
                          );
                      Navigator.pop(context);
                    },
                    child: Text(S.of(context).save),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPlaylistTile(
    BuildContext context,
    String title,
    bool isSelected,
    String playlistId,
    List<String> selectedPlaylists,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kPadding8),
      child: StatefulBuilder(
        builder: (context, setState) {
          return CheckboxListTile(
            title: Text(title),
            value: isSelected,
            onChanged: (value) {
              final List<String> updated = List.from(selectedPlaylists);
              if (value == true) {
                if (!updated.contains(playlistId)) {
                  updated.add(playlistId);
                }
              } else {
                updated.remove(playlistId);
              }
              context.read<SettingsBloc>().add(
                    SettingsEvent.bookmarksApplied(selectedPlaylists: updated),
                  );
              setState(() {});
            },
            contentPadding: EdgeInsets.zero,
            dense: true,
          );
        },
      ),
    );
  }
}
