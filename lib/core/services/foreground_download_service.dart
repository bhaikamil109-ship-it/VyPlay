import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';

/// Keeps Android from reclaiming the process while downloads are running.
///
/// The native side is a `dataSync` foreground service
/// (`DownloadsForegroundService`); this class only manages its lifetime and the
/// wording of its single notification. Per-download progress notifications are
/// handled by `DownloadNotificationService`, so nothing here duplicates them.
///
/// Every method degrades to `false` instead of throwing: losing the keep-alive
/// guarantee must never fail the transfer itself.
class ForegroundDownloadService {
  ForegroundDownloadService({
    Future<Object?> Function(String method, Map<String, Object?>? args)? invoke,
    bool? isAndroid,
  })  : _invoke = invoke ?? _platformInvoke,
        _isAndroid = isAndroid ?? Platform.isAndroid;

  static const MethodChannel channel =
      MethodChannel('com.kamil.vyplay/download_service');

  final Future<Object?> Function(String method, Map<String, Object?>? args)
      _invoke;
  final bool _isAndroid;

  static Future<Object?> _platformInvoke(
    String method,
    Map<String, Object?>? args,
  ) =>
      channel.invokeMethod<Object?>(method, args);

  /// Notification text for a given number of active transfers.
  static String textFor(int count) {
    if (count <= 0) return 'Finishing downloads';
    if (count == 1) return 'Downloading 1 video';
    return 'Downloading $count videos';
  }

  /// Starts the foreground session, or refreshes it if it already runs.
  Future<bool> start({required int activeCount, String? text}) async {
    if (!_isAndroid) return false;
    try {
      final result = await _invoke('start', {
        'count': activeCount,
        'text': text ?? textFor(activeCount),
      });
      return result == true;
    } on MissingPluginException {
      return false;
    } on PlatformException catch (e) {
      log('[ForegroundDownloads] start failed: ${e.message}');
      return false;
    }
  }

  /// Updates the wording after the active count changes.
  Future<bool> update({required int activeCount, String? text}) async {
    if (!_isAndroid) return false;
    try {
      final result = await _invoke('update', {
        'count': activeCount,
        'text': text ?? textFor(activeCount),
      });
      return result == true;
    } on MissingPluginException {
      return false;
    } on PlatformException catch (e) {
      log('[ForegroundDownloads] update failed: ${e.message}');
      return false;
    }
  }

  /// Ends the session so the system may reclaim the process again.
  Future<void> stop() async {
    if (!_isAndroid) return;
    try {
      await _invoke('stop', null);
    } on MissingPluginException {
      // Native side absent; nothing to stop.
    } on PlatformException catch (e) {
      log('[ForegroundDownloads] stop failed: ${e.message}');
    }
  }

  /// Whether the service currently holds a foreground notification.
  Future<bool> isRunning() async {
    if (!_isAndroid) return false;
    try {
      final result = await _invoke('isRunning', null);
      return result == true;
    } on MissingPluginException {
      return false;
    } on PlatformException {
      return false;
    }
  }
}
