// Phase 3 features settings keys test.
//
// Tests for Playback Speed settings key validation.
// 
// NOTE: These tests validate settings key constants exist and follow
// naming convention - they do not test persistence (requires database.g.dart).

import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/settings.dart';

void main() {
  group('Phase 3: Playback Speed', () {
    test('playback speed key is defined', () {
      expect(playbackSpeedKey, isNotEmpty);
      expect(playbackSpeedKey, contains('speed'));
    });
  });

  group('Phase 3: All settings keys unique', () {
    test('playback speed key is unique among all keys', () {
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
      ];
      
      final uniqueKeys = allKeys.toSet();
      expect(allKeys.length, uniqueKeys.length,
          reason: 'All Phase 1, 2, 3 settings keys must be unique');
    });
  });

  group('Phase 3: Naming convention', () {
    test('playback speed key follows naming convention', () {
      expect(playbackSpeedKey, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
    });
  });
}
