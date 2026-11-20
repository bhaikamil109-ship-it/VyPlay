import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/services/bilibili_request_headers.dart';

void main() {
  group('BilibiliRequestHeaders', () {
    test('adds a Referer only for Bilibili playback', () {
      expect(BilibiliRequestHeaders.forPlaybackService('bilibili'),
          {'Referer': 'https://www.bilibili.com'});
      expect(BilibiliRequestHeaders.forPlaybackService('newpipe'), isEmpty);
      expect(BilibiliRequestHeaders.forPlaybackService('piped'), isEmpty);
    });

    test('matches known media CDN hostnames, including subdomains', () {
      for (final url in [
        'https://upos-sz-mirrorcos.bilivideo.com/video.m4s',
        'https://upos-hz-mirrorakam.akamaized.net/audio.m4s',
        'https://cdn.example.bilivideo.cn/video.m4s',
        'https://edge.mountaintoys.cn/video.m4s',
        'https://bilivideo.com/video.m4s',
      ]) {
        expect(BilibiliRequestHeaders.isBilibiliMediaUrl(url), isTrue,
            reason: url);
      }
    });

    test('does not match arbitrary hosts based on query/path text', () {
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

    test('adds Bilibili headers to Bilibili media downloads only', () {
      final headers = BilibiliRequestHeaders.forDownloadUrl(
        'https://upos-sz-mirrorcos.bilivideo.com/video.m4s',
      );
      expect(headers['Referer'], 'https://www.bilibili.com/');
      expect(headers['Accept-Language'], 'zh-CN,zh;q=0.9');
      expect(headers['User-Agent'], contains('Firefox/128.0'));
      expect(
        BilibiliRequestHeaders.forDownloadUrl(
          'https://rr.googlevideo.com/videoplayback',
        ),
        isEmpty,
      );
    });
  });
}
