import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vyplay/application/peertube/peertube_watch_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/core/player/global_player_controller.dart';
import 'package:vyplay/domain/peertube/models/peertube_models.dart';
import 'package:vyplay/domain/watch/playback/models/generic_quality_info.dart';
import 'package:vyplay/presentation/peertube/peertube_navigation.dart';
import 'package:vyplay/presentation/peertube/widgets/peertube_video_card.dart';
import 'package:vyplay/presentation/watch/widgets/player/generic_player_controls_overlay.dart';

class ScreenPeerTubeWatch extends StatelessWidget {
  const ScreenPeerTubeWatch({
    super.key,
    required this.instanceUrl,
    required this.uuid,
  });

  final String instanceUrl;
  final String uuid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeerTubeWatchBloc, PeerTubeWatchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('PeerTube'),
          ),
          body: _body(context, state),
        );
      },
    );
  }

  Widget _body(BuildContext context, PeerTubeWatchState state) {
    if (state.status == ApiStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    final video = state.video;
    if (video == null || state.status == ApiStatus.error) {
      return PeerTubeEmptyState(
        icon: Icons.videocam_off_outlined,
        title: 'Video unavailable',
        message: state.error ??
            'This video may be private, deleted, or not available on this instance.',
        action: FilledButton.icon(
          onPressed: () =>
              context.read<PeerTubeWatchBloc>().add(const PeerTubeWatchRetry()),
          icon: const Icon(Icons.refresh),
          label: const Text('Retry'),
        ),
      );
    }

    return Column(
      children: [
        _PeerTubePlayer(
          key: ValueKey(video.uuid),
          video: video,
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
            children: [
              _titleRow(context, video),
              kHeightBox8,
              _channelRow(context, video),
              kHeightBox12,
              _metaRow(context, video),
              kHeightBox12,
              _qualitySection(context, video),
              kHeightBox16,
              if (video.description.trim().isNotEmpty) ...[
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                kHeightBox6,
                SelectableText(
                  video.description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        height: 1.45,
                      ),
                ),
                kHeightBox16,
              ],
              OutlinedButton.icon(
                onPressed: () => _openOriginal(context, video.url),
                icon: const Icon(Icons.open_in_new, size: 18),
                label: const Text('Open on PeerTube'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _titleRow(BuildContext context, PeerTubeVideo video) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 6,
          runSpacing: 4,
          children: [
            _pill(context, 'PeerTube', Icons.public),
            if (video.isLive)
              _pill(context, 'LIVE', Icons.sensors, color: Colors.red),
            if (video.isNsfw)
              _pill(context, 'NSFW', Icons.warning_amber_rounded),
          ],
        ),
        kHeightBox8,
        Text(
          video.name,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            height: 1.3,
          ),
        ),
      ],
    );
  }

  Widget _channelRow(BuildContext context, PeerTubeVideo video) {
    final theme = Theme.of(context);
    final channel = video.channel;
    return InkWell(
      onTap: channel == null
          ? null
          : () => openPeerTubeChannel(
                context,
                instanceUrl: instanceUrl,
                handle: channel.apiHandle,
              ),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            ClipOval(
              child: SizedBox(
                width: 36,
                height: 36,
                child: (channel?.avatarUrl ?? '').isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: channel!.avatarUrl!,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            _avatarFallback(theme),
                      )
                    : _avatarFallback(theme),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    channel?.displayName ??
                        (video.accountName.isEmpty
                            ? 'Unknown channel'
                            : video.accountName),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'PeerTube channel',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            if (channel != null) const Icon(Icons.chevron_right, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _metaRow(BuildContext context, PeerTubeVideo video) {
    final theme = Theme.of(context);
    final parts = <String>[
      '${formatPeerTubeCount(video.views)} views',
      '${formatPeerTubeCount(video.likes)} likes',
      if (video.publishedAt != null)
        DateFormat.yMMMd().format(video.publishedAt!),
      if (video.duration > 0) formatPeerTubeDuration(video.duration),
    ];
    return Text(
      parts.join(' · '),
      style: theme.textTheme.bodySmall?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }

  Widget _qualitySection(BuildContext context, PeerTubeVideo video) {
    final theme = Theme.of(context);
    final sources = video.playbackSources;
    if (sources.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'This instance exposes no direct video or HLS source for this video.',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onErrorContainer,
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available formats',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        kHeightBox6,
        Wrap(
          spacing: 6,
          runSpacing: 4,
          children: [
            for (final source in sources)
              Chip(
                visualDensity: VisualDensity.compact,
                label: Text(
                  source.isHls
                      ? '${source.label} · HLS'
                      : '${source.label} · ${source.format}',
                  style: theme.textTheme.bodySmall,
                ),
              ),
          ],
        ),
        if (video.streamingPlaylists.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              'HLS includes audio and video in one adaptive playlist.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
      ],
    );
  }

  Widget _pill(
    BuildContext context,
    String text,
    IconData icon, {
    Color? color,
  }) {
    final theme = Theme.of(context);
    final effective = color ?? theme.colorScheme.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: effective.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: effective),
          const SizedBox(width: 3),
          Text(
            text,
            style: theme.textTheme.labelSmall?.copyWith(
              color: effective,
              fontWeight: FontWeight.w700,
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
        size: 20,
      ),
    );
  }

  Future<void> _openOriginal(BuildContext context, String url) async {
    try {
      final launched = await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
      if (!launched && context.mounted) {
        showPeerTubeMessage(context, 'Could not open the PeerTube page.');
      }
    } catch (_) {
      if (context.mounted) {
        showPeerTubeMessage(context, 'Could not open the PeerTube page.');
      }
    }
  }
}

/// media_kit player for PeerTube HLS/direct sources.
class _PeerTubePlayer extends StatefulWidget {
  const _PeerTubePlayer({
    super.key,
    required this.video,
  });

  final PeerTubeVideo video;

  @override
  State<_PeerTubePlayer> createState() => _PeerTubePlayerState();
}

class _PeerTubePlayerState extends State<_PeerTubePlayer> {
  static const _headers = {
    'User-Agent':
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
  };

  final GlobalPlayerController _global = GlobalPlayerController();
  List<PeerTubePlaybackSource> _sources = const [];
  List<GenericQualityInfo> _qualities = const [];
  String? _qualityLabel;
  String? _error;
  bool _initialized = false;
  bool _changingQuality = false;
  BoxFit _fitMode = BoxFit.contain;

  Player get _player => _global.player;
  VideoController get _videoController => _global.videoController;

  @override
  void initState() {
    super.initState();
    _sources = widget.video.playbackSources;
    _qualities = _sources
        .map((source) => GenericQualityInfo(
              label: source.label,
              displayLabel: source.isHls
                  ? '${source.label} (HLS)'
                  : '${source.label} ${source.format}',
              resolution: source.resolution,
              format: source.format,
              url: source.url,
            ))
        .toList(growable: false);
    WidgetsBinding.instance.addPostFrameCallback((_) => _initialize());
  }

  @override
  void dispose() {
    _global.savePlaybackState();
    super.dispose();
  }

  Future<void> _initialize() async {
    if (_sources.isEmpty) {
      setState(() => _error =
          'This video has no playable HLS or direct video file on this instance.');
      return;
    }
    final source = closestPeerTubeSource(_sources, 720) ?? _sources.first;
    final videoId = 'peertube:${widget.video.uuid}';
    final ok = await _global.initializeForVideo(
      videoId: videoId,
      videoUrl: source.url,
      httpHeaders: _headers,
    );
    if (!mounted) return;
    if (!ok) {
      setState(() => _error = 'Could not start playback for this source.');
      return;
    }
    setState(() {
      _initialized = true;
      _qualityLabel = source.label;
    });
    await _global.updateMediaNotification(
      title: widget.video.name,
      artist: widget.video.channel?.displayName ?? 'PeerTube',
      thumbnailUrl: widget.video.thumbnailUrl,
      duration: Duration(seconds: widget.video.duration),
    );
  }

  Future<void> _changeQuality(String label) async {
    if (_changingQuality || label == _qualityLabel) return;
    PeerTubePlaybackSource? target;
    for (final source in _sources) {
      if (source.label == label) {
        target = source;
        break;
      }
    }
    if (target == null) return;

    setState(() => _changingQuality = true);
    try {
      final position = _player.state.position;
      final wasPlaying = _player.state.playing;
      await _player.open(
        Media(target.url, httpHeaders: _headers),
        play: false,
      );
      if (position > Duration.zero) await _player.seek(position);
      if (wasPlaying) await _player.play();
      if (!mounted) return;
      setState(() {
        _qualityLabel = target!.label;
      });
    } catch (_) {
      if (mounted) {
        showPeerTubeMessage(context, 'Could not switch to $label.');
      }
    } finally {
      if (mounted) setState(() => _changingQuality = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: ColoredBox(
          color: Colors.black,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                _error!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ),
          ),
        ),
      );
    }
    if (!_initialized) {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: ColoredBox(
          color: Colors.black,
          child: Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        ),
      );
    }

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ColoredBox(
            color: Colors.black,
            child: Video(
              controller: _videoController,
              fit: _fitMode,
              controls: (state) => GenericPlayerControlsOverlay(
                player: _player,
                videoState: state,
                availableQualities: _qualities,
                currentQuality: _qualityLabel,
                onQualityChanged: _changeQuality,
                subtitles: const [],
                skipInterval: 10,
                isLive: widget.video.isLive,
                currentFitMode: _fitMode,
                onFitModeChanged: (fit) => setState(() => _fitMode = fit),
                isInitializing: _changingQuality,
              ),
            ),
          ),
          StreamBuilder<bool>(
            stream: _player.stream.buffering,
            initialData: false,
            builder: (context, snapshot) {
              if (!(snapshot.data ?? false) && !_changingQuality) {
                return const SizedBox.shrink();
              }
              return ColoredBox(
                color: Colors.black.withValues(alpha: 0.3),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
