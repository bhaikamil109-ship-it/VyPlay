import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/settings.dart';
import 'package:vyplay/domain/content_filter/content_filter_config.dart';

void main() {
  group('Phase 15: Content filter keywords', () {
    test('plain keyword hides matching titles case-insensitively', () {
      const filter = ContentFilterConfig(
        keywords: ['Spoiler'],
        blockedChannelIds: [],
        hideShorts: false,
        hidePaidPromotions: false,
      );
      expect(filter.shouldHide(title: 'Big SPOILER inside'), isTrue);
      expect(filter.shouldHide(title: 'Nothing to see'), isFalse);
    });

    test('keyword also matches the channel name', () {
      const filter = ContentFilterConfig(
        keywords: ['clickbait'],
        blockedChannelIds: [],
        hideShorts: false,
        hidePaidPromotions: false,
      );
      expect(
        filter.shouldHide(title: 'Daily upload', channelName: 'ClickBait TV'),
        isTrue,
      );
    });

    test('slash wrapped keyword is a regular expression', () {
      const filter = ContentFilterConfig(
        keywords: [r'/^episode \d+$/'],
        blockedChannelIds: [],
        hideShorts: false,
        hidePaidPromotions: false,
      );
      expect(filter.shouldHide(title: 'Episode 12'), isTrue);
      expect(filter.shouldHide(title: 'Episode twelve'), isFalse);
    });

    test('malformed regex falls back to substring match', () {
      const filter = ContentFilterConfig(
        keywords: ['/[unclosed/'],
        blockedChannelIds: [],
        hideShorts: false,
        hidePaidPromotions: false,
      );
      expect(filter.shouldHide(title: 'An [unclosed bracket'), isTrue);
    });

    test('empty keyword entries are ignored', () {
      const filter = ContentFilterConfig(
        keywords: ['', '   '],
        blockedChannelIds: [],
        hideShorts: false,
        hidePaidPromotions: false,
      );
      expect(filter.isEnabled, isFalse);
      expect(filter.shouldHide(title: 'Anything'), isFalse);
    });
  });

  group('Phase 15: Channel blocklist', () {
    test('blocked channel id hides the entry', () {
      const filter = ContentFilterConfig(
        keywords: [],
        blockedChannelIds: ['UCabc123'],
        hideShorts: false,
        hidePaidPromotions: false,
      );
      expect(filter.shouldHide(channelId: 'UCabc123'), isTrue);
      expect(filter.shouldHide(channelId: 'UCother'), isFalse);
    });

    test('full channel URL entry matches the bare id', () {
      const filter = ContentFilterConfig(
        keywords: [],
        blockedChannelIds: ['https://youtube.com/channel/UCabc123'],
        hideShorts: false,
        hidePaidPromotions: false,
      );
      expect(filter.shouldHide(channelId: 'UCabc123'), isTrue);
    });
  });

  group('Phase 15: Shorts and paid hiding', () {
    test('hide shorts uses the isShort flag', () {
      const filter = ContentFilterConfig(
        keywords: [],
        blockedChannelIds: [],
        hideShorts: true,
        hidePaidPromotions: false,
      );
      expect(filter.shouldHide(title: 'Clip', isShort: true), isTrue);
      expect(filter.shouldHide(title: 'Full video'), isFalse);
    });

    test('hide shorts detects shorts URLs', () {
      const filter = ContentFilterConfig(
        keywords: [],
        blockedChannelIds: [],
        hideShorts: true,
        hidePaidPromotions: false,
      );
      expect(
        filter.shouldHide(title: 'Clip', url: 'https://y.com/shorts/abc'),
        isTrue,
      );
    });

    test('hide paid promotions only when enabled', () {
      const enabled = ContentFilterConfig(
        keywords: [],
        blockedChannelIds: [],
        hideShorts: false,
        hidePaidPromotions: true,
      );
      const disabled = ContentFilterConfig(
        keywords: [],
        blockedChannelIds: [],
        hideShorts: false,
        hidePaidPromotions: false,
      );
      expect(enabled.shouldHide(isPaidPromotion: true), isTrue);
      expect(disabled.shouldHide(isPaidPromotion: true), isFalse);
    });

    test('disabled config hides nothing and isEnabled is false', () {
      const filter = ContentFilterConfig.disabled();
      expect(filter.isEnabled, isFalse);
      expect(
        filter.shouldHide(
          title: 'Anything',
          channelId: 'UCabc',
          isShort: true,
          isPaidPromotion: true,
        ),
        isFalse,
      );
    });

    test('equality compares keywords, channels and switches', () {
      const a = ContentFilterConfig(
        keywords: ['a'],
        blockedChannelIds: ['b'],
        hideShorts: true,
        hidePaidPromotions: false,
      );
      const b = ContentFilterConfig(
        keywords: ['a'],
        blockedChannelIds: ['b'],
        hideShorts: true,
        hidePaidPromotions: false,
      );
      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });
  });

  group('Phase 15: Settings keys', () {
    test('content filter keys are defined', () {
      expect(contentFilterKeywordsKey, 'content-filter-keywords');
      expect(contentFilterChannelsKey, 'content-filter-channels');
      expect(contentFilterHideShortsKey, 'content-filter-hide-shorts');
      expect(contentFilterHidePaidKey, 'content-filter-hide-paid');
    });

    test('content filter keys are unique', () {
      final keys = [
        contentFilterKeywordsKey,
        contentFilterChannelsKey,
        contentFilterHideShortsKey,
        contentFilterHidePaidKey,
      ];
      expect(keys.toSet().length, keys.length);
    });
  });
}
