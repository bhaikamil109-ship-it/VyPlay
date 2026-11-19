/// Which stage of the watch/playback pipeline failed.
///
/// Before this, every NewPipe failure reached the UI as
/// `Exception: Failed to get stream info: <raw text>` because
/// `WatchImpl` wrapped it in `MainFailure.unknown(message: e.toString())`
/// (`lib/infrastructure/watch/watch_impl.dart:322-334`, `:337-349`). That is
/// where a bare "HTTP 404" could reach the user without saying which request
/// produced it.
library;

enum WatchStage {
  backendSelection('backend selection'),
  metadataExtraction('metadata extraction'),
  streamResolution('stream resolution'),
  qualitySelection('quality selection'),
  playback('playback');

  const WatchStage(this.label);

  final String label;
}

/// A classified watch failure: backend, stage and HTTP status.
///
/// Pure data plus one parser, so it can be unit-tested without a device, a
/// network or a platform channel.
class WatchFailureReport {
  const WatchFailureReport({
    required this.backend,
    required this.stage,
    required this.detail,
    this.httpStatus,
    this.exceptionType = 'Exception',
  });

  final String backend;
  final WatchStage stage;
  final String detail;
  final int? httpStatus;
  final String exceptionType;

  /// A 4xx other than 408/429 is a permanent answer for this request; anything
  /// else (no status, timeout, rate limit, 5xx) may succeed on a retry.
  bool get retryable {
    final status = httpStatus;
    if (status == null) return true;
    if (status == 408 || status == 429) return true;
    return status >= 500;
  }

  /// User-facing one-liner. Names the backend and the stage, and includes the
  /// status code only when there really was one.
  String describe() {
    final status = httpStatus == null ? '' : ' (HTTP $httpStatus)';
    return '$backend ${stage.label} failed$status';
  }

  /// Builds a report from whatever was thrown.
  ///
  /// NewPipeExtractor surfaces HTTP problems as text (`... response code: 404`,
  /// `HTTP 404`, `Content not available`), so the status is parsed from the
  /// message. [detail] is kept for the diagnostics log, never for the UI.
  factory WatchFailureReport.fromException({
    required String backend,
    required Object error,
    WatchStage fallbackStage = WatchStage.metadataExtraction,
  }) {
    final text = error.toString();
    final statusMatch = RegExp(r'\b([45]\d{2})\b').firstMatch(text);
    final status = statusMatch == null ? null : int.tryParse(statusMatch.group(1)!);
    return WatchFailureReport(
      backend: backend,
      stage: _stageFor(text, fallbackStage),
      detail: text,
      httpStatus: status,
      // `toString()` drops the runtime type (`Bad state: ...` for StateError),
      // so keep the type the caller actually threw.
      exceptionType: error.runtimeType.toString(),
    );
  }

  /// Order matters. An extractor message often embeds the request URL, and
  /// `.../youtubei/v1/player` would otherwise classify a metadata failure as a
  /// player failure, so extraction is tested before playback.
  static WatchStage _stageFor(String text, WatchStage fallback) {
    final lower = text.toLowerCase();
    if (lower.contains('stream info') || lower.contains('extract')) {
      return WatchStage.metadataExtraction;
    }
    if (lower.contains('no valid video stream') ||
        lower.contains('no stream') ||
        lower.contains('manifest')) {
      return WatchStage.streamResolution;
    }
    if (lower.contains('quality')) return WatchStage.qualitySelection;
    if (lower.contains('playback') || lower.contains('player error')) {
      return WatchStage.playback;
    }
    return fallback;
  }
}
