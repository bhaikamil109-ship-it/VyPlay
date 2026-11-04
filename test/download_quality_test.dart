import 'package:flutter_test/flutter_test.dart';
import 'package:fluxtube/domain/download/models/download_quality.dart';

/// Unit tests for the download quality models (master checklist 10.2:
/// "Download quality selection").
///
/// These cover the parts the download sheet actually relies on: the label the
/// user picks from, the size formatting, and the "best option" fallbacks that
/// decide which stream is preselected.
void main() {
  group('VideoQualityOption', () {
    test('formats a sub-megabyte size in KB', () {
      const option = VideoQualityOption(
        label: '144p',
        quality: '144p',
        url: 'https://example.test/v144',
        fileSize: 512 * 1024,
      );

      expect(option.formattedSize, '512.0 KB');
    });

    test('formats a megabyte size in MB', () {
      const option = VideoQualityOption(
        label: '720p',
        quality: '720p',
        url: 'https://example.test/v720',
        fileSize: 25 * 1024 * 1024,
      );

      expect(option.formattedSize, '25.0 MB');
    });

    test('returns an empty size string when the size is unknown', () {
      const option = VideoQualityOption(
        label: '1080p',
        quality: '1080p',
        url: 'https://example.test/v1080',
      );

      expect(option.formattedSize, '');
    });

    test('displayLabel joins label, codec and size', () {
      const option = VideoQualityOption(
        label: '720p',
        quality: '720p',
        url: 'https://example.test/v720',
        codec: 'avc1',
        fileSize: 10 * 1024 * 1024,
      );

      expect(option.displayLabel, '720p (avc1) - 10.0 MB');
    });

    test('displayLabel omits an empty codec', () {
      const option = VideoQualityOption(
        label: '480p',
        quality: '480p',
        url: 'https://example.test/v480',
        codec: '',
      );

      expect(option.displayLabel, '480p');
    });

    test('displayLabel omits the size when it is unknown', () {
      const option = VideoQualityOption(
        label: '360p',
        quality: '360p',
        url: 'https://example.test/v360',
        codec: 'vp9',
      );

      expect(option.displayLabel, '360p (vp9)');
    });

    test('defaults to a non-HLS, non-muxed stream', () {
      const option = VideoQualityOption(
        label: '720p',
        quality: '720p',
        url: 'https://example.test/v720',
      );

      expect(option.isHls, isFalse);
      expect(option.isMuxed, isFalse);
    });
  });

  group('AudioQualityOption', () {
    test('displayLabel includes the bitrate', () {
      const option = AudioQualityOption(
        label: 'Medium',
        bitrate: 128,
        url: 'https://example.test/a128',
      );

      expect(option.displayLabel, 'Medium 128kbps');
    });

    test('displayLabel joins bitrate, codec and size', () {
      const option = AudioQualityOption(
        label: 'High',
        bitrate: 256,
        codec: 'opus',
        url: 'https://example.test/a256',
        fileSize: 4 * 1024 * 1024,
      );

      expect(option.displayLabel, 'High 256kbps (opus) - 4.0 MB');
    });

    test('displayLabel omits the bitrate when it is unknown', () {
      const option = AudioQualityOption(
        label: 'Low',
        url: 'https://example.test/a64',
      );

      expect(option.displayLabel, 'Low');
    });

    test('formats a sub-megabyte size in KB', () {
      const option = AudioQualityOption(
        label: 'Low',
        url: 'https://example.test/a64',
        fileSize: 900 * 1024,
      );

      expect(option.formattedSize, '900.0 KB');
    });
  });

  group('DownloadOptions', () {
    const video720 = VideoQualityOption(
      label: '720p',
      quality: '720p',
      url: 'https://example.test/v720',
    );
    const video360 = VideoQualityOption(
      label: '360p',
      quality: '360p',
      url: 'https://example.test/v360',
    );
    const audio128 = AudioQualityOption(
      label: 'Medium',
      bitrate: 128,
      url: 'https://example.test/a128',
    );

    test('reports whether video and audio options exist', () {
      const withBoth = DownloadOptions(
        videoId: 'abc',
        title: 'A video',
        channelName: 'A channel',
        videoQualities: [video720],
        audioQualities: [audio128],
      );

      expect(withBoth.hasVideoOptions, isTrue);
      expect(withBoth.hasAudioOptions, isTrue);
    });

    test('reports missing options for an audio-only video', () {
      const audioOnly = DownloadOptions(
        videoId: 'abc',
        title: 'A video',
        channelName: 'A channel',
        videoQualities: [],
        audioQualities: [audio128],
      );

      expect(audioOnly.hasVideoOptions, isFalse);
      expect(audioOnly.hasAudioOptions, isTrue);
    });

    test('bestVideoQuality returns the first option, not the highest label', () {
      // The extractor is expected to sort by preference; the model must not
      // second-guess it by parsing labels.
      const options = DownloadOptions(
        videoId: 'abc',
        title: 'A video',
        channelName: 'A channel',
        videoQualities: [video720, video360],
        audioQualities: [audio128],
      );

      expect(options.bestVideoQuality, same(video720));
    });

    test('bestVideoQuality is null when there are no video options', () {
      const options = DownloadOptions(
        videoId: 'abc',
        title: 'A video',
        channelName: 'A channel',
        videoQualities: [],
        audioQualities: [audio128],
      );

      expect(options.bestVideoQuality, isNull);
    });

    test('bestAudioQuality is null when there are no audio options', () {
      const options = DownloadOptions(
        videoId: 'abc',
        title: 'A video',
        channelName: 'A channel',
        videoQualities: [video720],
        audioQualities: [],
      );

      expect(options.bestAudioQuality, isNull);
    });

    test('bestAudioQuality returns the first option', () {
      const options = DownloadOptions(
        videoId: 'abc',
        title: 'A video',
        channelName: 'A channel',
        videoQualities: [video720],
        audioQualities: [audio128],
      );

      expect(options.bestAudioQuality, same(audio128));
    });
  });
}
