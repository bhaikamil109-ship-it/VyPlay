import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/peertube/peertube_channel_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/domain/peertube/models/peertube_models.dart';
import 'package:vyplay/presentation/peertube/peertube_navigation.dart';
import 'package:vyplay/presentation/peertube/widgets/peertube_video_card.dart';

class ScreenPeerTubeChannel extends StatelessWidget {
  const ScreenPeerTubeChannel({
    super.key,
    required this.instanceUrl,
    required this.handle,
  });

  final String instanceUrl;
  final String handle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeerTubeChannelBloc, PeerTubeChannelState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.channel?.displayName ?? handle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              IconButton(
                tooltip: 'Refresh',
                onPressed: () => context
                    .read<PeerTubeChannelBloc>()
                    .add(const PeerTubeChannelRetry()),
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
          body: _body(context, state),
        );
      },
    );
  }

  Widget _body(BuildContext context, PeerTubeChannelState state) {
    if (state.status == ApiStatus.loading && state.channel == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final channel = state.channel;
    if (channel == null) {
      return PeerTubeEmptyState(
        icon: Icons.person_off_outlined,
        title: 'Channel unavailable',
        message: state.error ?? 'This channel could not be loaded.',
        action: FilledButton.icon(
          onPressed: () => context
              .read<PeerTubeChannelBloc>()
              .add(const PeerTubeChannelRetry()),
          icon: const Icon(Icons.refresh),
          label: const Text('Retry'),
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.extentAfter < 500) {
          context
              .read<PeerTubeChannelBloc>()
              .add(const PeerTubeChannelLoadMore());
        }
        return false;
      },
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<PeerTubeChannelBloc>().add(const PeerTubeChannelRetry());
        },
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 24),
          itemCount: 1 + state.videos.length + (state.loadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == 0) return _header(context, channel, state);
            final videoIndex = index - 1;
            if (videoIndex >= state.videos.length) {
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
            final video = state.videos[videoIndex];
            return PeerTubeVideoCard(
              key: ValueKey(video.uuid),
              video: video,
              showChannel: false,
              onTap: () => openPeerTubeWatch(
                context,
                instanceUrl: instanceUrl,
                uuid: video.uuid,
              ),
              onChannelTap: () {},
            );
          },
        ),
      ),
    );
  }

  Widget _header(
    BuildContext context,
    PeerTubeChannel channel,
    PeerTubeChannelState state,
  ) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: SizedBox(
                  width: 64,
                  height: 64,
                  child: (channel.avatarUrl ?? '').isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: channel.avatarUrl!,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
                              _avatarFallback(theme),
                        )
                      : _avatarFallback(theme),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      channel.displayName,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '@${channel.name}@${channel.host}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${formatPeerTubeCount(channel.followersCount)} followers'
                      ' · ${formatPeerTubeCount(state.total)} videos',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (channel.description.trim().isNotEmpty) ...[
            kHeightBox12,
            Text(
              channel.description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall,
            ),
          ],
          if (state.error != null) ...[
            kHeightBox8,
            Text(
              state.error!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ],
          const Divider(height: 24),
          Text(
            'Videos',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          if (state.videos.isEmpty && state.status == ApiStatus.loading)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            ),
          if (state.videos.isEmpty && state.status == ApiStatus.loaded)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'This channel has no public videos.',
                style: theme.textTheme.bodySmall,
              ),
            ),
        ],
      ),
    );
  }

  Widget _avatarFallback(ThemeData theme) {
    return ColoredBox(
      color: theme.colorScheme.surfaceContainerHighest,
      child: Icon(
        Icons.person_outline,
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}
