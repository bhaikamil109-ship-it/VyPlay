import 'package:flutter_test/flutter_test.dart';
import 'package:fluxtube/domain/download/models/download_item.dart';
import 'package:fluxtube/domain/subscribes/models/subscribe.dart';

/// Unit tests for local profile data separation (master checklist 10.2:
/// "Profile data separation").
///
/// Every persisted row carries a `profileName` and every query filters on it,
/// so the guarantee that two profiles never see each other's data rests on two
/// things this test can actually check: the models default to `default` rather
/// than to null/empty, and the profile name survives a copy. A model that
/// silently dropped the profile would make every profile share one library.
void main() {
  group('Subscribe profile scoping', () {
    test('defaults to the default profile', () {
      final subscribe = Subscribe(id: 'UC123', channelName: 'A channel');

      expect(subscribe.profileName, 'default');
    });

    test('keeps an explicit profile name', () {
      final subscribe = Subscribe(
        id: 'UC123',
        channelName: 'A channel',
        profileName: 'work',
      );

      expect(subscribe.profileName, 'work');
    });

    test('two profiles can subscribe to the same channel independently', () {
      final personal = Subscribe(
        id: 'UC123',
        channelName: 'A channel',
        profileName: 'default',
      );
      final work = Subscribe(
        id: 'UC123',
        channelName: 'A channel',
        profileName: 'work',
      );

      // Same channel id, different owner: the (channelId, profileName) key is
      // what keeps the rows apart in the database.
      expect(personal.id, work.id);
      expect(personal.profileName, isNot(work.profileName));
    });

    test('filters a mixed list down to one profile', () {
      final all = <Subscribe>[
        Subscribe(id: 'a', channelName: 'A', profileName: 'default'),
        Subscribe(id: 'b', channelName: 'B', profileName: 'work'),
        Subscribe(id: 'c', channelName: 'C', profileName: 'default'),
      ];

      final mine = all.where((s) => s.profileName == 'default').toList();

      expect(mine.map((s) => s.id), ['a', 'c']);
    });
  });

  group('DownloadItem profile scoping', () {
    DownloadItem make(String profile) => DownloadItem.create(
          videoId: 'vid1',
          title: 'A video',
          channelName: 'A channel',
          downloadType: DownloadType.videoOnly,
          profileName: profile,
        );

    test('defaults to the default profile', () {
      final item = DownloadItem.create(
        videoId: 'vid1',
        title: 'A video',
        channelName: 'A channel',
        downloadType: DownloadType.videoOnly,
      );

      expect(item.profileName, 'default');
    });

    test('keeps an explicit profile name', () {
      expect(make('work').profileName, 'work');
    });

    test('the same video downloaded in two profiles stays two rows', () {
      final personal = make('default');
      final work = make('work');

      expect(personal.videoId, work.videoId);
      expect(personal.profileName, isNot(work.profileName));
    });

    test('a copy preserves the profile name', () {
      final original = make('work');
      final copy = original.copy();

      expect(copy.profileName, 'work');
    });

    test('filters a mixed download list down to one profile', () {
      final all = <DownloadItem>[
        make('default'),
        make('work'),
        make('default'),
      ];

      final mine = all.where((d) => d.profileName == 'default').toList();

      expect(mine, hasLength(2));
    });
  });
}
