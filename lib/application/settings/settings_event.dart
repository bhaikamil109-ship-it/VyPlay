part of 'settings_bloc.dart';

@freezed
sealed class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.initialize() = InitializeSettings;
  const factory SettingsEvent.getDefaultLanguage({required String language}) =
      GetDefaultLanguage;
  const factory SettingsEvent.getDefaultQuality({required String quality}) =
      GetDefaultQuality;
  const factory SettingsEvent.getDefaultRegion({required String region}) =
      GetDefaultRegion;
  const factory SettingsEvent.changeTheme({required String themeMode}) =
      ChangeTheme;
  const factory SettingsEvent.toggleHistoryVisibility(
      {required bool isHistoryVisible}) = ToggleHistoryVisibility;
  const factory SettingsEvent.toggleDislikeVisibility(
      {required bool isDislikeVisible}) = ToggleDislikeVisibility;
  const factory SettingsEvent.toggleHlsPlayer({required bool isHlsPlayer}) =
      ToggleHlsPlayer;
  const factory SettingsEvent.toggleCommentVisibility(
      {required bool isHideComments}) = ToggleCommentVisibility;
  const factory SettingsEvent.toggleRelatedVideoVisibility(
      {required bool isHideRelated}) = ToggleRelatedVideoVisibility;
  const factory SettingsEvent.setInstance({required String instanceApi}) =
      SetInstance;
  const factory SettingsEvent.setYTService({required YouTubeServices service}) =
      SetYTService;
  const factory SettingsEvent.togglePipPlayer({required bool isPipDisabled}) =
      TogglePipPlayer;
  const factory SettingsEvent.setSearchFilter({required String filter}) =
      SetSearchFilter;
  const factory SettingsEvent.setVideoFitMode({required String fitMode}) =
      SetVideoFitMode;
  const factory SettingsEvent.setSkipInterval({required int seconds}) =
      SetSkipInterval;
  const factory SettingsEvent.toggleSponsorBlock({required bool isEnabled}) =
      ToggleSponsorBlock;
  const factory SettingsEvent.setSponsorBlockCategories(
      {required List<String> categories}) = SetSponsorBlockCategories;
  const factory SettingsEvent.toggleOpenLinksInBrowser(
      {required bool openInBrowser}) = ToggleOpenLinksInBrowser;
  const factory SettingsEvent.setHomeFeedMode({required String mode}) =
      SetHomeFeedMode;
  const factory SettingsEvent.toggleAudioFocus({required bool isEnabled}) =
      ToggleAudioFocus;
  const factory SettingsEvent.addProfile({required String profileName}) =
      AddProfile;
  const factory SettingsEvent.deleteProfile({required String profileName}) =
      DeleteProfile;
  const factory SettingsEvent.switchProfile({required String profileName}) =
      SwitchProfile;
  const factory SettingsEvent.renameProfile(
      {required String oldName, required String newName}) = RenameProfile;
  const factory SettingsEvent.exportSubscriptions(
      {@Default('default') String profileName}) = ExportSubscriptions;
  const factory SettingsEvent.importSubscriptions(
      {required String filePath,
      @Default('default') String profileName}) = ImportSubscriptions;
  const factory SettingsEvent.setSubtitleSize({required double size}) =
      SetSubtitleSize;
  const factory SettingsEvent.toggleSearchHistoryEnabled(
      {required bool isEnabled}) = ToggleSearchHistoryEnabled;
  const factory SettingsEvent.toggleSearchHistoryVisibility(
      {required bool isVisible}) = ToggleSearchHistoryVisibility;
  const factory SettingsEvent.toggleAutoPip({required bool isEnabled}) =
      ToggleAutoPip;

  // Instance lists
  const factory SettingsEvent.fetchPipedInstances(
      {@Default(false) bool forceRefresh}) = FetchPipedInstances;
  const factory SettingsEvent.fetchInvidiousInstances(
      {@Default(false) bool forceRefresh}) = FetchInvidiousInstances;
  const factory SettingsEvent.setLastExportedFilePath(
      {required String? filePath}) = SetLastExportedFilePath;

  // Sleep Timer events
  const factory SettingsEvent.setSleepTimer({required int seconds}) =
      SetSleepTimer;
  const factory SettingsEvent.clearSleepTimer() = ClearSleepTimer;

  // Swipe Gestures
  const factory SettingsEvent.toggleSwipeGestures({required bool enabled}) =
      ToggleSwipeGestures;

  // DeArrow
  const factory SettingsEvent.toggleDeArrow({required bool enabled}) =
      ToggleDeArrow;

  // Playlist Bookmarks
  const factory SettingsEvent.bookmarksToggled({required bool enabled}) =
      ToggleBookmarks;
  const factory SettingsEvent.toggleBookmarkPlaylist(
      {required String playlistId,
      required bool bookmarked}) = ToggleBookmarkPlaylist;

  // Content Filtering
  const factory SettingsEvent.restrictedModeToggled({required bool enabled}) =
      ToggleRestrictedMode;

  // Mini Player
  const factory SettingsEvent.miniPlayerToggled({required bool enabled}) =
      ToggleMiniPlayer;

  // Download Preferences
  const factory SettingsEvent.downloadQualityChanged({required String quality}) =
      SetDownloadQuality;
  const factory SettingsEvent.downloadSubtitlesToggled({required bool enabled}) =
      ToggleDownloadSubtitles;
  const factory SettingsEvent.downloadOverWifiOnlyToggled(
      {required bool enabled}) = ToggleDownloadOverWifiOnly;
  const factory SettingsEvent.downloadAutoDeleteToggled(
      {required bool enabled}) = ToggleDownloadAutoDelete;

  // Playback speed
  const factory SettingsEvent.setPlaybackSpeed({required double speed}) =
      SetPlaybackSpeed;

  // Autoplay next video
  const factory SettingsEvent.toggleAutoplayNextVideo({required bool enabled}) =
      ToggleAutoplayNextVideo;

  // Show related videos in queue
  const factory SettingsEvent.toggleShowRelatedInQueue(
      {required bool enabled}) = ToggleShowRelatedInQueue;

  // Queue auto-dismiss time
  const factory SettingsEvent.setQueueDismissTime({required int seconds}) =
      SetQueueDismissTime;

  // Autoplay countdown
  const factory SettingsEvent.setAutoplayCountdown({required int seconds}) =
      SetAutoplayCountdown;

  // Disable autoplay on cellular
  const factory SettingsEvent.toggleDisableAutoplayOnCellular(
      {required bool enabled}) = ToggleDisableAutoplayOnCellular;

  // Auto-queue
  const factory SettingsEvent.toggleAutoQueue({required bool enabled}) =
      ToggleAutoQueue;

  // Buffer preloading
  const factory SettingsEvent.toggleBufferPreload({required bool enabled}) =
      ToggleBufferPreload;

  // Video quality auto-adjust
  const factory SettingsEvent.toggleAutoQualityAdjust(
      {required bool enabled}) = ToggleAutoQualityAdjust;

  // Background playback
  const factory SettingsEvent.toggleBackgroundPlayback(
      {required bool enabled}) = ToggleBackgroundPlayback;

  // Notification controls
  const factory SettingsEvent.toggleNotificationControls(
      {required bool enabled}) = ToggleNotificationControls;

  // Data saver mode
  const factory SettingsEvent.toggleDataSaver({required bool enabled}) =
      ToggleDataSaver;

  // Hide watched videos in feeds
  const factory SettingsEvent.toggleHideWatchedVideos(
      {required bool enabled}) = ToggleHideWatchedVideos;

  // Quality for mobile data
  const factory SettingsEvent.setMobileDataQuality({required int quality}) =
      SetMobileDataQuality;

  // Download items in queue
  const factory SettingsEvent.toggleDownloadQueueItems(
      {required bool enabled}) = ToggleDownloadQueueItems;

  // Rich caption rendering
  const factory SettingsEvent.toggleRichCaptionRendering(
      {required bool enabled}) = ToggleRichCaptionRendering;

  // Bilibili video support
  const factory SettingsEvent.toggleBilibiliEnabled({required bool enabled}) =
      ToggleBilibiliEnabled;

  // Content swipe direction
  const factory SettingsEvent.setSwipeDirection({required bool leftToRight}) =
      SetSwipeDirection;

  // YouTube service switch
  const factory SettingsEvent.setYoutubeService({required String service}) =
      SetYoutubeService;

  // Playlist bookmarks selection
  const factory SettingsEvent.bookmarksApplied(
      {required List<String> selectedPlaylists}) = BookmarksApplied;

  // Restricted mode filter strictness
  const factory SettingsEvent.restrictedModeFilterChanged(
      {required RestrictedModeFilterLevel level}) = RestrictedModeFilterChanged;

  // Mini player expansion behaviour
  const factory SettingsEvent.miniPlayerAutoExpandChanged(
      {required bool enabled}) = MiniPlayerAutoExpandChanged;
  const factory SettingsEvent.miniPlayerTapToExpandChanged(
      {required bool enabled}) = MiniPlayerTapToExpandChanged;
  const factory SettingsEvent.miniPlayerDoubleTapToExpandChanged(
      {required bool enabled}) = MiniPlayerDoubleTapToExpandChanged;

  // Download auto-delete retention
  const factory SettingsEvent.downloadAutoDeleteDaysChanged({required int days}) =
      DownloadAutoDeleteDaysChanged;

  // Advanced content filter
  const factory SettingsEvent.contentFilterKeywordsChanged(
      {required List<String> keywords}) = ContentFilterKeywordsChanged;
  const factory SettingsEvent.contentFilterChannelsChanged(
      {required List<String> channelIds}) = ContentFilterChannelsChanged;
  const factory SettingsEvent.contentFilterHideShortsChanged(
      {required bool enabled}) = ContentFilterHideShortsChanged;
  const factory SettingsEvent.contentFilterHidePaidChanged(
      {required bool enabled}) = ContentFilterHidePaidChanged;

  // Download folder (removable/SD storage aware)
  const factory SettingsEvent.downloadFolderChanged({String? path}) =
      DownloadFolderChanged;

  // Return YouTube Dislike fallback
  const factory SettingsEvent.rydToggled({required bool enabled}) = ToggleRyd;
}
