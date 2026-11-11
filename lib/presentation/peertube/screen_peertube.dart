import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/peertube/peertube_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/presentation/peertube/peertube_navigation.dart';
import 'package:vyplay/presentation/peertube/widgets/peertube_instance_sheet.dart';
import 'package:vyplay/presentation/peertube/widgets/peertube_video_card.dart';

/// Dedicated PeerTube source. Independent from the four YouTube backends.
class ScreenPeerTube extends StatefulWidget {
  const ScreenPeerTube({super.key});

  @override
  State<ScreenPeerTube> createState() => _ScreenPeerTubeState();
}

class _ScreenPeerTubeState extends State<ScreenPeerTube> {
  final TextEditingController _searchController = TextEditingController();
  String? _lastInstanceUrl;
  bool _hasSearchText = false;

  static const _sortOptions = <String, String>{
    '-publishedAt': 'Recently published',
    '-trending': 'Trending',
    '-views': 'Most viewed',
    '-likes': 'Most liked',
    '-createdAt': 'Recently added',
  };

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _submitSearch(String value) {
    final query = value.trim();
    if (query.isEmpty) {
      context.read<PeerTubeBloc>().add(const PeerTubeClearSearch());
      return;
    }
    context.read<PeerTubeBloc>().add(PeerTubeSearch(query));
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() => _hasSearchText = false);
    context.read<PeerTubeBloc>().add(const PeerTubeClearSearch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PeerTubeBloc, PeerTubeState>(
      listenWhen: (previous, current) =>
          previous.activeUrl != current.activeUrl ||
          (previous.error != current.error && current.error != null),
      listener: (context, state) {
        if (_lastInstanceUrl != state.activeUrl) {
          _lastInstanceUrl = state.activeUrl;
          _searchController.clear();
          if (_hasSearchText) setState(() => _hasSearchText = false);
        }
        if (state.error != null && !state.addingInstance) {
          // The instance sheet shows its own inline error; avoid duplicate
          // snackbars when it is open by only surfacing feed failures here.
          if (state.feedStatus == ApiStatus.error &&
              state.videos.isEmpty &&
              state.config == null) {
            showPeerTubeMessage(context, state.error!);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.public, size: 22),
                const SizedBox(width: 8),
                const Text('PeerTube'),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'PUBLIC',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                tooltip: 'Manage instances',
                onPressed: () => showPeerTubeInstanceSheet(context),
                icon: const Icon(Icons.dns_outlined),
              ),
            ],
          ),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, PeerTubeState state) {
    if (state.instancesStatus == ApiStatus.loading && state.instances.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.instances.isEmpty) {
      return PeerTubeEmptyState(
        icon: Icons.dns_outlined,
        title: 'No PeerTube instance',
        message: 'Add a public PeerTube server to browse videos anonymously.',
        action: FilledButton.icon(
          onPressed: () => showPeerTubeInstanceSheet(context),
          icon: const Icon(Icons.add),
          label: const Text('Add instance'),
        ),
      );
    }

    if (state.config == null) {
      if (state.feedStatus == ApiStatus.error) {
        return _errorPanel(
          context,
          state.error ?? 'Could not load this PeerTube instance.',
          onRetry: () =>
              context.read<PeerTubeBloc>().add(const PeerTubeRefresh()),
          onManage: () => showPeerTubeInstanceSheet(context),
        );
      }
      return _instanceLoading(context, state);
    }

    return Column(
      children: [
        _instanceHeader(context, state),
        _searchAndSort(context, state),
        Expanded(child: _results(context, state)),
      ],
    );
  }

  Widget _instanceLoading(BuildContext context, PeerTubeState state) {
    final instance = state.activeInstance;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          kHeightBox16,
          Text(instance?.name ?? state.activeUrl ?? 'PeerTube'),
          kHeightBox4,
          Text(
            'Loading instance configuration…',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _instanceHeader(BuildContext context, PeerTubeState state) {
    final theme = Theme.of(context);
    final config = state.config!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
      color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      child: Row(
        children: [
          Icon(Icons.dns_outlined, color: theme.colorScheme.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  config.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  [
                    config.hostUrl,
                    if (config.serverVersion.isNotEmpty)
                      'v${config.serverVersion}',
                    if (!config.transcodingEnabled) 'no transcoding',
                    if (config.liveEnabled) 'live',
                  ].join(' · '),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => showPeerTubeInstanceSheet(context),
            child: const Text('Switch'),
          ),
        ],
      ),
    );
  }

  Widget _searchAndSort(BuildContext context, PeerTubeState state) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            textInputAction: TextInputAction.search,
            onChanged: (value) {
              final hasText = value.isNotEmpty;
              if (hasText != _hasSearchText) {
                setState(() => _hasSearchText = hasText);
              }
            },
            onSubmitted: _submitSearch,
            decoration: InputDecoration(
              hintText: 'Search videos on this instance',
              prefixIcon: const Icon(Icons.search, size: 20),
              suffixIcon: _hasSearchText
                  ? IconButton(
                      tooltip: 'Clear search',
                      icon: const Icon(Icons.close, size: 18),
                      onPressed: _clearSearch,
                    )
                  : null,
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                state.isSearching
                    ? 'Results for "${state.query}"'
                    : 'Discover public videos',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              PopupMenuButton<String>(
                tooltip: 'Sort videos',
                initialValue: state.sort,
                onSelected: (value) =>
                    context.read<PeerTubeBloc>().add(PeerTubeSetSort(value)),
                itemBuilder: (context) => [
                  for (final entry in _sortOptions.entries)
                    PopupMenuItem<String>(
                      value: entry.key,
                      child: Text(entry.value),
                    ),
                ],
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _sortOptions[state.sort] ?? 'Sort',
                        style: theme.textTheme.bodySmall,
                      ),
                      const Icon(Icons.arrow_drop_down, size: 18),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _results(BuildContext context, PeerTubeState state) {
    final searching = state.isSearching;
    final videos = searching ? state.searchResults : state.videos;
    final status = searching ? state.searchStatus : state.feedStatus;
    final error = searching ? state.searchError : state.error;
    final loadingMore = searching ? state.searchingMore : state.loadingMore;

    if (status == ApiStatus.loading && videos.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (status == ApiStatus.error && videos.isEmpty) {
      return _errorPanel(
        context,
        error ?? 'Could not load videos from this instance.',
        onRetry: () {
          if (searching) {
            context.read<PeerTubeBloc>().add(PeerTubeSearch(state.query));
          } else {
            context.read<PeerTubeBloc>().add(const PeerTubeRefresh());
          }
        },
      );
    }
    if (videos.isEmpty) {
      return PeerTubeEmptyState(
        icon: Icons.video_library_outlined,
        title: searching ? 'No matching videos' : 'No public videos',
        message: searching
            ? 'Try another search or a different instance.'
            : 'This instance has no public videos in the selected order.',
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.extentAfter < 500) {
          context.read<PeerTubeBloc>().add(const PeerTubeLoadMore());
        }
        return false;
      },
      child: RefreshIndicator(
        onRefresh: () async {
          if (searching) {
            context.read<PeerTubeBloc>().add(PeerTubeSearch(state.query));
          } else {
            context.read<PeerTubeBloc>().add(const PeerTubeRefresh());
          }
        },
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 24),
          itemCount: videos.length + (loadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index >= videos.length) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              );
            }
            final video = videos[index];
            return PeerTubeVideoCard(
              key: ValueKey(video.uuid),
              video: video,
              onTap: () => openPeerTubeWatch(
                context,
                instanceUrl: state.activeUrl!,
                uuid: video.uuid,
              ),
              onChannelTap: () => openPeerTubeChannelForVideo(
                context,
                instanceUrl: state.activeUrl!,
                video: video,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _errorPanel(
    BuildContext context,
    String message, {
    required VoidCallback onRetry,
    VoidCallback? onManage,
  }) {
    final theme = Theme.of(context);
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_off_outlined,
              size: 56,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            kHeightBox16,
            Text(
              'PeerTube is unavailable',
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            kHeightBox8,
            Text(
              message,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            kHeightBox16,
            Wrap(
              spacing: 8,
              children: [
                FilledButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh, size: 18),
                  label: const Text('Retry'),
                ),
                if (onManage != null)
                  OutlinedButton.icon(
                    onPressed: onManage,
                    icon: const Icon(Icons.dns_outlined, size: 18),
                    label: const Text('Instances'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
