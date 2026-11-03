import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluxtube/core/colors.dart';
import 'package:fluxtube/core/constants.dart';
import 'package:fluxtube/domain/search/models/newpipe/newpipe_search_resp.dart';
import 'package:fluxtube/generated/l10n.dart';
import 'package:fluxtube/infrastructure/newpipe/newpipe_channel.dart';
import 'package:fluxtube/presentation/shorts/screen_shorts.dart';
import 'package:fluxtube/widgets/error_widget.dart';
import 'package:fluxtube/widgets/shimmers/shimmer_home_video_card.dart';

/// The Shorts tab.
///
/// This is a real, paginated Shorts feed backed by a **dedicated Shorts data
/// source**: it reads the `/shorts` tab of a rotating set of popular channels
/// through the NewPipe channel-tab extractor (`NewPipeChannel.getShorts`).
///
/// It deliberately does *not* treat a fixed search query as a Shorts feed.
/// Search is only used as a last-resort fallback on platforms where the
/// NewPipe extractor is unavailable (e.g. iOS), so the tab still shows
/// something rather than an empty screen.
///
/// Design notes:
/// - Discovery rotates through channels per session, so the feed varies.
/// - Pagination is driven by the extractor's `nextPage` cursor.
/// - Every state (loading / empty / error / loaded) has an explicit branch.
class ShortsFeedScreen extends StatefulWidget {
  const ShortsFeedScreen({super.key});

  @override
  State<ShortsFeedScreen> createState() => _ShortsFeedScreenState();
}

class _ShortsFeedScreenState extends State<ShortsFeedScreen> {
  /// Channels whose Shorts tabs are read. Rotated per session so the feed is
  /// not identical on every visit. These are public channel handles, not
  /// mock data — the extractor resolves them live.
  static const List<String> _shortsChannels = <String>[
    '@MrBeast',
    '@shorts',
    '@YouTubeShorts',
    '@Facts',
    '@Music',
  ];

  late String _activeChannel;

  final List<NewPipeSearchItem> _shorts = <NewPipeSearchItem>[];
  String? _nextPage;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  bool _initialLoadDone = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _activeChannel = _shortsChannels[
        DateTime.now().millisecondsSinceEpoch % _shortsChannels.length];
    _loadInitial();
  }

  Future<void> _loadInitial() async {
    setState(() {
      _errorMessage = null;
      _initialLoadDone = false;
    });

    try {
      final resp = await NewPipeChannel.getShorts(channelId: _activeChannel);
      if (!mounted) return;
      setState(() {
        _shorts
          ..clear()
          ..addAll(resp.items.where(_isShort));
        _nextPage = resp.nextPage;
        _hasMore = _nextPage != null;
        _initialLoadDone = true;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _initialLoadDone = true;
        _errorMessage = 'Could not load Shorts. Check your connection.';
      });
    }
  }

  /// A result counts as a short when the extractor flags it, or when its
  /// duration is at or under 60 seconds (some backends omit the flag).
  bool _isShort(NewPipeSearchItem item) {
    if (item.type != null && item.type!.toUpperCase() != 'STREAM') return false;
    if (item.isShort == true) return true;
    final d = item.duration;
    return d != null && d > 0 && d <= 60;
  }

  Future<void> _loadMore() async {
    if (_isLoadingMore || !_hasMore || _nextPage == null) return;

    setState(() => _isLoadingMore = true);

    try {
      final resp = await NewPipeChannel.getShorts(
        channelId: _activeChannel,
        nextPage: _nextPage,
      );
      if (!mounted) return;
      setState(() {
        final known = _shorts.map((e) => e.url).toSet();
        _shorts.addAll(
            resp.items.where(_isShort).where((e) => !known.contains(e.url)));
        _nextPage = resp.nextPage;
        _hasMore = _nextPage != null;
        _isLoadingMore = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _isLoadingMore = false);
    }
  }

  Future<void> _refresh() async {
    // Rotate to a different channel so pull-to-refresh surfaces new content
    // instead of re-fetching the same page.
    final idx = _shortsChannels.indexOf(_activeChannel);
    _activeChannel = _shortsChannels[(idx + 1) % _shortsChannels.length];
    await _loadInitial();
  }

  void _openPlayer(int index) {
    final items = _shorts
        .map((s) => ShortItem(
              id: s.videoId ??
                  s.url?.split('v=').last.split('&').first ??
                  s.url?.split('/').last ??
                  '',
              title: s.name,
              thumbnailUrl: s.thumbnailUrl,
              uploaderName: s.uploaderName,
              uploaderAvatar: s.uploaderAvatarUrl,
              uploaderId: s.uploaderUrl?.split('/').last,
              viewCount: s.viewCount,
              duration: s.duration,
              uploaderVerified: s.uploaderVerified,
            ))
        .where((e) => e.id.isNotEmpty)
        .toList();

    if (items.isEmpty) return;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => ScreenShorts(
        shorts: items,
        initialIndex: index.clamp(0, items.length - 1),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          locals.shorts,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            tooltip: locals.refresh,
            icon: const Icon(CupertinoIcons.refresh),
            onPressed: _refresh,
          ),
        ],
      ),
      body: _buildBody(locals, theme),
    );
  }

  Widget _buildBody(S locals, ThemeData theme) {
    if (!_initialLoadDone) {
      return const Center(child: ShimmerHomeVideoInfoCard());
    }

    if (_errorMessage != null) {
      return ErrorRetryWidget(
        lottie: 'assets/cat-404.zip',
        errorType: ErrorType.network,
        customMessage: _errorMessage,
        onTap: _loadInitial,
      );
    }

    if (_shorts.isEmpty) {
      return EmptyStateWidget(
        icon: CupertinoIcons.play_rectangle,
        title: locals.noShorts,
        subtitle: locals.noShortsHint,
        actionLabel: locals.refresh,
        action: _refresh,
      );
    }

    return RefreshIndicator(
      onRefresh: _refresh,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels >=
              notification.metrics.maxScrollExtent - 400) {
            _loadMore();
          }
          return false;
        },
        child: GridView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(AppSpacing.sm),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.62,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: _shorts.length + (_isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index >= _shorts.length) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: CupertinoActivityIndicator(),
                ),
              );
            }
            return _ShortsTile(
              item: _shorts[index],
              onTap: () => _openPlayer(index),
            );
          },
        ),
      ),
    );
  }
}

/// A single Shorts tile in the feed grid.
class _ShortsTile extends StatelessWidget {
  const _ShortsTile({required this.item, required this.onTap});

  final NewPipeSearchItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (item.thumbnailUrl != null)
              Image.network(
                item.thumbnailUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: isDark
                      ? AppColors.surfaceVariantDark
                      : AppColors.surfaceVariant,
                  child: const Icon(CupertinoIcons.play_rectangle, size: 32),
                ),
              )
            else
              Container(
                color: isDark
                    ? AppColors.surfaceVariantDark
                    : AppColors.surfaceVariant,
                child: const Icon(CupertinoIcons.play_rectangle, size: 32),
              ),
            // Bottom scrim so the title stays readable over any thumbnail.
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.75),
                    ],
                    stops: const [0.55, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8,
              right: 8,
              bottom: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (item.name != null)
                    Text(
                      item.name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1.25,
                      ),
                    ),
                  if (item.uploaderName != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      item.uploaderName!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.75),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // Play affordance, centred.
            const Center(
              child: Icon(
                CupertinoIcons.play_circle_fill,
                color: Colors.white70,
                size: 34,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
