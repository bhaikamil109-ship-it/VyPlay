import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/core/player/playback_queue.dart';
import 'package:vyplay/domain/playlist/models/local_playlist.dart';
import 'package:vyplay/domain/watch/models/basic_info.dart';
import 'package:vyplay/infrastructure/playlist/local_playlist_service.dart';
import 'package:vyplay/widgets/thumbnail_image.dart';
import 'package:vyplay/core/services/content_filter_helper.dart';
import 'package:vyplay/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:vyplay/application/download/download_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/di/injectable.dart';
import 'package:vyplay/domain/download/download_service.dart';
import 'package:share_plus/share_plus.dart' show ShareParams, SharePlus;
import 'package:vyplay/domain/download/models/download_item.dart';

class ScreenPlaylistDetail extends StatefulWidget {
  const ScreenPlaylistDetail({super.key, required this.playlistId});

  final String playlistId;

  @override
  State<ScreenPlaylistDetail> createState() => _ScreenPlaylistDetailState();
}

enum _PlaylistSort { playlistOrder, titleAsc, titleDesc }

class _ScreenPlaylistDetailState extends State<ScreenPlaylistDetail> {
  final _service = LocalPlaylistService();
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  _PlaylistSort _sort = _PlaylistSort.playlistOrder;

  List<_PlaylistVideo> _visibleItems(List<_PlaylistVideo> items) {
    final query = _query.trim().toLowerCase();
    final filtered = query.isEmpty
        ? List<_PlaylistVideo>.from(items)
        : items
            .where((item) =>
                item.title.toLowerCase().contains(query) ||
                item.id.toLowerCase().contains(query))
            .toList();
    switch (_sort) {
      case _PlaylistSort.titleAsc:
        filtered.sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
        break;
      case _PlaylistSort.titleDesc:
        filtered.sort((a, b) => b.title.toLowerCase().compareTo(a.title.toLowerCase()));
        break;
      case _PlaylistSort.playlistOrder:
        break;
    }
    return filtered;
  }

  @override
  void initState() {
    super.initState();
    _service.addListener(_onChanged);
    _service.load();
  }

  @override
  void dispose() {
    _service.removeListener(_onChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  LocalPlaylist? get _playlist => _service.getById(widget.playlistId);

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);
    final playlist = _playlist;
    if (playlist == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(locals.playlistNotFound)),
      );
    }

    final items = _visibleItems(_buildVideoItems(playlist));

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(playlist.name, style: const TextStyle(fontSize: 16)),
            Text(locals.videoCountLabel(items.length),
                style: TextStyle(
                    fontSize: 12, color: Theme.of(context).colorScheme.outline)),
          ],
        ),
        actions: [
          if (items.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.play_arrow),
              tooltip: locals.playAll,
              onPressed: () => _playAll(items),
            ),
          PopupMenuButton<_PlaylistSort>(
            icon: const Icon(Icons.sort),
            initialValue: _sort,
            onSelected: (value) => setState(() => _sort = value),
            itemBuilder: (_) => [
              PopupMenuItem(
                  value: _PlaylistSort.playlistOrder,
                  child: Text(locals.playlistOrder)),
              PopupMenuItem(
                  value: _PlaylistSort.titleAsc,
                  child: Text(locals.sortAToZ)),
              PopupMenuItem(
                  value: _PlaylistSort.titleDesc,
                  child: Text(locals.sortZToA)),
            ],
          ),
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                  value: 'downloadAll', child: Text(locals.downloadAll)),
              PopupMenuItem(
                  value: 'share', child: const Text('Share playlist')),
              PopupMenuItem(value: 'rename', child: Text(locals.renameAction)),
              PopupMenuItem(
                  value: 'delete',
                  child: Text(locals.deletePlaylistAction,
                      style: const TextStyle(color: Colors.red))),
            ],
            onSelected: (action) {
              if (action == 'downloadAll') _downloadAll(items);
              if (action == 'share') _sharePlaylist(playlist, items);
              if (action == 'rename') _renamePlaylist(playlist);
              if (action == 'delete') {
                _service.delete(playlist.id);
                if (mounted) Navigator.pop(context);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => _query = value),
              decoration: InputDecoration(
                isDense: true,
                hintText: locals.searchInPlaylist,
                prefixIcon: const Icon(Icons.search, size: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            child: items.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.playlist_add,
                      size: 48,
                      color: Theme.of(context).colorScheme.outline),
                  const SizedBox(height: 16),
                  Text(locals.noVideosInPlaylist,
                      style: TextStyle(color: Colors.grey, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(locals.addVideosHint,
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 2),
              itemBuilder: (context, index) {
                final item = items[index];
                if (isHiddenByContentFilter(
                  context,
                  title: item.title,
                  channelId: item.channelId ?? '',
                  channelName: item.channelName ?? '',
                  url: '/watch?v=${item.id}',
                )) {
                  return const SizedBox.shrink();
                }
                return _buildVideoRow(context, item, index, playlist);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Queues every video in this playlist at the best stream the extractor
  /// offers, using the backend currently selected in Settings.
  ///
  /// Quality is resolved per video because stream availability differs per
  /// video; the download service still refuses duplicates it already has.
  Future<void> _downloadAll(List<_PlaylistVideo> items) async {
    if (items.isEmpty) return;
    final locals = S.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final bloc = context.read<DownloadBloc>();
    final service = getIt<DownloadService>();
    final serviceType = context.read<SettingsBloc>().state.ytService;

    var queued = 0;
    for (final video in items) {
      final options = await service.getDownloadOptions(
        videoId: video.id,
        serviceType: serviceType,
      );
      final resolved = options.fold((_) => null, (value) => value);
      if (resolved == null) continue;

      final videoQuality = resolved.videoQualities.isEmpty
          ? null
          : resolved.videoQualities.first;
      final audioQuality = resolved.audioQualities.isEmpty
          ? null
          : resolved.audioQualities.first;
      if (videoQuality == null && audioQuality == null) continue;

      final downloadType = videoQuality == null
          ? DownloadType.audioOnly
          : (audioQuality == null
              ? DownloadType.videoOnly
              : DownloadType.videoWithAudio);

      bloc.add(DownloadEvent.startDownload(
        videoId: video.id,
        title: video.title.isEmpty ? video.id : video.title,
        channelName: video.channelName ?? '',
        downloadType: downloadType,
        thumbnailUrl: video.thumbnailUrl,
        videoQuality: videoQuality,
        audioQuality: audioQuality,
      ));
      queued++;
    }

    if (!mounted) return;
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          queued == 0 ? locals.downloadAllFailed : locals.downloadAllQueued,
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  List<_PlaylistVideo> _buildVideoItems(LocalPlaylist playlist) {
    final items = <_PlaylistVideo>[];
    for (int i = 0; i < playlist.videoIds.length; i++) {
      items.add(_PlaylistVideo(
        id: playlist.videoIds[i],
        title: i < playlist.videoTitles.length ? playlist.videoTitles[i] : '',
        thumbnailUrl: i < playlist.thumbnailUrls.length ? playlist.thumbnailUrls[i] : null,
        channelName: i < playlist.channelNames.length ? playlist.channelNames[i] : null,
        channelId: i < playlist.channelIds.length ? playlist.channelIds[i] : null,
      ));
    }
    return items;
  }

  Widget _buildVideoRow(
      BuildContext context, _PlaylistVideo item, int index, LocalPlaylist playlist) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _playVideo(context, item),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 28,
                child: Text('${index + 1}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.outline)),
              ),
              const SizedBox(width: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: SizedBox(
                  width: 120,
                  height: 68,
                  child: item.thumbnailUrl != null
                      ? ThumbnailImage.small(url: item.thumbnailUrl!)
                      : Container(
                          color: isDark ? Colors.white10 : Colors.black12,
                          child: const Icon(Icons.play_circle_outline,
                              color: Colors.white38),
                        ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14, height: 1.3)),
                    const SizedBox(height: 4),
                    if (item.channelName != null)
                      Text(item.channelName!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.outline)),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, size: 18),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                color: Colors.white30,
                onPressed: () {
                  _service.removeVideo(playlist.id, item.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Shares the playlist as readable text: one title plus its watch link per
  /// video. Local playlists live only on this device, so there is no server URL
  /// to hand out — the links are what a recipient can actually open.
  Future<void> _sharePlaylist(
    LocalPlaylist playlist,
    List<_PlaylistVideo> items,
  ) async {
    final buffer = StringBuffer(playlist.name)
      ..writeln()
      ..writeln();
    for (final item in items) {
      buffer.writeln(item.title);
      buffer.writeln('https://www.youtube.com/watch?v=${item.id}');
      buffer.writeln();
    }

    await SharePlus.instance.share(
      ShareParams(text: buffer.toString().trimRight(), subject: playlist.name),
    );
  }

  void _playVideo(BuildContext context, _PlaylistVideo item) {
    context.pushNamed('watch', pathParameters: {
      'videoId': item.id,
      'channelId': item.channelId ?? '',
    });
  }

  /// Loads the whole playlist into the playback queue, then opens the first
  /// video. Without seeding the queue, "Play all" would only play one video.
  void _playAll(List<_PlaylistVideo> items) {
    if (items.isEmpty) return;
    PlaybackQueue().setQueue(
      items
          .map((item) => VideoBasicInfo(
                id: item.id,
                title: item.title,
                thumbnailUrl:
                    (item.thumbnailUrl?.isEmpty ?? true) ? null : item.thumbnailUrl,
                channelName:
                    (item.channelName?.isEmpty ?? true) ? null : item.channelName,
                channelId:
                    (item.channelId?.isEmpty ?? true) ? null : item.channelId,
              ))
          .toList(),
    );
    _playVideo(context, items.first);
  }

  Future<void> _renamePlaylist(LocalPlaylist playlist) async {
    final locals = S.of(context);
    final controller = TextEditingController(text: playlist.name);
    final name = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(locals.renamePlaylistTitle),
        content: TextField(
          autofocus: true,
          controller: controller,
          decoration: InputDecoration(hintText: locals.newNameHint),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(locals.cancel)),
          TextButton(
              onPressed: () => Navigator.pop(ctx, controller.text),
              child: Text(locals.renameAction)),
        ],
      ),
    );
    await Future.delayed(const Duration(milliseconds: 300));
    controller.dispose();
    if (name != null && name.trim().isNotEmpty) {
      _service.rename(playlist.id, name.trim());
    }
  }
}

class _PlaylistVideo {
  final String id;
  final String title;
  final String? thumbnailUrl;
  final String? channelName;
  final String? channelId;

  _PlaylistVideo({
    required this.id,
    required this.title,
    this.thumbnailUrl,
    this.channelName,
    this.channelId,
  });
}
