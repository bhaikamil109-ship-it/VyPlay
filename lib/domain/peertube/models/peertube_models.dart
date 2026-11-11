import 'dart:math' as math;

/// A user-configured PeerTube instance.
class PeerTubeInstance {
  const PeerTubeInstance({required this.url, required this.name});

  final String url;
  final String name;

  Map<String, dynamic> toJson() => {'url': url, 'name': name};

  factory PeerTubeInstance.fromJson(Map<String, dynamic> json) {
    final rawUrl = json['url']?.toString() ?? '';
    final normalized = normalizePeerTubeInstanceUrl(rawUrl);
    if (normalized == null) {
      throw const FormatException('Invalid PeerTube instance URL');
    }
    final name = json['name']?.toString().trim();
    return PeerTubeInstance(
      url: normalized,
      name: name == null || name.isEmpty ? normalized : name,
    );
  }

  PeerTubeInstance copyWith({String? url, String? name}) =>
      PeerTubeInstance(url: url ?? this.url, name: name ?? this.name);

  @override
  bool operator ==(Object other) =>
      other is PeerTubeInstance && other.url == url && other.name == name;

  @override
  int get hashCode => Object.hash(url, name);
}

/// Persisted instance list and the currently selected origin.
class PeerTubeInstanceSelection {
  const PeerTubeInstanceSelection({
    required this.instances,
    required this.activeUrl,
  });

  const PeerTubeInstanceSelection.empty()
      : instances = const [],
        activeUrl = null;

  final List<PeerTubeInstance> instances;
  final String? activeUrl;

  Map<String, dynamic> toJson() => {
        'activeUrl': activeUrl,
        'instances': instances.map((e) => e.toJson()).toList(),
      };

  factory PeerTubeInstanceSelection.fromJson(Map<String, dynamic> json) {
    final instances = <PeerTubeInstance>[];
    final raw = json['instances'];
    if (raw is List) {
      for (final item in raw.whereType<Map>()) {
        try {
          instances.add(
            PeerTubeInstance.fromJson(Map<String, dynamic>.from(item)),
          );
        } on FormatException {
          // Ignore corrupt entries instead of losing the whole file.
        }
      }
    }
    final active = normalizePeerTubeInstanceUrl(
      json['activeUrl']?.toString() ?? '',
    );
    final hasActive = active != null && instances.any((e) => e.url == active);
    return PeerTubeInstanceSelection(
      instances: instances,
      activeUrl:
          hasActive ? active : (instances.isEmpty ? null : instances.first.url),
    );
  }
}

/// Instance configuration fetched from `/api/v1/config`.
class PeerTubeInstanceConfig {
  const PeerTubeInstanceConfig({
    required this.hostUrl,
    required this.name,
    required this.shortDescription,
    required this.serverVersion,
    required this.isNsfw,
    required this.signupAllowed,
    required this.transcodingEnabled,
    required this.liveEnabled,
  });

  final String hostUrl;
  final String name;
  final String shortDescription;
  final String serverVersion;
  final bool isNsfw;
  final bool signupAllowed;
  final bool transcodingEnabled;
  final bool liveEnabled;

  factory PeerTubeInstanceConfig.fromJson(
    Map<String, dynamic> json,
    String hostUrl,
  ) {
    final instance = json['instance'];
    if (instance is! Map) {
      throw const FormatException('Not a PeerTube config response');
    }
    final name = instance['name']?.toString().trim() ?? '';
    if (name.isEmpty) {
      throw const FormatException('PeerTube config has no instance name');
    }
    final transcoding = json['transcoding'];
    final live = json['live'];
    final signup = json['signup'];
    return PeerTubeInstanceConfig(
      hostUrl: hostUrl,
      name: name,
      shortDescription: instance['shortDescription']?.toString() ?? '',
      serverVersion: json['serverVersion']?.toString() ?? '',
      isNsfw: _asBool(instance['isNSFW']),
      signupAllowed: signup is Map && _asBool(signup['allowed']),
      transcodingEnabled: transcoding is Map && _asBool(transcoding['enabled']),
      liveEnabled: live is Map && _asBool(live['enabled']),
    );
  }
}

/// Minimal channel reference embedded in a video.
class PeerTubeChannelRef {
  const PeerTubeChannelRef({
    required this.name,
    required this.displayName,
    required this.url,
    required this.host,
    required this.avatarUrl,
  });

  final String name;
  final String displayName;
  final String url;
  final String host;
  final String? avatarUrl;

  /// Handle accepted by `/api/v1/video-channels/{handle}`.
  ///
  /// Remote/federated channels need `name@host`; local channels also accept
  /// that form, so it is always safe to use.
  String get apiHandle {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return trimmed;
    if (trimmed.contains('@')) return trimmed;
    final hostValue = host.trim();
    if (hostValue.isEmpty) return trimmed;
    return '$trimmed@$hostValue';
  }

  factory PeerTubeChannelRef.fromJson(
    Map<String, dynamic> json,
    String instanceUrl,
  ) {
    final avatars = json['avatars'];
    return PeerTubeChannelRef(
      name: json['name']?.toString() ?? '',
      displayName: json['displayName']?.toString() ??
          json['name']?.toString() ??
          'Unknown channel',
      url: _resolveUrl(instanceUrl, json['url']?.toString()),
      host: json['host']?.toString() ?? '',
      avatarUrl: _pickImage(avatars),
    );
  }
}

/// One file exposed by a PeerTube video.
class PeerTubeVideoFile {
  const PeerTubeVideoFile({
    required this.fileUrl,
    required this.playlistUrl,
    required this.resolutionLabel,
    required this.resolutionId,
    required this.width,
    required this.height,
    required this.fps,
    required this.size,
    required this.hasAudio,
    required this.hasVideo,
  });

  final String? fileUrl;
  final String? playlistUrl;
  final String resolutionLabel;
  final int resolutionId;
  final int width;
  final int height;
  final int? fps;
  final int? size;
  final bool hasAudio;
  final bool hasVideo;

  factory PeerTubeVideoFile.fromJson(
    Map<String, dynamic> json,
    String instanceUrl,
  ) {
    final resolution = json['resolution'];
    return PeerTubeVideoFile(
      fileUrl: _resolveOptionalUrl(instanceUrl, json['fileUrl']?.toString()),
      playlistUrl:
          _resolveOptionalUrl(instanceUrl, json['playlistUrl']?.toString()),
      resolutionLabel: resolution is Map
          ? resolution['label']?.toString() ?? 'Unknown'
          : 'Unknown',
      resolutionId: resolution is Map ? _asInt(resolution['id']) : 0,
      width: _asInt(json['width']),
      height: _asInt(json['height']),
      fps: json['fps'] == null ? null : _asInt(json['fps']),
      size: json['size'] == null ? null : _asInt(json['size']),
      hasAudio: _asBool(json['hasAudio']),
      hasVideo: _asBool(json['hasVideo']),
    );
  }
}

class PeerTubeStreamingPlaylist {
  const PeerTubeStreamingPlaylist({
    required this.playlistUrl,
    required this.type,
    required this.files,
  });

  final String? playlistUrl;
  final int type;
  final List<PeerTubeVideoFile> files;

  factory PeerTubeStreamingPlaylist.fromJson(
    Map<String, dynamic> json,
    String instanceUrl,
  ) {
    final rawFiles = json['files'];
    return PeerTubeStreamingPlaylist(
      playlistUrl:
          _resolveOptionalUrl(instanceUrl, json['playlistUrl']?.toString()),
      type: _asInt(json['type']),
      files: rawFiles is List
          ? rawFiles
              .whereType<Map>()
              .map((e) => PeerTubeVideoFile.fromJson(
                    Map<String, dynamic>.from(e),
                    instanceUrl,
                  ))
              .toList(growable: false)
          : const [],
    );
  }
}

/// A video summary or full details. Details payloads also carry [files] and
/// [streamingPlaylists]; list payloads leave them empty.
class PeerTubeVideo {
  const PeerTubeVideo({
    required this.uuid,
    required this.shortUuid,
    required this.name,
    required this.description,
    required this.thumbnailUrl,
    required this.previewUrl,
    required this.url,
    required this.embedPath,
    required this.duration,
    required this.views,
    required this.likes,
    required this.publishedAt,
    required this.isLive,
    required this.isLocal,
    required this.isNsfw,
    required this.channel,
    required this.accountName,
    required this.accountAvatarUrl,
    required this.files,
    required this.streamingPlaylists,
  });

  final String uuid;
  final String shortUuid;
  final String name;
  final String description;
  final String? thumbnailUrl;
  final String? previewUrl;
  final String url;
  final String embedPath;
  final int duration;
  final int views;
  final int likes;
  final DateTime? publishedAt;
  final bool isLive;
  final bool isLocal;
  final bool isNsfw;
  final PeerTubeChannelRef? channel;
  final String accountName;
  final String? accountAvatarUrl;
  final List<PeerTubeVideoFile> files;
  final List<PeerTubeStreamingPlaylist> streamingPlaylists;

  factory PeerTubeVideo.fromJson(
    Map<String, dynamic> json,
    String instanceUrl,
  ) {
    final uuid = json['uuid']?.toString() ?? '';
    if (uuid.isEmpty) {
      throw const FormatException('PeerTube video has no uuid');
    }
    final channelJson = json['channel'];
    final accountJson = json['account'];

    return PeerTubeVideo(
      uuid: uuid,
      shortUuid: json['shortUUID']?.toString() ?? uuid,
      name: json['name']?.toString() ?? 'Untitled video',
      description: json['description']?.toString() ??
          json['truncatedDescription']?.toString() ??
          '',
      thumbnailUrl: _resolveOptionalUrl(
        instanceUrl,
        json['thumbnailPath']?.toString() ?? json['thumbnailUrl']?.toString(),
      ),
      previewUrl: _resolveOptionalUrl(
        instanceUrl,
        json['previewPath']?.toString() ?? json['previewUrl']?.toString(),
      ),
      url: _resolveUrl(instanceUrl, json['url']?.toString()),
      embedPath: _resolveUrl(instanceUrl, json['embedPath']?.toString()),
      duration: _asInt(json['duration']),
      views: _asInt(json['views']),
      likes: _asInt(json['likes']),
      publishedAt: DateTime.tryParse(json['publishedAt']?.toString() ?? ''),
      isLive: _asBool(json['isLive']),
      isLocal: _asBool(json['isLocal']),
      isNsfw: _asBool(json['nsfw']),
      channel: channelJson is Map
          ? PeerTubeChannelRef.fromJson(
              Map<String, dynamic>.from(channelJson),
              instanceUrl,
            )
          : null,
      accountName: accountJson is Map
          ? accountJson['displayName']?.toString() ??
              accountJson['name']?.toString() ??
              ''
          : '',
      accountAvatarUrl:
          accountJson is Map ? _pickImage(accountJson['avatars']) : null,
      files: _parseFileList(json['files'], instanceUrl),
      streamingPlaylists: _parsePlaylistList(
        json['streamingPlaylists'],
        instanceUrl,
      ),
    );
  }

  /// Largest sensible preview image, used on the watch screen.
  String? get largeThumbnailUrl => previewUrl ?? thumbnailUrl;

  /// Anonymous playback sources, best quality first.
  ///
  /// HLS per-resolution playlists are preferred because PeerTube exposes them
  /// for transcoded videos and media_kit handles HLS natively. Direct muxed MP4
  /// files are the fallback when transcoding/HLS is unavailable. Audio-only
  /// entries are never offered as video qualities.
  List<PeerTubePlaybackSource> get playbackSources {
    final sources = <PeerTubePlaybackSource>[];
    final seen = <String>{};

    if (isLive) {
      for (final playlist in streamingPlaylists) {
        final url = playlist.playlistUrl;
        if (url == null || url.isEmpty || !seen.add('live:$url')) continue;
        sources.add(PeerTubePlaybackSource(
          label: 'Auto',
          url: url,
          isHls: true,
          isLive: true,
          resolution: 0,
          width: 0,
          height: 0,
          format: 'HLS',
        ));
      }
    } else {
      for (final playlist in streamingPlaylists) {
        for (final file in playlist.files) {
          final url = file.playlistUrl;
          if (url == null || url.isEmpty || !file.hasVideo) continue;
          final label = _qualityLabel(file);
          if (label == null || !seen.add('hls:$url')) continue;
          sources.add(PeerTubePlaybackSource(
            label: label,
            url: url,
            isHls: true,
            isLive: false,
            resolution: file.height,
            width: file.width,
            height: file.height,
            format: 'HLS',
          ));
        }
      }
    }

    if (sources.isEmpty) {
      for (final file in files) {
        final url = file.fileUrl;
        if (url == null || url.isEmpty || !file.hasAudio || !file.hasVideo) {
          continue;
        }
        final label = _qualityLabel(file);
        if (label == null || !seen.add('file:$url')) continue;
        sources.add(PeerTubePlaybackSource(
          label: label,
          url: url,
          isHls: false,
          isLive: false,
          resolution: file.height,
          width: file.width,
          height: file.height,
          format: _fileExtension(url),
        ));
      }
    }

    sources.sort((a, b) => b.resolution.compareTo(a.resolution));
    return sources;
  }

  /// Best source for a saved quality label, falling back to the highest
  /// available resolution.
  PeerTubePlaybackSource? sourceFor(String? preferredLabel) {
    final sources = playbackSources;
    if (sources.isEmpty) return null;
    if (preferredLabel != null) {
      for (final source in sources) {
        if (source.label == preferredLabel) return source;
      }
    }
    return sources.first;
  }

  static String? _qualityLabel(PeerTubeVideoFile file) {
    if (file.resolutionLabel == 'Audio only') return null;
    if (file.resolutionId <= 0 || file.height <= 0) return null;
    return '${file.height}p';
  }

  static String _fileExtension(String url) {
    final path = Uri.tryParse(url)?.path ?? url;
    final dot = path.lastIndexOf('.');
    if (dot < 0 || dot == path.length - 1) return 'FILE';
    return path.substring(dot + 1).toUpperCase();
  }

  static List<PeerTubeVideoFile> _parseFileList(
    dynamic raw,
    String instanceUrl,
  ) {
    if (raw is! List) return const [];
    return raw
        .whereType<Map>()
        .map((e) => PeerTubeVideoFile.fromJson(
              Map<String, dynamic>.from(e),
              instanceUrl,
            ))
        .toList(growable: false);
  }

  static List<PeerTubeStreamingPlaylist> _parsePlaylistList(
    dynamic raw,
    String instanceUrl,
  ) {
    if (raw is! List) return const [];
    return raw
        .whereType<Map>()
        .map((e) => PeerTubeStreamingPlaylist.fromJson(
              Map<String, dynamic>.from(e),
              instanceUrl,
            ))
        .toList(growable: false);
  }
}

class PeerTubePlaybackSource {
  const PeerTubePlaybackSource({
    required this.label,
    required this.url,
    required this.isHls,
    required this.isLive,
    required this.resolution,
    required this.width,
    required this.height,
    required this.format,
  });

  final String label;
  final String url;
  final bool isHls;
  final bool isLive;
  final int resolution;
  final int width;
  final int height;
  final String format;

  bool get requiresMerging => false;
}

class PeerTubeVideoPage {
  const PeerTubeVideoPage({
    required this.videos,
    required this.total,
    required this.start,
    required this.count,
  });

  final List<PeerTubeVideo> videos;
  final int total;
  final int start;
  final int count;

  bool get hasMore => start + videos.length < total;

  factory PeerTubeVideoPage.fromJson(
    Map<String, dynamic> json,
    String instanceUrl, {
    int? start,
    int? requestedStart,
  }) {
    final raw = json['data'];
    if (raw is! List) {
      throw const FormatException('Expected a paged video response');
    }
    final videos = raw
        .whereType<Map>()
        .map((e) => PeerTubeVideo.fromJson(
              Map<String, dynamic>.from(e),
              instanceUrl,
            ))
        .toList(growable: false);
    final hasStart = json.containsKey('start') && json['start'] != null;
    final resolvedStart =
        hasStart ? _asInt(json['start']) : (requestedStart ?? start ?? 0);
    return PeerTubeVideoPage(
      videos: videos,
      total: _asInt(json['total']),
      start: resolvedStart,
      count: videos.length,
    );
  }
}

class PeerTubeChannel {
  const PeerTubeChannel({
    required this.name,
    required this.displayName,
    required this.description,
    required this.avatarUrl,
    required this.url,
    required this.host,
    required this.followersCount,
    required this.videosCount,
  });

  final String name;
  final String displayName;
  final String description;
  final String? avatarUrl;
  final String url;
  final String host;

  /// Handle accepted by `/api/v1/video-channels/{handle}`.
  String get apiHandle {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return trimmed;
    if (trimmed.contains('@')) return trimmed;
    final hostValue = host.trim();
    if (hostValue.isEmpty) return trimmed;
    return '$trimmed@$hostValue';
  }

  final int followersCount;
  final int videosCount;

  factory PeerTubeChannel.fromJson(
    Map<String, dynamic> json,
    String instanceUrl,
  ) {
    return PeerTubeChannel(
      name: json['name']?.toString() ?? '',
      displayName: json['displayName']?.toString() ??
          json['name']?.toString() ??
          'Unknown channel',
      description: json['description']?.toString() ?? '',
      avatarUrl: _pickImage(json['avatars']),
      url: _resolveUrl(instanceUrl, json['url']?.toString()),
      host: json['host']?.toString() ?? '',
      followersCount: _asInt(json['followersCount']),
      videosCount: _asInt(json['videosCount']),
    );
  }
}

/// Normalizes and validates an instance origin.
///
/// Accepts `host`, `host:port`, `https://host/` and rejects credentials, query
/// strings, fragments and paths other than `/`. Returns null for anything that
/// cannot be a PeerTube origin.
String? normalizePeerTubeInstanceUrl(String input) {
  var value = input.trim();
  if (value.isEmpty) return null;
  if (!value.contains('://')) {
    if (value.startsWith('//')) {
      value = 'https:$value';
    } else {
      value = 'https://$value';
    }
  }
  final uri = Uri.tryParse(value);
  if (uri == null || !uri.hasScheme || uri.host.isEmpty) return null;
  final scheme = uri.scheme.toLowerCase();
  if (scheme != 'http' && scheme != 'https') return null;
  if (uri.userInfo.isNotEmpty || uri.hasQuery || uri.hasFragment) return null;
  if (uri.path.isNotEmpty && uri.path != '/') return null;
  final port = uri.hasPort ? ':${uri.port}' : '';
  return '$scheme://${uri.host.toLowerCase()}$port';
}

String _resolveUrl(String instanceUrl, String? value) {
  final raw = value?.trim() ?? '';
  if (raw.isEmpty) return instanceUrl;
  final parsed = Uri.tryParse(raw);
  if (parsed != null && parsed.hasScheme) return raw;
  final base = instanceUrl.endsWith('/')
      ? instanceUrl.substring(0, instanceUrl.length - 1)
      : instanceUrl;
  return raw.startsWith('/') ? '$base$raw' : '$base/$raw';
}

String? _resolveOptionalUrl(String instanceUrl, String? value) {
  if (value == null || value.trim().isEmpty) return null;
  return _resolveUrl(instanceUrl, value);
}

String? _pickImage(dynamic raw) {
  if (raw is! List) return null;
  final images = raw
      .whereType<Map>()
      .map((e) => (
            url: e['fileUrl']?.toString(),
            width: _asInt(e['width']),
            path: e['path']?.toString(),
          ))
      .where((e) => e.url != null && e.url!.isNotEmpty)
      .toList();
  if (images.isEmpty) return null;
  // Prefer a small avatar; fall back to the widest image.
  final small = images.where((e) => e.width > 0 && e.width <= 200).toList()
    ..sort((a, b) => a.width.compareTo(b.width));
  if (small.isNotEmpty) return small.last.url;
  images.sort((a, b) => b.width.compareTo(a.width));
  final best = images.first;
  if (best.url != null) return best.url;
  if (best.path != null) return best.path;
  return null;
}

bool _asBool(dynamic value) {
  if (value is bool) return value;
  if (value is num) return value != 0;
  if (value is String) return value.toLowerCase() == 'true';
  return false;
}

int _asInt(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.round();
  return int.tryParse(value?.toString() ?? '') ?? 0;
}

/// Formats a duration for cards.
String formatPeerTubeDuration(int seconds) {
  if (seconds <= 0) return '';
  final d = Duration(seconds: seconds);
  final h = d.inHours;
  final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
  final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
  return h > 0 ? '$h:$m:$s' : '$m:$s';
}

/// Compact view count used on cards.
String formatPeerTubeCount(int count) {
  if (count >= 1000000) {
    return '${(count / 1000000).toStringAsFixed(count % 1000000 == 0 ? 0 : 1)}M';
  }
  if (count >= 1000) {
    return '${(count / 1000).toStringAsFixed(count % 1000 == 0 ? 0 : 1)}K';
  }
  return '$count';
}

/// Date label for cards, avoiding an intl dependency here.
String formatPeerTubeDate(DateTime? date) {
  if (date == null) return '';
  final now = DateTime.now();
  final diff = now.difference(date);
  if (diff.inDays < 1) return 'today';
  if (diff.inDays < 7) return '${diff.inDays}d ago';
  if (diff.inDays < 30) return '${(diff.inDays / 7).floor()}w ago';
  if (diff.inDays < 365) return '${(diff.inDays / 30).floor()}mo ago';
  return '${(diff.inDays / 365).floor()}y ago';
}

/// Clamps a resolution preference to an available source.
PeerTubePlaybackSource? closestPeerTubeSource(
  List<PeerTubePlaybackSource> sources,
  int preferredHeight,
) {
  if (sources.isEmpty) return null;
  if (preferredHeight <= 0) return sources.first;
  var best = sources.first;
  var bestDistance = (best.height - preferredHeight).abs();
  for (final source in sources.skip(1)) {
    final distance = (source.height - preferredHeight).abs();
    if (distance < bestDistance ||
        (distance == bestDistance && source.height < best.height)) {
      best = source;
      bestDistance = distance;
    }
  }
  return best;
}

int highestPeerTubeResolution(List<PeerTubePlaybackSource> sources) {
  if (sources.isEmpty) return 0;
  return sources.map((e) => e.resolution).reduce(math.max);
}
