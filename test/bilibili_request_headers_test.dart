import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/services/bilibili_request_headers.dart';

void main() {
  group('BilibiliRequestHeaders.forPlaybackService', () {
    test('adds the Bilibili site Referer for Bilibili playback', () {
      expect(
        BilibiliRequestHeaders.forPlaybackService('bilibili'),
        {'Referer': 'https://www.bilibili.com'},
      );
    });

    test('does not override headers for other services', () {
      expect(
        BilibiliRequestHeaders.forPlaybackService('newpipe'),
        isEmpty,
      );
      expect(
        BilibiliRequestHeaders.forPlaybackService('piped'),
        isEmpty,
      );
    });
  });

  group('BilibiliRequestHeaders.isBilibiliMediaUrl', () {
    test('recognizes Bilibili CDN host suffixes', () {
      for (final url in [
        'https://upos-sz-mirrorcos.bilivideo.com/path/video.m4s',
        'https://upos-hz-mirrorakam.akamaized.net/path/audio.m4s',
        'https://cdn.example.bilivideo.cn/path/video.m4s',
        'https://edge.mountaintoys.cn/path/video.m4s',
      ]) {
        expect(BilibiliRequestHeaders.isBilibiliMediaUrl(url), isTrue, reason: url);
      }
    });

    test('is case-insensitive and recognizes the root domains', () {
      expect(
        BilibiliRequestHeaders.isBilibiliMediaUrl(
          'https://MEDIA.BILIVIDEO.COM/video.m4s',
        ),
        isTrue,
      );
      expect(
        BilibiliRequestHeaders.isBilibiliMediaUrl(
          'https://bilivideo.com/video.m4s',
        ),
        isTrue,
      );
    });

    test('does not classify a URL by its query or path text', () {
      expect(
        BilibiliRequestHeaders.isBilibiliMediaUrl(
          'https://rr.googlevideo.com/video?source=bilivideo.com',
        ),
        isFalse,
      );
      expect(
        BilibiliRequestHeaders.isBilibiliMediaUrl(
          'https://example.com/bilivideo.com/video.m4s',
        ),
        isFalse,
      );
    });
  });

  group('BilibiliRequestHeaders.forDownloadUrl', () {
    test('adds Referer and a browser User-Agent for Bilibili CDN downloads', () {
      final headers = BilibiliRequestHeaders.forDownloadUrl(
        'https://upos-sz-mirrorcos.bilivideo.com/path/video.m4s',
      );

      expect(headers['Referer'], 'https://www.bilibili.com/');
      expect(headers['Accept-Language'], 'zh-CN,zh;q=0.9');
      expect(headers['User-Agent'], contains('Firefox/128.0'));
    });

    test('does not change YouTube request headers', () {
      expect(
        BilibiliRequestHeaders.forDownloadUrl(
          'https://rr.googlevideo.com/videoplayback',
        ),
        isEmpty,
      );
    });
  });
}
