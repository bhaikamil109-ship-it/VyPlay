import 'package:vyplay/domain/search/models/newpipe/newpipe_search_resp.dart';

/// Returns true only for a stream the NewPipe extractor identifies as a
/// Short, or a stream with a known duration from 1 through 60 seconds.
bool isShortSearchItem(NewPipeSearchItem item) {
  if (item.type != null && item.type!.toUpperCase() != 'STREAM') {
    return false;
  }
  if (item.isShort == true) return true;
  final duration = item.duration;
  return duration != null && duration > 0 && duration <= 60;
}

/// Extracts a stable YouTube video id from supported NewPipe stream URLs.
String? shortsVideoId(NewPipeSearchItem item) {
  final rawUrl = item.url?.trim();
  if (rawUrl == null || rawUrl.isEmpty) return null;

  final uri = Uri.tryParse(rawUrl);
  if (uri == null) return null;

  final queryId = uri.queryParameters['v']?.trim();
  if (queryId != null && queryId.isNotEmpty) return queryId;

  final segments = uri.pathSegments.where((segment) => segment.isNotEmpty).toList();
  if (segments.isEmpty) return null;

  if (uri.host.toLowerCase() == 'youtu.be') {
    return segments.last;
  }

  for (final marker in const ['shorts', 'embed', 'live', 'v']) {
    final index = segments.indexOf(marker);
    if (index >= 0 && index + 1 < segments.length) {
      return segments[index + 1];
    }
  }

  final last = segments.last;
  if (last == 'watch' || last == 'shorts' || last == 'embed' || last == 'live') {
    return null;
  }
  return last;
}

/// Returns valid, unique Shorts. Items without a usable video identity are
/// excluded so the feed cannot contain tiles that open no playback screen.
List<NewPipeSearchItem> uniqueShortItems(
  Iterable<NewPipeSearchItem> incoming, {
  Iterable<NewPipeSearchItem> existing = const <NewPipeSearchItem>[],
}) {
  final known = <String>{};
  for (final item in existing) {
    final id = shortsVideoId(item);
    if (id != null) known.add(id);
  }

  final result = <NewPipeSearchItem>[];
  for (final item in incoming) {
    if (!isShortSearchItem(item)) continue;
    final id = shortsVideoId(item);
    if (id == null || !known.add(id)) continue;
    result.add(item);
  }
  return result;
}
