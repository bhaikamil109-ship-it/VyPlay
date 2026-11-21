import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class DeepLinkHandler {
  static final DeepLinkHandler _instance = DeepLinkHandler._internal();
  factory DeepLinkHandler() => _instance;
  DeepLinkHandler._internal();

  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;
  StreamSubscription<List<SharedMediaFile>>? _shareSubscription;
  BuildContext? _context;

  void init(BuildContext context) {
    _context = context;
    _appLinks = AppLinks();
    _setupDeepLinkListener();
    _setupShareIntentListener();
    _handleInitialLink();
    _handleInitialShareIntent();
  }

  void _setupDeepLinkListener() {
    _linkSubscription = _appLinks.uriLinkStream.listen((Uri uri) {
      _handleDeepLink(uri);
    });
  }

  void _setupShareIntentListener() {
    _shareSubscription = ReceiveSharingIntent.instance.getMediaStream().listen(
      (List<SharedMediaFile> value) {
        if (value.isNotEmpty) {
          final text = value.first.path;
          _handleSharedText(text);
        }
      },
    );
  }

  Future<void> _handleInitialLink() async {
    try {
      final Uri? initialLink = await _appLinks.getInitialLink();
      if (initialLink != null) {
        _handleDeepLink(initialLink);
      }
    } catch (e) {
      debugPrint('Error getting initial link: $e');
    }
  }

  Future<void> _handleInitialShareIntent() async {
    try {
      final List<SharedMediaFile> sharedFiles =
          await ReceiveSharingIntent.instance.getInitialMedia();
      if (sharedFiles.isNotEmpty) {
        final text = sharedFiles.first.path;
        _handleSharedText(text);
        ReceiveSharingIntent.instance.reset();
      }
    } catch (e) {
      debugPrint('Error getting initial share intent: $e');
    }
  }

  void _handleDeepLink(Uri uri) {
    final result = parseYouTubeUrl(uri.toString());
    debugPrint(
      result == null
          ? '[DeepLink] Unsupported link ignored'
          : '[DeepLink] Parsed ${result.type.name} link',
    );
    if (result != null) {
      _navigateToContent(result);
    }
  }

  void _handleSharedText(String text) {
    final result = parseYouTubeUrl(text);
    debugPrint(
      result == null
          ? '[Share] No supported YouTube link found'
          : '[Share] Parsed ${result.type.name} link from shared content',
    );
    if (result != null) {
      _navigateToContent(result);
    }
  }

  void _navigateToContent(YouTubeLinkResult result) {
    if (_context == null || !_context!.mounted) return;

    switch (result.type) {
      case YouTubeLinkType.video:
        _context!.goNamed(
          'watch',
          pathParameters: {
            'videoId': result.id,
            'channelId': 'unknown',
          },
        );
        break;
      case YouTubeLinkType.channel:
        _context!.goNamed(
          'channel',
          pathParameters: {
            'channelId': result.id,
          },
        );
        break;
      case YouTubeLinkType.playlist:
        _context!.goNamed(
          'playlist',
          pathParameters: {
            'playlistId': result.id,
          },
        );
        break;
    }
  }

  static YouTubeLinkResult? parseYouTubeUrl(String input) {
    // Shared text can contain prose around a URL. Extract only an explicitly
    // supported YouTube host; do not parse arbitrary URLs containing the text
    // "youtube.com" in their path or query.
    final match = RegExp(
      r"""(?:https?://(?:www\.|m\.)?(?:youtube\.com|youtu\.be)/|(?<![A-Za-z0-9/.-])(?:www\.|m\.)?(?:youtube\.com|youtu\.be)/)[^\s<>"']+""",
      caseSensitive: false,
    ).firstMatch(input.trim());
    if (match == null) return null;

    var candidate = match.group(0)!;
    candidate = candidate.replaceFirst(RegExp(r'[)\].,!?;:]+
    if (candidate.isEmpty) return null;

    var uri = Uri.tryParse(candidate);
    if (uri == null) return null;
    if (uri.scheme.isEmpty && uri.host.isEmpty) {
      uri = Uri.tryParse('https://$candidate');
    }
    if (uri == null ||
        (uri.scheme != 'https' && uri.scheme != 'http') ||
        uri.userInfo.isNotEmpty) {
      return null;
    }

    // Reject non-standard ports even when the hostname is otherwise trusted.
    if (uri.hasPort &&
        uri.port != (uri.scheme == 'https' ? 443 : 80)) {
      return null;
    }

    final host = uri.host.toLowerCase();
    const youtubeHosts = {
      'youtube.com',
      'www.youtube.com',
      'm.youtube.com',
    };
    final isShortLinkHost = host == 'youtu.be';
    if (!isShortLinkHost && !youtubeHosts.contains(host)) return null;

    final segments = uri.pathSegments;
    final first = segments.isEmpty ? '' : segments.first;
    final videoIdPattern = RegExp(r'^[A-Za-z0-9_-]{11}$');
    final identifierPattern = RegExp(r'^[A-Za-z0-9_-]+$');

    YouTubeLinkResult? videoResult(String? id) {
      if (id == null || !videoIdPattern.hasMatch(id)) return null;
      return YouTubeLinkResult(type: YouTubeLinkType.video, id: id);
    }

    if (isShortLinkHost) {
      return segments.length == 1 ? videoResult(segments.first) : null;
    }

    if (first == 'watch') {
      return videoResult(uri.queryParameters['v']);
    }

    if ((first == 'shorts' || first == 'embed' || first == 'v') &&
        segments.length == 2) {
      return videoResult(segments[1]);
    }

    if (first == 'channel' && segments.length == 2) {
      final channelId = segments[1];
      if (!identifierPattern.hasMatch(channelId)) return null;
      return YouTubeLinkResult(
        type: YouTubeLinkType.channel,
        id: channelId,
      );
    }

    if (first.startsWith('@') && segments.length == 1) {
      final handle = first.substring(1);
      if (!RegExp(r'^[A-Za-z0-9_-]+$').hasMatch(handle)) return null;
      return YouTubeLinkResult(
        type: YouTubeLinkType.channel,
        id: '@$handle',
      );
    }

    if (first == 'playlist') {
      final playlistId = uri.queryParameters['list'];
      if (playlistId == null || !identifierPattern.hasMatch(playlistId)) {
        return null;
      }
      return YouTubeLinkResult(
        type: YouTubeLinkType.playlist,
        id: playlistId,
      );
    }

    return null;
  }

  void dispose() {
    _linkSubscription?.cancel();
    _shareSubscription?.cancel();
  }
}

enum YouTubeLinkType {
  video,
  channel,
  playlist,
}

class YouTubeLinkResult {
  final YouTubeLinkType type;
  final String id;

  YouTubeLinkResult({
    required this.type,
    required this.id,
  });
}
), '');
    if (candidate.isEmpty) return null;

    var uri = Uri.tryParse(candidate);
    if (uri == null) return null;
    if (uri.scheme.isEmpty && uri.host.isEmpty) {
      uri = Uri.tryParse('https://$candidate');
    }
    if (uri == null ||
        (uri.scheme != 'https' && uri.scheme != 'http') ||
        uri.userInfo.isNotEmpty) {
      return null;
    }

    // Reject non-standard ports even when the hostname is otherwise trusted.
    if (uri.hasPort &&
        uri.port != (uri.scheme == 'https' ? 443 : 80)) {
      return null;
    }

    final host = uri.host.toLowerCase();
    const youtubeHosts = {
      'youtube.com',
      'www.youtube.com',
      'm.youtube.com',
    };
    final isShortLinkHost = host == 'youtu.be';
    if (!isShortLinkHost && !youtubeHosts.contains(host)) return null;

    final segments = uri.pathSegments;
    final first = segments.isEmpty ? '' : segments.first;
    final videoIdPattern = RegExp(r'^[A-Za-z0-9_-]{11}$');
    final identifierPattern = RegExp(r'^[A-Za-z0-9_-]+$');

    YouTubeLinkResult? videoResult(String? id) {
      if (id == null || !videoIdPattern.hasMatch(id)) return null;
      return YouTubeLinkResult(type: YouTubeLinkType.video, id: id);
    }

    if (isShortLinkHost) {
      return segments.length == 1 ? videoResult(segments.first) : null;
    }

    if (first == 'watch') {
      return videoResult(uri.queryParameters['v']);
    }

    if ((first == 'shorts' || first == 'embed' || first == 'v') &&
        segments.length == 2) {
      return videoResult(segments[1]);
    }

    if (first == 'channel' && segments.length == 2) {
      final channelId = segments[1];
      if (!identifierPattern.hasMatch(channelId)) return null;
      return YouTubeLinkResult(
        type: YouTubeLinkType.channel,
        id: channelId,
      );
    }

    if (first.startsWith('@') && segments.length == 1) {
      final handle = first.substring(1);
      if (!RegExp(r'^[A-Za-z0-9_-]+$').hasMatch(handle)) return null;
      return YouTubeLinkResult(
        type: YouTubeLinkType.channel,
        id: '@$handle',
      );
    }

    if (first == 'playlist') {
      final playlistId = uri.queryParameters['list'];
      if (playlistId == null || !identifierPattern.hasMatch(playlistId)) {
        return null;
      }
      return YouTubeLinkResult(
        type: YouTubeLinkType.playlist,
        id: playlistId,
      );
    }

    return null;
  }

  void dispose() {
    _linkSubscription?.cancel();
    _shareSubscription?.cancel();
  }
}

enum YouTubeLinkType {
  video,
  channel,
  playlist,
}

class YouTubeLinkResult {
  final YouTubeLinkType type;
  final String id;

  YouTubeLinkResult({
    required this.type,
    required this.id,
  });
}
