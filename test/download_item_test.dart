import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/domain/download/models/download_item.dart';

/// Unit tests for the download domain model.
///
/// These cover the progress-weighting maths and the state predicates that the
/// download UI branches on. They are pure Dart — no Flutter binding, no
/// database, no network — so they run in milliseconds and never flake.
void main() {
  group('DownloadItem.progress', () {
    test('video-only progress tracks the video stream alone', () {
      final item = DownloadItem.create(
        videoId: 'abc123',
        title: 'Test video',
        channelName: 'Test channel',
        downloadType: DownloadType.videoOnly,
      )..videoProgress = 0.4;

      expect(item.progress, closeTo(0.4, 1e-9));
    });

    test('audio-only progress tracks the audio stream alone', () {
      final item = DownloadItem.create(
        videoId: 'abc123',
        title: 'Test video',
        channelName: 'Test channel',
        downloadType: DownloadType.audioOnly,
      )..audioProgress = 0.75;

      expect(item.progress, closeTo(0.75, 1e-9));
    });

    test('video+audio progress weights video 70% and audio 30%', () {
      final item = DownloadItem.create(
        videoId: 'abc123',
        title: 'Test video',
        channelName: 'Test channel',
        downloadType: DownloadType.videoWithAudio,
      )
        ..videoProgress = 1.0
        ..audioProgress = 0.0;

      // 1.0 * 0.7 + 0.0 * 0.3
      expect(item.progress, closeTo(0.7, 1e-9));

      item.audioProgress = 1.0;
      expect(item.progress, closeTo(1.0, 1e-9));
    });

    test('progress never exceeds 1.0 for a completed muxed download', () {
      final item = DownloadItem.create(
        videoId: 'abc123',
        title: 'Test video',
        channelName: 'Test channel',
        downloadType: DownloadType.videoWithAudio,
      )
        ..videoProgress = 1.0
        ..audioProgress = 1.0;

      expect(item.progress, lessThanOrEqualTo(1.0));
    });
  });

  group('DownloadItem state predicates', () {
    test('a downloading item is active but not resumable', () {
      final item = DownloadItem.create(
        videoId: 'abc123',
        title: 'Test video',
        channelName: 'Test channel',
        downloadType: DownloadType.videoOnly,
      )..status = DownloadStatus.downloading;

      expect(item.isActive, isTrue);
      expect(item.canResume, isFalse);
      expect(item.canPause, isTrue);
    });

    test('a merging item counts as active', () {
      final item = DownloadItem.create(
        videoId: 'abc123',
        title: 'Test video',
        channelName: 'Test channel',
        downloadType: DownloadType.videoWithAudio,
      )..status = DownloadStatus.merging;

      expect(item.isActive, isTrue);
      expect(item.canPause, isFalse);
    });

    test('paused and failed items are resumable', () {
      final item = DownloadItem.create(
        videoId: 'abc123',
        title: 'Test video',
        channelName: 'Test channel',
        downloadType: DownloadType.videoOnly,
      );

      item.status = DownloadStatus.paused;
      expect(item.canResume, isTrue);

      item.status = DownloadStatus.failed;
      expect(item.canResume, isTrue);
    });

    test('completed and cancelled items are neither active nor resumable', () {
      final item = DownloadItem.create(
        videoId: 'abc123',
        title: 'Test video',
        channelName: 'Test channel',
        downloadType: DownloadType.videoOnly,
      );

      item.status = DownloadStatus.completed;
      expect(item.isActive, isFalse);
      expect(item.canResume, isFalse);

      item.status = DownloadStatus.cancelled;
      expect(item.isActive, isFalse);
      expect(item.canResume, isFalse);
    });
  });

  group('DownloadItem formatting', () {
    test('formats byte counts across unit boundaries', () {
      final item = DownloadItem.create(
        videoId: 'abc123',
        title: 'Test video',
        channelName: 'Test channel',
        downloadType: DownloadType.videoOnly,
      );

      item.totalBytes = 512;
      expect(item.formattedTotalSize, '512 B');

      item.totalBytes = 2048;
      expect(item.formattedTotalSize, '2.0 KB');

      item.totalBytes = 5 * 1024 * 1024;
      expect(item.formattedTotalSize, '5.0 MB');

      item.totalBytes = 3 * 1024 * 1024 * 1024;
      expect(item.formattedTotalSize, '3.00 GB');
    });

    test('reports unknown size when totalBytes is null', () {
      final item = DownloadItem.create(
        videoId: 'abc123',
        title: 'Test video',
        channelName: 'Test channel',
        downloadType: DownloadType.videoOnly,
      );

      expect(item.formattedTotalSize, 'Unknown');
    });

    test('formats ETA in minutes and seconds', () {
      final item = DownloadItem.create(
        videoId: 'abc123',
        title: 'Test video',
        channelName: 'Test channel',
        downloadType: DownloadType.videoOnly,
      );

      item.etaSeconds = 45;
      expect(item.formattedEta, '45s');

      item.etaSeconds = 125;
      expect(item.formattedEta, '2m 5s');

      item.etaSeconds = null;
      expect(item.formattedEta, '');
    });

    test('formats speed and hides it when zero', () {
      final item = DownloadItem.create(
        videoId: 'abc123',
        title: 'Test video',
        channelName: 'Test channel',
        downloadType: DownloadType.videoOnly,
      );

      expect(item.formattedSpeed, '');

      item.downloadSpeed = 1024 * 1024;
      expect(item.formattedSpeed, '1.0 MB/s');
    });
  });

  group('DownloadItem.copy', () {
    test('copies every field without sharing mutable state', () {
      final original = DownloadItem.create(
        videoId: 'abc123',
        title: 'Test video',
        channelName: 'Test channel',
        downloadType: DownloadType.videoWithAudio,
        videoQuality: '1080p',
        audioQuality: '128kbps',
      )
        ..id = 7
        ..status = DownloadStatus.downloading
        ..videoProgress = 0.5
        ..audioProgress = 0.25
        ..downloadedBytes = 1234
        ..errorMessage = 'none';

      final clone = original.copy();

      expect(clone.id, 7);
      expect(clone.videoId, 'abc123');
      expect(clone.videoQuality, '1080p');
      expect(clone.audioQuality, '128kbps');
      expect(clone.status, DownloadStatus.downloading);
      expect(clone.videoProgress, 0.5);
      expect(clone.audioProgress, 0.25);
      expect(clone.downloadedBytes, 1234);
      expect(clone.errorMessage, 'none');

      // Mutating the clone must not touch the original.
      clone.videoProgress = 0.9;
      expect(original.videoProgress, 0.5);
    });
  });
}
