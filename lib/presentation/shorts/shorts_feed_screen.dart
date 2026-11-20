import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show ScrollCacheExtent;
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/perf/app_perf.dart';
import 'package:vyplay/domain/search/models/newpipe/newpipe_search_resp.dart';
import 'package:vyplay/generated/l10n.dart';
import 'package:vyplay/infrastructure/newpipe/newpipe_channel.dart';
import 'package:vyplay/presentation/shorts/screen_shorts.dart';
import 'package:vyplay/presentation/shorts/shorts_feed_helpers.dart';
import 'package:vyplay/widgets/error_widget.dart';
import 'package:vyplay/widgets/shimmers/shimmer_home_video_card.dart';

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

  /// Consecutive failed attempts. Drives the backoff between retries so a
  /// flaky connection is not hammered with immediate re-requests.
  int _retryAttempt = 0;

  /// Invalidates late initial/pagination responses when the user refreshes or
  /// retries, so an older request cannot replace the active channel's feed.
  int _requestGeneration = 0;

  /// True once the dedicated Shorts source has failed and the feed is being
  /// served by the search fallback instead.
  bool _usingFallback = false;

  /// Set when a *pagination* request fails. Kept separate from
  /// [_errorMessage] so a failed "load more" does not throw away the items
  /// already on screen.
  bool _loadMoreFailed = false;

  @override
  void initState() {
    super.initState();
    _activeChannel = _shortsChannels[
        DateTime.now().millisecondsSinceEpoch % _shortsChannels.length];
    _loadInitial();
  }

  /// Fetches a page from the currently selected source.
  ///
  /// A NewPipe nextPage cursor belongs to the channel/tab that returned it.
  /// Keep [_activeChannel] fixed until that cursor is exhausted; only an
  /// explicit refresh rotates to another discovery channel.
  Future<NewPipeSearchResp> _fetchPage(String? nextPage) {
    if (_usingFallback) {
      return NewPipeChannel.search(
        query: 'shorts',
        filter: 'videos',
        nextPage: nextPage,
      );
    }
    return NewPipeChannel.getShorts(
      channelId: _activeChannel,
      nextPage: nextPage,
    );
  }

  Future<void> _loadInitial() async {
    final requestGeneration = ++_requestGeneration;
    setState(() {
      _errorMessage = null;
      _initialLoadDone = false;
      _isLoadingMore = false;
      _loadMoreFailed = false;
      _usingFallback = false;
    });

    try {
      final resp = await _fetchPage(null);
      if (!mounted || requestGeneration != _requestGeneration) return;
      setState(() {
        _shorts
          ..clear()
          ..addAll(uniqueShortItems(resp.items ?? const <NewPipeSearchItem>[]));
        _nextPage = resp.nextPage;
        _hasMore = _nextPage != null;
        _initialLoadDone = true;
        _retryAttempt = 0;
      });
    } catch (e) {
      // The dedicated source can fail for reasons that have nothing to do
      // with the network (an extractor change, a channel with no Shorts tab).
      // Try the fallback source once before showing an error.
      if (requestGeneration != _requestGeneration || !mounted) return;
      if (!_usingFallback) {
        await _loadFallback(requestGeneration);
        return;
      }
      setState(() {
        _initialLoadDone = true;
        _errorMessage = _describeError(e);
      });
    }
  }

  /// Last-resort source: a Shorts-filtered search.
  Future<void> _loadFallback(int requestGeneration) async {
    try {
      final resp = await NewPipeChannel.search(
        query: 'shorts',
        filter: 'videos',
      );
      if (!mounted || requestGeneration != _requestGeneration) return;
      setState(() {
        _shorts
          ..clear()
          ..addAll(uniqueShortItems(resp.items ?? const <NewPipeSearchItem>[]));
        _nextPage = resp.nextPage;
        _hasMore = _nextPage != null;
        _initialLoadDone = true;
        _usingFallback = true;
        _retryAttempt = 0;
      });
    } catch (e) {
      if (!mounted || requestGeneration != _requestGeneration) return;
      setState(() {
        _initialLoadDone = true;
        _errorMessage = _describeError(e);
      });
    }
  }

  /// Turns a thrown error into something the user can act on.
  String _describeError(Object error) {
    final text = error.toString().toLowerCase();
    if (text.contains('socket') ||
        text.contains('network') ||
        text.contains('connection') ||
        text.contains('timeout') ||
        text.contains('failed host lookup')) {
      return 'No internet connection. Check your network and try again.';
    }
    if (text.contains('extractor') || text.contains('null_result')) {
      return 'The Shorts source is temporarily unavailable. Try again in a '
          'moment.';
    }
    return 'Could not load Shorts. Pull to refresh or tap retry.';
  }

  /// Retries the initial load, backing off between consecutive attempts.
  ///
  /// The delay grows with each failure (2s, 4s, 6s …) and is capped at 10s, so
  /// a persistent outage does not turn into a request loop.
  Future<void> _retry() async {
    _retryAttempt++;
    final requestGeneration = _requestGeneration;
    final seconds = (_retryAttempt * 2).clamp(1, 10);

    setState(() {
      _errorMessage = null;
      _initialLoadDone = false;
    });

    await Future<void>.delayed(Duration(seconds: seconds));
    if (!mounted || requestGeneration != _requestGeneration) return;
    await _loadInitial();
  }

  Future<void> _loadMore() async {
    if (_isLoadingMore || !_hasMore || _nextPage == null) return;

    final requestGeneration = _requestGeneration;
    final requestedCursor = _nextPage!;
    setState(() {
      _isLoadingMore = true;
      _loadMoreFailed = false;
    });

    try {
      // The cursor is scoped to the active channel; never rotate channels here.
      final resp = await _fetchPage(requestedCursor);
      if (!mounted || requestGeneration != _requestGeneration) return;
      setState(() {
        _shorts.addAll(uniqueShortItems(
          resp.items ?? const <NewPipeSearchItem>[],
          existing: _shorts,
        ));
        _nextPage = resp.nextPage == requestedCursor ? null : resp.nextPage;
        _hasMore = _nextPage != null;
        _isLoadingMore = false;
        _loadMoreFailed = false;
      });
    } catch (_) {
      if (!mounted || requestGeneration != _requestGeneration) return;
      // Keep the items already on screen; surface a retry affordance at the
      // end of the list instead of replacing the whole feed with an error.
      setState(() {
        _isLoadingMore = false;
        _loadMoreFailed = true;
      });
    }
  }

  Future<void> _refresh() async {
    // Rotate to a different channel so pull-to-refresh surfaces new content
    // instead of re-fetching the same page. A manual refresh also clears the
    // backoff, because the user explicitly asked for a new attempt.
    final idx = _shortsChannels.indexOf(_activeChannel);
    _activeChannel = _shortsChannels[(idx + 1) % _shortsChannels.length];
    _usingFallback = false;
    _retryAttempt = 0;
    _loadMoreFailed = false;
    await _loadInitial();
  }

  void _openPlayer(int index) {
    final items = <ShortItem>[];
    final sourceIndexes = <int>[];
    for (var sourceIndex = 0; sourceIndex < _shorts.length; sourceIndex++) {
      final item = _shorts[sourceIndex];
      final id = shortsVideoId(item);
      if (id == null) continue;
      sourceIndexes.add(sourceIndex);
      items.add(ShortItem(
        id: id,
        title: item.name,
        thumbnailUrl: item.thumbnailUrl,
        uploaderName: item.uploaderName,
        uploaderAvatar: item.uploaderAvatarUrl,
        uploaderId: item.uploaderUrl?.split('/').last,
        viewCount: item.viewCount,
        duration: item.duration,
        uploaderVerified: item.uploaderVerified,
      ));
    }

    final selectedIndex = sourceIndexes.indexOf(index);
    if (selectedIndex < 0) return;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => ScreenShorts(
        shorts: items,
        initialIndex: selectedIndex,
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
        onTap: _retry,
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
              notification.metrics.maxScrollExtent -
                  AppPerf.loadMoreThreshold) {
            _loadMore();
          }
          return false;
        },
        child: GridView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          // Dense grids hold four times as many tiles per screen as a list, so
          // the prefetch window is scaled to the device tier here rather than
          // reusing the list value.
          scrollCacheExtent: ScrollCacheExtent.pixels(AppPerf.gridCacheExtent),
          padding: const EdgeInsets.all(AppSpacing.sm),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.62,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount:
              _shorts.length + ((_isLoadingMore || _loadMoreFailed) ? 1 : 0),
          itemBuilder: (context, index) {
            if (index >= _shorts.length) {
              if (_loadMoreFailed) {
                return _LoadMoreRetryTile(onRetry: _loadMore);
              }
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

/// Shown at the end of the grid when a pagination request failed.
///
/// The already-loaded tiles stay on screen, so the user keeps what they had
/// and can retry just the next page instead of losing the whole feed.
class _LoadMoreRetryTile extends StatelessWidget {
  const _LoadMoreRetryTile({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              locals.retry,
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: onRetry,
              icon: const Icon(CupertinoIcons.refresh, size: 18),
              label: Text(locals.retry),
            ),
          ],
        ),
      ),
    );
  }
}
