import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

/// Redacted, exportable record of what playback was trying to do when it
/// failed.
///
/// Playback failures are the one class of bug that cannot be reproduced from a
/// stack trace alone: the interesting part is *which* URL was opened, which
/// backend produced it and what the player said. The Googlevideo URLs carry
/// signed query parameters, so nothing here is allowed to keep a query string
/// or a header — only scheme, host and path, plus the error classification.
class PlaybackDiagnostics {
  PlaybackDiagnostics._();

  static final PlaybackDiagnostics instance = PlaybackDiagnostics._();

  /// Keeps the log small enough to stay readable in a shared file.
  static const int _maxEntries = 200;

  final List<String> _entries = [];

  List<String> get entries => List.unmodifiable(_entries);

  /// Records one failure. [url] is reduced to scheme://host/path.
  void recordFailure({
    required String backend,
    required String player,
    required String videoId,
    required String errorCode,
    required String message,
    String? quality,
    String? sourceType,
    String? url,
    String? secondaryUrl,
    int? httpStatus,
    int? recoveryAttempt,
    bool fromCache = false,
  }) {
    final sanitized = _sanitize(url);
    final buffer = StringBuffer()
      ..write('${DateTime.now().toIso8601String()} ')
      ..write('backend=$backend player=$player video=$videoId ')
      ..write('quality=${quality ?? 'unknown'} ')
      ..write('source=${sourceType ?? 'unknown'} ')
      ..write('url=$sanitized ')
      ..write('secondaryUrl=${_sanitize(secondaryUrl)} ')
      ..write('httpStatus=${httpStatus ?? '-'} ')
      ..write('cached=$fromCache ')
      ..write('recovery=${recoveryAttempt ?? 0} ')
      ..write('code=$errorCode ')
      ..write('error=${_redactMessage(message)}');
    _append(buffer.toString());
  }

  /// Records a recovery attempt so an exported log shows what was retried.
  void recordRecovery({
    required String videoId,
    required String action,
    required bool success,
    String? detail,
  }) {
    _append(
      '${DateTime.now().toIso8601String()} recovery video=$videoId '
      'action=$action success=$success detail=${detail ?? '-'}',
    );
  }

  void _append(String line) {
    _entries.add(line);
    if (_entries.length > _maxEntries) {
      _entries.removeRange(0, _entries.length - _maxEntries);
    }
  }

  /// `https://host/path` only. Query strings (signed tokens, expiry, CPN,
  /// range info) are dropped entirely rather than partially masked.
  String _sanitize(String? url) {
    if (url == null || url.isEmpty) return '-';
    final uri = Uri.tryParse(url);
    if (uri == null) return '<unparseable>';
    return '${uri.scheme}://${uri.host}${uri.path}';
  }

  /// Keeps the error class and message, strips anything that looks like a URL
  /// so a message carrying a signed link cannot leak it.
  String _redactMessage(String message) {
    final withoutUrls = message.replaceAllMapped(
      RegExp(r'https?://\S+'),
      (match) => _sanitize(match.group(0)),
    );
    return withoutUrls.length > 500
        ? '${withoutUrls.substring(0, 500)}…'
        : withoutUrls;
  }

  /// Redact URLs (including signed query parameters) from diagnostic messages.
  String redactMessage(String message) => _redactMessage(message);

  String dump() {
    if (_entries.isEmpty) return 'No playback failures recorded.';
    return _entries.join('\n');
  }

  Future<File> writeLog() async {
    final dir = await getApplicationSupportDirectory();
    final file = File('${dir.path}/vyplay_playback_diagnostics.log');
    await file.writeAsString(dump());
    return file;
  }

  Future<void> share() async {
    final file = await writeLog();
    await SharePlus.instance.share(ShareParams(files: [XFile(file.path)]));
  }

  void clear() => _entries.clear();
}
