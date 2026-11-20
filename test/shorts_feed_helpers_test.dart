import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/domain/search/models/newpipe/newpipe_search_resp.dart';
import 'package:vyplay/presentation/shorts/shorts_feed_helpers.dart';

void main() {
  group('isShortSearchItem', () {
    test('accepts extractor-flagged streams even when duration is unknown', () {
      expect(
        isShortSearchItem(NewPipeSearchItem(
          type: 'STREAM',
          isShort: true,
          url: 'https://www.youtube.com/shorts/short-1',
        )),
        isTrue,
      );
    });

    test('accepts 1 through 60 second streams when flag is missing', () {
      for (final duration in [1, 15, 60]) {
        expect(
          isShortSearchItem(NewPipeSearchItem(
            type: 'STREAM',
            duration: duration,
            url: 'https://www.youtube.com/shorts/short-$duration',
          )),
          isTrue,
        );
      }
    });

    test('rejects non-stream results, long streams and invalid durations', () {
      expect(isShortSearchItem(NewPipeSearchItem(type: 'CHANNEL', isShort: true)), isFalse);
      expect(isShortSearchItem(NewPipeSearchItem(type: 'PLAYLIST', duration: 10)), isFalse);
      expect(isShortSearchItem(NewPipeSearchItem(type: 'STREAM', duration: 61)), isFalse);
      expect(isShortSearchItem(NewPipeSearchItem(type: 'STREAM', duration: 0)), isFalse);
      expect(isShortSearchItem(NewPipeSearchItem(type: 'STREAM')), isFalse);
    });

    test('accepts extractor item with null type if short metadata is present', () {
      expect(isShortSearchItem(NewPipeSearchItem(isShort: true)), isTrue);
      expect(isShortSearchItem(NewPipeSearchItem(duration: 60)), isTrue);
    });
  });

  group('shortsVideoId', () {
    test('extracts query based watch URL', () {
      expect(
        shortsVideoId(NewPipeSearchItem(url: 'https://www.youtube.com/watch?v=abc123&t=8')),
        'abc123',
      );
    });

    test('extracts shorts, embed and youtu.be paths', () {
      expect(shortsVideoId(NewPipeSearchItem(url: 'https://www.youtube.com/shorts/s1')), 's1');
      expect(shortsVideoId(NewPipeSearchItem(url: 'https://www.youtube.com/embed/e1')), 'e1');
      expect(shortsVideoId(NewPipeSearchItem(url: 'https://youtu.be/y1')), 'y1');
    });

    test('rejects empty urls and non-video watch routes', () {
      expect(shortsVideoId(NewPipeSearchItem()), isNull);
      expect(shortsVideoId(NewPipeSearchItem(url: 'https://youtube.com/watch')), isNull);
    });
  });

  group('uniqueShortItems', () {
    test('filters invalid entries and de-duplicates by video id across pages', () {
      final first = NewPipeSearchItem(
        type: 'STREAM',
        duration: 30,
        url: 'https://www.youtube.com/shorts/one',
      );
      final duplicate = NewPipeSearchItem(
        type: 'STREAM',
        isShort: true,
        url: 'https://www.youtube.com/watch?v=one',
      );
      final second = NewPipeSearchItem(
        type: 'STREAM',
        duration: 60,
        url: 'https://youtu.be/two',
      );
      final ignored = NewPipeSearchItem(
        type: 'STREAM',
        duration: 120,
        url: 'https://youtu.be/long',
      );

      expect(
        uniqueShortItems([first, duplicate, second, ignored], existing: [first])
            .map(shortsVideoId)
            .toList(),
        ['two'],
      );
    });

    test('does not treat null urls as a shared duplicate key', () {
      final flaggedWithoutUrl = NewPipeSearchItem(type: 'STREAM', isShort: true);
      expect(uniqueShortItems([flaggedWithoutUrl]), isEmpty);
    });
  });
}
