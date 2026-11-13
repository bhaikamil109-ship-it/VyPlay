import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/operations/math_operations.dart';

void main() {
  group('formatPlayerDuration', () {
    test('pads minutes and seconds the same way on every player', () {
      // ExoPlayer used to render "5:03" here while the media_kit overlays
      // rendered "05:03"; the shared formatter must pick one.
      expect(formatPlayerDuration(const Duration(minutes: 5, seconds: 3)), '05:03');
      expect(formatPlayerDuration(const Duration(seconds: 0)), '00:00');
      expect(formatPlayerDuration(const Duration(seconds: 59)), '00:59');
    });

    test('keeps hours padded and matches the app-wide duration format', () {
      expect(
        formatPlayerDuration(const Duration(hours: 1, minutes: 5, seconds: 3)),
        '01:05:03',
      );
      expect(formatPlayerDuration(const Duration(seconds: 3725)),
          formatDuration(3725));
    });

    test('never renders a negative clock', () {
      expect(formatPlayerDuration(const Duration(seconds: -5)), '00:00');
    });

    test('drops sub-second remainder instead of rounding up', () {
      expect(
        formatPlayerDuration(const Duration(seconds: 61, milliseconds: 900)),
        '01:01',
      );
    });
  });
}
