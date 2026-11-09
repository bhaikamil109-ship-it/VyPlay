// Phase 5 features settings keys test.
//
// Tests for Queue Settings keys validation.
// 
// NOTE: These tests validate settings key constants exist and follow
// naming convention - they do not test persistence (requires database.g.dart).

import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/settings.dart';

void main() {
  group('Phase 5: Show Related Videos in Queue', () {
    test('show related in queue key is defined', () {
      expect(showRelatedInQueueKey, isNotEmpty);
      expect(showRelatedInQueueKey, contains('related'));
    });
  });

  group('Phase 5: Queue Dismiss Timeout', () {
    test('queue dismiss time key is defined', () {
      expect(queueDismissTimeKey, isNotEmpty);
      expect(queueDismissTimeKey, contains('dismiss'));
    });
  });

  group('Phase 5: All settings keys unique', () {
    test('Phase 5 keys are unique among all keys', () {
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
      ];
      
      final uniqueKeys = allKeys.toSet();
      expect(allKeys.length, uniqueKeys.length,
          reason: 'All Phase 1-5 settings keys must be unique');
    });
  });

  group('Phase 5: Naming convention', () {
    test('all Phase 5 keys follow naming convention', () {
      expect(showRelatedInQueueKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
      expect(queueDismissTimeKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
    });
  });
}
