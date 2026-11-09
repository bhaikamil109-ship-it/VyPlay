import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/domain/watch/models/ryd_votes.dart';

void main() {
  group('Phase 16: Return YouTube Dislike model', () {
    test('parses a normal API payload', () {
      final votes = RydVotes.fromJson({
        'id': 'dQw4w9WgXcQ',
        'likes': 1500,
        'dislikes': 42,
        'rating': 4.2,
        'viewCount': 100000,
      });
      expect(votes.id, 'dQw4w9WgXcQ');
      expect(votes.likes, 1500);
      expect(votes.dislikes, 42);
      expect(votes.rating, 4.2);
      expect(votes.viewCount, 100000);
    });

    test('tolerates numeric strings', () {
      final votes = RydVotes.fromJson({
        'likes': '10',
        'dislikes': '3',
        'rating': '3.5',
        'viewCount': '7',
      });
      expect(votes.likes, 10);
      expect(votes.dislikes, 3);
      expect(votes.rating, 3.5);
      expect(votes.viewCount, 7);
    });

    test('missing and malformed values default to zero', () {
      final votes = RydVotes.fromJson({'id': 5, 'likes': null, 'dislikes': {}});
      expect(votes.id, '');
      expect(votes.likes, 0);
      expect(votes.dislikes, 0);
      expect(votes.rating, 0);
      expect(votes.viewCount, 0);
    });

    test('supports value equality', () {
      const a = RydVotes(
          id: 'x', likes: 1, dislikes: 2, rating: 3, viewCount: 4);
      const b = RydVotes(
          id: 'x', likes: 1, dislikes: 2, rating: 3, viewCount: 4);
      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });
  });
}
