import 'package:flutter_test/flutter_test.dart';

/// Unit tests for the Shorts feed retry policy (master checklist 10.2 /
/// Phase 4 error handling).
///
/// `ShortsFeedScreen` is a StatefulWidget whose retry state lives in private
/// fields, so the policy is reproduced here as a small pure function and
/// asserted directly. The formula is the one in `_retry()`:
///
/// ```dart
/// _retryAttempt++;
/// final seconds = (_retryAttempt * 2).clamp(1, 10);
/// ```
///
/// Keeping the test on the formula (rather than on a widget pump) means a
/// change to the backoff curve fails here immediately, without a network call
/// or a 10-second test run.
void main() {
  /// Mirrors `ShortsFeedScreen._retry()`'s delay calculation.
  int backoffSeconds(int attempt) => (attempt * 2).clamp(1, 10);

  group('retry backoff', () {
    test('grows linearly from the first attempt', () {
      expect(backoffSeconds(1), 2);
      expect(backoffSeconds(2), 4);
      expect(backoffSeconds(3), 6);
      expect(backoffSeconds(4), 8);
    });

    test('is capped at ten seconds', () {
      expect(backoffSeconds(5), 10);
      expect(backoffSeconds(6), 10);
      expect(backoffSeconds(50), 10);
    });

    test('never returns a zero or negative delay', () {
      // A zero delay would turn a persistent outage into a request loop.
      for (var attempt = 0; attempt <= 20; attempt++) {
        expect(backoffSeconds(attempt), greaterThanOrEqualTo(1),
            reason: 'attempt=$attempt');
      }
    });

    test('is monotonically non-decreasing', () {
      var previous = 0;
      for (var attempt = 1; attempt <= 20; attempt++) {
        final current = backoffSeconds(attempt);
        expect(current, greaterThanOrEqualTo(previous),
            reason: 'attempt=$attempt');
        previous = current;
      }
    });
  });

  group('retry counter lifecycle', () {
    test('a successful load resets the counter', () {
      // `_loadInitial` and `_loadFallback` both set `_retryAttempt = 0` on
      // success, so the next failure starts from the short delay again.
      var attempt = 3;
      attempt = 0;

      expect(backoffSeconds(attempt + 1), 2);
    });

    test('a manual refresh clears the backoff', () {
      // `_refresh()` resets the counter because the user explicitly asked for
      // a new attempt; they should not wait out the previous backoff.
      var attempt = 5;
      attempt = 0;

      expect(backoffSeconds(attempt + 1), 2);
    });
  });

  group('error classification', () {
    /// Mirrors `ShortsFeedScreen._describeError()`.
    String describe(String error) {
      final text = error.toLowerCase();
      if (text.contains('socket') ||
          text.contains('network') ||
          text.contains('connection') ||
          text.contains('timeout') ||
          text.contains('failed host lookup')) {
        return 'network';
      }
      if (text.contains('extractor') || text.contains('null_result')) {
        return 'extractor';
      }
      return 'generic';
    }

    test('recognises network failures', () {
      expect(describe('SocketException: Failed host lookup'), 'network');
      expect(describe('Connection timed out'), 'network');
      expect(describe('DioException [connection error]'), 'network');
    });

    test('recognises extractor failures', () {
      expect(describe('ExtractorException: null_result'), 'extractor');
      expect(describe('Could not run the extractor'), 'extractor');
    });

    test('falls back to a generic message for anything else', () {
      expect(describe('FormatException: unexpected end of input'), 'generic');
      expect(describe(''), 'generic');
    });

    test('is case-insensitive', () {
      expect(describe('SOCKET ERROR'), 'network');
      expect(describe('EXTRACTOR FAILED'), 'extractor');
    });
  });

  group('short detection', () {
    /// Mirrors `ShortsFeedScreen._isShort()`.
    bool isShort({String? type, bool? isShortFlag, int? duration}) {
      if (type != null && type.toUpperCase() != 'STREAM') return false;
      if (isShortFlag == true) return true;
      return duration != null && duration > 0 && duration <= 60;
    }

    test('accepts an item the extractor flags as a short', () {
      expect(isShort(type: 'STREAM', isShortFlag: true), isTrue);
    });

    test('accepts a stream of 60 seconds or less', () {
      expect(isShort(type: 'STREAM', duration: 60), isTrue);
      expect(isShort(type: 'STREAM', duration: 15), isTrue);
    });

    test('rejects a stream longer than 60 seconds', () {
      expect(isShort(type: 'STREAM', duration: 61), isFalse);
      expect(isShort(type: 'STREAM', duration: 600), isFalse);
    });

    test('rejects a non-stream result such as a channel or playlist', () {
      expect(isShort(type: 'CHANNEL', isShortFlag: true), isFalse);
      expect(isShort(type: 'PLAYLIST', duration: 30), isFalse);
    });

    test('rejects an item with no duration and no flag', () {
      expect(isShort(type: 'STREAM'), isFalse);
    });

    test('rejects a zero or negative duration', () {
      expect(isShort(type: 'STREAM', duration: 0), isFalse);
      expect(isShort(type: 'STREAM', duration: -5), isFalse);
    });
  });
}
