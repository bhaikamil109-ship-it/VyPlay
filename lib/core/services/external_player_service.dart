import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';

/// Hands a resolved stream URL to another installed video player.
///
/// The native side issues `ACTION_VIEW` with an explicit MIME type, so Android
/// offers every app that can play the container (VLC, MX Player, the system
/// player) through a chooser. Nothing is downloaded or re-extracted first: the
/// URL is the stream the in-app player already resolved.
///
/// The channel is injectable for tests.
class ExternalPlayerService {
  ExternalPlayerService({
    Future<Object?> Function(String method, Map<String, Object?>? args)? invoke,
    bool? isAndroid,
  })  : _invoke = invoke ?? _platformInvoke,
        _isAndroid = isAndroid ?? Platform.isAndroid;

  /// Reuses the existing NewPipe channel; the contract is additive, so no
  /// existing method changes behaviour.
  static const MethodChannel channel = MethodChannel('com.kamil.vyplay/newpipe');

  final Future<Object?> Function(String method, Map<String, Object?>? args)
      _invoke;
  final bool _isAndroid;

  static Future<Object?> _platformInvoke(
    String method,
    Map<String, Object?>? args,
  ) =>
      channel.invokeMethod<Object?>(method, args);

  /// Returns true when a player was launched.
  Future<bool> open({
    required String url,
    String? mimeType,
    String? title,
  }) async {
    if (!_isAndroid) return false;
    if (url.trim().isEmpty) return false;

    try {
      final result = await _invoke('openExternalPlayer', {
        'url': url,
        'mimeType': mimeType,
        'title': title,
      });
      return result == true;
    } on MissingPluginException {
      return false;
    } on PlatformException catch (e) {
      // NO_HANDLER means nothing is installed that can play this stream.
      log('[ExternalPlayer] failed: ${e.code} ${e.message}');
      return false;
    }
  }

  /// Picks a MIME type the chooser can filter on from a stream URL.
  static String mimeTypeFor(String url) {
    final path = Uri.tryParse(url)?.path.toLowerCase() ?? url.toLowerCase();
    if (path.endsWith('.m3u8')) return 'application/x-mpegURL';
    if (path.endsWith('.mpd')) return 'application/dash+xml';
    if (path.endsWith('.webm')) return 'video/webm';
    if (path.endsWith('.mkv')) return 'video/x-matroska';
    if (path.endsWith('.m4a')) return 'audio/mp4';
    if (path.endsWith('.mp3')) return 'audio/mpeg';
    return 'video/mp4';
  }
}
