// Phase 2 features settings keys test.
//
// Tests for Playlist Bookmarks, Content Filtering, Mini Player, and
// Download Preferences settings keys validation.
// 
// NOTE: These tests validate settings key constants exist and follow
// naming convention - they do not test persistence (requires database.g.dart).

import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/settings.dart';

void main() {
  group('Phase 2: Playlist Bookmarks', () {
    test('bookmarks enabled key is defined', () {
      expect(bookmarksEnabledKey, isNotEmpty);
      expect(bookmarksEnabledKey, contains('bookmark'));
    });

    test('bookmark playlists key is defined', () {
      expect(bookmarkPlaylistsKey, isNotEmpty);
      expect(bookmarkPlaylistsKey, contains('playlist'));
    });
  });

  group('Phase 2: Content Filtering (Restricted Mode)', () {
    test('restricted mode key is defined', () {
      expect(restrictedModeKey, isNotEmpty);
      expect(restrictedModeKey, contains('restricted'));
    });
  });

  group('Phase 2: Mini Player', () {
    test('mini player key is defined', () {
      expect(miniPlayerEnabledKey, isNotEmpty);
      expect(miniPlayerEnabledKey, contains('mini'));
    });
  });

  group('Phase 2: Download Preferences', () {
    test('download quality key is defined', () {
      expect(downloadQualityKey, isNotEmpty);
      expect(downloadQualityKey, contains('quality'));
    });

    test('download subtitles key is defined', () {
      expect(downloadSubtitlesKey, isNotEmpty);
      expect(downloadSubtitlesKey, contains('subtitle'));
    });

    test('download over wifi only key is defined', () {
      expect(downloadOverWifiOnlyKey, isNotEmpty);
      expect(downloadOverWifiOnlyKey, contains('wifi'));
    });

    test('download auto delete key is defined', () {
      expect(downloadAutoDeleteKey, isNotEmpty);
      expect(downloadAutoDeleteKey, contains('delete'));
    });
  });

  group('Phase 2: All settings keys unique', () {
    test('all Phase 2 keys are unique', () {
      final keys = [
        bookmarksEnabledKey,
        bookmarkPlaylistsKey,
        restrictedModeKey,
        miniPlayerEnabledKey,
        downloadQualityKey,
        downloadSubtitlesKey,
        downloadOverWifiOnlyKey,
        downloadAutoDeleteKey,
      ];
      
      final uniqueKeys = keys.toSet();
      expect(keys.length, uniqueKeys.length,
          reason: 'Phase 2 settings keys must be unique');
    });
  });

  group('Phase 2: Naming convention', () {
    test('all keys follow naming convention', () {
      final keys = [
        bookmarksEnabledKey,
        bookmarkPlaylistsKey,
        restrictedModeKey,
        miniPlayerEnabledKey,
        downloadQualityKey,
        downloadSubtitlesKey,
        downloadOverWifiOnlyKey,
        downloadAutoDeleteKey,
      ];
      
      for (final key in keys) {
        expect(key, isNotEmpty);
        expect(key, isNotNull);
        expect(key, matches(RegExp(r'^[a-z][a-z0-9-]*$')));
      }
    });
  });
}
