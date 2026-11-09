// Phase 14 features settings keys test.
//
// Tests for Bilibili support and swipe direction settings key validation.
// 
// NOTE: These tests validate settings key constants exist and follow
// naming convention - they do not test persistence (requires database.g.dart).

import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/settings.dart';

void main() {
  group('Phase 14: Bilibili Support', () {
    test('bilibili enabled key is defined', () {
      expect(bilibiliEnabledKey, isNotEmpty);
      expect(bilibiliEnabledKey, contains('bilibili'));
    });
  });

  group('Phase 14: Swipe Direction', () {
    test('swipe direction key is defined', () {
      expect(swipeDirectionKey, isNotEmpty);
      expect(swipeDirectionKey, contains('swipe-direction'));
    });
  });

  group('Phase 14: All settings keys unique', () {
    test('Phase 14 keys are unique among all keys', () {
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
        // Phase 14
        bilibiliEnabledKey,
        swipeDirectionKey,
      ];
      
      final uniqueKeys = allKeys.toSet();
      expect(allKeys.length, uniqueKeys.length,
          reason: 'All Phase 1-14 settings keys must be unique');
    });
  });

  group('Phase 14: Naming convention', () {
    test('all Phase 14 keys follow naming convention', () {
      expect(bilibiliEnabledKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
      expect(swipeDirectionKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
    });
  });
}
