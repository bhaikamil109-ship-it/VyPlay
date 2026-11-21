import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/deep_link_handler.dart';

void main() {
  group('DeepLinkHandler.parseYouTubeUrl', () {
    test('parses watch URLs when the video parameter is not first', () {
      final result = DeepLinkHandler.parseYouTubeUrl(
        'https://www.youtube.com/watch?feature=share&v=abcdefghijk&t=12',
      );

      expect(result?.type, YouTubeLinkType.video);
      expect(result?.id, 'abcdefghijk');
    });

    test('parses youtu.be URLs embedded in shared text', () {
      final result = DeepLinkHandler.parseYouTubeUrl(
        'Check this video: https://youtu.be/abcdefghijk?si=share-token',
      );

      expect(result?.type, YouTubeLinkType.video);
      expect(result?.id, 'abcdefghijk');
    });

    test('parses Shorts and embed paths', () {
      final shorts = DeepLinkHandler.parseYouTubeUrl(
        'https://m.youtube.com/shorts/abcdefghijk',
      );
      final embed = DeepLinkHandler.parseYouTubeUrl(
        'https://youtube.com/embed/lmnopqrstuv',
      );

      expect(shorts?.type, YouTubeLinkType.video);
      expect(shorts?.id, 'abcdefghijk');
      expect(embed?.type, YouTubeLinkType.video);
      expect(embed?.id, 'lmnopqrstuv');
    });

    test('parses channel ids and handles', () {
      final channel = DeepLinkHandler.parseYouTubeUrl(
        'https://www.youtube.com/channel/UC_channel-123',
      );
      final handle = DeepLinkHandler.parseYouTubeUrl(
        'https://youtube.com/@vyplay_channel',
      );

      expect(channel?.type, YouTubeLinkType.channel);
      expect(channel?.id, 'UC_channel-123');
      expect(handle?.type, YouTubeLinkType.channel);
      expect(handle?.id, '@vyplay_channel');
    });

    test('parses playlist ids', () {
      final result = DeepLinkHandler.parseYouTubeUrl(
        'https://www.youtube.com/playlist?list=PL_vyplay-123',
      );

      expect(result?.type, YouTubeLinkType.playlist);
      expect(result?.id, 'PL_vyplay-123');
    });

    test('rejects lookalike hosts and YouTube text in another URL path', () {
      expect(
        DeepLinkHandler.parseYouTubeUrl(
          'https://youtube.com.evil.example/watch?v=abcdefghijk',
        ),
        isNull,
      );
      expect(
        DeepLinkHandler.parseYouTubeUrl(
          'https://evil.example/youtube.com/watch?v=abcdefghijk',
        ),
        isNull,
      );
      expect(
        DeepLinkHandler.parseYouTubeUrl(
          'https://evil.example/?next=https://youtube.com/watch?v=abcdefghijk',
        ),
        isNull,
      );
    });

    test('rejects malformed video ids and non-standard ports', () {
      expect(
        DeepLinkHandler.parseYouTubeUrl(
          'https://youtube.com/watch?v=too-short',
        ),
        isNull,
      );
      expect(
        DeepLinkHandler.parseYouTubeUrl(
          'https://youtube.com:8443/watch?v=abcdefghijk',
        ),
        isNull,
      );
    });

    test('rejects unsupported hosts and schemes', () {
      expect(
        DeepLinkHandler.parseYouTubeUrl(
          'https://example.com/watch?v=abcdefghijk',
        ),
        isNull,
      );
      expect(
        DeepLinkHandler.parseYouTubeUrl(
          'javascript://youtube.com/watch?v=abcdefghijk',
        ),
        isNull,
      );
    });
  });
}
