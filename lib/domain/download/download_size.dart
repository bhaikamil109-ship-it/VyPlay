import 'package:vyplay/domain/download/models/download_item.dart' show DownloadType;
import 'package:vyplay/domain/download/models/download_quality.dart';

/// Size of a download before it starts, from the metadata the extractor
/// already returned for the exact streams that will be downloaded.
///
/// Nothing here guesses: when the backend does not report a content length the
/// estimate is [isKnown] == false and the UI says so instead of showing a
/// fabricated number.
class DownloadSizeEstimate {
  const DownloadSizeEstimate({
    required this.bytes,
    this.isComplete = true,
  });

  /// Total bytes, or null when no stream reported a size.
  final int? bytes;

  /// False when only some of the streams reported a size, e.g. the video size
  /// is known but the separate audio track's is not. The label then reads
  /// "at least …" rather than pretending to be exact.
  final bool isComplete;

  static const DownloadSizeEstimate unknown =
      DownloadSizeEstimate(bytes: null, isComplete: false);

  bool get isKnown => bytes != null && bytes! > 0;

  String get label {
    if (!isKnown) return 'Size unknown';
    return isComplete ? formatBytes(bytes!) : 'at least ${formatBytes(bytes!)}';
  }
}

/// Human-readable byte count. Keeps one decimal place, which is what the
/// existing quality labels use, so the sheet stays visually consistent.
String formatBytes(int bytes) {
  if (bytes <= 0) return '0 B';
  const kb = 1024;
  const mb = kb * 1024;
  const gb = mb * 1024;

  if (bytes < kb) return '$bytes B';
  if (bytes < mb) return '${(bytes / kb).toStringAsFixed(1)} KB';
  if (bytes < gb) return '${(bytes / mb).toStringAsFixed(1)} MB';
  return '${(bytes / gb).toStringAsFixed(2)} GB';
}

/// Adds up the streams a download of [type] will actually fetch.
///
/// A muxed video stream already contains its audio, so no audio size is added in
/// that case — otherwise the estimate would double-count.
DownloadSizeEstimate estimateDownloadSize({
  required DownloadType type,
  VideoQualityOption? video,
  AudioQualityOption? audio,
}) {
  bool known(int? value) => value != null && value > 0;

  if (type == DownloadType.audioOnly) {
    return known(audio?.fileSize)
        ? DownloadSizeEstimate(bytes: audio!.fileSize)
        : DownloadSizeEstimate.unknown;
  }

  final videoBytes = video?.fileSize;

  if (type == DownloadType.videoOnly) {
    return known(videoBytes)
        ? DownloadSizeEstimate(bytes: videoBytes)
        : DownloadSizeEstimate.unknown;
  }

  // videoWithAudio
  final audioBytes = audio?.fileSize;

  // No video option at all: the audio size is all we can prove, so it is a
  // lower bound rather than a total.
  if (video == null) {
    return known(audioBytes)
        ? DownloadSizeEstimate(bytes: audioBytes, isComplete: false)
        : DownloadSizeEstimate.unknown;
  }

  // A muxed video stream already carries its audio; adding the audio track
  // size would double-count.
  if (video.isMuxed) {
    return known(videoBytes)
        ? DownloadSizeEstimate(bytes: videoBytes)
        : DownloadSizeEstimate.unknown;
  }
  if (known(videoBytes) && known(audioBytes)) {
    return DownloadSizeEstimate(bytes: videoBytes! + audioBytes!);
  }
  if (known(videoBytes)) {
    return DownloadSizeEstimate(bytes: videoBytes, isComplete: false);
  }
  if (known(audioBytes)) {
    return DownloadSizeEstimate(bytes: audioBytes, isComplete: false);
  }
  return DownloadSizeEstimate.unknown;
}
