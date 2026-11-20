import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/presentation/main_navigation/main_navigation.dart';

void main() {
  group('MainNavigationConfig', () {
    test('keeps five primary destinations on compact phone navigation', () {
      expect(
        MainNavigationConfig.destinationKeys,
        <String>['home', 'shorts', 'subscriptions', 'library', 'more'],
      );
    });

    test('keeps all feature pages available from the navigation shell', () {
      final pages = MainNavigationConfig.activePageKeys(showTrending: true);

      expect(
        pages,
        <String>[
          'home',
          'shorts',
          'trending',
          'subscriptions',
          'library',
          'downloads',
          'settings',
          'more',
        ],
      );
    });

    test('omits Trending from NewPipe while preserving other page identities', () {
      final pages = MainNavigationConfig.activePageKeys(showTrending: false);

      expect(pages, isNot(contains('trending')));
      expect(pages, containsAll(<String>[
        'home',
        'shorts',
        'subscriptions',
        'library',
        'downloads',
        'settings',
        'more',
      ]));
    });

    test('secondary pages keep the More destination selected', () {
      for (final pageKey in <String>['trending', 'downloads', 'settings']) {
        expect(
          MainNavigationConfig.destinationKeyForPage(pageKey),
          'more',
          reason: '$pageKey is opened from the More destination',
        );
      }
    });

    test('primary pages map back to their own destination', () {
      for (final destinationKey in MainNavigationConfig.destinationKeys) {
        expect(
          MainNavigationConfig.destinationKeyForPage(destinationKey),
          destinationKey,
        );
      }
    });

    test('destination index resolves correctly with Trending enabled or disabled', () {
      for (final showTrending in <bool>[true, false]) {
        final activePages = MainNavigationConfig.activePageKeys(
          showTrending: showTrending,
        );

        for (final destinationKey
            in MainNavigationConfig.destinationKeys) {
          final pageIndex = MainNavigationConfig.pageIndexForDestination(
            destinationKey,
            showTrending: showTrending,
          );

          expect(pageIndex, greaterThanOrEqualTo(0));
          expect(activePages[pageIndex], destinationKey);
        }
      }
    });

    test('conditional Trending removal does not reorder shared page keys', () {
      final withTrending = MainNavigationConfig.activePageKeys(
        showTrending: true,
      );
      final withoutTrending = MainNavigationConfig.activePageKeys(
        showTrending: false,
      );

      final sharedWithTrending =
          withTrending.where((key) => key != 'trending').toList();
      expect(withoutTrending, sharedWithTrending);
    });
  });
}
