import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/application/watch/watch_failure.dart';

void main() {
  group('WatchFailureReport.fromException', () {
    test('names the backend, the stage and the HTTP status', () {
      final report = WatchFailureReport.fromException(
        backend: 'NewPipe',
        error: Exception(
          'Failed to get stream info: Could not fetch '
          'https://www.youtube.com/youtubei/v1/player (response code: 404)',
        ),
      );

      expect(report.stage, WatchStage.metadataExtraction);
      expect(report.httpStatus, 404);
      expect(report.describe(), 'NewPipe metadata extraction failed (HTTP 404)');
    });

    test('extraction failures without a status still name the stage', () {
      final report = WatchFailureReport.fromException(
        backend: 'NewPipe',
        error: Exception('Failed to get stream info: Content not available'),
      );

      expect(report.stage, WatchStage.metadataExtraction);
      expect(report.httpStatus, isNull);
      expect(report.describe(), 'NewPipe metadata extraction failed');
      expect(report.describe().contains('HTTP'), isFalse);
    });

    test('no valid stream is a stream-resolution failure, not extraction', () {
      final report = WatchFailureReport.fromException(
        backend: 'NewPipe',
        error: Exception('No valid video stream available'),
      );

      expect(report.stage, WatchStage.streamResolution);
    });

    test('manifest failures are stream-resolution failures', () {
      final report = WatchFailureReport.fromException(
        backend: 'NewPipe',
        error: Exception('manifest.googlevideo.com returned 404'),
      );

      expect(report.stage, WatchStage.streamResolution);
      expect(report.httpStatus, 404);
    });

    test('player errors are playback failures', () {
      final report = WatchFailureReport.fromException(
        backend: 'NewPipe',
        error: Exception('Player error: ERROR_CODE_IO_BAD_HTTP_STATUS'),
      );

      expect(report.stage, WatchStage.playback);
    });

    test('4xx is permanent, 5xx/429/timeouts are retryable', () {
      final notFound = WatchFailureReport.fromException(
        backend: 'NewPipe',
        error: Exception('response code: 404'),
      );
      final forbidden = WatchFailureReport.fromException(
        backend: 'NewPipe',
        error: Exception('response code: 403'),
      );
      final serverError = WatchFailureReport.fromException(
        backend: 'NewPipe',
        error: Exception('response code: 503'),
      );
      final rateLimited = WatchFailureReport.fromException(
        backend: 'NewPipe',
        error: Exception('response code: 429'),
      );
      final timeout = WatchFailureReport.fromException(
        backend: 'NewPipe',
        error: Exception('connect timed out'),
      );

      expect(notFound.retryable, isFalse);
      expect(forbidden.retryable, isFalse);
      expect(serverError.retryable, isTrue);
      expect(rateLimited.retryable, isTrue);
      expect(timeout.retryable, isTrue);
    });

    test('exception type is preserved for diagnostics', () {
      final report = WatchFailureReport.fromException(
        backend: 'Piped',
        error: StateError('ExtractionException: boom'),
      );

      expect(report.exceptionType, 'StateError');
      expect(report.backend, 'Piped');
    });
  });
}
