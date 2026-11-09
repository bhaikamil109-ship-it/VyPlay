// Phase 7-12 features settings keys test.
//
// Tests for Auto-Queue, Buffer Preload, Auto Quality Adjust, Background Playback,
// Notification Controls, and Data Saver settings key validation.
// 
// NOTE: These tests validate settings key constants exist and follow
// naming convention - they do not test persistence (requires database.g.dart).

import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/settings.dart';

void main() {
  group('Phase 7: Auto-Queue', () {
    test('auto-queue key is defined', () {
      expect(autoQueueKey, isNotEmpty);
      expect(autoQueueKey, contains('auto-queue'));
    });
  });

  group('Phase 8: Buffer Preloading', () {
    test('buffer preload key is defined', () {
      expect(bufferPreloadKey, isNotEmpty);
      expect(bufferPreloadKey, contains('buffer-preload'));
    });
  });

  group('Phase 9: Video Quality Auto-Adjust', () {
    test('auto quality adjust key is defined', () {
      expect(autoQualityAdjustKey, isNotEmpty);
      expect(autoQualityAdjustKey, contains('auto-quality-adjust'));
    });
  });

  group('Phase 10: Background Playback', () {
    test('background playback key is defined', () {
      expect(backgroundPlaybackKey, isNotEmpty);
      expect(backgroundPlaybackKey, contains('background-playback'));
    });
  });

  group('Phase 11: Notification Controls', () {
    test('notification controls key is defined', () {
      expect(notificationControlsKey, isNotEmpty);
      expect(notificationControlsKey, contains('notification-controls'));
    });
  });

  group('Phase 12: Data Saver Mode', () {
    test('data saver key is defined', () {
      expect(dataSaverKey, isNotEmpty);
      expect(dataSaverKey, contains('data-saver'));
    });
  });

  group('Phase 7-12: All settings keys unique', () {
    test('Phase 7-12 keys are unique among all keys', () {
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
      ];
      
      final uniqueKeys = allKeys.toSet();
      expect(allKeys.length, uniqueKeys.length,
          reason: 'All Phase 1-12 settings keys must be unique');
    });
  });

  group('Phase 7-12: Naming convention', () {
    test('all Phase 7-12 keys follow naming convention', () {
      expect(autoQueueKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
      expect(bufferPreloadKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
      expect(autoQualityAdjustKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
      expect(backgroundPlaybackKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
      expect(notificationControlsKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
      expect(dataSaverKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
    });
  });
}
