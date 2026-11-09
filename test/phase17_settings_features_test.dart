import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/settings.dart';

void main() {
  group('Phase 17: Download location', () {
    test('download folder key matches the value used by the downloader', () {
      // DownloadImpl reads exactly this key when resolving the folder.
      expect(downloadFolderPathKey, 'download_folder_path');
    });
  });

  group('Phase 17: Return YouTube Dislike', () {
    test('ryd key is defined', () {
      expect(rydEnabledKey, 'ryd-enabled');
    });
  });

  group('Phase 17: keys unique', () {
    test('new keys are unique among phase 15-17 keys', () {
      final keys = [
        contentFilterKeywordsKey,
        contentFilterChannelsKey,
        contentFilterHideShortsKey,
        contentFilterHidePaidKey,
        downloadFolderPathKey,
        rydEnabledKey,
      ];
      expect(keys.toSet().length, keys.length);
    });
  });
}
