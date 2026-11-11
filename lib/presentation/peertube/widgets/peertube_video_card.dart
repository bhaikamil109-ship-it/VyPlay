import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/domain/peertube/models/peertube_models.dart';

/// PeerTube video card that follows VyPlay's existing list-card density.
class PeerTubeVideoCard extends StatelessWidget {
  const PeerTubeVideoCard({
    super.key,
    required this.video,
    required this.onTap,
    required this.onChannelTap,
    this.showChannel = true,
  });

  final PeerTubeVideo video;
  final VoidCallback onTap;
  final VoidCallback onChannelTap;
  final bool showChannel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final duration = formatPeerTubeDuration(video.duration);
    final channel = video.channel;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 148,
                height: 86,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if ((video.thumbnailUrl ?? '').isNotEmpty)
                      CachedNetworkImage(
                        imageUrl: video.thumbnailUrl!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => _thumbnailFallback(),
                        errorWidget: (context, url, error) =>
                            _thumbnailFallback(),
                      )
                    else
                      _thumbnailFallback(),
                    if (video.isLive)
                      Positioned(
                        left: 6,
                        top: 6,
                        child: _badge(
                          context,
                          'LIVE',
                          color: Colors.red,
                        ),
                      )
                    else if (duration.isNotEmpty)
                      Positioned(
                        right: 6,
                        bottom: 6,
                        child: _badge(context, duration),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.play_circle_outline, size: 13),
                      const SizedBox(width: 3),
                      Text(
                        'PeerTube',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (video.isLive) ...[
                        const SizedBox(width: 6),
                        Text(
                          'live',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 3),
                  if (showChannel && channel != null)
                    GestureDetector(
                      onTap: onChannelTap,
                      child: Text(
                        channel.displayName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  const SizedBox(height: 2),
                  Text(
                    [
                      '${formatPeerTubeCount(video.views)} views',
                      if (video.publishedAt != null)
                        formatPeerTubeDate(video.publishedAt),
                      if (video.isNsfw) 'NSFW',
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
          ],
        ),
      ),
    );
  }

  Widget _thumbnailFallback() {
    return Container(
      color: const Color(0xFF2A2A2A),
      alignment: Alignment.center,
      child: const Icon(
        Icons.ondemand_video_outlined,
        color: Colors.white54,
        size: 28,
      ),
    );
  }

  Widget _badge(BuildContext context, String text, {Color? color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: (color ?? Colors.black).withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// Snackbar helper that never throws when the route is already gone.
void showPeerTubeMessage(BuildContext context, String message) {
  if (!context.mounted) return;
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
}

/// Shared empty state for browse/channel screens.
class PeerTubeEmptyState extends StatelessWidget {
  const PeerTubeEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.action,
  });

  final IconData icon;
  final String title;
  final String message;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 56, color: theme.colorScheme.onSurfaceVariant),
            kHeightBox16,
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium,
            ),
            kHeightBox8,
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (action != null) ...[kHeightBox16, action!],
          ],
        ),
      ),
    );
  }
}
