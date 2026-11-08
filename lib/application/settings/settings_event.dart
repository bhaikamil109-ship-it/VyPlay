import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vyplay/domain/sleep_timer/sleep_timer_config.dart';
import 'package:vyplay/domain/settings/settings_service.dart';

part 'settings_event.freezed.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.initialize() = _Initialize;
  const factory SettingsEvent.selectDefaultLanguage({required String language}) = SelectDefaultLanguage;
  const factory SettingsEvent.selectDefaultQuality({required String quality}) = SelectDefaultQuality;
  const factory SettingsEvent.selectRegion({required String region}) = SelectRegion;
  const factory SettingsEvent.setTheme({required String themeMode}) = SetTheme;
  const factory SettingsEvent.toggleHistoryVisibility({required bool isHistoryVisible}) = ToggleHistoryVisibility;
  const factory SettingsEvent.toggleDislikeVisibility({required bool isDislikeVisible}) = ToggleDislikeVisibility;
  const factory SettingsEvent.toggleHlsPlayer({required bool isHlsPlayer}) = ToggleHlsPlayer;
  const factory SettingsEvent.toggleHideComments({required bool isHideComments}) = ToggleHideComments;
  const factory SettingsEvent.toggleHideRelatedVideos({required bool isHideRelated}) = ToggleHideRelatedVideos;
  const factory SettingsEvent.setInstance({required String instanceApi}) = SetInstance;
  const factory SettingsEvent.setTYService({required YouTubeServices service}) = SetTYService;
  const factory SettingsEvent.togglePipPlayer({required bool isPipDisabled}) = TogglePipPlayer;
  const factory SettingsEvent.setSearchFilter({required String filter}) = SetSearchFilter;
  const factory SettingsEvent.setVideoFitMode({required String fitMode}) = SetVideoFitMode;
  const factory SettingsEvent.setSkipInterval({required int seconds}) = SetSkipInterval;
  const factory SettingsEvent.toggleSponsorBlock({required bool isEnabled}) = ToggleSponsorBlock;
  const factory SettingsEvent.setSponsorBlockCategories({required List<String> categories}) = SetSponsorBlockCategories;
  const factory SettingsEvent.toggleOpenLinksInBrowser({required bool openInBrowser}) = ToggleOpenLinksInBrowser;
  const factory SettingsEvent.setHomeFeedMode({required String mode}) = SetHomeFeedMode;
  const factory SettingsEvent.toggleAudioFocus({required bool isEnabled}) = ToggleAudioFocus;
  const factory SettingsEvent.addProfile({required String profileName}) = AddProfile;
  const factory SettingsEvent.deleteProfile({required String profileName}) = DeleteProfile;
  const factory SettingsEvent.switchProfile({required String profileName}) = SwitchProfile;
  const factory SettingsEvent.renameProfile({required String oldName, required String newName}) = RenameProfile;
  const factory SettingsEvent.exportSubscriptions({String profileName = 'default'}) = ExportSubscriptions;
  const factory SettingsEvent.importSubscriptions({required String filePath, String profileName}) = ImportSubscriptions;
  const factory SettingsEvent.setSubtitleSize({required double size}) = SetSubtitleSize;
  const factory SettingsEvent.toggleSearchHistoryEnabled({required bool isEnabled}) = ToggleSearchHistoryEnabled;
  const factory SettingsEvent.toggleSearchHistoryVisibility({required bool isVisible}) = ToggleSearchHistoryVisibility;
  const factory SettingsEvent.toggleAutoPip({required bool isEnabled}) = ToggleAutoPip;
  
  // Sleep Timer events
  const factory SettingsEvent.setSleepTimerConfig({required SleepTimerConfig config}) = SetSleepTimer;
  const factory SettingsEvent.clearSleepTimer() = ClearSleepTimer;
  
  // Swipe Gestures
  const factory SettingsEvent.toggleSwipeGestures({required bool enabled}) = ToggleSwipeGestures;
  
  // DeArrow
  const factory SettingsEvent.toggleDeArrow({required bool enabled}) = ToggleDeArrow;
  
  // Playlist Bookmarks
  const factory SettingsEvent.toggleBookmarks({required bool enabled}) = ToggleBookmarks;
  const factory SettingsEvent.toggleBookmarkPlaylist({required String playlistId, required bool bookmarked}) = ToggleBookmarkPlaylist;
  
  // Content Filtering
  const factory SettingsEvent.toggleRestrictedMode({required bool enabled}) = ToggleRestrictedMode;
  
  // Mini Player
  const factory SettingsEvent.toggleMiniPlayer({required bool enabled}) = ToggleMiniPlayer;
  
  // Download Preferences
  const factory SettingsEvent.setDownloadQuality({required String quality}) = SetDownloadQuality;
  const factory SettingsEvent.toggleDownloadSubtitles({required bool enabled}) = ToggleDownloadSubtitles;
  const factory SettingsEvent.toggleDownloadOverWifiOnly({required bool enabled}) = ToggleDownloadOverWifiOnly;
  const factory SettingsEvent.toggleDownloadAutoDelete({required bool enabled}) = ToggleDownloadAutoDelete;
  
  // Playback speed
  const factory SettingsEvent.setPlaybackSpeed({required double speed}) = SetPlaybackSpeed;
  
  // Autoplay next video
  const factory SettingsEvent.toggleAutoplayNextVideo({required bool enabled}) = ToggleAutoplayNextVideo;
  
  // Show related videos in queue
  const factory SettingsEvent.toggleShowRelatedInQueue({required bool enabled}) = ToggleShowRelatedInQueue;
  
  // Queue auto-dismiss time
  const factory SettingsEvent.setQueueDismissTime({required int seconds}) = SetQueueDismissTime;
  
  // Autoplay countdown
  const factory SettingsEvent.setAutoplayCountdown({required int seconds}) = SetAutoplayCountdown;
  
  // Disable autoplay on cellular
  const factory SettingsEvent.toggleDisableAutoplayOnCellular({required bool enabled}) = ToggleDisableAutoplayOnCellular;
  
  // Auto-queue
  const factory SettingsEvent.toggleAutoQueue({required bool enabled}) = ToggleAutoQueue;
  
  // Buffer preloading
  const factory SettingsEvent.toggleBufferPreload({required bool enabled}) = ToggleBufferPreload;
  
  // Video quality auto-adjust
  const factory SettingsEvent.toggleAutoQualityAdjust({required bool enabled}) = ToggleAutoQualityAdjust;
  
  // Background playback
  const factory SettingsEvent.toggleBackgroundPlayback({required bool enabled}) = ToggleBackgroundPlayback;
  
  // Notification controls
  const factory SettingsEvent.toggleNotificationControls({required bool enabled}) = ToggleNotificationControls;
  
  // Data saver mode
  const factory SettingsEvent.toggleDataSaver({required bool enabled}) = ToggleDataSaver;
  
  // Hide watched videos in feeds
  const factory SettingsEvent.toggleHideWatchedVideos({required bool enabled}) = ToggleHideWatchedVideos;
  
  // Quality for mobile data
  const factory SettingsEvent.setMobileDataQuality({required int quality}) = SetMobileDataQuality;
  
  // Download items in queue
  const factory SettingsEvent.toggleDownloadQueueItems({required bool enabled}) = ToggleDownloadQueueItems;
  
  // Rich caption rendering
  const factory SettingsEvent.toggleRichCaptionRendering({required bool enabled}) = ToggleRichCaptionRendering;
  
  // Bilibili video support
  const factory SettingsEvent.toggleBilibiliEnabled({required bool enabled}) = ToggleBilibiliEnabled;
  
  // Content swipe direction
  const factory SettingsEvent.setSwipeDirection({required bool leftToRight}) = SetSwipeDirection;
}
