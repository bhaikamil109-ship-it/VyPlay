import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/domain/piped_account/models/piped_account_models.dart';

void main() {
  group('Piped account models', () {
    test('parses channel URL into a channel id', () {
      final sub = PipedSubscription.fromJson({
        'url': '/channel/UC1234567890',
        'name': 'Example',
        'avatar': 'https://example.com/a.jpg',
        'verified': true,
      });
      expect(sub.id, 'UC1234567890');
      expect(sub.name, 'Example');
      expect(sub.avatarUrl, 'https://example.com/a.jpg');
      expect(sub.verified, isTrue);
    });

    test('parses playlist fields from the backend shape', () {
      final playlist = PipedPlaylist.fromJson({
        'id': 'PL123',
        'name': 'Favorites',
        'shortDescription': 'My list',
        'thumbnail': 'https://example.com/t.jpg',
        'videos': 7,
      });
      expect(playlist.id, 'PL123');
      expect(playlist.name, 'Favorites');
      expect(playlist.description, 'My list');
      expect(playlist.videoCount, 7);
    });
  });
}
