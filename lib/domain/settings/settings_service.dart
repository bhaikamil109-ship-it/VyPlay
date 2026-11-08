import 'package:dartz/dartz.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/domain/core/failure/main_failure.dart';
import 'package:vyplay/domain/settings/models/instance.dart';
import 'package:vyplay/domain/sleep_timer/sleep_timer_config.dart';

abstract class SettingsService {
  Future<List<Map<String, String>>> initializeSettings();
  Future<Either<MainFailure, String>> selectDefaultLanguage(
      {required String language});
  Future<Either<MainFailure, String>> selectDefaultQuality(
      {required String quality});
  Future<Either<MainFailure, String>> selectRegion({required String region});
  Future<Either<MainFailure, String>> setTheme({required String themeMode});
  Future<Either<MainFailure, bool>> toggleHistoryVisibility(
      {required bool isHistoryVisible});
  Future<Either<MainFailure, bool>> toggleDislikeVisibility(
      {required bool isDislikeVisible});
  Future<Either<MainFailure, bool>> toggleHlsPlayer(
      {required bool isHlsPlayer});
  Future<Either<MainFailure, bool>> toggleHideComments(
      {required bool isHideComments});
  Future<Either<MainFailure, bool>> toggleHideRelatedVideos(
      {required bool isHideRelated});
  Future<Either<MainFailure, List<Instance>>> fetchInstances();
  Future<Either<MainFailure, List<Instance>>> fetchInvidiousInstances();
  Future<Either<MainFailure, String>> setInstance(
      {required String instanceApi});
  Future<Either<MainFailure, YouTubeServices>> setTYService(
      {required YouTubeServices service});
  Future<Either<MainFailure, bool>> togglePipPlayer(
      {required bool isPipDisabled});
  Future<Either<MainFailure, String>> findWorkingPipedInstance({
    required List<Instance> instances,
    String? preferredInstanceApi,
    void Function(String instanceName)? onTestingInstance,
  });
  Future<bool> testInstanceConnection(String apiUrl);
  Future<Either<MainFailure, String>> findWorkingInvidiousInstance({
    required List<Instance> instances,
    String? preferredInstanceApi,
    void Function(String instanceName)? onTestingInstance,
  });
  Future<bool> testInvidiousInstanceConnection(String apiUrl);
  // New methods for additional features
  Future<Either<MainFailure, String>> setSearchFilter({required String filter});
  Future<Either<MainFailure, String>> setVideoFitMode({required String fitMode});
  Future<Either<MainFailure, int>> setSkipInterval({required int seconds});
  Future<Either<MainFailure, bool>> toggleSponsorBlock({required bool isEnabled});
  Future<Either<MainFailure, List<String>>> setSponsorBlockCategories(
      {required List<String> categories});
  Future<Either<MainFailure, bool>> toggleOpenLinksInBrowser(
      {required bool openInBrowser});
  Future<Either<MainFailure, String>> setHomeFeedMode({required String mode});
  Future<Either<MainFailure, bool>> toggleAudioFocus({required bool isEnabled});
  // Profile methods
  Future<Either<MainFailure, List<String>>> addProfile({required String profileName});
  Future<Either<MainFailure, List<String>>> deleteProfile({required String profileName});
  Future<Either<MainFailure, String>> switchProfile({required String profileName});
  Future<Either<MainFailure, List<String>>> renameProfile({required String oldName, required String newName});
  Future<Either<MainFailure, List<String>>> getProfiles();
  // Import/Export methods
  Future<Either<MainFailure, String>> exportSubscriptions({String profileName = 'default'});
  Future<Either<MainFailure, int>> importSubscriptions({required String filePath, String profileName = 'default'});
  // Subtitle size
  Future<Either<MainFailure, double>> setSubtitleSize({required double size});
  // Search history privacy
  Future<Either<MainFailure, bool>> toggleSearchHistoryEnabled({required bool isEnabled});
  Future<Either<MainFailure, bool>> toggleSearchHistoryVisibility({required bool isVisible});
  // Auto PiP
  Future<Either<MainFailure, bool>> toggleAutoPip({required bool isEnabled});
  
  /// Set sleep timer to pause playback after specified duration
  Future<Either<MainFailure, SleepTimerConfig>> setSleepTimerConfig({required SleepTimerConfig config});
  Future<Either<MainFailure, bool>> clearSleepTimer();
  Future<Either<MainFailure, SleepTimerConfig?>> getSleepTimerConfig();

  // Swipe gestures
  Future<Either<MainFailure, bool>> toggleSwipeGestures({required bool enabled});
  Future<Either<MainFailure, bool>> isSwipeGesturesEnabled();

  // DeArrow
  Future<Either<MainFailure, bool>> toggleDeArrow({required bool enabled});
  Future<Either<MainFailure, bool>> isDeArrowEnabled();

  // Playlist Bookmarks
  Future<Either<MainFailure, bool>> toggleBookmarks({required bool enabled});
  Future<Either<MainFailure, bool>> isBookmarksEnabled();
  Future<Either<MainFailure, bool>> toggleBookmarkPlaylist({required String playlistId, required bool bookmarked});
  Future<Either<MainFailure, List<String>>> getBookmarkedPlaylists();

  // Content Filtering
  Future<Either<MainFailure, bool>> toggleRestrictedMode({required bool enabled});
  Future<Either<MainFailure, bool>> isRestrictedModeEnabled();

  // Mini Player
  Future<Either<MainFailure, bool>> toggleMiniPlayer({required bool enabled});
  Future<Either<MainFailure, bool>> isMiniPlayerEnabled();

  // Download Preferences
  Future<Either<MainFailure, String>> setDownloadQuality({required String quality});
  Future<Either<MainFailure, String>> getDownloadQuality();
  Future<Either<MainFailure, bool>> toggleDownloadSubtitles({required bool enabled});
  Future<Either<MainFailure, bool>> isDownloadSubtitlesEnabled();
  Future<Either<MainFailure, bool>> toggleDownloadOverWifiOnly({required bool enabled});
  Future<Either<MainFailure, bool>> isDownloadOverWifiOnlyEnabled();
  Future<Either<MainFailure, bool>> toggleDownloadAutoDelete({required bool enabled});
  Future<Either<MainFailure, bool>> isDownloadAutoDeleteEnabled();
  
  // Playback speed
  Future<Either<MainFailure, double>> setPlaybackSpeed({required double speed});
  Future<Either<MainFailure, double>> getPlaybackSpeed();
  
  // Autoplay next video
  Future<Either<MainFailure, bool>> setAutoplayNextVideo({required bool enabled});
  Future<Either<MainFailure, bool>> isAutoplayNextVideoEnabled();
  
  // Show related videos in queue
  Future<Either<MainFailure, bool>> setShowRelatedInQueue({required bool enabled});
  Future<Either<MainFailure, bool>> isShowRelatedInQueueEnabled();
  
  // Queue auto-dismiss time
  Future<Either<MainFailure, int>> setQueueDismissTime({required int seconds});
  Future<Either<MainFailure, int>> getQueueDismissTime();
  
  // Autoplay countdown
  Future<Either<MainFailure, int>> setAutoplayCountdown({required int seconds});
  Future<Either<MainFailure, int>> getAutoplayCountdown();
  
  // YouTube service type
  Future<Either<MainFailure, String>> setYoutubeService({required String service});
  
  // Disable autoplay on cellular
  Future<Either<MainFailure, bool>> setDisableAutoplayOnCellular({required bool enabled});
  Future<Either<MainFailure, bool>> isDisableAutoplayOnCellularEnabled();
  
  // Auto-queue: continue playlist by auto-adding related stream
  Future<Either<MainFailure, bool>> setAutoQueue({required bool enabled});
  Future<Either<MainFailure, bool>> isAutoQueueEnabled();
  
  // Buffer preloading
  Future<Either<MainFailure, bool>> setBufferPreload({required bool enabled});
  Future<Either<MainFailure, bool>> isBufferPreloadEnabled();
  
  // Video quality auto-adjust
  Future<Either<MainFailure, bool>> setAutoQualityAdjust({required bool enabled});
  Future<Either<MainFailure, bool>> isAutoQualityAdjustEnabled();
  
  // Background playback
  Future<Either<MainFailure, bool>> setBackgroundPlayback({required bool enabled});
  Future<Either<MainFailure, bool>> isBackgroundPlaybackEnabled();
  
  // Notification controls
  Future<Either<MainFailure, bool>> setNotificationControls({required bool enabled});
  Future<Either<MainFailure, bool>> isNotificationControlsEnabled();
  
  // Data saver mode
  Future<Either<MainFailure, bool>> setDataSaver({required bool enabled});
  Future<Either<MainFailure, bool>> isDataSaverEnabled();
  
  // Hide watched videos in feeds
  Future<Either<MainFailure, bool>> setHideWatchedVideos({required bool enabled});
  Future<Either<MainFailure, bool>> isHideWatchedVideosEnabled();
  
  // Quality for mobile data
  Future<Either<MainFailure, int>> setMobileDataQuality({required int quality});
  Future<Either<MainFailure, int>> getMobileDataQuality();
  
  // Download items in queue
  Future<Either<MainFailure, bool>> setDownloadQueueItems({required bool enabled});
  Future<Either<MainFailure, bool>> isDownloadQueueItemsEnabled();
  
  // Rich caption rendering
  Future<Either<MainFailure, bool>> setRichCaptionRendering({required bool enabled});
  Future<Either<MainFailure, bool>> isRichCaptionRenderingEnabled();
  
  // Bilibili video support
  Future<Either<MainFailure, bool>> setBilibiliEnabled({required bool enabled});
  Future<Either<MainFailure, bool>> isBilibiliEnabled();
  
  // Content swipe direction (left-to-right = true, right-to-left = false)
  Future<Either<MainFailure, bool>> setSwipeDirection({required bool leftToRight});
  Future<Either<MainFailure, bool>> isSwipeLeftToRight();
}
