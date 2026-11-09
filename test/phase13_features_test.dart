// Phase 13 features settings keys test.
//
// Tests for Hide Watched Videos, Mobile Data Quality, Download Queue Items,
// and Rich Caption Rendering settings key validation.
// 
// NOTE: These tests validate settings key constants exist and follow
// naming convention - they do not test persistence (requires database.g.dart).

import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/settings.dart';

void main() {
  group('Phase 13: Hide Watched Videos', () {
    test('hide watched videos key is defined', () {
      expect(hideWatchedVideosKey, isNotEmpty);
      expect(hideWatchedVideosKey, contains('hide-watched'));
    });
  });

  group('Phase 13: Mobile Data Quality', () {
    test('mobile data quality key is defined', () {
      expect(mobileDataQualityKey, isNotEmpty);
      expect(mobileDataQualityKey, contains('mobile-data'));
    });
  });

  group('Phase 13: Download Queue Items', () {
    test('download queue items key is defined', () {
      expect(downloadQueueItemsKey, isNotEmpty);
      expect(downloadQueueItemsKey, contains('download-queue'));
    });
  });

  group('Phase 13: Rich Caption Rendering', () {
    test('rich caption rendering key is defined', () {
      expect(richCaptionRenderingKey, isNotEmpty);
      expect(richCaptionRenderingKey, contains('rich-caption'));
    });
  });

  group('Phase 13: All settings keys unique', () {
    test('Phase 13 keys are unique among all keys', () {
      final allKeys = [
        // Phase 1
        sleepTimerKey,
        enableSwipeGesturesKey,
        dearrowEnabledKey,
        // Phase 2
        bookmarksEnabledKey,
        bookmarkPlaylistsKey,
        restrictedModeKey,
        miniPlayerEnabledKey,
        downloadQualityKey,
        downloadSubtitlesKey,
        downloadOverWifiOnlyKey,
        downloadAutoDeleteKey,
        // Phase 3
        playbackSpeedKey,
        // Phase 4
        autoplayNextVideoKey,
        // Phase 5
        showRelatedInQueueKey,
        queueDismissTimeKey,
        // Phase 6
        autoplayCountdownKey,
        disableAutoplayOnCellularKey,
        // Phase 7
        autoQueueKey,
        // Phase 8
        bufferPreloadKey,
        // Phase 9
        autoQualityAdjustKey,
        // Phase 10
        backgroundPlaybackKey,
        // Phase 11
        notificationControlsKey,
        // Phase 12
        dataSaverKey,
        // Phase 13
        hideWatchedVideosKey,
        mobileDataQualityKey,
        downloadQueueItemsKey,
        richCaptionRenderingKey,
      ];
      
      final uniqueKeys = allKeys.toSet();
      expect(allKeys.length, uniqueKeys.length,
          reason: 'All Phase 1-13 settings keys must be unique');
    });
  });

  group('Phase 13: Naming convention', () {
    test('all Phase 13 keys follow naming convention', () {
      expect(hideWatchedVideosKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
      expect(mobileDataQualityKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
      expect(downloadQueueItemsKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
      expect(richCaptionRenderingKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
    });
  });
}
