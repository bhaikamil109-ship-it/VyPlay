import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/domain/watch/models/invidious/video/adaptive_format.dart';
import 'package:vyplay/domain/watch/models/invidious/video/format_stream.dart';
import 'package:vyplay/domain/watch/models/newpipe/newpipe_stream.dart';
import 'package:vyplay/domain/watch/models/piped/video/audio_stream.dart';
import 'package:vyplay/domain/watch/models/piped/video/video_stream.dart';
import 'package:vyplay/domain/watch/playback/invidious_stream_helper.dart';
import 'package:vyplay/domain/watch/playback/piped_stream_helper.dart';

/// Cross-backend stream conversion.
///
/// Every back end hands streams to the same download pipeline, so the converted
/// models must agree: same units, same null handling, same separation of muxed
/// and video-only streams. These tests pin that contract for Piped and
/// Invidious without touching the network.
void main() {
  group('Piped conversion', () {
    test('handles missing and empty stream lists', () {
      expect(PipedStreamHelper.convertVideoStreams(null), isEmpty);
      expect(PipedStreamHelper.convertVideoStreams([]), isEmpty);
      expect(PipedStreamHelper.convertAudioStreams(null), isEmpty);
      expect(PipedStreamHelper.separateVideoStreams(null).muxed, isEmpty);
      expect(PipedStreamHelper.separateVideoStreams(null).videoOnly, isEmpty);
      expect(PipedStreamHelper.hasVideoOnlyStreams(null), isFalse);
      expect(PipedStreamHelper.getBestAudioStream(null), isNull);
      expect(PipedStreamHelper.getBestVideoOnlyStream(null, '720p'), isNull);
    });

    test('keeps content length and bitrate so size and kbps survive', () {
      final converted = PipedStreamHelper.convertAudioStreams([
        AudioStream(
          url: 'https://piped.test/a.m4a',
          format: 'M4A',
          bitrate: 128000,
          contentLength: 2048,
        ),
      ]).single;

      // Bits per second, exactly as the download layer expects before /1000.
      expect(converted.averageBitrate, 128000);
      expect(converted.bitrate, 128000);
      expect(converted.contentLength, 2048);
    });

    test('separates muxed from video-only streams', () {
      final separated = PipedStreamHelper.separateVideoStreams([
        VideoStream(url: 'u1', quality: '360p', videoOnly: false),
        VideoStream(url: 'u2', quality: '1080p', videoOnly: true),
        VideoStream(url: 'u3', quality: '720p'),
      ]);

      expect(separated.muxed.map((s) => s.url), ['u1', 'u3']);
      expect(separated.videoOnly.map((s) => s.url), ['u2']);
      expect(
        PipedStreamHelper.hasVideoOnlyStreams([
          VideoStream(url: 'u2', quality: '1080p', videoOnly: true),
        ]),
        isTrue,
      );
    });

    test('picks the exact video-only quality, then the closest', () {
      final streams = [
        VideoStream(url: 'a', quality: '720p', videoOnly: true),
        VideoStream(url: 'b', quality: '1080p', videoOnly: true),
        VideoStream(url: 'c', quality: '360p', videoOnly: false),
      ];

      expect(PipedStreamHelper.getBestVideoOnlyStream(streams, '1080p')!.url, 'b');
      expect(PipedStreamHelper.getBestVideoOnlyStream(streams, '900p')!.url, 'a');
      // Muxed streams are never offered as video-only merges.
      expect(PipedStreamHelper.getBestVideoOnlyStream(streams, '360p')!.url, 'a');
    });

    test('prefers the highest bitrate audio and the M4A format on a tie', () {
      final best = PipedStreamHelper.getBestAudioStream([
        AudioStream(url: 'low', format: 'WEBM', bitrate: 64000),
        AudioStream(url: 'webm-tie', format: 'WEBM', bitrate: 128000),
        AudioStream(url: 'm4a-tie', format: 'M4A', bitrate: 128000),
      ]);

      expect(best!.url, 'm4a-tie');
    });

    test('groups audio tracks and puts original before dubbed', () {
      final tracks = PipedStreamHelper.getAvailableAudioTracks([
        AudioStream(
          url: 'en',
          format: 'M4A',
          bitrate: 128000,
          audioTrackId: 'en',
          audioTrackName: 'English',
          audioTrackType: 'ORIGINAL',
          audioTrackLocale: 'en',
        ),
        AudioStream(
          url: 'de',
          format: 'M4A',
          bitrate: 128000,
          audioTrackId: 'de',
          audioTrackName: 'German',
          audioTrackType: 'DUBBED',
          audioTrackLocale: 'de',
        ),
        // Same track, lower bitrate: the higher one must represent it.
        AudioStream(
          url: 'en-low',
          format: 'WEBM',
          bitrate: 48000,
          audioTrackId: 'en',
          audioTrackType: 'ORIGINAL',
        ),
      ]);

      expect(tracks.map((t) => t.trackId), ['en', 'de']);
      expect(tracks.first.isOriginal, isTrue);
      expect(tracks.first.url, 'en');
      expect(tracks.last.isDubbed, isTrue);
      expect(tracks.last.displayName, contains('German'));
      expect(PipedStreamHelper.getBestAudioUrlForTrack(
        [
          AudioStream(url: 'en', bitrate: 128000, audioTrackId: 'en'),
          AudioStream(url: 'en-low', bitrate: 48000, audioTrackId: 'en'),
        ],
        'en',
      ), 'en');
      expect(
        PipedStreamHelper.getBestAudioUrlForTrack(
          [AudioStream(url: 'en', audioTrackId: 'en')],
          'missing',
        ),
        isNull,
      );
    });

    test('skips audio streams without a URL when building tracks', () {
      final tracks = PipedStreamHelper.getAvailableAudioTracks([
        AudioStream(url: null, audioTrackId: 'broken'),
        AudioStream(url: 'ok', audioTrackId: 'fine', bitrate: 128000),
      ]);

      expect(tracks.map((t) => t.trackId), ['fine']);
    });
  });

  group('Invidious conversion', () {
    test('handles missing and empty format lists', () {
      expect(InvidiousStreamHelper.convertVideoStreams(null), isEmpty);
      expect(InvidiousStreamHelper.convertAudioStreams([]), isEmpty);
      expect(InvidiousStreamHelper.convertMuxedStreams(null), isEmpty);
    });

    test('splits adaptive formats by media type and parses dimensions', () {
      final videos = InvidiousStreamHelper.convertVideoStreams([
        AdaptiveFormat(
          url: 'v',
          type: 'video/mp4',
          size: '1920x1080',
          qualityLabel: '1080p',
          clen: '2048',
        ),
        AdaptiveFormat(url: 'a', type: 'audio/mp4'),
      ]);

      expect(videos, hasLength(1));
      final video = videos.single;
      expect(video.width, 1920);
      expect(video.height, 1080);
      // Adaptive video is always video-only and keeps its content length.
      expect(video.isVideoOnly, isTrue);
      expect(video.contentLength, 2048);
      expect(video.resolution, '1080p');
    });

    test('reports audio bitrate in bits per second like every other backend', () {
      final audio = InvidiousStreamHelper.convertAudioStreams([
        AdaptiveFormat(
          url: 'a',
          type: 'audio/mp4',
          bitrate: '128000',
          audioQuality: 'AUDIO_QUALITY_MEDIUM',
          itag: '140',
          clen: '1024',
        ),
      ]).single;

      // The download layer divides this by 1000 for the kbps label; storing
      // kbps here produced "0 kbps" for Invidious audio.
      expect(audio.averageBitrate, 128000);
      expect(audio.bitrate, 128000);
      expect(audio.quality, 'AUDIO_QUALITY_MEDIUM');
      expect(audio.contentLength, 1024);
      expect(audio.itag, 140);
    });

    test('derives a kbps label when Invidious omits audioQuality', () {
      final audio = InvidiousStreamHelper.convertAudioStreams([
        AdaptiveFormat(url: 'a', type: 'audio/webm', bitrate: '96000'),
      ]).single;

      expect(audio.quality, '96kbps');
    });

    test('muxed format streams keep resolution and are marked not video-only', () {
      final muxed = InvidiousStreamHelper.convertMuxedStreams([
        FormatStream(
          url: 'm',
          size: '640x360',
          qualityLabel: '360p',
          container: 'mp4',
          encoding: 'avc1',
        ),
      ]).single;

      expect(muxed.width, 640);
      expect(muxed.height, 360);
      expect(muxed.isVideoOnly, isFalse);
      expect(muxed.resolution, '360p');
    });
  });

  group('shared stream labels', () {
    test('render bitrate as kbps, not raw bits', () {
      final stream = NewPipeAudioStream(
        url: 'a',
        averageBitrate: 128000,
        quality: 'M4A',
      );

      expect(stream.resolutionLikeLabel, '128k');
    });

    test('fall back to the format when no bitrate is known', () {
      final stream = NewPipeAudioStream(url: 'a', format: 'WEBM');

      expect(stream.resolutionLikeLabel, 'WEBM');
    });
  });
}
