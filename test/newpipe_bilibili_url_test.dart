import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/domain/search/models/newpipe/newpipe_search_resp.dart';

void main() {
  group('NewPipeSearchItem Bilibili URL parsing', () {
    test('extracts BVID from a Bilibili video URL', () {
      final item = NewPipeSearchItem(
        url: 'https://www.bilibili.com/video/BV1xx411c7mD',
      );
      expect(item.videoId, 'BV1xx411c7mD');
    });

    test('ignores trailing slash and unrelated query parameters', () {
      final item = NewPipeSearchItem(
        url: 'https://www.bilibili.com/video/BV1xx411c7mD/?p=2&spm_id_from=333',
      );
      expect(item.videoId, 'BV1xx411c7mD');
    });

    test('extracts Bilibili channel ID from the space URL', () {
      final item = NewPipeSearchItem(
        url: 'https://space.bilibili.com/12345678',
      );
      expect(item.channelId, '12345678');
    });

    test('does not mistake a video URL for a channel', () {
      final item = NewPipeSearchItem(
        url: 'https://www.bilibili.com/video/BV1xx411c7mD',
      );
      expect(item.channelId, isNull);
    });
  });
}
