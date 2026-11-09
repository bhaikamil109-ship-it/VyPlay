// Phase 4 features settings keys test.
//
// Tests for Autoplay Next Video settings key validation.
// 
// NOTE: These tests validate settings key constants exist and follow
// naming convention - they do not test persistence (requires database.g.dart).

import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/settings.dart';

void main() {
  group('Phase 4: Autoplay Next Video', () {
    test('autoplay next video key is defined', () {
      expect(autoplayNextVideoKey, isNotEmpty);
      expect(autoplayNextVideoKey, contains('autoplay'));
    });
  });

  group('Phase 4: All settings keys unique', () {
    test('autoplay next video key is unique among all keys', () {
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
      ];
      
      final uniqueKeys = allKeys.toSet();
      expect(allKeys.length, uniqueKeys.length,
          reason: 'All Phase 1, 2, 3, 4 settings keys must be unique');
    });
  });

  group('Phase 4: Naming convention', () {
    test('autoplay next video key follows naming convention', () {
      expect(autoplayNextVideoKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
    });
  });
}
