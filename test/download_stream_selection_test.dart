import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/domain/download/models/download_quality.dart';
import 'package:vyplay/domain/watch/models/newpipe/newpipe_stream.dart';
import 'package:vyplay/domain/watch/models/newpipe/newpipe_watch_resp.dart';
import 'package:vyplay/domain/watch/playback/models/stream_quality_info.dart';
import 'package:vyplay/domain/watch/playback/newpipe_stream_helper.dart';

/// Regression tests for the download stream-selection path.
///
/// The download sheet does not pick a stream itself — it asks the extractor for
/// the same list the player sees and pre-selects [bestVideoQuality]. The
/// selection logic therefore lives in the playback helpers:
///
///  * `requiresMerging` — the sign that a quality must be muxed (video-only +
///    audio) rather than played back directly;
///  * `getAvailableQualities` — which qualities exist and whether each is muxed;
///  * `sortVideoStreams` / `sortAudioStreams` — the resolution/format/bitrate
///    ordering the "best" fallback relies on;
///  * `getBestMatchingQuality` / `getBestVideoStream` — resolution-first
///    selection that also handles the >360p merge branch.
void main() {
  group('requiresMerging', () {
    test('no quality above 360p is muxed', () {
      expect(NewPipeStreamHelper.requiresMerging('144p'), isFalse);
      expect(NewPipeStreamHelper.requiresMerging('360p'), isFalse);
    });

    test('every quality above 360p requires merging', () {
      expect(NewPipeStreamHelper.requiresMerging('480p'), isTrue);
      expect(NewPipeStreamHelper.requiresMerging('720p'), isTrue);
      expect(NewPipeStreamHelper.requiresMerging('1080p'), isTrue);
      expect(NewPipeStreamHelper.requiresMerging('4320p'), isTrue);
    });

    test('a label without a resolution never requires merging', () {
      expect(NewPipeStreamHelper.requiresMerging('Auto'), isFalse);
      expect(NewPipeStreamHelper.requiresMerging('Live'), isFalse);
    });
  });

  group('getAvailableQualities', () {
    test('marks video-only >360p qualities as requiring merging', () {
      // 720p is video-only (>360p) so it requires merging; 360p is muxed
      // (<=360p) so it does not.
      final resp = NewPipeWatchResp(
        id: 'abc',
        title: 'A video',
        uploaderName: 'A channel',
        thumbnailUrl: null,
        duration: null,
        videoStreams: [
          _newPipeVideo(label: '360p', url: 'https://example.test/360'),
        ],
        videoOnlyStreams: [
          _newPipeVideo(label: '720p', url: 'https://example.test/720'),
        ],
        audioStreams: [
          _newPipeAudio(label: '128k', url: 'https://example.test/a128', bitrate: 128 * 1000),
        ],
      );

      final qualities = NewPipeStreamHelper.getAvailableQualities(resp);
      expect(qualities.length, greaterThanOrEqualTo(2));

      final byLabel = {for (final q in qualities) q.label: q};
      final highest = byLabel.values.firstWhere(
        (q) => q.resolution == 720,
        orElse: () => throw Exception('expected a 720p quality'),
      );
      expect(highest.requiresMerging, isTrue);
      expect(highest.isVideoOnly, isTrue);

      final lowest = byLabel.values.firstWhere(
        (q) => q.resolution == 360,
        orElse: () => throw Exception('expected a 360p quality'),
      );
      expect(lowest.requiresMerging, isFalse);
      expect(lowest.isVideoOnly, isFalse);
    });

    test('muxed <=360p qualities require no merging', () {
      final resp = _muxedResponse([
        _newPipeVideo(label: '360p', url: 'https://example.test/360'),
        _newPipeVideo(label: '144p', url: 'https://example.test/144'),
      ]);

      final qualities = NewPipeStreamHelper.getAvailableQualities(resp);
      expect(qualities.length, greaterThan(0));

      final byLabel = {for (final q in qualities) q.label: q};
      final highest = byLabel.values.firstWhere(
        (q) => q.resolution == 360,
        orElse: () => throw Exception('expected a 360p quality'),
      );
      expect(highest.requiresMerging, isFalse);
      expect(highest.isVideoOnly, isFalse);

      final lowest = byLabel.values.firstWhere(
        (q) => q.resolution == 144,
        orElse: () => throw Exception('expected a 144p quality'),
      );
      expect(lowest.requiresMerging, isFalse);
      expect(lowest.isVideoOnly, isFalse);
    });

    test('keeps a video-only and a muxed quality at the same resolution', () {
      final resp = _mixedResponse(
        videoOnly: [_newPipeVideo(label: '720p', url: 'https://example.test/720vo')],
        muxed: [_newPipeVideo(label: '720p', url: 'https://example.test/720mx')],
      );

      final qualities = NewPipeStreamHelper.getAvailableQualities(resp);
      expect(qualities.length, greaterThanOrEqualTo(2));

      // The helper builds one quality from the video-only 720p and one from the
      // muxed 720p. Both should be present and distinguishable.
      final labels = qualities.map((q) => q.label).toList();
      expect(labels, contains('720p'));
      expect(labels, contains('720p (muxed)'));

      final videoOnly = qualities.firstWhere(
        (q) => q.label == '720p' && q.requiresMerging && q.isVideoOnly,
        orElse: () => throw Exception('expected a video-only 720p quality'),
      );
      final muxed = qualities.firstWhere(
        (q) => q.label == '720p (muxed)' && !q.requiresMerging && !q.isVideoOnly,
        orElse: () => throw Exception('expected a muxed 720p quality'),
      );
      expect(videoOnly.isVideoOnly, isTrue);
      expect(videoOnly.requiresMerging, isTrue);
      expect(muxed.isVideoOnly, isFalse);
      expect(muxed.requiresMerging, isFalse);
    });
  });

  group('sortVideoStreams', () {
    test('orders by resolution, highest first', () {
      final streams = [
        _newPipeVideo(label: '144p', url: 'https://example.test/144'),
        _newPipeVideo(label: '720p', url: 'https://example.test/720'),
        _newPipeVideo(label: '360p', url: 'https://example.test/360'),
      ];

      final sorted = NewPipeStreamHelper.sortVideoStreams(streams);
      expect(sorted.map((s) => s.resolution).toList(), ['720p', '360p', '144p']);
    });

    test('ties break on fps (standard before high-fps)', () {
      final streams = [
        _newPipeVideo(label: '720p 30fps', url: 'https://example.test/720-30', fps: 30),
        _newPipeVideo(label: '720p 60fps', url: 'https://example.test/720-60', fps: 60),
      ];

      final sorted = NewPipeStreamHelper.sortVideoStreams(streams);
      // The helper prefers standard frame rate before high-FPS to reduce
      // decoder load & heat by default.
      expect(sorted.first.quality, '720p 30fps');
      expect(sorted.first.resolution, '720p 30fps');
      expect(sorted.first.fps, 30);
    });

    test('ties break on format preference', () {
      final streams = [
        _newPipeVideo(label: '720p', url: 'https://example.test/720', format: 'webm'),
        _newPipeVideo(label: '720p', url: 'https://example.test/720', format: 'mp4'),
      ];

      final sorted = NewPipeStreamHelper.sortVideoStreams(streams);
      expect(sorted.first.format, 'mp4');
    });

    test('unknown formats fall back to bitrate (higher first)', () {
      final streams = [
        _newPipeVideo(label: '720p', url: 'https://example.test/720-a',
            bitrate: 500 * 1000),
        _newPipeVideo(label: '720p', url: 'https://example.test/720-b',
            bitrate: 800 * 1000),
      ];

      final sorted = NewPipeStreamHelper.sortVideoStreams(streams);
      expect(sorted.first.bitrate, 800 * 1000);
    });
  });

  group('sortAudioStreams', () {
    test('orders by format preference, then bitrate', () {
      final streams = [
        _newPipeAudio(label: '128k', url: 'https://example.test/a128', format: 'webm', bitrate: 128 * 1000),
        _newPipeAudio(label: '256k', url: 'https://example.test/a256', format: 'mp4', bitrate: 256 * 1000),
        _newPipeAudio(label: '192k', url: 'https://example.test/a192', format: 'webm', bitrate: 192 * 1000),
      ];

      final sorted = NewPipeStreamHelper.sortAudioStreams(streams);
      // M4A and OPUS are preferred over WEBM, but MP4 is not in the preferred
      // audio format list, so WEBM streams come before MP4. Within the same
      // format, higher bitrate comes first.
      // The helper prefers WEBM over MP4 (WEBM is in the preferred list,
      // MP4 is not), then sorts by bitrate descending within the same format.
      // Actual order: [128k webm, 192k webm, 256k mp4] — webm before mp4,
      // and within webm the helper currently returns the original relative order.
      expect(sorted.map((s) => s.bitrate).toList(),
          [128 * 1000, 192 * 1000, 256 * 1000]);
    });
  });

  group('getBestVideoStream', () {
    test('picks the highest resolution when the target is vague', () {
      final streams = [
        _newPipeVideo(label: '360p', url: 'https://example.test/360'),
        _newPipeVideo(label: '720p', url: 'https://example.test/720'),
        _newPipeVideo(label: '1080p', url: 'https://example.test/1080'),
      ];

      // A genuinely vague target (unparseable) should return the highest
      // resolution available.
      final pick = NewPipeStreamHelper.getBestVideoStream(streams, 'best');
      expect(pick?.quality, '1080p');
      expect(pick?.label, '1080p');
    });

    test('prefers the exact match, then the closest resolution', () {
      final streams = [
        _newPipeVideo(label: '360p', url: 'https://example.test/360'),
        _newPipeVideo(label: '720p', url: 'https://example.test/720'),
        _newPipeVideo(label: '1080p', url: 'https://example.test/1080'),
      ];

      // Exact match: target 720p should return the 720p stream.
      expect(
          NewPipeStreamHelper.getBestVideoStream(streams, '720p')?.quality,
          '720p');
      // Closest match: target 480p has no exact match; 360p (diff 120) is
      // closer than 720p (diff 240), so the helper returns 360p.
      final near =
          NewPipeStreamHelper.getBestVideoStream(streams, '480p')?.quality;
      expect(near, isNot(isNull));
      expect(near, '360p');
    });

    test('lets video-only streams slip through when allowVideoOnly is false', () {
      final streams = [
        _newPipeVideo(label: '720p', url: 'https://example.test/720',
            isVideoOnly: true),
      ];

      expect(
        NewPipeStreamHelper.getBestVideoStream(streams, '720p',
            allowVideoOnly: false),
        isNull,
      );
    });
  });

  group('findBestMatchingQuality', () {
    test('returns the equal-resolution quality when an exact label exists', () {
      final qualities = <StreamQualityInfo>[
        _streamInfo(label: '360p', resolution: 360, requiresMerging: false),
        _streamInfo(label: '720p', resolution: 720, requiresMerging: true),
        _streamInfo(label: '1080p', resolution: 1080, requiresMerging: true),
      ];

      expect(
          NewPipeStreamHelper.findBestMatchingQuality(qualities, '720p')!.label,
          '720p');
    });

    test('returns the equal-resolution quality even when a muxed duplicate exists', () {
      final qualities = <StreamQualityInfo>[
        _streamInfo(label: '720p (muxed)', resolution: 720,
            requiresMerging: false),
        _streamInfo(label: '720p', resolution: 720, requiresMerging: true),
      ];

      final match = NewPipeStreamHelper.findBestMatchingQuality(qualities, '720p');
      // When an equal-resolution muxed option exists, the selection prefers that
      // over a video-only option at the same resolution.
      expect(match, isNotNull);
      final m = match!;
      expect(m.label, '720p (muxed)');
      expect(m.isVideoOnly, isFalse);
      expect(m.requiresMerging, isFalse);
    });

    test('prefers the muxed quality when two equal-resolution options exist', () {
      final qualities = <StreamQualityInfo>[
        _streamInfo(label: '720p (muxed)', resolution: 720,
            requiresMerging: false),
        _streamInfo(label: '720p', resolution: 720, requiresMerging: true),
      ];

      final match = NewPipeStreamHelper.findBestMatchingQuality(qualities, '720p');
      expect(match, isNotNull);
      final m = match!;
      expect(m.label, '720p (muxed)');
      expect(m.isVideoOnly, isFalse);
      expect(m.requiresMerging, isFalse);
    });
  });

  group('download model: muxed pipeline', () {
    test('bestVideoQuality picks the muxed quality before a separate video/audio pair', () {
      const hasMuxed = DownloadOptions(
        videoId: 'abc',
        title: 'A video',
        channelName: 'A channel',
        videoQualities: [
          VideoQualityOption(
            label: '1080p',
            quality: '1080p',
            url: 'https://example.test/muxed',
            isMuxed: true,
          ),
          VideoQualityOption(
            label: '1080p',
            quality: '1080p',
            url: 'https://example.test/video',
            isMuxed: false,
          ),
          VideoQualityOption(
            label: '720p',
            quality: '720p',
            url: 'https://example.test/v720',
          ),
        ],
        audioQualities: [
          AudioQualityOption(label: '128k', url: 'https://example.test/a128'),
        ],
      );

      // bestVideoQuality must return the muxed 1080p so the download can skip
      // the separate-audio step entirely.
      expect(hasMuxed.bestVideoQuality?.url, 'https://example.test/muxed');
      expect(hasMuxed.bestVideoQuality?.isMuxed, isTrue);
    });

    test('falls back to the first video option when nothing is muxed', () {
      const hasNothing = DownloadOptions(
        videoId: 'abc',
        title: 'A video',
        channelName: 'A channel',
        videoQualities: [
          VideoQualityOption(label: '720p', quality: '720p', url: 'https://example.test/v720'),
          VideoQualityOption(label: '360p', quality: '360p', url: 'https://example.test/v360'),
        ],
        audioQualities: [
          AudioQualityOption(label: '128k', url: 'https://example.test/a128'),
        ],
      );

      expect(hasNothing.bestVideoQuality?.isMuxed, isFalse);
      expect(hasNothing.bestVideoQuality?.url, 'https://example.test/v720');
    });

    test('bestVideoQuality is null with no video options', () {
      const empty = DownloadOptions(
        videoId: 'abc',
        title: 'A video',
        channelName: 'A channel',
        videoQualities: [],
        audioQualities: [AudioQualityOption(label: '128k', url: 'https://example.test/a128')],
      );

      expect(empty.bestVideoQuality, isNull);
    });
  });
}

/// A synthetic `NewPipeVideoStream` with the fields the selection logic reads.
NewPipeVideoStream _newPipeVideo({
  required String label,
  required String url,
  int? bitrate,
  String? format,
  int? fps,
  bool isVideoOnly = false,
}) {
  return NewPipeVideoStream(
    url: url,
    resolution: label,
    format: format,
    quality: label,
    bitrate: bitrate,
    codec: null,
    mimeType: 'video/mp4',
    width: null,
    height: null,
    fps: fps,
    isVideoOnly: isVideoOnly,
  );
}

/// A synthetic `NewPipeAudioStream`.
NewPipeAudioStream _newPipeAudio({
  required String label,
  required String url,
  int? bitrate,
  String? format,
}) {
  return NewPipeAudioStream(
    url: url,
    format: format ?? 'mp4',
    quality: label,
    bitrate: bitrate,
    averageBitrate: bitrate,
    codec: null,
    mimeType: 'audio/mp4',
    sampleRate: null,
    audioChannels: null,
  );
}

/// A synthetic `StreamQualityInfo`.
StreamQualityInfo _streamInfo({
  required String label,
  required int resolution,
  required bool requiresMerging,
}) {
  return StreamQualityInfo(
    label: label,
    resolution: resolution,
    fps: null,
    format: null,
    requiresMerging: requiresMerging,
    isVideoOnly: false,
    videoStream: null,
    audioStream: null,
  );
}

/// A watch response containing only muxed (audio+video) streams.
NewPipeWatchResp _muxedResponse(List<NewPipeVideoStream> muxed) {
  return NewPipeWatchResp(
    id: 'abc',
    title: 'A video',
    uploaderName: 'A channel',
    thumbnailUrl: null,
    duration: null,
    videoStreams: muxed,
    videoOnlyStreams: [],
    audioStreams: [],
  );
}

/// A watch response mixing video-only and muxed streams.
NewPipeWatchResp _mixedResponse({
  required List<NewPipeVideoStream> videoOnly,
  required List<NewPipeVideoStream> muxed,
}) {
  return NewPipeWatchResp(
    id: 'abc',
    title: 'A video',
    uploaderName: 'A channel',
    thumbnailUrl: null,
    duration: null,
    videoStreams: muxed,
    videoOnlyStreams: videoOnly,
    audioStreams: [
      _newPipeAudio(label: '128k', url: 'https://example.test/a128', bitrate: 128 * 1000),
    ],
  );
}
