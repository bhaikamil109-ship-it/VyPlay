part of 'settings_bloc.dart';

@freezed
sealed class SettingsState with _$SettingsState {
  const factory SettingsState({
    required String defaultLanguage,
    required String defaultQuality,
    required String defaultRegion,
    required String themeMode,
    required String? version,
    required bool isHistoryVisible,
    required bool isDislikeVisible,
    required bool isHlsPlayer,
    required bool isHideComments,
    required bool isHideRelated,
    required List<Instance> pipedInstances,
    required ApiStatus pipedInstanceStatus,
    required String instance,
    required List<Instance> invidiousInstances,
    required ApiStatus invidiousInstanceStatus,
    required String ytService,
    required bool initialized,
    required ApiStatus settingsStatus,
    required bool isPipDisabled,
    // Connection status tracking for UI feedback
    required String? connectingToInstance,
    required bool isTestingConnection,
    // Track if user's preferred instance failed (for showing snackbar)
    required bool userInstanceFailed,
    required String? failedInstanceName,
    // Search filter
    required String searchFilter,
    // Video fit mode (contain, cover, fill, fitWidth, fitHeight)
    required String videoFitMode,
    // Skip interval in seconds (for double-tap skip)
    required int skipInterval,
    // SponsorBlock settings
    required bool isSponsorBlockEnabled,
    required List<String> sponsorBlockCategories,
    // Open links in external browser
    required bool openLinksInBrowser,
    // Home feed display mode
    required String homeFeedMode,
    // Audio focus / pause on interruption
    required bool isAudioFocusEnabled,
    // Profiles
    required String currentProfile,
    required List<String> profiles,
    // Subtitle size (font size in pixels)
    required double subtitleSize,
    // Last exported file path (for sharing)
    required String? lastExportedFilePath,
    // Search history privacy
    required bool isSearchHistoryEnabled,
    required bool isSearchHistoryVisible,
    // Auto PiP (enter PiP when pressing home button while video is playing)
    required bool isAutoPipEnabled,
    SleepTimerConfig? sleepTimerConfig,
    bool? isSwipeGesturesEnabled,
    bool? isDeArrowEnabled,
    bool? isBookmarksEnabled,
    List<String>? bookmarkedPlaylists,
    bool? isRestrictedModeEnabled,
    bool? isMiniPlayerEnabled,
    String? downloadQuality,
    bool? isDownloadSubtitlesEnabled,
    bool? isDownloadOverWifiOnlyEnabled,
    bool? isDownloadAutoDeleteEnabled,
    double? playbackSpeed,
    bool? isAutoplayNextVideoEnabled,
    bool? isShowRelatedInQueueEnabled,
    int? queueDismissTime,
    int? autoplayCountdown,
    bool? isDisableAutoplayOnCellularEnabled,
    bool? isAutoQueueEnabled,
    bool? isBufferPreloadEnabled,
    bool? isAutoQualityAdjustEnabled,
    bool? isBackgroundPlaybackEnabled,
    bool? isNotificationControlsEnabled,
    bool? isDataSaverEnabled,
    bool? isHideWatchedVideosEnabled,
    int? mobileDataQuality,
    bool? isDownloadQueueItemsEnabled,
    bool? isRichCaptionRenderingEnabled,
    bool? isBilibiliEnabled,
    bool? isSwipeLeftToRight,
    bool? isMiniPlayerAutoExpandEnabled,
    bool? isMiniPlayerTapToExpandEnabled,
    bool? isMiniPlayerDoubleTapToExpandEnabled,
    RestrictedModeFilterLevel? restrictedModeFilterLevel,
    int? downloadAutoDeleteDays,
    List<String>? contentFilterKeywords,
    List<String>? contentFilterBlockedChannels,
    bool? contentFilterHideShorts,
    bool? contentFilterHidePaid,
    String? downloadFolderPath,
    bool? isRydEnabled,
    // Phase 18
    bool? isLongPressSpeedUpEnabled,
    bool? isOriginalTitlesEnabled,
    bool? isCommentFilterEnabled,
    List<String>? commentFilterKeywords,
    String? preferredAudioQuality,
    bool? isScreenLockEnabled,
    bool? isPinchToZoomEnabled,
    bool? isSeekbarThumbnailsEnabled,
    bool? isPopupPlayerEnabled,
    bool? isLiveChatDanmakuEnabled,
    bool? isBluetoothSeekEnabled,
    bool? isMultiSelectListsEnabled,
    bool? isSbExclusiveMarkerEnabled,
    bool? isSbForDownloadsEnabled,
  }) = _Initial;

  const SettingsState._();

  factory SettingsState.initialize() => SettingsState(
        defaultLanguage: 'en',
        defaultQuality: '720p',
        defaultRegion: 'IN',
        themeMode: 'system',
        version: "",
        isHistoryVisible: true,
        isDislikeVisible: false,
        isHlsPlayer: false,
        isHideComments: false,
        isHideRelated: false,
        pipedInstances: [],
        pipedInstanceStatus: ApiStatus.initial,
        // set by home (commom for piped and invidious)
        instance: BaseUrl.kBaseUrl,
        invidiousInstances: [],
        invidiousInstanceStatus: ApiStatus.initial,
        ytService: YouTubeServices.newpipe.name,
        initialized: false,
        settingsStatus: ApiStatus.initial,
        isPipDisabled: false,
        connectingToInstance: null,
        isTestingConnection: false,
        userInstanceFailed: false,
        failedInstanceName: null,
        // New settings
        searchFilter: 'all',
        videoFitMode: 'contain',
        skipInterval: 10,
        isSponsorBlockEnabled: false,
        sponsorBlockCategories: ['sponsor', 'intro', 'outro', 'selfpromo'],
        openLinksInBrowser: false,
        homeFeedMode: HomeFeedMode.feedOrTrending.name,
        isAudioFocusEnabled: true,
        currentProfile: 'default',
        profiles: ['default'],
        subtitleSize: 32.0,
        lastExportedFilePath: null,
        isSearchHistoryEnabled: true,
        isSearchHistoryVisible: true,
        isAutoPipEnabled: true,
        sleepTimerConfig: null,
        isSwipeGesturesEnabled: true,
        isDeArrowEnabled: false,
        isBookmarksEnabled: true,
        bookmarkedPlaylists: [],
        isRestrictedModeEnabled: false,
        isMiniPlayerEnabled: true,
        downloadQuality: '720p',
        isDownloadSubtitlesEnabled: true,
        isDownloadOverWifiOnlyEnabled: false,
        isDownloadAutoDeleteEnabled: false,
        playbackSpeed: 1.0,
        isAutoplayNextVideoEnabled: true,
        isShowRelatedInQueueEnabled: true,
        queueDismissTime: 30,
        autoplayCountdown: 5,
        isDisableAutoplayOnCellularEnabled: false,
        isAutoQueueEnabled: true,
        isBufferPreloadEnabled: true,
        isAutoQualityAdjustEnabled: false,
        isBackgroundPlaybackEnabled: true,
        isNotificationControlsEnabled: true,
        isDataSaverEnabled: false,
        isHideWatchedVideosEnabled: false,
        mobileDataQuality: 360,
        isDownloadQueueItemsEnabled: false,
        isRichCaptionRenderingEnabled: false,
        isBilibiliEnabled: false,
        isSwipeLeftToRight: false,
        isMiniPlayerAutoExpandEnabled: true,
        isMiniPlayerTapToExpandEnabled: true,
        isMiniPlayerDoubleTapToExpandEnabled: false,
        restrictedModeFilterLevel: RestrictedModeFilterLevel.standard,
        downloadAutoDeleteDays: 7,
        contentFilterKeywords: const [],
        contentFilterBlockedChannels: const [],
        contentFilterHideShorts: false,
        contentFilterHidePaid: false,
        downloadFolderPath: null,
        isRydEnabled: true,
        isLongPressSpeedUpEnabled: false,
        isOriginalTitlesEnabled: false,
        isCommentFilterEnabled: false,
        commentFilterKeywords: const [],
        preferredAudioQuality: 'auto',
        isScreenLockEnabled: false,
        isPinchToZoomEnabled: false,
        isSeekbarThumbnailsEnabled: true,
        isPopupPlayerEnabled: false,
        isLiveChatDanmakuEnabled: false,
        isBluetoothSeekEnabled: true,
        isMultiSelectListsEnabled: false,
        isSbExclusiveMarkerEnabled: false,
        isSbForDownloadsEnabled: false,
      );

  /// Playlist bookmark preferences derived from the persisted state.
  BookmarksConfig? get bookmarksConfig => BookmarksConfig(
        enabled: isBookmarksEnabled ?? false,
        selectedPlaylists: bookmarkedPlaylists ?? const [],
      );

  /// Restricted mode preferences derived from the persisted state.
  RestrictedModeConfig? get restrictedModeConfig => RestrictedModeConfig(
        enabled: isRestrictedModeEnabled ?? false,
        filterLevel:
            restrictedModeFilterLevel ?? RestrictedModeFilterLevel.standard,
      );

  /// Advanced content filter derived from the persisted state.
  ContentFilterConfig? get contentFilterConfig => ContentFilterConfig(
        keywords: contentFilterKeywords ?? const [],
        blockedChannelIds: contentFilterBlockedChannels ?? const [],
        hideShorts: contentFilterHideShorts ?? false,
        hidePaidPromotions: contentFilterHidePaid ?? false,
      );

  /// Mini player preferences derived from the persisted state.
  MiniPlayerConfig? get miniPlayerConfig => MiniPlayerConfig(
        enabled: isMiniPlayerEnabled ?? false,
        autoExpand: isMiniPlayerAutoExpandEnabled ?? true,
        tapToExpand: isMiniPlayerTapToExpandEnabled ?? true,
        doubleTapToExpand: isMiniPlayerDoubleTapToExpandEnabled ?? false,
      );

  /// Download preferences derived from the persisted state.
  DownloadPreferencesConfig? get downloadPreferencesConfig =>
      DownloadPreferencesConfig(
        downloadQuality: _downloadQualityFromSetting(downloadQuality),
        includeSubtitles: isDownloadSubtitlesEnabled ?? false,
        overWifiOnly: isDownloadOverWifiOnlyEnabled ?? true,
        autoDelete: isDownloadAutoDeleteEnabled ?? false,
        autoDeleteDays: downloadAutoDeleteDays ?? 7,
      );
}

/// Maps a persisted download quality setting to its enum value.
DownloadQuality _downloadQualityFromSetting(String? quality) {
  switch (quality) {
    case 'low':
    case '144p':
    case '240p':
    case '360p':
      return DownloadQuality.low;
    case 'medium':
    case '480p':
      return DownloadQuality.medium;
    case 'high':
    case '720p':
    case '1080p':
      return DownloadQuality.high;
    default:
      return DownloadQuality.high;
  }
}
