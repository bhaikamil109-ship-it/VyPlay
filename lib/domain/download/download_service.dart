import 'package:dartz/dartz.dart';
import 'package:vyplay/domain/core/failure/main_failure.dart';
import 'package:vyplay/domain/download/models/download_item.dart';
import 'package:vyplay/domain/download/models/download_quality.dart';
import 'package:vyplay/domain/watch/models/newpipe/newpipe_stream.dart';

/// Abstract service for download operations
abstract class DownloadService {
  /// Get available download options for a video
  Future<Either<MainFailure, DownloadOptions>> getDownloadOptions({
    required String videoId,
    required String serviceType,
  });

  /// Get download options from NewPipe streams (uses already fetched video data)
  DownloadOptions getDownloadOptionsFromStreams({
    required String videoId,
    required String title,
    required String channelName,
    String? thumbnailUrl,
    int? duration,
    List<NewPipeVideoStream>? videoStreams,
    List<NewPipeVideoStream>? videoOnlyStreams,
    List<NewPipeAudioStream>? audioStreams,
  });

  /// Start a download
  Future<Either<MainFailure, DownloadItem>> startDownload({
    required DownloadItem item,
    required Function(DownloadItem) onProgress,
    required Function(DownloadItem) onComplete,
    required Function(DownloadItem, String) onError,
  });

  /// Pause a download
  Future<Either<MainFailure, Unit>> pauseDownload(int downloadId);

  /// Resume a paused download
  Future<Either<MainFailure, DownloadItem>> resumeDownload({
    required int downloadId,
    required Function(DownloadItem) onProgress,
    required Function(DownloadItem) onComplete,
    required Function(DownloadItem, String) onError,
  });

  /// Restart downloads that were interrupted by the app being killed.
  ///
  /// Rows stuck in pending/downloading/merging are leftovers: the isolate that
  /// owned the transfer is gone, so nothing will ever finish them. Each is
  /// resumed once at startup, bounded by [limit] so a large queue cannot
  /// saturate the network on launch.
  Future<void> resumeInterruptedDownloads({
    required Function(DownloadItem) onProgress,
    required Function(DownloadItem) onComplete,
    required Function(DownloadItem, String) onError,
    int limit = 3,
  });

  /// Restart a failed or cancelled download from the beginning.
  ///
  /// Unlike [resumeDownload], partial files are discarded first: a failed
  /// transfer may have left a truncated stream behind.
  Future<Either<MainFailure, DownloadItem>> retryDownload({
    required int downloadId,
    required Function(DownloadItem) onProgress,
    required Function(DownloadItem) onComplete,
    required Function(DownloadItem, String) onError,
  });

  /// Cancel a download
  Future<Either<MainFailure, Unit>> cancelDownload(int downloadId);

  /// Delete a downloaded file
  Future<Either<MainFailure, Unit>> deleteDownload(int downloadId);

  /// Get all downloads
  Future<Either<MainFailure, List<DownloadItem>>> getAllDownloads({
    String profileName = 'default',
  });

  /// Get downloads by status
  Future<Either<MainFailure, List<DownloadItem>>> getDownloadsByStatus({
    required DownloadStatus status,
    String profileName = 'default',
  });

  /// Get active downloads count
  Future<int> getActiveDownloadsCount();

  /// Check if a video is already downloaded
  Future<bool> isVideoDownloaded(String videoId, {String profileName = 'default'});

  /// Get downloaded file path for a video
  Future<String?> getDownloadedFilePath(String videoId, {String profileName = 'default'});

  /// Clean up incomplete downloads
  Future<void> cleanupIncompleteDownloads();

  /// Save downloaded file to device storage (gallery/downloads folder)
  /// This makes the file visible in file managers and media apps
  Future<Either<MainFailure, Unit>> saveToDevice(DownloadItem item);
}
