// Phase 6 features settings keys test.
//
// Tests for Autoplay Countdown and Cellular settings key validation.
// 
// NOTE: These tests validate settings key constants exist and follow
// naming convention - they do not test persistence (requires database.g.dart).

import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/settings.dart';

void main() {
  group('Phase 6: Autoplay Countdown', () {
    test('autoplay countdown key is defined', () {
      expect(autoplayCountdownKey, isNotEmpty);
      expect(autoplayCountdownKey, contains('countdown'));
    });
  });

  group('Phase 6: Disable Autoplay on Cellular', () {
    test('disable autoplay on cellular key is defined', () {
      expect(disableAutoplayOnCellularKey, isNotEmpty);
      expect(disableAutoplayOnCellularKey, contains('cellular'));
    });
  });

  group('Phase 6: All settings keys unique', () {
    test('Phase 6 keys are unique among all keys', () {
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
      ];
      
      final uniqueKeys = allKeys.toSet();
      expect(allKeys.length, uniqueKeys.length,
          reason: 'All Phase 1-6 settings keys must be unique');
    });
  });

  group('Phase 6: Naming convention', () {
    test('all Phase 6 keys follow naming convention', () {
      expect(autoplayCountdownKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
      expect(disableAutoplayOnCellularKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
    });
  });
}
