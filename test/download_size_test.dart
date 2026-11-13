import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/domain/download/download_size.dart';
import 'package:vyplay/domain/download/models/download_item.dart' show DownloadType;
import 'package:vyplay/domain/download/models/download_quality.dart';

const _mb = 1024 * 1024;

VideoQualityOption _video({
  int? size,
  bool isMuxed = false,
}) =>
    VideoQualityOption(
      label: '720p',
      quality: '720p',
      fileSize: size,
      url: 'https://example.test/video',
      isMuxed: isMuxed,
    );

AudioQualityOption _audio({int? size}) => AudioQualityOption(
      label: '128kbps',
      fileSize: size,
      url: 'https://example.test/audio',
    );

void main() {
  group('formatBytes', () {
    test('picks the unit that keeps the number readable', () {
      expect(formatBytes(512), '512 B');
      expect(formatBytes(2048), '2.0 KB');
      expect(formatBytes(5 * _mb), '5.0 MB');
      expect(formatBytes(3 * 1024 * _mb), '3.00 GB');
    });

    test('never renders a negative or zero size as a number', () {
      expect(formatBytes(0), '0 B');
      expect(formatBytes(-10), '0 B');
    });
  });

  group('video with audio', () {
    test('adds video and separate audio sizes', () {
      final estimate = estimateDownloadSize(
        type: DownloadType.videoWithAudio,
        video: _video(size: 40 * _mb),
        audio: _audio(size: 3 * _mb),
      );

      expect(estimate.isKnown, isTrue);
      expect(estimate.isComplete, isTrue);
      expect(estimate.bytes, 43 * _mb);
      expect(estimate.label, '43.0 MB');
    });

    test('does not add audio for a muxed stream', () {
      final estimate = estimateDownloadSize(
        type: DownloadType.videoWithAudio,
        video: _video(size: 20 * _mb, isMuxed: true),
        audio: _audio(size: 3 * _mb),
      );

      expect(estimate.bytes, 20 * _mb);
      expect(estimate.isComplete, isTrue);
    });

    test('says "at least" when only the video size is known', () {
      final estimate = estimateDownloadSize(
        type: DownloadType.videoWithAudio,
        video: _video(size: 40 * _mb),
        audio: _audio(),
      );

      expect(estimate.isKnown, isTrue);
      expect(estimate.isComplete, isFalse);
      expect(estimate.label, 'at least 40.0 MB');
    });

    test('says "at least" when only the audio size is known', () {
      final estimate = estimateDownloadSize(
        type: DownloadType.videoWithAudio,
        video: _video(),
        audio: _audio(size: 3 * _mb),
      );

      expect(estimate.label, 'at least 3.0 MB');
    });

    test('is unknown when neither stream reports a size', () {
      final estimate = estimateDownloadSize(
        type: DownloadType.videoWithAudio,
        video: _video(),
        audio: _audio(),
      );

      expect(estimate.isKnown, isFalse);
      expect(estimate.label, 'Size unknown');
    });
  });

  group('single-stream downloads', () {
    test('video only uses the muxed/video size alone', () {
      final estimate = estimateDownloadSize(
        type: DownloadType.videoOnly,
        video: _video(size: 12 * _mb),
      );

      expect(estimate.bytes, 12 * _mb);
      expect(estimate.isComplete, isTrue);
    });

    test('video only with no metadata is unknown', () {
      final estimate = estimateDownloadSize(
        type: DownloadType.videoOnly,
        video: _video(),
      );

      expect(estimate.isKnown, isFalse);
      expect(estimate.label, 'Size unknown');
    });

    test('audio only uses the audio size and ignores the video size', () {
      final estimate = estimateDownloadSize(
        type: DownloadType.audioOnly,
        video: _video(size: 99 * _mb),
        audio: _audio(size: 4 * _mb),
      );

      expect(estimate.bytes, 4 * _mb);
      expect(estimate.isComplete, isTrue);
    });

    test('audio only with no size is unknown, not zero', () {
      final estimate = estimateDownloadSize(
        type: DownloadType.audioOnly,
        audio: _audio(),
      );

      expect(estimate.isKnown, isFalse);
      expect(estimate.label, 'Size unknown');
    });
  });

  test('a missing video option still reports the audio estimate', () {
    final estimate = estimateDownloadSize(
      type: DownloadType.videoWithAudio,
      audio: _audio(size: 6 * _mb),
    );

    // No video to check isMuxed on: the audio size is all we can prove.
    expect(estimate.bytes, 6 * _mb);
  });
}
