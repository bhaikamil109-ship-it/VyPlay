// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsEvent()';
  }
}

/// @nodoc
class $SettingsEventCopyWith<$Res> {
  $SettingsEventCopyWith(SettingsEvent _, $Res Function(SettingsEvent) __);
}

/// Adds pattern-matching-related methods to [SettingsEvent].
extension SettingsEventPatterns on SettingsEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeSettings value)? initialize,
    TResult Function(GetDefaultLanguage value)? getDefaultLanguage,
    TResult Function(GetDefaultQuality value)? getDefaultQuality,
    TResult Function(GetDefaultRegion value)? getDefaultRegion,
    TResult Function(ChangeTheme value)? changeTheme,
    TResult Function(ToggleHistoryVisibility value)? toggleHistoryVisibility,
    TResult Function(ToggleDislikeVisibility value)? toggleDislikeVisibility,
    TResult Function(ToggleHlsPlayer value)? toggleHlsPlayer,
    TResult Function(ToggleCommentVisibility value)? toggleCommentVisibility,
    TResult Function(ToggleRelatedVideoVisibility value)?
        toggleRelatedVideoVisibility,
    TResult Function(SetInstance value)? setInstance,
    TResult Function(SetYTService value)? setYTService,
    TResult Function(TogglePipPlayer value)? togglePipPlayer,
    TResult Function(SetSearchFilter value)? setSearchFilter,
    TResult Function(SetVideoFitMode value)? setVideoFitMode,
    TResult Function(SetSkipInterval value)? setSkipInterval,
    TResult Function(ToggleSponsorBlock value)? toggleSponsorBlock,
    TResult Function(SetSponsorBlockCategories value)?
        setSponsorBlockCategories,
    TResult Function(ToggleOpenLinksInBrowser value)? toggleOpenLinksInBrowser,
    TResult Function(SetHomeFeedMode value)? setHomeFeedMode,
    TResult Function(ToggleAudioFocus value)? toggleAudioFocus,
    TResult Function(AddProfile value)? addProfile,
    TResult Function(DeleteProfile value)? deleteProfile,
    TResult Function(SwitchProfile value)? switchProfile,
    TResult Function(RenameProfile value)? renameProfile,
    TResult Function(ExportSubscriptions value)? exportSubscriptions,
    TResult Function(ImportSubscriptions value)? importSubscriptions,
    TResult Function(SetSubtitleSize value)? setSubtitleSize,
    TResult Function(ToggleSearchHistoryEnabled value)?
        toggleSearchHistoryEnabled,
    TResult Function(ToggleSearchHistoryVisibility value)?
        toggleSearchHistoryVisibility,
    TResult Function(ToggleAutoPip value)? toggleAutoPip,
    TResult Function(FetchPipedInstances value)? fetchPipedInstances,
    TResult Function(FetchInvidiousInstances value)? fetchInvidiousInstances,
    TResult Function(SetLastExportedFilePath value)? setLastExportedFilePath,
    TResult Function(SetSleepTimer value)? setSleepTimer,
    TResult Function(ClearSleepTimer value)? clearSleepTimer,
    TResult Function(ToggleSwipeGestures value)? toggleSwipeGestures,
    TResult Function(ToggleDeArrow value)? toggleDeArrow,
    TResult Function(ToggleBookmarks value)? bookmarksToggled,
    TResult Function(ToggleBookmarkPlaylist value)? toggleBookmarkPlaylist,
    TResult Function(ToggleRestrictedMode value)? restrictedModeToggled,
    TResult Function(ToggleMiniPlayer value)? miniPlayerToggled,
    TResult Function(SetDownloadQuality value)? downloadQualityChanged,
    TResult Function(ToggleDownloadSubtitles value)? downloadSubtitlesToggled,
    TResult Function(ToggleDownloadOverWifiOnly value)?
        downloadOverWifiOnlyToggled,
    TResult Function(ToggleDownloadAutoDelete value)? downloadAutoDeleteToggled,
    TResult Function(SetPlaybackSpeed value)? setPlaybackSpeed,
    TResult Function(ToggleAutoplayNextVideo value)? toggleAutoplayNextVideo,
    TResult Function(ToggleShowRelatedInQueue value)? toggleShowRelatedInQueue,
    TResult Function(SetQueueDismissTime value)? setQueueDismissTime,
    TResult Function(SetAutoplayCountdown value)? setAutoplayCountdown,
    TResult Function(ToggleDisableAutoplayOnCellular value)?
        toggleDisableAutoplayOnCellular,
    TResult Function(ToggleAutoQueue value)? toggleAutoQueue,
    TResult Function(ToggleBufferPreload value)? toggleBufferPreload,
    TResult Function(ToggleAutoQualityAdjust value)? toggleAutoQualityAdjust,
    TResult Function(ToggleBackgroundPlayback value)? toggleBackgroundPlayback,
    TResult Function(ToggleNotificationControls value)?
        toggleNotificationControls,
    TResult Function(ToggleDataSaver value)? toggleDataSaver,
    TResult Function(ToggleHideWatchedVideos value)? toggleHideWatchedVideos,
    TResult Function(SetMobileDataQuality value)? setMobileDataQuality,
    TResult Function(ToggleDownloadQueueItems value)? toggleDownloadQueueItems,
    TResult Function(ToggleRichCaptionRendering value)?
        toggleRichCaptionRendering,
    TResult Function(ToggleBilibiliEnabled value)? toggleBilibiliEnabled,
    TResult Function(SetSwipeDirection value)? setSwipeDirection,
    TResult Function(SetYoutubeService value)? setYoutubeService,
    TResult Function(BookmarksApplied value)? bookmarksApplied,
    TResult Function(RestrictedModeFilterChanged value)?
        restrictedModeFilterChanged,
    TResult Function(MiniPlayerAutoExpandChanged value)?
        miniPlayerAutoExpandChanged,
    TResult Function(MiniPlayerTapToExpandChanged value)?
        miniPlayerTapToExpandChanged,
    TResult Function(MiniPlayerDoubleTapToExpandChanged value)?
        miniPlayerDoubleTapToExpandChanged,
    TResult Function(DownloadAutoDeleteDaysChanged value)?
        downloadAutoDeleteDaysChanged,
    TResult Function(ContentFilterKeywordsChanged value)?
        contentFilterKeywordsChanged,
    TResult Function(ContentFilterChannelsChanged value)?
        contentFilterChannelsChanged,
    TResult Function(ContentFilterHideShortsChanged value)?
        contentFilterHideShortsChanged,
    TResult Function(ContentFilterHidePaidChanged value)?
        contentFilterHidePaidChanged,
    TResult Function(DownloadFolderChanged value)? downloadFolderChanged,
    TResult Function(ToggleRyd value)? rydToggled,
    TResult Function(ToggleLongPressSpeedUp value)? toggleLongPressSpeedUp,
    TResult Function(ToggleOriginalTitles value)? toggleOriginalTitles,
    TResult Function(ToggleCommentFilter value)? toggleCommentFilter,
    TResult Function(SetCommentFilterKeywords value)? setCommentFilterKeywords,
    TResult Function(SetPreferredAudioQuality value)? setPreferredAudioQuality,
    TResult Function(ToggleScreenLock value)? toggleScreenLock,
    TResult Function(TogglePinchToZoom value)? togglePinchToZoom,
    TResult Function(ToggleSeekbarThumbnails value)? toggleSeekbarThumbnails,
    TResult Function(TogglePopupPlayer value)? togglePopupPlayer,
    TResult Function(ToggleLiveChatDanmaku value)? toggleLiveChatDanmaku,
    TResult Function(ToggleBluetoothSeek value)? toggleBluetoothSeek,
    TResult Function(ToggleMultiSelectLists value)? toggleMultiSelectLists,
    TResult Function(ToggleSbExclusiveMarker value)? toggleSbExclusiveMarker,
    TResult Function(ToggleSbForDownloads value)? toggleSbForDownloads,
    TResult Function(SetYoutubeCookie value)? setYoutubeCookie,
    TResult Function(ClearYoutubeCookie value)? clearYoutubeCookie,
    TResult Function(SavePipedSession value)? savePipedSession,
    TResult Function(ClearPipedSession value)? clearPipedSession,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case InitializeSettings() when initialize != null:
        return initialize(_that);
      case GetDefaultLanguage() when getDefaultLanguage != null:
        return getDefaultLanguage(_that);
      case GetDefaultQuality() when getDefaultQuality != null:
        return getDefaultQuality(_that);
      case GetDefaultRegion() when getDefaultRegion != null:
        return getDefaultRegion(_that);
      case ChangeTheme() when changeTheme != null:
        return changeTheme(_that);
      case ToggleHistoryVisibility() when toggleHistoryVisibility != null:
        return toggleHistoryVisibility(_that);
      case ToggleDislikeVisibility() when toggleDislikeVisibility != null:
        return toggleDislikeVisibility(_that);
      case ToggleHlsPlayer() when toggleHlsPlayer != null:
        return toggleHlsPlayer(_that);
      case ToggleCommentVisibility() when toggleCommentVisibility != null:
        return toggleCommentVisibility(_that);
      case ToggleRelatedVideoVisibility()
          when toggleRelatedVideoVisibility != null:
        return toggleRelatedVideoVisibility(_that);
      case SetInstance() when setInstance != null:
        return setInstance(_that);
      case SetYTService() when setYTService != null:
        return setYTService(_that);
      case TogglePipPlayer() when togglePipPlayer != null:
        return togglePipPlayer(_that);
      case SetSearchFilter() when setSearchFilter != null:
        return setSearchFilter(_that);
      case SetVideoFitMode() when setVideoFitMode != null:
        return setVideoFitMode(_that);
      case SetSkipInterval() when setSkipInterval != null:
        return setSkipInterval(_that);
      case ToggleSponsorBlock() when toggleSponsorBlock != null:
        return toggleSponsorBlock(_that);
      case SetSponsorBlockCategories() when setSponsorBlockCategories != null:
        return setSponsorBlockCategories(_that);
      case ToggleOpenLinksInBrowser() when toggleOpenLinksInBrowser != null:
        return toggleOpenLinksInBrowser(_that);
      case SetHomeFeedMode() when setHomeFeedMode != null:
        return setHomeFeedMode(_that);
      case ToggleAudioFocus() when toggleAudioFocus != null:
        return toggleAudioFocus(_that);
      case AddProfile() when addProfile != null:
        return addProfile(_that);
      case DeleteProfile() when deleteProfile != null:
        return deleteProfile(_that);
      case SwitchProfile() when switchProfile != null:
        return switchProfile(_that);
      case RenameProfile() when renameProfile != null:
        return renameProfile(_that);
      case ExportSubscriptions() when exportSubscriptions != null:
        return exportSubscriptions(_that);
      case ImportSubscriptions() when importSubscriptions != null:
        return importSubscriptions(_that);
      case SetSubtitleSize() when setSubtitleSize != null:
        return setSubtitleSize(_that);
      case ToggleSearchHistoryEnabled() when toggleSearchHistoryEnabled != null:
        return toggleSearchHistoryEnabled(_that);
      case ToggleSearchHistoryVisibility()
          when toggleSearchHistoryVisibility != null:
        return toggleSearchHistoryVisibility(_that);
      case ToggleAutoPip() when toggleAutoPip != null:
        return toggleAutoPip(_that);
      case FetchPipedInstances() when fetchPipedInstances != null:
        return fetchPipedInstances(_that);
      case FetchInvidiousInstances() when fetchInvidiousInstances != null:
        return fetchInvidiousInstances(_that);
      case SetLastExportedFilePath() when setLastExportedFilePath != null:
        return setLastExportedFilePath(_that);
      case SetSleepTimer() when setSleepTimer != null:
        return setSleepTimer(_that);
      case ClearSleepTimer() when clearSleepTimer != null:
        return clearSleepTimer(_that);
      case ToggleSwipeGestures() when toggleSwipeGestures != null:
        return toggleSwipeGestures(_that);
      case ToggleDeArrow() when toggleDeArrow != null:
        return toggleDeArrow(_that);
      case ToggleBookmarks() when bookmarksToggled != null:
        return bookmarksToggled(_that);
      case ToggleBookmarkPlaylist() when toggleBookmarkPlaylist != null:
        return toggleBookmarkPlaylist(_that);
      case ToggleRestrictedMode() when restrictedModeToggled != null:
        return restrictedModeToggled(_that);
      case ToggleMiniPlayer() when miniPlayerToggled != null:
        return miniPlayerToggled(_that);
      case SetDownloadQuality() when downloadQualityChanged != null:
        return downloadQualityChanged(_that);
      case ToggleDownloadSubtitles() when downloadSubtitlesToggled != null:
        return downloadSubtitlesToggled(_that);
      case ToggleDownloadOverWifiOnly()
          when downloadOverWifiOnlyToggled != null:
        return downloadOverWifiOnlyToggled(_that);
      case ToggleDownloadAutoDelete() when downloadAutoDeleteToggled != null:
        return downloadAutoDeleteToggled(_that);
      case SetPlaybackSpeed() when setPlaybackSpeed != null:
        return setPlaybackSpeed(_that);
      case ToggleAutoplayNextVideo() when toggleAutoplayNextVideo != null:
        return toggleAutoplayNextVideo(_that);
      case ToggleShowRelatedInQueue() when toggleShowRelatedInQueue != null:
        return toggleShowRelatedInQueue(_that);
      case SetQueueDismissTime() when setQueueDismissTime != null:
        return setQueueDismissTime(_that);
      case SetAutoplayCountdown() when setAutoplayCountdown != null:
        return setAutoplayCountdown(_that);
      case ToggleDisableAutoplayOnCellular()
          when toggleDisableAutoplayOnCellular != null:
        return toggleDisableAutoplayOnCellular(_that);
      case ToggleAutoQueue() when toggleAutoQueue != null:
        return toggleAutoQueue(_that);
      case ToggleBufferPreload() when toggleBufferPreload != null:
        return toggleBufferPreload(_that);
      case ToggleAutoQualityAdjust() when toggleAutoQualityAdjust != null:
        return toggleAutoQualityAdjust(_that);
      case ToggleBackgroundPlayback() when toggleBackgroundPlayback != null:
        return toggleBackgroundPlayback(_that);
      case ToggleNotificationControls() when toggleNotificationControls != null:
        return toggleNotificationControls(_that);
      case ToggleDataSaver() when toggleDataSaver != null:
        return toggleDataSaver(_that);
      case ToggleHideWatchedVideos() when toggleHideWatchedVideos != null:
        return toggleHideWatchedVideos(_that);
      case SetMobileDataQuality() when setMobileDataQuality != null:
        return setMobileDataQuality(_that);
      case ToggleDownloadQueueItems() when toggleDownloadQueueItems != null:
        return toggleDownloadQueueItems(_that);
      case ToggleRichCaptionRendering() when toggleRichCaptionRendering != null:
        return toggleRichCaptionRendering(_that);
      case ToggleBilibiliEnabled() when toggleBilibiliEnabled != null:
        return toggleBilibiliEnabled(_that);
      case SetSwipeDirection() when setSwipeDirection != null:
        return setSwipeDirection(_that);
      case SetYoutubeService() when setYoutubeService != null:
        return setYoutubeService(_that);
      case BookmarksApplied() when bookmarksApplied != null:
        return bookmarksApplied(_that);
      case RestrictedModeFilterChanged()
          when restrictedModeFilterChanged != null:
        return restrictedModeFilterChanged(_that);
      case MiniPlayerAutoExpandChanged()
          when miniPlayerAutoExpandChanged != null:
        return miniPlayerAutoExpandChanged(_that);
      case MiniPlayerTapToExpandChanged()
          when miniPlayerTapToExpandChanged != null:
        return miniPlayerTapToExpandChanged(_that);
      case MiniPlayerDoubleTapToExpandChanged()
          when miniPlayerDoubleTapToExpandChanged != null:
        return miniPlayerDoubleTapToExpandChanged(_that);
      case DownloadAutoDeleteDaysChanged()
          when downloadAutoDeleteDaysChanged != null:
        return downloadAutoDeleteDaysChanged(_that);
      case ContentFilterKeywordsChanged()
          when contentFilterKeywordsChanged != null:
        return contentFilterKeywordsChanged(_that);
      case ContentFilterChannelsChanged()
          when contentFilterChannelsChanged != null:
        return contentFilterChannelsChanged(_that);
      case ContentFilterHideShortsChanged()
          when contentFilterHideShortsChanged != null:
        return contentFilterHideShortsChanged(_that);
      case ContentFilterHidePaidChanged()
          when contentFilterHidePaidChanged != null:
        return contentFilterHidePaidChanged(_that);
      case DownloadFolderChanged() when downloadFolderChanged != null:
        return downloadFolderChanged(_that);
      case ToggleRyd() when rydToggled != null:
        return rydToggled(_that);
      case ToggleLongPressSpeedUp() when toggleLongPressSpeedUp != null:
        return toggleLongPressSpeedUp(_that);
      case ToggleOriginalTitles() when toggleOriginalTitles != null:
        return toggleOriginalTitles(_that);
      case ToggleCommentFilter() when toggleCommentFilter != null:
        return toggleCommentFilter(_that);
      case SetCommentFilterKeywords() when setCommentFilterKeywords != null:
        return setCommentFilterKeywords(_that);
      case SetPreferredAudioQuality() when setPreferredAudioQuality != null:
        return setPreferredAudioQuality(_that);
      case ToggleScreenLock() when toggleScreenLock != null:
        return toggleScreenLock(_that);
      case TogglePinchToZoom() when togglePinchToZoom != null:
        return togglePinchToZoom(_that);
      case ToggleSeekbarThumbnails() when toggleSeekbarThumbnails != null:
        return toggleSeekbarThumbnails(_that);
      case TogglePopupPlayer() when togglePopupPlayer != null:
        return togglePopupPlayer(_that);
      case ToggleLiveChatDanmaku() when toggleLiveChatDanmaku != null:
        return toggleLiveChatDanmaku(_that);
      case ToggleBluetoothSeek() when toggleBluetoothSeek != null:
        return toggleBluetoothSeek(_that);
      case ToggleMultiSelectLists() when toggleMultiSelectLists != null:
        return toggleMultiSelectLists(_that);
      case ToggleSbExclusiveMarker() when toggleSbExclusiveMarker != null:
        return toggleSbExclusiveMarker(_that);
      case ToggleSbForDownloads() when toggleSbForDownloads != null:
        return toggleSbForDownloads(_that);
      case SetYoutubeCookie() when setYoutubeCookie != null:
        return setYoutubeCookie(_that);
      case ClearYoutubeCookie() when clearYoutubeCookie != null:
        return clearYoutubeCookie(_that);
      case SavePipedSession() when savePipedSession != null:
        return savePipedSession(_that);
      case ClearPipedSession() when clearPipedSession != null:
        return clearPipedSession(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeSettings value) initialize,
    required TResult Function(GetDefaultLanguage value) getDefaultLanguage,
    required TResult Function(GetDefaultQuality value) getDefaultQuality,
    required TResult Function(GetDefaultRegion value) getDefaultRegion,
    required TResult Function(ChangeTheme value) changeTheme,
    required TResult Function(ToggleHistoryVisibility value)
        toggleHistoryVisibility,
    required TResult Function(ToggleDislikeVisibility value)
        toggleDislikeVisibility,
    required TResult Function(ToggleHlsPlayer value) toggleHlsPlayer,
    required TResult Function(ToggleCommentVisibility value)
        toggleCommentVisibility,
    required TResult Function(ToggleRelatedVideoVisibility value)
        toggleRelatedVideoVisibility,
    required TResult Function(SetInstance value) setInstance,
    required TResult Function(SetYTService value) setYTService,
    required TResult Function(TogglePipPlayer value) togglePipPlayer,
    required TResult Function(SetSearchFilter value) setSearchFilter,
    required TResult Function(SetVideoFitMode value) setVideoFitMode,
    required TResult Function(SetSkipInterval value) setSkipInterval,
    required TResult Function(ToggleSponsorBlock value) toggleSponsorBlock,
    required TResult Function(SetSponsorBlockCategories value)
        setSponsorBlockCategories,
    required TResult Function(ToggleOpenLinksInBrowser value)
        toggleOpenLinksInBrowser,
    required TResult Function(SetHomeFeedMode value) setHomeFeedMode,
    required TResult Function(ToggleAudioFocus value) toggleAudioFocus,
    required TResult Function(AddProfile value) addProfile,
    required TResult Function(DeleteProfile value) deleteProfile,
    required TResult Function(SwitchProfile value) switchProfile,
    required TResult Function(RenameProfile value) renameProfile,
    required TResult Function(ExportSubscriptions value) exportSubscriptions,
    required TResult Function(ImportSubscriptions value) importSubscriptions,
    required TResult Function(SetSubtitleSize value) setSubtitleSize,
    required TResult Function(ToggleSearchHistoryEnabled value)
        toggleSearchHistoryEnabled,
    required TResult Function(ToggleSearchHistoryVisibility value)
        toggleSearchHistoryVisibility,
    required TResult Function(ToggleAutoPip value) toggleAutoPip,
    required TResult Function(FetchPipedInstances value) fetchPipedInstances,
    required TResult Function(FetchInvidiousInstances value)
        fetchInvidiousInstances,
    required TResult Function(SetLastExportedFilePath value)
        setLastExportedFilePath,
    required TResult Function(SetSleepTimer value) setSleepTimer,
    required TResult Function(ClearSleepTimer value) clearSleepTimer,
    required TResult Function(ToggleSwipeGestures value) toggleSwipeGestures,
    required TResult Function(ToggleDeArrow value) toggleDeArrow,
    required TResult Function(ToggleBookmarks value) bookmarksToggled,
    required TResult Function(ToggleBookmarkPlaylist value)
        toggleBookmarkPlaylist,
    required TResult Function(ToggleRestrictedMode value) restrictedModeToggled,
    required TResult Function(ToggleMiniPlayer value) miniPlayerToggled,
    required TResult Function(SetDownloadQuality value) downloadQualityChanged,
    required TResult Function(ToggleDownloadSubtitles value)
        downloadSubtitlesToggled,
    required TResult Function(ToggleDownloadOverWifiOnly value)
        downloadOverWifiOnlyToggled,
    required TResult Function(ToggleDownloadAutoDelete value)
        downloadAutoDeleteToggled,
    required TResult Function(SetPlaybackSpeed value) setPlaybackSpeed,
    required TResult Function(ToggleAutoplayNextVideo value)
        toggleAutoplayNextVideo,
    required TResult Function(ToggleShowRelatedInQueue value)
        toggleShowRelatedInQueue,
    required TResult Function(SetQueueDismissTime value) setQueueDismissTime,
    required TResult Function(SetAutoplayCountdown value) setAutoplayCountdown,
    required TResult Function(ToggleDisableAutoplayOnCellular value)
        toggleDisableAutoplayOnCellular,
    required TResult Function(ToggleAutoQueue value) toggleAutoQueue,
    required TResult Function(ToggleBufferPreload value) toggleBufferPreload,
    required TResult Function(ToggleAutoQualityAdjust value)
        toggleAutoQualityAdjust,
    required TResult Function(ToggleBackgroundPlayback value)
        toggleBackgroundPlayback,
    required TResult Function(ToggleNotificationControls value)
        toggleNotificationControls,
    required TResult Function(ToggleDataSaver value) toggleDataSaver,
    required TResult Function(ToggleHideWatchedVideos value)
        toggleHideWatchedVideos,
    required TResult Function(SetMobileDataQuality value) setMobileDataQuality,
    required TResult Function(ToggleDownloadQueueItems value)
        toggleDownloadQueueItems,
    required TResult Function(ToggleRichCaptionRendering value)
        toggleRichCaptionRendering,
    required TResult Function(ToggleBilibiliEnabled value)
        toggleBilibiliEnabled,
    required TResult Function(SetSwipeDirection value) setSwipeDirection,
    required TResult Function(SetYoutubeService value) setYoutubeService,
    required TResult Function(BookmarksApplied value) bookmarksApplied,
    required TResult Function(RestrictedModeFilterChanged value)
        restrictedModeFilterChanged,
    required TResult Function(MiniPlayerAutoExpandChanged value)
        miniPlayerAutoExpandChanged,
    required TResult Function(MiniPlayerTapToExpandChanged value)
        miniPlayerTapToExpandChanged,
    required TResult Function(MiniPlayerDoubleTapToExpandChanged value)
        miniPlayerDoubleTapToExpandChanged,
    required TResult Function(DownloadAutoDeleteDaysChanged value)
        downloadAutoDeleteDaysChanged,
    required TResult Function(ContentFilterKeywordsChanged value)
        contentFilterKeywordsChanged,
    required TResult Function(ContentFilterChannelsChanged value)
        contentFilterChannelsChanged,
    required TResult Function(ContentFilterHideShortsChanged value)
        contentFilterHideShortsChanged,
    required TResult Function(ContentFilterHidePaidChanged value)
        contentFilterHidePaidChanged,
    required TResult Function(DownloadFolderChanged value)
        downloadFolderChanged,
    required TResult Function(ToggleRyd value) rydToggled,
    required TResult Function(ToggleLongPressSpeedUp value)
        toggleLongPressSpeedUp,
    required TResult Function(ToggleOriginalTitles value) toggleOriginalTitles,
    required TResult Function(ToggleCommentFilter value) toggleCommentFilter,
    required TResult Function(SetCommentFilterKeywords value)
        setCommentFilterKeywords,
    required TResult Function(SetPreferredAudioQuality value)
        setPreferredAudioQuality,
    required TResult Function(ToggleScreenLock value) toggleScreenLock,
    required TResult Function(TogglePinchToZoom value) togglePinchToZoom,
    required TResult Function(ToggleSeekbarThumbnails value)
        toggleSeekbarThumbnails,
    required TResult Function(TogglePopupPlayer value) togglePopupPlayer,
    required TResult Function(ToggleLiveChatDanmaku value)
        toggleLiveChatDanmaku,
    required TResult Function(ToggleBluetoothSeek value) toggleBluetoothSeek,
    required TResult Function(ToggleMultiSelectLists value)
        toggleMultiSelectLists,
    required TResult Function(ToggleSbExclusiveMarker value)
        toggleSbExclusiveMarker,
    required TResult Function(ToggleSbForDownloads value) toggleSbForDownloads,
    required TResult Function(SetYoutubeCookie value) setYoutubeCookie,
    required TResult Function(ClearYoutubeCookie value) clearYoutubeCookie,
    required TResult Function(SavePipedSession value) savePipedSession,
    required TResult Function(ClearPipedSession value) clearPipedSession,
  }) {
    final _that = this;
    switch (_that) {
      case InitializeSettings():
        return initialize(_that);
      case GetDefaultLanguage():
        return getDefaultLanguage(_that);
      case GetDefaultQuality():
        return getDefaultQuality(_that);
      case GetDefaultRegion():
        return getDefaultRegion(_that);
      case ChangeTheme():
        return changeTheme(_that);
      case ToggleHistoryVisibility():
        return toggleHistoryVisibility(_that);
      case ToggleDislikeVisibility():
        return toggleDislikeVisibility(_that);
      case ToggleHlsPlayer():
        return toggleHlsPlayer(_that);
      case ToggleCommentVisibility():
        return toggleCommentVisibility(_that);
      case ToggleRelatedVideoVisibility():
        return toggleRelatedVideoVisibility(_that);
      case SetInstance():
        return setInstance(_that);
      case SetYTService():
        return setYTService(_that);
      case TogglePipPlayer():
        return togglePipPlayer(_that);
      case SetSearchFilter():
        return setSearchFilter(_that);
      case SetVideoFitMode():
        return setVideoFitMode(_that);
      case SetSkipInterval():
        return setSkipInterval(_that);
      case ToggleSponsorBlock():
        return toggleSponsorBlock(_that);
      case SetSponsorBlockCategories():
        return setSponsorBlockCategories(_that);
      case ToggleOpenLinksInBrowser():
        return toggleOpenLinksInBrowser(_that);
      case SetHomeFeedMode():
        return setHomeFeedMode(_that);
      case ToggleAudioFocus():
        return toggleAudioFocus(_that);
      case AddProfile():
        return addProfile(_that);
      case DeleteProfile():
        return deleteProfile(_that);
      case SwitchProfile():
        return switchProfile(_that);
      case RenameProfile():
        return renameProfile(_that);
      case ExportSubscriptions():
        return exportSubscriptions(_that);
      case ImportSubscriptions():
        return importSubscriptions(_that);
      case SetSubtitleSize():
        return setSubtitleSize(_that);
      case ToggleSearchHistoryEnabled():
        return toggleSearchHistoryEnabled(_that);
      case ToggleSearchHistoryVisibility():
        return toggleSearchHistoryVisibility(_that);
      case ToggleAutoPip():
        return toggleAutoPip(_that);
      case FetchPipedInstances():
        return fetchPipedInstances(_that);
      case FetchInvidiousInstances():
        return fetchInvidiousInstances(_that);
      case SetLastExportedFilePath():
        return setLastExportedFilePath(_that);
      case SetSleepTimer():
        return setSleepTimer(_that);
      case ClearSleepTimer():
        return clearSleepTimer(_that);
      case ToggleSwipeGestures():
        return toggleSwipeGestures(_that);
      case ToggleDeArrow():
        return toggleDeArrow(_that);
      case ToggleBookmarks():
        return bookmarksToggled(_that);
      case ToggleBookmarkPlaylist():
        return toggleBookmarkPlaylist(_that);
      case ToggleRestrictedMode():
        return restrictedModeToggled(_that);
      case ToggleMiniPlayer():
        return miniPlayerToggled(_that);
      case SetDownloadQuality():
        return downloadQualityChanged(_that);
      case ToggleDownloadSubtitles():
        return downloadSubtitlesToggled(_that);
      case ToggleDownloadOverWifiOnly():
        return downloadOverWifiOnlyToggled(_that);
      case ToggleDownloadAutoDelete():
        return downloadAutoDeleteToggled(_that);
      case SetPlaybackSpeed():
        return setPlaybackSpeed(_that);
      case ToggleAutoplayNextVideo():
        return toggleAutoplayNextVideo(_that);
      case ToggleShowRelatedInQueue():
        return toggleShowRelatedInQueue(_that);
      case SetQueueDismissTime():
        return setQueueDismissTime(_that);
      case SetAutoplayCountdown():
        return setAutoplayCountdown(_that);
      case ToggleDisableAutoplayOnCellular():
        return toggleDisableAutoplayOnCellular(_that);
      case ToggleAutoQueue():
        return toggleAutoQueue(_that);
      case ToggleBufferPreload():
        return toggleBufferPreload(_that);
      case ToggleAutoQualityAdjust():
        return toggleAutoQualityAdjust(_that);
      case ToggleBackgroundPlayback():
        return toggleBackgroundPlayback(_that);
      case ToggleNotificationControls():
        return toggleNotificationControls(_that);
      case ToggleDataSaver():
        return toggleDataSaver(_that);
      case ToggleHideWatchedVideos():
        return toggleHideWatchedVideos(_that);
      case SetMobileDataQuality():
        return setMobileDataQuality(_that);
      case ToggleDownloadQueueItems():
        return toggleDownloadQueueItems(_that);
      case ToggleRichCaptionRendering():
        return toggleRichCaptionRendering(_that);
      case ToggleBilibiliEnabled():
        return toggleBilibiliEnabled(_that);
      case SetSwipeDirection():
        return setSwipeDirection(_that);
      case SetYoutubeService():
        return setYoutubeService(_that);
      case BookmarksApplied():
        return bookmarksApplied(_that);
      case RestrictedModeFilterChanged():
        return restrictedModeFilterChanged(_that);
      case MiniPlayerAutoExpandChanged():
        return miniPlayerAutoExpandChanged(_that);
      case MiniPlayerTapToExpandChanged():
        return miniPlayerTapToExpandChanged(_that);
      case MiniPlayerDoubleTapToExpandChanged():
        return miniPlayerDoubleTapToExpandChanged(_that);
      case DownloadAutoDeleteDaysChanged():
        return downloadAutoDeleteDaysChanged(_that);
      case ContentFilterKeywordsChanged():
        return contentFilterKeywordsChanged(_that);
      case ContentFilterChannelsChanged():
        return contentFilterChannelsChanged(_that);
      case ContentFilterHideShortsChanged():
        return contentFilterHideShortsChanged(_that);
      case ContentFilterHidePaidChanged():
        return contentFilterHidePaidChanged(_that);
      case DownloadFolderChanged():
        return downloadFolderChanged(_that);
      case ToggleRyd():
        return rydToggled(_that);
      case ToggleLongPressSpeedUp():
        return toggleLongPressSpeedUp(_that);
      case ToggleOriginalTitles():
        return toggleOriginalTitles(_that);
      case ToggleCommentFilter():
        return toggleCommentFilter(_that);
      case SetCommentFilterKeywords():
        return setCommentFilterKeywords(_that);
      case SetPreferredAudioQuality():
        return setPreferredAudioQuality(_that);
      case ToggleScreenLock():
        return toggleScreenLock(_that);
      case TogglePinchToZoom():
        return togglePinchToZoom(_that);
      case ToggleSeekbarThumbnails():
        return toggleSeekbarThumbnails(_that);
      case TogglePopupPlayer():
        return togglePopupPlayer(_that);
      case ToggleLiveChatDanmaku():
        return toggleLiveChatDanmaku(_that);
      case ToggleBluetoothSeek():
        return toggleBluetoothSeek(_that);
      case ToggleMultiSelectLists():
        return toggleMultiSelectLists(_that);
      case ToggleSbExclusiveMarker():
        return toggleSbExclusiveMarker(_that);
      case ToggleSbForDownloads():
        return toggleSbForDownloads(_that);
      case SetYoutubeCookie():
        return setYoutubeCookie(_that);
      case ClearYoutubeCookie():
        return clearYoutubeCookie(_that);
      case SavePipedSession():
        return savePipedSession(_that);
      case ClearPipedSession():
        return clearPipedSession(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeSettings value)? initialize,
    TResult? Function(GetDefaultLanguage value)? getDefaultLanguage,
    TResult? Function(GetDefaultQuality value)? getDefaultQuality,
    TResult? Function(GetDefaultRegion value)? getDefaultRegion,
    TResult? Function(ChangeTheme value)? changeTheme,
    TResult? Function(ToggleHistoryVisibility value)? toggleHistoryVisibility,
    TResult? Function(ToggleDislikeVisibility value)? toggleDislikeVisibility,
    TResult? Function(ToggleHlsPlayer value)? toggleHlsPlayer,
    TResult? Function(ToggleCommentVisibility value)? toggleCommentVisibility,
    TResult? Function(ToggleRelatedVideoVisibility value)?
        toggleRelatedVideoVisibility,
    TResult? Function(SetInstance value)? setInstance,
    TResult? Function(SetYTService value)? setYTService,
    TResult? Function(TogglePipPlayer value)? togglePipPlayer,
    TResult? Function(SetSearchFilter value)? setSearchFilter,
    TResult? Function(SetVideoFitMode value)? setVideoFitMode,
    TResult? Function(SetSkipInterval value)? setSkipInterval,
    TResult? Function(ToggleSponsorBlock value)? toggleSponsorBlock,
    TResult? Function(SetSponsorBlockCategories value)?
        setSponsorBlockCategories,
    TResult? Function(ToggleOpenLinksInBrowser value)? toggleOpenLinksInBrowser,
    TResult? Function(SetHomeFeedMode value)? setHomeFeedMode,
    TResult? Function(ToggleAudioFocus value)? toggleAudioFocus,
    TResult? Function(AddProfile value)? addProfile,
    TResult? Function(DeleteProfile value)? deleteProfile,
    TResult? Function(SwitchProfile value)? switchProfile,
    TResult? Function(RenameProfile value)? renameProfile,
    TResult? Function(ExportSubscriptions value)? exportSubscriptions,
    TResult? Function(ImportSubscriptions value)? importSubscriptions,
    TResult? Function(SetSubtitleSize value)? setSubtitleSize,
    TResult? Function(ToggleSearchHistoryEnabled value)?
        toggleSearchHistoryEnabled,
    TResult? Function(ToggleSearchHistoryVisibility value)?
        toggleSearchHistoryVisibility,
    TResult? Function(ToggleAutoPip value)? toggleAutoPip,
    TResult? Function(FetchPipedInstances value)? fetchPipedInstances,
    TResult? Function(FetchInvidiousInstances value)? fetchInvidiousInstances,
    TResult? Function(SetLastExportedFilePath value)? setLastExportedFilePath,
    TResult? Function(SetSleepTimer value)? setSleepTimer,
    TResult? Function(ClearSleepTimer value)? clearSleepTimer,
    TResult? Function(ToggleSwipeGestures value)? toggleSwipeGestures,
    TResult? Function(ToggleDeArrow value)? toggleDeArrow,
    TResult? Function(ToggleBookmarks value)? bookmarksToggled,
    TResult? Function(ToggleBookmarkPlaylist value)? toggleBookmarkPlaylist,
    TResult? Function(ToggleRestrictedMode value)? restrictedModeToggled,
    TResult? Function(ToggleMiniPlayer value)? miniPlayerToggled,
    TResult? Function(SetDownloadQuality value)? downloadQualityChanged,
    TResult? Function(ToggleDownloadSubtitles value)? downloadSubtitlesToggled,
    TResult? Function(ToggleDownloadOverWifiOnly value)?
        downloadOverWifiOnlyToggled,
    TResult? Function(ToggleDownloadAutoDelete value)?
        downloadAutoDeleteToggled,
    TResult? Function(SetPlaybackSpeed value)? setPlaybackSpeed,
    TResult? Function(ToggleAutoplayNextVideo value)? toggleAutoplayNextVideo,
    TResult? Function(ToggleShowRelatedInQueue value)? toggleShowRelatedInQueue,
    TResult? Function(SetQueueDismissTime value)? setQueueDismissTime,
    TResult? Function(SetAutoplayCountdown value)? setAutoplayCountdown,
    TResult? Function(ToggleDisableAutoplayOnCellular value)?
        toggleDisableAutoplayOnCellular,
    TResult? Function(ToggleAutoQueue value)? toggleAutoQueue,
    TResult? Function(ToggleBufferPreload value)? toggleBufferPreload,
    TResult? Function(ToggleAutoQualityAdjust value)? toggleAutoQualityAdjust,
    TResult? Function(ToggleBackgroundPlayback value)? toggleBackgroundPlayback,
    TResult? Function(ToggleNotificationControls value)?
        toggleNotificationControls,
    TResult? Function(ToggleDataSaver value)? toggleDataSaver,
    TResult? Function(ToggleHideWatchedVideos value)? toggleHideWatchedVideos,
    TResult? Function(SetMobileDataQuality value)? setMobileDataQuality,
    TResult? Function(ToggleDownloadQueueItems value)? toggleDownloadQueueItems,
    TResult? Function(ToggleRichCaptionRendering value)?
        toggleRichCaptionRendering,
    TResult? Function(ToggleBilibiliEnabled value)? toggleBilibiliEnabled,
    TResult? Function(SetSwipeDirection value)? setSwipeDirection,
    TResult? Function(SetYoutubeService value)? setYoutubeService,
    TResult? Function(BookmarksApplied value)? bookmarksApplied,
    TResult? Function(RestrictedModeFilterChanged value)?
        restrictedModeFilterChanged,
    TResult? Function(MiniPlayerAutoExpandChanged value)?
        miniPlayerAutoExpandChanged,
    TResult? Function(MiniPlayerTapToExpandChanged value)?
        miniPlayerTapToExpandChanged,
    TResult? Function(MiniPlayerDoubleTapToExpandChanged value)?
        miniPlayerDoubleTapToExpandChanged,
    TResult? Function(DownloadAutoDeleteDaysChanged value)?
        downloadAutoDeleteDaysChanged,
    TResult? Function(ContentFilterKeywordsChanged value)?
        contentFilterKeywordsChanged,
    TResult? Function(ContentFilterChannelsChanged value)?
        contentFilterChannelsChanged,
    TResult? Function(ContentFilterHideShortsChanged value)?
        contentFilterHideShortsChanged,
    TResult? Function(ContentFilterHidePaidChanged value)?
        contentFilterHidePaidChanged,
    TResult? Function(DownloadFolderChanged value)? downloadFolderChanged,
    TResult? Function(ToggleRyd value)? rydToggled,
    TResult? Function(ToggleLongPressSpeedUp value)? toggleLongPressSpeedUp,
    TResult? Function(ToggleOriginalTitles value)? toggleOriginalTitles,
    TResult? Function(ToggleCommentFilter value)? toggleCommentFilter,
    TResult? Function(SetCommentFilterKeywords value)? setCommentFilterKeywords,
    TResult? Function(SetPreferredAudioQuality value)? setPreferredAudioQuality,
    TResult? Function(ToggleScreenLock value)? toggleScreenLock,
    TResult? Function(TogglePinchToZoom value)? togglePinchToZoom,
    TResult? Function(ToggleSeekbarThumbnails value)? toggleSeekbarThumbnails,
    TResult? Function(TogglePopupPlayer value)? togglePopupPlayer,
    TResult? Function(ToggleLiveChatDanmaku value)? toggleLiveChatDanmaku,
    TResult? Function(ToggleBluetoothSeek value)? toggleBluetoothSeek,
    TResult? Function(ToggleMultiSelectLists value)? toggleMultiSelectLists,
    TResult? Function(ToggleSbExclusiveMarker value)? toggleSbExclusiveMarker,
    TResult? Function(ToggleSbForDownloads value)? toggleSbForDownloads,
    TResult? Function(SetYoutubeCookie value)? setYoutubeCookie,
    TResult? Function(ClearYoutubeCookie value)? clearYoutubeCookie,
    TResult? Function(SavePipedSession value)? savePipedSession,
    TResult? Function(ClearPipedSession value)? clearPipedSession,
  }) {
    final _that = this;
    switch (_that) {
      case InitializeSettings() when initialize != null:
        return initialize(_that);
      case GetDefaultLanguage() when getDefaultLanguage != null:
        return getDefaultLanguage(_that);
      case GetDefaultQuality() when getDefaultQuality != null:
        return getDefaultQuality(_that);
      case GetDefaultRegion() when getDefaultRegion != null:
        return getDefaultRegion(_that);
      case ChangeTheme() when changeTheme != null:
        return changeTheme(_that);
      case ToggleHistoryVisibility() when toggleHistoryVisibility != null:
        return toggleHistoryVisibility(_that);
      case ToggleDislikeVisibility() when toggleDislikeVisibility != null:
        return toggleDislikeVisibility(_that);
      case ToggleHlsPlayer() when toggleHlsPlayer != null:
        return toggleHlsPlayer(_that);
      case ToggleCommentVisibility() when toggleCommentVisibility != null:
        return toggleCommentVisibility(_that);
      case ToggleRelatedVideoVisibility()
          when toggleRelatedVideoVisibility != null:
        return toggleRelatedVideoVisibility(_that);
      case SetInstance() when setInstance != null:
        return setInstance(_that);
      case SetYTService() when setYTService != null:
        return setYTService(_that);
      case TogglePipPlayer() when togglePipPlayer != null:
        return togglePipPlayer(_that);
      case SetSearchFilter() when setSearchFilter != null:
        return setSearchFilter(_that);
      case SetVideoFitMode() when setVideoFitMode != null:
        return setVideoFitMode(_that);
      case SetSkipInterval() when setSkipInterval != null:
        return setSkipInterval(_that);
      case ToggleSponsorBlock() when toggleSponsorBlock != null:
        return toggleSponsorBlock(_that);
      case SetSponsorBlockCategories() when setSponsorBlockCategories != null:
        return setSponsorBlockCategories(_that);
      case ToggleOpenLinksInBrowser() when toggleOpenLinksInBrowser != null:
        return toggleOpenLinksInBrowser(_that);
      case SetHomeFeedMode() when setHomeFeedMode != null:
        return setHomeFeedMode(_that);
      case ToggleAudioFocus() when toggleAudioFocus != null:
        return toggleAudioFocus(_that);
      case AddProfile() when addProfile != null:
        return addProfile(_that);
      case DeleteProfile() when deleteProfile != null:
        return deleteProfile(_that);
      case SwitchProfile() when switchProfile != null:
        return switchProfile(_that);
      case RenameProfile() when renameProfile != null:
        return renameProfile(_that);
      case ExportSubscriptions() when exportSubscriptions != null:
        return exportSubscriptions(_that);
      case ImportSubscriptions() when importSubscriptions != null:
        return importSubscriptions(_that);
      case SetSubtitleSize() when setSubtitleSize != null:
        return setSubtitleSize(_that);
      case ToggleSearchHistoryEnabled() when toggleSearchHistoryEnabled != null:
        return toggleSearchHistoryEnabled(_that);
      case ToggleSearchHistoryVisibility()
          when toggleSearchHistoryVisibility != null:
        return toggleSearchHistoryVisibility(_that);
      case ToggleAutoPip() when toggleAutoPip != null:
        return toggleAutoPip(_that);
      case FetchPipedInstances() when fetchPipedInstances != null:
        return fetchPipedInstances(_that);
      case FetchInvidiousInstances() when fetchInvidiousInstances != null:
        return fetchInvidiousInstances(_that);
      case SetLastExportedFilePath() when setLastExportedFilePath != null:
        return setLastExportedFilePath(_that);
      case SetSleepTimer() when setSleepTimer != null:
        return setSleepTimer(_that);
      case ClearSleepTimer() when clearSleepTimer != null:
        return clearSleepTimer(_that);
      case ToggleSwipeGestures() when toggleSwipeGestures != null:
        return toggleSwipeGestures(_that);
      case ToggleDeArrow() when toggleDeArrow != null:
        return toggleDeArrow(_that);
      case ToggleBookmarks() when bookmarksToggled != null:
        return bookmarksToggled(_that);
      case ToggleBookmarkPlaylist() when toggleBookmarkPlaylist != null:
        return toggleBookmarkPlaylist(_that);
      case ToggleRestrictedMode() when restrictedModeToggled != null:
        return restrictedModeToggled(_that);
      case ToggleMiniPlayer() when miniPlayerToggled != null:
        return miniPlayerToggled(_that);
      case SetDownloadQuality() when downloadQualityChanged != null:
        return downloadQualityChanged(_that);
      case ToggleDownloadSubtitles() when downloadSubtitlesToggled != null:
        return downloadSubtitlesToggled(_that);
      case ToggleDownloadOverWifiOnly()
          when downloadOverWifiOnlyToggled != null:
        return downloadOverWifiOnlyToggled(_that);
      case ToggleDownloadAutoDelete() when downloadAutoDeleteToggled != null:
        return downloadAutoDeleteToggled(_that);
      case SetPlaybackSpeed() when setPlaybackSpeed != null:
        return setPlaybackSpeed(_that);
      case ToggleAutoplayNextVideo() when toggleAutoplayNextVideo != null:
        return toggleAutoplayNextVideo(_that);
      case ToggleShowRelatedInQueue() when toggleShowRelatedInQueue != null:
        return toggleShowRelatedInQueue(_that);
      case SetQueueDismissTime() when setQueueDismissTime != null:
        return setQueueDismissTime(_that);
      case SetAutoplayCountdown() when setAutoplayCountdown != null:
        return setAutoplayCountdown(_that);
      case ToggleDisableAutoplayOnCellular()
          when toggleDisableAutoplayOnCellular != null:
        return toggleDisableAutoplayOnCellular(_that);
      case ToggleAutoQueue() when toggleAutoQueue != null:
        return toggleAutoQueue(_that);
      case ToggleBufferPreload() when toggleBufferPreload != null:
        return toggleBufferPreload(_that);
      case ToggleAutoQualityAdjust() when toggleAutoQualityAdjust != null:
        return toggleAutoQualityAdjust(_that);
      case ToggleBackgroundPlayback() when toggleBackgroundPlayback != null:
        return toggleBackgroundPlayback(_that);
      case ToggleNotificationControls() when toggleNotificationControls != null:
        return toggleNotificationControls(_that);
      case ToggleDataSaver() when toggleDataSaver != null:
        return toggleDataSaver(_that);
      case ToggleHideWatchedVideos() when toggleHideWatchedVideos != null:
        return toggleHideWatchedVideos(_that);
      case SetMobileDataQuality() when setMobileDataQuality != null:
        return setMobileDataQuality(_that);
      case ToggleDownloadQueueItems() when toggleDownloadQueueItems != null:
        return toggleDownloadQueueItems(_that);
      case ToggleRichCaptionRendering() when toggleRichCaptionRendering != null:
        return toggleRichCaptionRendering(_that);
      case ToggleBilibiliEnabled() when toggleBilibiliEnabled != null:
        return toggleBilibiliEnabled(_that);
      case SetSwipeDirection() when setSwipeDirection != null:
        return setSwipeDirection(_that);
      case SetYoutubeService() when setYoutubeService != null:
        return setYoutubeService(_that);
      case BookmarksApplied() when bookmarksApplied != null:
        return bookmarksApplied(_that);
      case RestrictedModeFilterChanged()
          when restrictedModeFilterChanged != null:
        return restrictedModeFilterChanged(_that);
      case MiniPlayerAutoExpandChanged()
          when miniPlayerAutoExpandChanged != null:
        return miniPlayerAutoExpandChanged(_that);
      case MiniPlayerTapToExpandChanged()
          when miniPlayerTapToExpandChanged != null:
        return miniPlayerTapToExpandChanged(_that);
      case MiniPlayerDoubleTapToExpandChanged()
          when miniPlayerDoubleTapToExpandChanged != null:
        return miniPlayerDoubleTapToExpandChanged(_that);
      case DownloadAutoDeleteDaysChanged()
          when downloadAutoDeleteDaysChanged != null:
        return downloadAutoDeleteDaysChanged(_that);
      case ContentFilterKeywordsChanged()
          when contentFilterKeywordsChanged != null:
        return contentFilterKeywordsChanged(_that);
      case ContentFilterChannelsChanged()
          when contentFilterChannelsChanged != null:
        return contentFilterChannelsChanged(_that);
      case ContentFilterHideShortsChanged()
          when contentFilterHideShortsChanged != null:
        return contentFilterHideShortsChanged(_that);
      case ContentFilterHidePaidChanged()
          when contentFilterHidePaidChanged != null:
        return contentFilterHidePaidChanged(_that);
      case DownloadFolderChanged() when downloadFolderChanged != null:
        return downloadFolderChanged(_that);
      case ToggleRyd() when rydToggled != null:
        return rydToggled(_that);
      case ToggleLongPressSpeedUp() when toggleLongPressSpeedUp != null:
        return toggleLongPressSpeedUp(_that);
      case ToggleOriginalTitles() when toggleOriginalTitles != null:
        return toggleOriginalTitles(_that);
      case ToggleCommentFilter() when toggleCommentFilter != null:
        return toggleCommentFilter(_that);
      case SetCommentFilterKeywords() when setCommentFilterKeywords != null:
        return setCommentFilterKeywords(_that);
      case SetPreferredAudioQuality() when setPreferredAudioQuality != null:
        return setPreferredAudioQuality(_that);
      case ToggleScreenLock() when toggleScreenLock != null:
        return toggleScreenLock(_that);
      case TogglePinchToZoom() when togglePinchToZoom != null:
        return togglePinchToZoom(_that);
      case ToggleSeekbarThumbnails() when toggleSeekbarThumbnails != null:
        return toggleSeekbarThumbnails(_that);
      case TogglePopupPlayer() when togglePopupPlayer != null:
        return togglePopupPlayer(_that);
      case ToggleLiveChatDanmaku() when toggleLiveChatDanmaku != null:
        return toggleLiveChatDanmaku(_that);
      case ToggleBluetoothSeek() when toggleBluetoothSeek != null:
        return toggleBluetoothSeek(_that);
      case ToggleMultiSelectLists() when toggleMultiSelectLists != null:
        return toggleMultiSelectLists(_that);
      case ToggleSbExclusiveMarker() when toggleSbExclusiveMarker != null:
        return toggleSbExclusiveMarker(_that);
      case ToggleSbForDownloads() when toggleSbForDownloads != null:
        return toggleSbForDownloads(_that);
      case SetYoutubeCookie() when setYoutubeCookie != null:
        return setYoutubeCookie(_that);
      case ClearYoutubeCookie() when clearYoutubeCookie != null:
        return clearYoutubeCookie(_that);
      case SavePipedSession() when savePipedSession != null:
        return savePipedSession(_that);
      case ClearPipedSession() when clearPipedSession != null:
        return clearPipedSession(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String language)? getDefaultLanguage,
    TResult Function(String quality)? getDefaultQuality,
    TResult Function(String region)? getDefaultRegion,
    TResult Function(String themeMode)? changeTheme,
    TResult Function(bool isHistoryVisible)? toggleHistoryVisibility,
    TResult Function(bool isDislikeVisible)? toggleDislikeVisibility,
    TResult Function(bool isHlsPlayer)? toggleHlsPlayer,
    TResult Function(bool isHideComments)? toggleCommentVisibility,
    TResult Function(bool isHideRelated)? toggleRelatedVideoVisibility,
    TResult Function(String instanceApi)? setInstance,
    TResult Function(YouTubeServices service)? setYTService,
    TResult Function(bool isPipDisabled)? togglePipPlayer,
    TResult Function(String filter)? setSearchFilter,
    TResult Function(String fitMode)? setVideoFitMode,
    TResult Function(int seconds)? setSkipInterval,
    TResult Function(bool isEnabled)? toggleSponsorBlock,
    TResult Function(List<String> categories)? setSponsorBlockCategories,
    TResult Function(bool openInBrowser)? toggleOpenLinksInBrowser,
    TResult Function(String mode)? setHomeFeedMode,
    TResult Function(bool isEnabled)? toggleAudioFocus,
    TResult Function(String profileName)? addProfile,
    TResult Function(String profileName)? deleteProfile,
    TResult Function(String profileName)? switchProfile,
    TResult Function(String oldName, String newName)? renameProfile,
    TResult Function(String profileName)? exportSubscriptions,
    TResult Function(String filePath, String profileName)? importSubscriptions,
    TResult Function(double size)? setSubtitleSize,
    TResult Function(bool isEnabled)? toggleSearchHistoryEnabled,
    TResult Function(bool isVisible)? toggleSearchHistoryVisibility,
    TResult Function(bool isEnabled)? toggleAutoPip,
    TResult Function(bool forceRefresh)? fetchPipedInstances,
    TResult Function(bool forceRefresh)? fetchInvidiousInstances,
    TResult Function(String? filePath)? setLastExportedFilePath,
    TResult Function(int seconds)? setSleepTimer,
    TResult Function()? clearSleepTimer,
    TResult Function(bool enabled)? toggleSwipeGestures,
    TResult Function(bool enabled)? toggleDeArrow,
    TResult Function(bool enabled)? bookmarksToggled,
    TResult Function(String playlistId, bool bookmarked)?
        toggleBookmarkPlaylist,
    TResult Function(bool enabled)? restrictedModeToggled,
    TResult Function(bool enabled)? miniPlayerToggled,
    TResult Function(String quality)? downloadQualityChanged,
    TResult Function(bool enabled)? downloadSubtitlesToggled,
    TResult Function(bool enabled)? downloadOverWifiOnlyToggled,
    TResult Function(bool enabled)? downloadAutoDeleteToggled,
    TResult Function(double speed)? setPlaybackSpeed,
    TResult Function(bool enabled)? toggleAutoplayNextVideo,
    TResult Function(bool enabled)? toggleShowRelatedInQueue,
    TResult Function(int seconds)? setQueueDismissTime,
    TResult Function(int seconds)? setAutoplayCountdown,
    TResult Function(bool enabled)? toggleDisableAutoplayOnCellular,
    TResult Function(bool enabled)? toggleAutoQueue,
    TResult Function(bool enabled)? toggleBufferPreload,
    TResult Function(bool enabled)? toggleAutoQualityAdjust,
    TResult Function(bool enabled)? toggleBackgroundPlayback,
    TResult Function(bool enabled)? toggleNotificationControls,
    TResult Function(bool enabled)? toggleDataSaver,
    TResult Function(bool enabled)? toggleHideWatchedVideos,
    TResult Function(int quality)? setMobileDataQuality,
    TResult Function(bool enabled)? toggleDownloadQueueItems,
    TResult Function(bool enabled)? toggleRichCaptionRendering,
    TResult Function(bool enabled)? toggleBilibiliEnabled,
    TResult Function(bool leftToRight)? setSwipeDirection,
    TResult Function(String service)? setYoutubeService,
    TResult Function(List<String> selectedPlaylists)? bookmarksApplied,
    TResult Function(RestrictedModeFilterLevel level)?
        restrictedModeFilterChanged,
    TResult Function(bool enabled)? miniPlayerAutoExpandChanged,
    TResult Function(bool enabled)? miniPlayerTapToExpandChanged,
    TResult Function(bool enabled)? miniPlayerDoubleTapToExpandChanged,
    TResult Function(int days)? downloadAutoDeleteDaysChanged,
    TResult Function(List<String> keywords)? contentFilterKeywordsChanged,
    TResult Function(List<String> channelIds)? contentFilterChannelsChanged,
    TResult Function(bool enabled)? contentFilterHideShortsChanged,
    TResult Function(bool enabled)? contentFilterHidePaidChanged,
    TResult Function(String? path)? downloadFolderChanged,
    TResult Function(bool enabled)? rydToggled,
    TResult Function(bool enabled)? toggleLongPressSpeedUp,
    TResult Function(bool enabled)? toggleOriginalTitles,
    TResult Function(bool enabled)? toggleCommentFilter,
    TResult Function(List<String> keywords)? setCommentFilterKeywords,
    TResult Function(String quality)? setPreferredAudioQuality,
    TResult Function(bool enabled)? toggleScreenLock,
    TResult Function(bool enabled)? togglePinchToZoom,
    TResult Function(bool enabled)? toggleSeekbarThumbnails,
    TResult Function(bool enabled)? togglePopupPlayer,
    TResult Function(bool enabled)? toggleLiveChatDanmaku,
    TResult Function(bool enabled)? toggleBluetoothSeek,
    TResult Function(bool enabled)? toggleMultiSelectLists,
    TResult Function(bool enabled)? toggleSbExclusiveMarker,
    TResult Function(bool enabled)? toggleSbForDownloads,
    TResult Function(String cookie)? setYoutubeCookie,
    TResult Function()? clearYoutubeCookie,
    TResult Function(String token, String username)? savePipedSession,
    TResult Function()? clearPipedSession,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case InitializeSettings() when initialize != null:
        return initialize();
      case GetDefaultLanguage() when getDefaultLanguage != null:
        return getDefaultLanguage(_that.language);
      case GetDefaultQuality() when getDefaultQuality != null:
        return getDefaultQuality(_that.quality);
      case GetDefaultRegion() when getDefaultRegion != null:
        return getDefaultRegion(_that.region);
      case ChangeTheme() when changeTheme != null:
        return changeTheme(_that.themeMode);
      case ToggleHistoryVisibility() when toggleHistoryVisibility != null:
        return toggleHistoryVisibility(_that.isHistoryVisible);
      case ToggleDislikeVisibility() when toggleDislikeVisibility != null:
        return toggleDislikeVisibility(_that.isDislikeVisible);
      case ToggleHlsPlayer() when toggleHlsPlayer != null:
        return toggleHlsPlayer(_that.isHlsPlayer);
      case ToggleCommentVisibility() when toggleCommentVisibility != null:
        return toggleCommentVisibility(_that.isHideComments);
      case ToggleRelatedVideoVisibility()
          when toggleRelatedVideoVisibility != null:
        return toggleRelatedVideoVisibility(_that.isHideRelated);
      case SetInstance() when setInstance != null:
        return setInstance(_that.instanceApi);
      case SetYTService() when setYTService != null:
        return setYTService(_that.service);
      case TogglePipPlayer() when togglePipPlayer != null:
        return togglePipPlayer(_that.isPipDisabled);
      case SetSearchFilter() when setSearchFilter != null:
        return setSearchFilter(_that.filter);
      case SetVideoFitMode() when setVideoFitMode != null:
        return setVideoFitMode(_that.fitMode);
      case SetSkipInterval() when setSkipInterval != null:
        return setSkipInterval(_that.seconds);
      case ToggleSponsorBlock() when toggleSponsorBlock != null:
        return toggleSponsorBlock(_that.isEnabled);
      case SetSponsorBlockCategories() when setSponsorBlockCategories != null:
        return setSponsorBlockCategories(_that.categories);
      case ToggleOpenLinksInBrowser() when toggleOpenLinksInBrowser != null:
        return toggleOpenLinksInBrowser(_that.openInBrowser);
      case SetHomeFeedMode() when setHomeFeedMode != null:
        return setHomeFeedMode(_that.mode);
      case ToggleAudioFocus() when toggleAudioFocus != null:
        return toggleAudioFocus(_that.isEnabled);
      case AddProfile() when addProfile != null:
        return addProfile(_that.profileName);
      case DeleteProfile() when deleteProfile != null:
        return deleteProfile(_that.profileName);
      case SwitchProfile() when switchProfile != null:
        return switchProfile(_that.profileName);
      case RenameProfile() when renameProfile != null:
        return renameProfile(_that.oldName, _that.newName);
      case ExportSubscriptions() when exportSubscriptions != null:
        return exportSubscriptions(_that.profileName);
      case ImportSubscriptions() when importSubscriptions != null:
        return importSubscriptions(_that.filePath, _that.profileName);
      case SetSubtitleSize() when setSubtitleSize != null:
        return setSubtitleSize(_that.size);
      case ToggleSearchHistoryEnabled() when toggleSearchHistoryEnabled != null:
        return toggleSearchHistoryEnabled(_that.isEnabled);
      case ToggleSearchHistoryVisibility()
          when toggleSearchHistoryVisibility != null:
        return toggleSearchHistoryVisibility(_that.isVisible);
      case ToggleAutoPip() when toggleAutoPip != null:
        return toggleAutoPip(_that.isEnabled);
      case FetchPipedInstances() when fetchPipedInstances != null:
        return fetchPipedInstances(_that.forceRefresh);
      case FetchInvidiousInstances() when fetchInvidiousInstances != null:
        return fetchInvidiousInstances(_that.forceRefresh);
      case SetLastExportedFilePath() when setLastExportedFilePath != null:
        return setLastExportedFilePath(_that.filePath);
      case SetSleepTimer() when setSleepTimer != null:
        return setSleepTimer(_that.seconds);
      case ClearSleepTimer() when clearSleepTimer != null:
        return clearSleepTimer();
      case ToggleSwipeGestures() when toggleSwipeGestures != null:
        return toggleSwipeGestures(_that.enabled);
      case ToggleDeArrow() when toggleDeArrow != null:
        return toggleDeArrow(_that.enabled);
      case ToggleBookmarks() when bookmarksToggled != null:
        return bookmarksToggled(_that.enabled);
      case ToggleBookmarkPlaylist() when toggleBookmarkPlaylist != null:
        return toggleBookmarkPlaylist(_that.playlistId, _that.bookmarked);
      case ToggleRestrictedMode() when restrictedModeToggled != null:
        return restrictedModeToggled(_that.enabled);
      case ToggleMiniPlayer() when miniPlayerToggled != null:
        return miniPlayerToggled(_that.enabled);
      case SetDownloadQuality() when downloadQualityChanged != null:
        return downloadQualityChanged(_that.quality);
      case ToggleDownloadSubtitles() when downloadSubtitlesToggled != null:
        return downloadSubtitlesToggled(_that.enabled);
      case ToggleDownloadOverWifiOnly()
          when downloadOverWifiOnlyToggled != null:
        return downloadOverWifiOnlyToggled(_that.enabled);
      case ToggleDownloadAutoDelete() when downloadAutoDeleteToggled != null:
        return downloadAutoDeleteToggled(_that.enabled);
      case SetPlaybackSpeed() when setPlaybackSpeed != null:
        return setPlaybackSpeed(_that.speed);
      case ToggleAutoplayNextVideo() when toggleAutoplayNextVideo != null:
        return toggleAutoplayNextVideo(_that.enabled);
      case ToggleShowRelatedInQueue() when toggleShowRelatedInQueue != null:
        return toggleShowRelatedInQueue(_that.enabled);
      case SetQueueDismissTime() when setQueueDismissTime != null:
        return setQueueDismissTime(_that.seconds);
      case SetAutoplayCountdown() when setAutoplayCountdown != null:
        return setAutoplayCountdown(_that.seconds);
      case ToggleDisableAutoplayOnCellular()
          when toggleDisableAutoplayOnCellular != null:
        return toggleDisableAutoplayOnCellular(_that.enabled);
      case ToggleAutoQueue() when toggleAutoQueue != null:
        return toggleAutoQueue(_that.enabled);
      case ToggleBufferPreload() when toggleBufferPreload != null:
        return toggleBufferPreload(_that.enabled);
      case ToggleAutoQualityAdjust() when toggleAutoQualityAdjust != null:
        return toggleAutoQualityAdjust(_that.enabled);
      case ToggleBackgroundPlayback() when toggleBackgroundPlayback != null:
        return toggleBackgroundPlayback(_that.enabled);
      case ToggleNotificationControls() when toggleNotificationControls != null:
        return toggleNotificationControls(_that.enabled);
      case ToggleDataSaver() when toggleDataSaver != null:
        return toggleDataSaver(_that.enabled);
      case ToggleHideWatchedVideos() when toggleHideWatchedVideos != null:
        return toggleHideWatchedVideos(_that.enabled);
      case SetMobileDataQuality() when setMobileDataQuality != null:
        return setMobileDataQuality(_that.quality);
      case ToggleDownloadQueueItems() when toggleDownloadQueueItems != null:
        return toggleDownloadQueueItems(_that.enabled);
      case ToggleRichCaptionRendering() when toggleRichCaptionRendering != null:
        return toggleRichCaptionRendering(_that.enabled);
      case ToggleBilibiliEnabled() when toggleBilibiliEnabled != null:
        return toggleBilibiliEnabled(_that.enabled);
      case SetSwipeDirection() when setSwipeDirection != null:
        return setSwipeDirection(_that.leftToRight);
      case SetYoutubeService() when setYoutubeService != null:
        return setYoutubeService(_that.service);
      case BookmarksApplied() when bookmarksApplied != null:
        return bookmarksApplied(_that.selectedPlaylists);
      case RestrictedModeFilterChanged()
          when restrictedModeFilterChanged != null:
        return restrictedModeFilterChanged(_that.level);
      case MiniPlayerAutoExpandChanged()
          when miniPlayerAutoExpandChanged != null:
        return miniPlayerAutoExpandChanged(_that.enabled);
      case MiniPlayerTapToExpandChanged()
          when miniPlayerTapToExpandChanged != null:
        return miniPlayerTapToExpandChanged(_that.enabled);
      case MiniPlayerDoubleTapToExpandChanged()
          when miniPlayerDoubleTapToExpandChanged != null:
        return miniPlayerDoubleTapToExpandChanged(_that.enabled);
      case DownloadAutoDeleteDaysChanged()
          when downloadAutoDeleteDaysChanged != null:
        return downloadAutoDeleteDaysChanged(_that.days);
      case ContentFilterKeywordsChanged()
          when contentFilterKeywordsChanged != null:
        return contentFilterKeywordsChanged(_that.keywords);
      case ContentFilterChannelsChanged()
          when contentFilterChannelsChanged != null:
        return contentFilterChannelsChanged(_that.channelIds);
      case ContentFilterHideShortsChanged()
          when contentFilterHideShortsChanged != null:
        return contentFilterHideShortsChanged(_that.enabled);
      case ContentFilterHidePaidChanged()
          when contentFilterHidePaidChanged != null:
        return contentFilterHidePaidChanged(_that.enabled);
      case DownloadFolderChanged() when downloadFolderChanged != null:
        return downloadFolderChanged(_that.path);
      case ToggleRyd() when rydToggled != null:
        return rydToggled(_that.enabled);
      case ToggleLongPressSpeedUp() when toggleLongPressSpeedUp != null:
        return toggleLongPressSpeedUp(_that.enabled);
      case ToggleOriginalTitles() when toggleOriginalTitles != null:
        return toggleOriginalTitles(_that.enabled);
      case ToggleCommentFilter() when toggleCommentFilter != null:
        return toggleCommentFilter(_that.enabled);
      case SetCommentFilterKeywords() when setCommentFilterKeywords != null:
        return setCommentFilterKeywords(_that.keywords);
      case SetPreferredAudioQuality() when setPreferredAudioQuality != null:
        return setPreferredAudioQuality(_that.quality);
      case ToggleScreenLock() when toggleScreenLock != null:
        return toggleScreenLock(_that.enabled);
      case TogglePinchToZoom() when togglePinchToZoom != null:
        return togglePinchToZoom(_that.enabled);
      case ToggleSeekbarThumbnails() when toggleSeekbarThumbnails != null:
        return toggleSeekbarThumbnails(_that.enabled);
      case TogglePopupPlayer() when togglePopupPlayer != null:
        return togglePopupPlayer(_that.enabled);
      case ToggleLiveChatDanmaku() when toggleLiveChatDanmaku != null:
        return toggleLiveChatDanmaku(_that.enabled);
      case ToggleBluetoothSeek() when toggleBluetoothSeek != null:
        return toggleBluetoothSeek(_that.enabled);
      case ToggleMultiSelectLists() when toggleMultiSelectLists != null:
        return toggleMultiSelectLists(_that.enabled);
      case ToggleSbExclusiveMarker() when toggleSbExclusiveMarker != null:
        return toggleSbExclusiveMarker(_that.enabled);
      case ToggleSbForDownloads() when toggleSbForDownloads != null:
        return toggleSbForDownloads(_that.enabled);
      case SetYoutubeCookie() when setYoutubeCookie != null:
        return setYoutubeCookie(_that.cookie);
      case ClearYoutubeCookie() when clearYoutubeCookie != null:
        return clearYoutubeCookie();
      case SavePipedSession() when savePipedSession != null:
        return savePipedSession(_that.token, _that.username);
      case ClearPipedSession() when clearPipedSession != null:
        return clearPipedSession();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String language) getDefaultLanguage,
    required TResult Function(String quality) getDefaultQuality,
    required TResult Function(String region) getDefaultRegion,
    required TResult Function(String themeMode) changeTheme,
    required TResult Function(bool isHistoryVisible) toggleHistoryVisibility,
    required TResult Function(bool isDislikeVisible) toggleDislikeVisibility,
    required TResult Function(bool isHlsPlayer) toggleHlsPlayer,
    required TResult Function(bool isHideComments) toggleCommentVisibility,
    required TResult Function(bool isHideRelated) toggleRelatedVideoVisibility,
    required TResult Function(String instanceApi) setInstance,
    required TResult Function(YouTubeServices service) setYTService,
    required TResult Function(bool isPipDisabled) togglePipPlayer,
    required TResult Function(String filter) setSearchFilter,
    required TResult Function(String fitMode) setVideoFitMode,
    required TResult Function(int seconds) setSkipInterval,
    required TResult Function(bool isEnabled) toggleSponsorBlock,
    required TResult Function(List<String> categories)
        setSponsorBlockCategories,
    required TResult Function(bool openInBrowser) toggleOpenLinksInBrowser,
    required TResult Function(String mode) setHomeFeedMode,
    required TResult Function(bool isEnabled) toggleAudioFocus,
    required TResult Function(String profileName) addProfile,
    required TResult Function(String profileName) deleteProfile,
    required TResult Function(String profileName) switchProfile,
    required TResult Function(String oldName, String newName) renameProfile,
    required TResult Function(String profileName) exportSubscriptions,
    required TResult Function(String filePath, String profileName)
        importSubscriptions,
    required TResult Function(double size) setSubtitleSize,
    required TResult Function(bool isEnabled) toggleSearchHistoryEnabled,
    required TResult Function(bool isVisible) toggleSearchHistoryVisibility,
    required TResult Function(bool isEnabled) toggleAutoPip,
    required TResult Function(bool forceRefresh) fetchPipedInstances,
    required TResult Function(bool forceRefresh) fetchInvidiousInstances,
    required TResult Function(String? filePath) setLastExportedFilePath,
    required TResult Function(int seconds) setSleepTimer,
    required TResult Function() clearSleepTimer,
    required TResult Function(bool enabled) toggleSwipeGestures,
    required TResult Function(bool enabled) toggleDeArrow,
    required TResult Function(bool enabled) bookmarksToggled,
    required TResult Function(String playlistId, bool bookmarked)
        toggleBookmarkPlaylist,
    required TResult Function(bool enabled) restrictedModeToggled,
    required TResult Function(bool enabled) miniPlayerToggled,
    required TResult Function(String quality) downloadQualityChanged,
    required TResult Function(bool enabled) downloadSubtitlesToggled,
    required TResult Function(bool enabled) downloadOverWifiOnlyToggled,
    required TResult Function(bool enabled) downloadAutoDeleteToggled,
    required TResult Function(double speed) setPlaybackSpeed,
    required TResult Function(bool enabled) toggleAutoplayNextVideo,
    required TResult Function(bool enabled) toggleShowRelatedInQueue,
    required TResult Function(int seconds) setQueueDismissTime,
    required TResult Function(int seconds) setAutoplayCountdown,
    required TResult Function(bool enabled) toggleDisableAutoplayOnCellular,
    required TResult Function(bool enabled) toggleAutoQueue,
    required TResult Function(bool enabled) toggleBufferPreload,
    required TResult Function(bool enabled) toggleAutoQualityAdjust,
    required TResult Function(bool enabled) toggleBackgroundPlayback,
    required TResult Function(bool enabled) toggleNotificationControls,
    required TResult Function(bool enabled) toggleDataSaver,
    required TResult Function(bool enabled) toggleHideWatchedVideos,
    required TResult Function(int quality) setMobileDataQuality,
    required TResult Function(bool enabled) toggleDownloadQueueItems,
    required TResult Function(bool enabled) toggleRichCaptionRendering,
    required TResult Function(bool enabled) toggleBilibiliEnabled,
    required TResult Function(bool leftToRight) setSwipeDirection,
    required TResult Function(String service) setYoutubeService,
    required TResult Function(List<String> selectedPlaylists) bookmarksApplied,
    required TResult Function(RestrictedModeFilterLevel level)
        restrictedModeFilterChanged,
    required TResult Function(bool enabled) miniPlayerAutoExpandChanged,
    required TResult Function(bool enabled) miniPlayerTapToExpandChanged,
    required TResult Function(bool enabled) miniPlayerDoubleTapToExpandChanged,
    required TResult Function(int days) downloadAutoDeleteDaysChanged,
    required TResult Function(List<String> keywords)
        contentFilterKeywordsChanged,
    required TResult Function(List<String> channelIds)
        contentFilterChannelsChanged,
    required TResult Function(bool enabled) contentFilterHideShortsChanged,
    required TResult Function(bool enabled) contentFilterHidePaidChanged,
    required TResult Function(String? path) downloadFolderChanged,
    required TResult Function(bool enabled) rydToggled,
    required TResult Function(bool enabled) toggleLongPressSpeedUp,
    required TResult Function(bool enabled) toggleOriginalTitles,
    required TResult Function(bool enabled) toggleCommentFilter,
    required TResult Function(List<String> keywords) setCommentFilterKeywords,
    required TResult Function(String quality) setPreferredAudioQuality,
    required TResult Function(bool enabled) toggleScreenLock,
    required TResult Function(bool enabled) togglePinchToZoom,
    required TResult Function(bool enabled) toggleSeekbarThumbnails,
    required TResult Function(bool enabled) togglePopupPlayer,
    required TResult Function(bool enabled) toggleLiveChatDanmaku,
    required TResult Function(bool enabled) toggleBluetoothSeek,
    required TResult Function(bool enabled) toggleMultiSelectLists,
    required TResult Function(bool enabled) toggleSbExclusiveMarker,
    required TResult Function(bool enabled) toggleSbForDownloads,
    required TResult Function(String cookie) setYoutubeCookie,
    required TResult Function() clearYoutubeCookie,
    required TResult Function(String token, String username) savePipedSession,
    required TResult Function() clearPipedSession,
  }) {
    final _that = this;
    switch (_that) {
      case InitializeSettings():
        return initialize();
      case GetDefaultLanguage():
        return getDefaultLanguage(_that.language);
      case GetDefaultQuality():
        return getDefaultQuality(_that.quality);
      case GetDefaultRegion():
        return getDefaultRegion(_that.region);
      case ChangeTheme():
        return changeTheme(_that.themeMode);
      case ToggleHistoryVisibility():
        return toggleHistoryVisibility(_that.isHistoryVisible);
      case ToggleDislikeVisibility():
        return toggleDislikeVisibility(_that.isDislikeVisible);
      case ToggleHlsPlayer():
        return toggleHlsPlayer(_that.isHlsPlayer);
      case ToggleCommentVisibility():
        return toggleCommentVisibility(_that.isHideComments);
      case ToggleRelatedVideoVisibility():
        return toggleRelatedVideoVisibility(_that.isHideRelated);
      case SetInstance():
        return setInstance(_that.instanceApi);
      case SetYTService():
        return setYTService(_that.service);
      case TogglePipPlayer():
        return togglePipPlayer(_that.isPipDisabled);
      case SetSearchFilter():
        return setSearchFilter(_that.filter);
      case SetVideoFitMode():
        return setVideoFitMode(_that.fitMode);
      case SetSkipInterval():
        return setSkipInterval(_that.seconds);
      case ToggleSponsorBlock():
        return toggleSponsorBlock(_that.isEnabled);
      case SetSponsorBlockCategories():
        return setSponsorBlockCategories(_that.categories);
      case ToggleOpenLinksInBrowser():
        return toggleOpenLinksInBrowser(_that.openInBrowser);
      case SetHomeFeedMode():
        return setHomeFeedMode(_that.mode);
      case ToggleAudioFocus():
        return toggleAudioFocus(_that.isEnabled);
      case AddProfile():
        return addProfile(_that.profileName);
      case DeleteProfile():
        return deleteProfile(_that.profileName);
      case SwitchProfile():
        return switchProfile(_that.profileName);
      case RenameProfile():
        return renameProfile(_that.oldName, _that.newName);
      case ExportSubscriptions():
        return exportSubscriptions(_that.profileName);
      case ImportSubscriptions():
        return importSubscriptions(_that.filePath, _that.profileName);
      case SetSubtitleSize():
        return setSubtitleSize(_that.size);
      case ToggleSearchHistoryEnabled():
        return toggleSearchHistoryEnabled(_that.isEnabled);
      case ToggleSearchHistoryVisibility():
        return toggleSearchHistoryVisibility(_that.isVisible);
      case ToggleAutoPip():
        return toggleAutoPip(_that.isEnabled);
      case FetchPipedInstances():
        return fetchPipedInstances(_that.forceRefresh);
      case FetchInvidiousInstances():
        return fetchInvidiousInstances(_that.forceRefresh);
      case SetLastExportedFilePath():
        return setLastExportedFilePath(_that.filePath);
      case SetSleepTimer():
        return setSleepTimer(_that.seconds);
      case ClearSleepTimer():
        return clearSleepTimer();
      case ToggleSwipeGestures():
        return toggleSwipeGestures(_that.enabled);
      case ToggleDeArrow():
        return toggleDeArrow(_that.enabled);
      case ToggleBookmarks():
        return bookmarksToggled(_that.enabled);
      case ToggleBookmarkPlaylist():
        return toggleBookmarkPlaylist(_that.playlistId, _that.bookmarked);
      case ToggleRestrictedMode():
        return restrictedModeToggled(_that.enabled);
      case ToggleMiniPlayer():
        return miniPlayerToggled(_that.enabled);
      case SetDownloadQuality():
        return downloadQualityChanged(_that.quality);
      case ToggleDownloadSubtitles():
        return downloadSubtitlesToggled(_that.enabled);
      case ToggleDownloadOverWifiOnly():
        return downloadOverWifiOnlyToggled(_that.enabled);
      case ToggleDownloadAutoDelete():
        return downloadAutoDeleteToggled(_that.enabled);
      case SetPlaybackSpeed():
        return setPlaybackSpeed(_that.speed);
      case ToggleAutoplayNextVideo():
        return toggleAutoplayNextVideo(_that.enabled);
      case ToggleShowRelatedInQueue():
        return toggleShowRelatedInQueue(_that.enabled);
      case SetQueueDismissTime():
        return setQueueDismissTime(_that.seconds);
      case SetAutoplayCountdown():
        return setAutoplayCountdown(_that.seconds);
      case ToggleDisableAutoplayOnCellular():
        return toggleDisableAutoplayOnCellular(_that.enabled);
      case ToggleAutoQueue():
        return toggleAutoQueue(_that.enabled);
      case ToggleBufferPreload():
        return toggleBufferPreload(_that.enabled);
      case ToggleAutoQualityAdjust():
        return toggleAutoQualityAdjust(_that.enabled);
      case ToggleBackgroundPlayback():
        return toggleBackgroundPlayback(_that.enabled);
      case ToggleNotificationControls():
        return toggleNotificationControls(_that.enabled);
      case ToggleDataSaver():
        return toggleDataSaver(_that.enabled);
      case ToggleHideWatchedVideos():
        return toggleHideWatchedVideos(_that.enabled);
      case SetMobileDataQuality():
        return setMobileDataQuality(_that.quality);
      case ToggleDownloadQueueItems():
        return toggleDownloadQueueItems(_that.enabled);
      case ToggleRichCaptionRendering():
        return toggleRichCaptionRendering(_that.enabled);
      case ToggleBilibiliEnabled():
        return toggleBilibiliEnabled(_that.enabled);
      case SetSwipeDirection():
        return setSwipeDirection(_that.leftToRight);
      case SetYoutubeService():
        return setYoutubeService(_that.service);
      case BookmarksApplied():
        return bookmarksApplied(_that.selectedPlaylists);
      case RestrictedModeFilterChanged():
        return restrictedModeFilterChanged(_that.level);
      case MiniPlayerAutoExpandChanged():
        return miniPlayerAutoExpandChanged(_that.enabled);
      case MiniPlayerTapToExpandChanged():
        return miniPlayerTapToExpandChanged(_that.enabled);
      case MiniPlayerDoubleTapToExpandChanged():
        return miniPlayerDoubleTapToExpandChanged(_that.enabled);
      case DownloadAutoDeleteDaysChanged():
        return downloadAutoDeleteDaysChanged(_that.days);
      case ContentFilterKeywordsChanged():
        return contentFilterKeywordsChanged(_that.keywords);
      case ContentFilterChannelsChanged():
        return contentFilterChannelsChanged(_that.channelIds);
      case ContentFilterHideShortsChanged():
        return contentFilterHideShortsChanged(_that.enabled);
      case ContentFilterHidePaidChanged():
        return contentFilterHidePaidChanged(_that.enabled);
      case DownloadFolderChanged():
        return downloadFolderChanged(_that.path);
      case ToggleRyd():
        return rydToggled(_that.enabled);
      case ToggleLongPressSpeedUp():
        return toggleLongPressSpeedUp(_that.enabled);
      case ToggleOriginalTitles():
        return toggleOriginalTitles(_that.enabled);
      case ToggleCommentFilter():
        return toggleCommentFilter(_that.enabled);
      case SetCommentFilterKeywords():
        return setCommentFilterKeywords(_that.keywords);
      case SetPreferredAudioQuality():
        return setPreferredAudioQuality(_that.quality);
      case ToggleScreenLock():
        return toggleScreenLock(_that.enabled);
      case TogglePinchToZoom():
        return togglePinchToZoom(_that.enabled);
      case ToggleSeekbarThumbnails():
        return toggleSeekbarThumbnails(_that.enabled);
      case TogglePopupPlayer():
        return togglePopupPlayer(_that.enabled);
      case ToggleLiveChatDanmaku():
        return toggleLiveChatDanmaku(_that.enabled);
      case ToggleBluetoothSeek():
        return toggleBluetoothSeek(_that.enabled);
      case ToggleMultiSelectLists():
        return toggleMultiSelectLists(_that.enabled);
      case ToggleSbExclusiveMarker():
        return toggleSbExclusiveMarker(_that.enabled);
      case ToggleSbForDownloads():
        return toggleSbForDownloads(_that.enabled);
      case SetYoutubeCookie():
        return setYoutubeCookie(_that.cookie);
      case ClearYoutubeCookie():
        return clearYoutubeCookie();
      case SavePipedSession():
        return savePipedSession(_that.token, _that.username);
      case ClearPipedSession():
        return clearPipedSession();
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String language)? getDefaultLanguage,
    TResult? Function(String quality)? getDefaultQuality,
    TResult? Function(String region)? getDefaultRegion,
    TResult? Function(String themeMode)? changeTheme,
    TResult? Function(bool isHistoryVisible)? toggleHistoryVisibility,
    TResult? Function(bool isDislikeVisible)? toggleDislikeVisibility,
    TResult? Function(bool isHlsPlayer)? toggleHlsPlayer,
    TResult? Function(bool isHideComments)? toggleCommentVisibility,
    TResult? Function(bool isHideRelated)? toggleRelatedVideoVisibility,
    TResult? Function(String instanceApi)? setInstance,
    TResult? Function(YouTubeServices service)? setYTService,
    TResult? Function(bool isPipDisabled)? togglePipPlayer,
    TResult? Function(String filter)? setSearchFilter,
    TResult? Function(String fitMode)? setVideoFitMode,
    TResult? Function(int seconds)? setSkipInterval,
    TResult? Function(bool isEnabled)? toggleSponsorBlock,
    TResult? Function(List<String> categories)? setSponsorBlockCategories,
    TResult? Function(bool openInBrowser)? toggleOpenLinksInBrowser,
    TResult? Function(String mode)? setHomeFeedMode,
    TResult? Function(bool isEnabled)? toggleAudioFocus,
    TResult? Function(String profileName)? addProfile,
    TResult? Function(String profileName)? deleteProfile,
    TResult? Function(String profileName)? switchProfile,
    TResult? Function(String oldName, String newName)? renameProfile,
    TResult? Function(String profileName)? exportSubscriptions,
    TResult? Function(String filePath, String profileName)? importSubscriptions,
    TResult? Function(double size)? setSubtitleSize,
    TResult? Function(bool isEnabled)? toggleSearchHistoryEnabled,
    TResult? Function(bool isVisible)? toggleSearchHistoryVisibility,
    TResult? Function(bool isEnabled)? toggleAutoPip,
    TResult? Function(bool forceRefresh)? fetchPipedInstances,
    TResult? Function(bool forceRefresh)? fetchInvidiousInstances,
    TResult? Function(String? filePath)? setLastExportedFilePath,
    TResult? Function(int seconds)? setSleepTimer,
    TResult? Function()? clearSleepTimer,
    TResult? Function(bool enabled)? toggleSwipeGestures,
    TResult? Function(bool enabled)? toggleDeArrow,
    TResult? Function(bool enabled)? bookmarksToggled,
    TResult? Function(String playlistId, bool bookmarked)?
        toggleBookmarkPlaylist,
    TResult? Function(bool enabled)? restrictedModeToggled,
    TResult? Function(bool enabled)? miniPlayerToggled,
    TResult? Function(String quality)? downloadQualityChanged,
    TResult? Function(bool enabled)? downloadSubtitlesToggled,
    TResult? Function(bool enabled)? downloadOverWifiOnlyToggled,
    TResult? Function(bool enabled)? downloadAutoDeleteToggled,
    TResult? Function(double speed)? setPlaybackSpeed,
    TResult? Function(bool enabled)? toggleAutoplayNextVideo,
    TResult? Function(bool enabled)? toggleShowRelatedInQueue,
    TResult? Function(int seconds)? setQueueDismissTime,
    TResult? Function(int seconds)? setAutoplayCountdown,
    TResult? Function(bool enabled)? toggleDisableAutoplayOnCellular,
    TResult? Function(bool enabled)? toggleAutoQueue,
    TResult? Function(bool enabled)? toggleBufferPreload,
    TResult? Function(bool enabled)? toggleAutoQualityAdjust,
    TResult? Function(bool enabled)? toggleBackgroundPlayback,
    TResult? Function(bool enabled)? toggleNotificationControls,
    TResult? Function(bool enabled)? toggleDataSaver,
    TResult? Function(bool enabled)? toggleHideWatchedVideos,
    TResult? Function(int quality)? setMobileDataQuality,
    TResult? Function(bool enabled)? toggleDownloadQueueItems,
    TResult? Function(bool enabled)? toggleRichCaptionRendering,
    TResult? Function(bool enabled)? toggleBilibiliEnabled,
    TResult? Function(bool leftToRight)? setSwipeDirection,
    TResult? Function(String service)? setYoutubeService,
    TResult? Function(List<String> selectedPlaylists)? bookmarksApplied,
    TResult? Function(RestrictedModeFilterLevel level)?
        restrictedModeFilterChanged,
    TResult? Function(bool enabled)? miniPlayerAutoExpandChanged,
    TResult? Function(bool enabled)? miniPlayerTapToExpandChanged,
    TResult? Function(bool enabled)? miniPlayerDoubleTapToExpandChanged,
    TResult? Function(int days)? downloadAutoDeleteDaysChanged,
    TResult? Function(List<String> keywords)? contentFilterKeywordsChanged,
    TResult? Function(List<String> channelIds)? contentFilterChannelsChanged,
    TResult? Function(bool enabled)? contentFilterHideShortsChanged,
    TResult? Function(bool enabled)? contentFilterHidePaidChanged,
    TResult? Function(String? path)? downloadFolderChanged,
    TResult? Function(bool enabled)? rydToggled,
    TResult? Function(bool enabled)? toggleLongPressSpeedUp,
    TResult? Function(bool enabled)? toggleOriginalTitles,
    TResult? Function(bool enabled)? toggleCommentFilter,
    TResult? Function(List<String> keywords)? setCommentFilterKeywords,
    TResult? Function(String quality)? setPreferredAudioQuality,
    TResult? Function(bool enabled)? toggleScreenLock,
    TResult? Function(bool enabled)? togglePinchToZoom,
    TResult? Function(bool enabled)? toggleSeekbarThumbnails,
    TResult? Function(bool enabled)? togglePopupPlayer,
    TResult? Function(bool enabled)? toggleLiveChatDanmaku,
    TResult? Function(bool enabled)? toggleBluetoothSeek,
    TResult? Function(bool enabled)? toggleMultiSelectLists,
    TResult? Function(bool enabled)? toggleSbExclusiveMarker,
    TResult? Function(bool enabled)? toggleSbForDownloads,
    TResult? Function(String cookie)? setYoutubeCookie,
    TResult? Function()? clearYoutubeCookie,
    TResult? Function(String token, String username)? savePipedSession,
    TResult? Function()? clearPipedSession,
  }) {
    final _that = this;
    switch (_that) {
      case InitializeSettings() when initialize != null:
        return initialize();
      case GetDefaultLanguage() when getDefaultLanguage != null:
        return getDefaultLanguage(_that.language);
      case GetDefaultQuality() when getDefaultQuality != null:
        return getDefaultQuality(_that.quality);
      case GetDefaultRegion() when getDefaultRegion != null:
        return getDefaultRegion(_that.region);
      case ChangeTheme() when changeTheme != null:
        return changeTheme(_that.themeMode);
      case ToggleHistoryVisibility() when toggleHistoryVisibility != null:
        return toggleHistoryVisibility(_that.isHistoryVisible);
      case ToggleDislikeVisibility() when toggleDislikeVisibility != null:
        return toggleDislikeVisibility(_that.isDislikeVisible);
      case ToggleHlsPlayer() when toggleHlsPlayer != null:
        return toggleHlsPlayer(_that.isHlsPlayer);
      case ToggleCommentVisibility() when toggleCommentVisibility != null:
        return toggleCommentVisibility(_that.isHideComments);
      case ToggleRelatedVideoVisibility()
          when toggleRelatedVideoVisibility != null:
        return toggleRelatedVideoVisibility(_that.isHideRelated);
      case SetInstance() when setInstance != null:
        return setInstance(_that.instanceApi);
      case SetYTService() when setYTService != null:
        return setYTService(_that.service);
      case TogglePipPlayer() when togglePipPlayer != null:
        return togglePipPlayer(_that.isPipDisabled);
      case SetSearchFilter() when setSearchFilter != null:
        return setSearchFilter(_that.filter);
      case SetVideoFitMode() when setVideoFitMode != null:
        return setVideoFitMode(_that.fitMode);
      case SetSkipInterval() when setSkipInterval != null:
        return setSkipInterval(_that.seconds);
      case ToggleSponsorBlock() when toggleSponsorBlock != null:
        return toggleSponsorBlock(_that.isEnabled);
      case SetSponsorBlockCategories() when setSponsorBlockCategories != null:
        return setSponsorBlockCategories(_that.categories);
      case ToggleOpenLinksInBrowser() when toggleOpenLinksInBrowser != null:
        return toggleOpenLinksInBrowser(_that.openInBrowser);
      case SetHomeFeedMode() when setHomeFeedMode != null:
        return setHomeFeedMode(_that.mode);
      case ToggleAudioFocus() when toggleAudioFocus != null:
        return toggleAudioFocus(_that.isEnabled);
      case AddProfile() when addProfile != null:
        return addProfile(_that.profileName);
      case DeleteProfile() when deleteProfile != null:
        return deleteProfile(_that.profileName);
      case SwitchProfile() when switchProfile != null:
        return switchProfile(_that.profileName);
      case RenameProfile() when renameProfile != null:
        return renameProfile(_that.oldName, _that.newName);
      case ExportSubscriptions() when exportSubscriptions != null:
        return exportSubscriptions(_that.profileName);
      case ImportSubscriptions() when importSubscriptions != null:
        return importSubscriptions(_that.filePath, _that.profileName);
      case SetSubtitleSize() when setSubtitleSize != null:
        return setSubtitleSize(_that.size);
      case ToggleSearchHistoryEnabled() when toggleSearchHistoryEnabled != null:
        return toggleSearchHistoryEnabled(_that.isEnabled);
      case ToggleSearchHistoryVisibility()
          when toggleSearchHistoryVisibility != null:
        return toggleSearchHistoryVisibility(_that.isVisible);
      case ToggleAutoPip() when toggleAutoPip != null:
        return toggleAutoPip(_that.isEnabled);
      case FetchPipedInstances() when fetchPipedInstances != null:
        return fetchPipedInstances(_that.forceRefresh);
      case FetchInvidiousInstances() when fetchInvidiousInstances != null:
        return fetchInvidiousInstances(_that.forceRefresh);
      case SetLastExportedFilePath() when setLastExportedFilePath != null:
        return setLastExportedFilePath(_that.filePath);
      case SetSleepTimer() when setSleepTimer != null:
        return setSleepTimer(_that.seconds);
      case ClearSleepTimer() when clearSleepTimer != null:
        return clearSleepTimer();
      case ToggleSwipeGestures() when toggleSwipeGestures != null:
        return toggleSwipeGestures(_that.enabled);
      case ToggleDeArrow() when toggleDeArrow != null:
        return toggleDeArrow(_that.enabled);
      case ToggleBookmarks() when bookmarksToggled != null:
        return bookmarksToggled(_that.enabled);
      case ToggleBookmarkPlaylist() when toggleBookmarkPlaylist != null:
        return toggleBookmarkPlaylist(_that.playlistId, _that.bookmarked);
      case ToggleRestrictedMode() when restrictedModeToggled != null:
        return restrictedModeToggled(_that.enabled);
      case ToggleMiniPlayer() when miniPlayerToggled != null:
        return miniPlayerToggled(_that.enabled);
      case SetDownloadQuality() when downloadQualityChanged != null:
        return downloadQualityChanged(_that.quality);
      case ToggleDownloadSubtitles() when downloadSubtitlesToggled != null:
        return downloadSubtitlesToggled(_that.enabled);
      case ToggleDownloadOverWifiOnly()
          when downloadOverWifiOnlyToggled != null:
        return downloadOverWifiOnlyToggled(_that.enabled);
      case ToggleDownloadAutoDelete() when downloadAutoDeleteToggled != null:
        return downloadAutoDeleteToggled(_that.enabled);
      case SetPlaybackSpeed() when setPlaybackSpeed != null:
        return setPlaybackSpeed(_that.speed);
      case ToggleAutoplayNextVideo() when toggleAutoplayNextVideo != null:
        return toggleAutoplayNextVideo(_that.enabled);
      case ToggleShowRelatedInQueue() when toggleShowRelatedInQueue != null:
        return toggleShowRelatedInQueue(_that.enabled);
      case SetQueueDismissTime() when setQueueDismissTime != null:
        return setQueueDismissTime(_that.seconds);
      case SetAutoplayCountdown() when setAutoplayCountdown != null:
        return setAutoplayCountdown(_that.seconds);
      case ToggleDisableAutoplayOnCellular()
          when toggleDisableAutoplayOnCellular != null:
        return toggleDisableAutoplayOnCellular(_that.enabled);
      case ToggleAutoQueue() when toggleAutoQueue != null:
        return toggleAutoQueue(_that.enabled);
      case ToggleBufferPreload() when toggleBufferPreload != null:
        return toggleBufferPreload(_that.enabled);
      case ToggleAutoQualityAdjust() when toggleAutoQualityAdjust != null:
        return toggleAutoQualityAdjust(_that.enabled);
      case ToggleBackgroundPlayback() when toggleBackgroundPlayback != null:
        return toggleBackgroundPlayback(_that.enabled);
      case ToggleNotificationControls() when toggleNotificationControls != null:
        return toggleNotificationControls(_that.enabled);
      case ToggleDataSaver() when toggleDataSaver != null:
        return toggleDataSaver(_that.enabled);
      case ToggleHideWatchedVideos() when toggleHideWatchedVideos != null:
        return toggleHideWatchedVideos(_that.enabled);
      case SetMobileDataQuality() when setMobileDataQuality != null:
        return setMobileDataQuality(_that.quality);
      case ToggleDownloadQueueItems() when toggleDownloadQueueItems != null:
        return toggleDownloadQueueItems(_that.enabled);
      case ToggleRichCaptionRendering() when toggleRichCaptionRendering != null:
        return toggleRichCaptionRendering(_that.enabled);
      case ToggleBilibiliEnabled() when toggleBilibiliEnabled != null:
        return toggleBilibiliEnabled(_that.enabled);
      case SetSwipeDirection() when setSwipeDirection != null:
        return setSwipeDirection(_that.leftToRight);
      case SetYoutubeService() when setYoutubeService != null:
        return setYoutubeService(_that.service);
      case BookmarksApplied() when bookmarksApplied != null:
        return bookmarksApplied(_that.selectedPlaylists);
      case RestrictedModeFilterChanged()
          when restrictedModeFilterChanged != null:
        return restrictedModeFilterChanged(_that.level);
      case MiniPlayerAutoExpandChanged()
          when miniPlayerAutoExpandChanged != null:
        return miniPlayerAutoExpandChanged(_that.enabled);
      case MiniPlayerTapToExpandChanged()
          when miniPlayerTapToExpandChanged != null:
        return miniPlayerTapToExpandChanged(_that.enabled);
      case MiniPlayerDoubleTapToExpandChanged()
          when miniPlayerDoubleTapToExpandChanged != null:
        return miniPlayerDoubleTapToExpandChanged(_that.enabled);
      case DownloadAutoDeleteDaysChanged()
          when downloadAutoDeleteDaysChanged != null:
        return downloadAutoDeleteDaysChanged(_that.days);
      case ContentFilterKeywordsChanged()
          when contentFilterKeywordsChanged != null:
        return contentFilterKeywordsChanged(_that.keywords);
      case ContentFilterChannelsChanged()
          when contentFilterChannelsChanged != null:
        return contentFilterChannelsChanged(_that.channelIds);
      case ContentFilterHideShortsChanged()
          when contentFilterHideShortsChanged != null:
        return contentFilterHideShortsChanged(_that.enabled);
      case ContentFilterHidePaidChanged()
          when contentFilterHidePaidChanged != null:
        return contentFilterHidePaidChanged(_that.enabled);
      case DownloadFolderChanged() when downloadFolderChanged != null:
        return downloadFolderChanged(_that.path);
      case ToggleRyd() when rydToggled != null:
        return rydToggled(_that.enabled);
      case ToggleLongPressSpeedUp() when toggleLongPressSpeedUp != null:
        return toggleLongPressSpeedUp(_that.enabled);
      case ToggleOriginalTitles() when toggleOriginalTitles != null:
        return toggleOriginalTitles(_that.enabled);
      case ToggleCommentFilter() when toggleCommentFilter != null:
        return toggleCommentFilter(_that.enabled);
      case SetCommentFilterKeywords() when setCommentFilterKeywords != null:
        return setCommentFilterKeywords(_that.keywords);
      case SetPreferredAudioQuality() when setPreferredAudioQuality != null:
        return setPreferredAudioQuality(_that.quality);
      case ToggleScreenLock() when toggleScreenLock != null:
        return toggleScreenLock(_that.enabled);
      case TogglePinchToZoom() when togglePinchToZoom != null:
        return togglePinchToZoom(_that.enabled);
      case ToggleSeekbarThumbnails() when toggleSeekbarThumbnails != null:
        return toggleSeekbarThumbnails(_that.enabled);
      case TogglePopupPlayer() when togglePopupPlayer != null:
        return togglePopupPlayer(_that.enabled);
      case ToggleLiveChatDanmaku() when toggleLiveChatDanmaku != null:
        return toggleLiveChatDanmaku(_that.enabled);
      case ToggleBluetoothSeek() when toggleBluetoothSeek != null:
        return toggleBluetoothSeek(_that.enabled);
      case ToggleMultiSelectLists() when toggleMultiSelectLists != null:
        return toggleMultiSelectLists(_that.enabled);
      case ToggleSbExclusiveMarker() when toggleSbExclusiveMarker != null:
        return toggleSbExclusiveMarker(_that.enabled);
      case ToggleSbForDownloads() when toggleSbForDownloads != null:
        return toggleSbForDownloads(_that.enabled);
      case SetYoutubeCookie() when setYoutubeCookie != null:
        return setYoutubeCookie(_that.cookie);
      case ClearYoutubeCookie() when clearYoutubeCookie != null:
        return clearYoutubeCookie();
      case SavePipedSession() when savePipedSession != null:
        return savePipedSession(_that.token, _that.username);
      case ClearPipedSession() when clearPipedSession != null:
        return clearPipedSession();
      case _:
        return null;
    }
  }
}

/// @nodoc

class InitializeSettings implements SettingsEvent {
  const InitializeSettings();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitializeSettings);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsEvent.initialize()';
  }
}

/// @nodoc

class GetDefaultLanguage implements SettingsEvent {
  const GetDefaultLanguage({required this.language});

  final String language;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetDefaultLanguageCopyWith<GetDefaultLanguage> get copyWith =>
      _$GetDefaultLanguageCopyWithImpl<GetDefaultLanguage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetDefaultLanguage &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @override
  String toString() {
    return 'SettingsEvent.getDefaultLanguage(language: $language)';
  }
}

/// @nodoc
abstract mixin class $GetDefaultLanguageCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $GetDefaultLanguageCopyWith(
          GetDefaultLanguage value, $Res Function(GetDefaultLanguage) _then) =
      _$GetDefaultLanguageCopyWithImpl;
  @useResult
  $Res call({String language});
}

/// @nodoc
class _$GetDefaultLanguageCopyWithImpl<$Res>
    implements $GetDefaultLanguageCopyWith<$Res> {
  _$GetDefaultLanguageCopyWithImpl(this._self, this._then);

  final GetDefaultLanguage _self;
  final $Res Function(GetDefaultLanguage) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? language = null,
  }) {
    return _then(GetDefaultLanguage(
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetDefaultQuality implements SettingsEvent {
  const GetDefaultQuality({required this.quality});

  final String quality;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetDefaultQualityCopyWith<GetDefaultQuality> get copyWith =>
      _$GetDefaultQualityCopyWithImpl<GetDefaultQuality>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetDefaultQuality &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quality);

  @override
  String toString() {
    return 'SettingsEvent.getDefaultQuality(quality: $quality)';
  }
}

/// @nodoc
abstract mixin class $GetDefaultQualityCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $GetDefaultQualityCopyWith(
          GetDefaultQuality value, $Res Function(GetDefaultQuality) _then) =
      _$GetDefaultQualityCopyWithImpl;
  @useResult
  $Res call({String quality});
}

/// @nodoc
class _$GetDefaultQualityCopyWithImpl<$Res>
    implements $GetDefaultQualityCopyWith<$Res> {
  _$GetDefaultQualityCopyWithImpl(this._self, this._then);

  final GetDefaultQuality _self;
  final $Res Function(GetDefaultQuality) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? quality = null,
  }) {
    return _then(GetDefaultQuality(
      quality: null == quality
          ? _self.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetDefaultRegion implements SettingsEvent {
  const GetDefaultRegion({required this.region});

  final String region;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetDefaultRegionCopyWith<GetDefaultRegion> get copyWith =>
      _$GetDefaultRegionCopyWithImpl<GetDefaultRegion>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetDefaultRegion &&
            (identical(other.region, region) || other.region == region));
  }

  @override
  int get hashCode => Object.hash(runtimeType, region);

  @override
  String toString() {
    return 'SettingsEvent.getDefaultRegion(region: $region)';
  }
}

/// @nodoc
abstract mixin class $GetDefaultRegionCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $GetDefaultRegionCopyWith(
          GetDefaultRegion value, $Res Function(GetDefaultRegion) _then) =
      _$GetDefaultRegionCopyWithImpl;
  @useResult
  $Res call({String region});
}

/// @nodoc
class _$GetDefaultRegionCopyWithImpl<$Res>
    implements $GetDefaultRegionCopyWith<$Res> {
  _$GetDefaultRegionCopyWithImpl(this._self, this._then);

  final GetDefaultRegion _self;
  final $Res Function(GetDefaultRegion) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? region = null,
  }) {
    return _then(GetDefaultRegion(
      region: null == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ChangeTheme implements SettingsEvent {
  const ChangeTheme({required this.themeMode});

  final String themeMode;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChangeThemeCopyWith<ChangeTheme> get copyWith =>
      _$ChangeThemeCopyWithImpl<ChangeTheme>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeTheme &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  @override
  String toString() {
    return 'SettingsEvent.changeTheme(themeMode: $themeMode)';
  }
}

/// @nodoc
abstract mixin class $ChangeThemeCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ChangeThemeCopyWith(
          ChangeTheme value, $Res Function(ChangeTheme) _then) =
      _$ChangeThemeCopyWithImpl;
  @useResult
  $Res call({String themeMode});
}

/// @nodoc
class _$ChangeThemeCopyWithImpl<$Res> implements $ChangeThemeCopyWith<$Res> {
  _$ChangeThemeCopyWithImpl(this._self, this._then);

  final ChangeTheme _self;
  final $Res Function(ChangeTheme) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(ChangeTheme(
      themeMode: null == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ToggleHistoryVisibility implements SettingsEvent {
  const ToggleHistoryVisibility({required this.isHistoryVisible});

  final bool isHistoryVisible;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleHistoryVisibilityCopyWith<ToggleHistoryVisibility> get copyWith =>
      _$ToggleHistoryVisibilityCopyWithImpl<ToggleHistoryVisibility>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleHistoryVisibility &&
            (identical(other.isHistoryVisible, isHistoryVisible) ||
                other.isHistoryVisible == isHistoryVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isHistoryVisible);

  @override
  String toString() {
    return 'SettingsEvent.toggleHistoryVisibility(isHistoryVisible: $isHistoryVisible)';
  }
}

/// @nodoc
abstract mixin class $ToggleHistoryVisibilityCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleHistoryVisibilityCopyWith(ToggleHistoryVisibility value,
          $Res Function(ToggleHistoryVisibility) _then) =
      _$ToggleHistoryVisibilityCopyWithImpl;
  @useResult
  $Res call({bool isHistoryVisible});
}

/// @nodoc
class _$ToggleHistoryVisibilityCopyWithImpl<$Res>
    implements $ToggleHistoryVisibilityCopyWith<$Res> {
  _$ToggleHistoryVisibilityCopyWithImpl(this._self, this._then);

  final ToggleHistoryVisibility _self;
  final $Res Function(ToggleHistoryVisibility) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isHistoryVisible = null,
  }) {
    return _then(ToggleHistoryVisibility(
      isHistoryVisible: null == isHistoryVisible
          ? _self.isHistoryVisible
          : isHistoryVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleDislikeVisibility implements SettingsEvent {
  const ToggleDislikeVisibility({required this.isDislikeVisible});

  final bool isDislikeVisible;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleDislikeVisibilityCopyWith<ToggleDislikeVisibility> get copyWith =>
      _$ToggleDislikeVisibilityCopyWithImpl<ToggleDislikeVisibility>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleDislikeVisibility &&
            (identical(other.isDislikeVisible, isDislikeVisible) ||
                other.isDislikeVisible == isDislikeVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDislikeVisible);

  @override
  String toString() {
    return 'SettingsEvent.toggleDislikeVisibility(isDislikeVisible: $isDislikeVisible)';
  }
}

/// @nodoc
abstract mixin class $ToggleDislikeVisibilityCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleDislikeVisibilityCopyWith(ToggleDislikeVisibility value,
          $Res Function(ToggleDislikeVisibility) _then) =
      _$ToggleDislikeVisibilityCopyWithImpl;
  @useResult
  $Res call({bool isDislikeVisible});
}

/// @nodoc
class _$ToggleDislikeVisibilityCopyWithImpl<$Res>
    implements $ToggleDislikeVisibilityCopyWith<$Res> {
  _$ToggleDislikeVisibilityCopyWithImpl(this._self, this._then);

  final ToggleDislikeVisibility _self;
  final $Res Function(ToggleDislikeVisibility) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isDislikeVisible = null,
  }) {
    return _then(ToggleDislikeVisibility(
      isDislikeVisible: null == isDislikeVisible
          ? _self.isDislikeVisible
          : isDislikeVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleHlsPlayer implements SettingsEvent {
  const ToggleHlsPlayer({required this.isHlsPlayer});

  final bool isHlsPlayer;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleHlsPlayerCopyWith<ToggleHlsPlayer> get copyWith =>
      _$ToggleHlsPlayerCopyWithImpl<ToggleHlsPlayer>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleHlsPlayer &&
            (identical(other.isHlsPlayer, isHlsPlayer) ||
                other.isHlsPlayer == isHlsPlayer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isHlsPlayer);

  @override
  String toString() {
    return 'SettingsEvent.toggleHlsPlayer(isHlsPlayer: $isHlsPlayer)';
  }
}

/// @nodoc
abstract mixin class $ToggleHlsPlayerCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleHlsPlayerCopyWith(
          ToggleHlsPlayer value, $Res Function(ToggleHlsPlayer) _then) =
      _$ToggleHlsPlayerCopyWithImpl;
  @useResult
  $Res call({bool isHlsPlayer});
}

/// @nodoc
class _$ToggleHlsPlayerCopyWithImpl<$Res>
    implements $ToggleHlsPlayerCopyWith<$Res> {
  _$ToggleHlsPlayerCopyWithImpl(this._self, this._then);

  final ToggleHlsPlayer _self;
  final $Res Function(ToggleHlsPlayer) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isHlsPlayer = null,
  }) {
    return _then(ToggleHlsPlayer(
      isHlsPlayer: null == isHlsPlayer
          ? _self.isHlsPlayer
          : isHlsPlayer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleCommentVisibility implements SettingsEvent {
  const ToggleCommentVisibility({required this.isHideComments});

  final bool isHideComments;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleCommentVisibilityCopyWith<ToggleCommentVisibility> get copyWith =>
      _$ToggleCommentVisibilityCopyWithImpl<ToggleCommentVisibility>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleCommentVisibility &&
            (identical(other.isHideComments, isHideComments) ||
                other.isHideComments == isHideComments));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isHideComments);

  @override
  String toString() {
    return 'SettingsEvent.toggleCommentVisibility(isHideComments: $isHideComments)';
  }
}

/// @nodoc
abstract mixin class $ToggleCommentVisibilityCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleCommentVisibilityCopyWith(ToggleCommentVisibility value,
          $Res Function(ToggleCommentVisibility) _then) =
      _$ToggleCommentVisibilityCopyWithImpl;
  @useResult
  $Res call({bool isHideComments});
}

/// @nodoc
class _$ToggleCommentVisibilityCopyWithImpl<$Res>
    implements $ToggleCommentVisibilityCopyWith<$Res> {
  _$ToggleCommentVisibilityCopyWithImpl(this._self, this._then);

  final ToggleCommentVisibility _self;
  final $Res Function(ToggleCommentVisibility) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isHideComments = null,
  }) {
    return _then(ToggleCommentVisibility(
      isHideComments: null == isHideComments
          ? _self.isHideComments
          : isHideComments // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleRelatedVideoVisibility implements SettingsEvent {
  const ToggleRelatedVideoVisibility({required this.isHideRelated});

  final bool isHideRelated;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleRelatedVideoVisibilityCopyWith<ToggleRelatedVideoVisibility>
      get copyWith => _$ToggleRelatedVideoVisibilityCopyWithImpl<
          ToggleRelatedVideoVisibility>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleRelatedVideoVisibility &&
            (identical(other.isHideRelated, isHideRelated) ||
                other.isHideRelated == isHideRelated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isHideRelated);

  @override
  String toString() {
    return 'SettingsEvent.toggleRelatedVideoVisibility(isHideRelated: $isHideRelated)';
  }
}

/// @nodoc
abstract mixin class $ToggleRelatedVideoVisibilityCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleRelatedVideoVisibilityCopyWith(
          ToggleRelatedVideoVisibility value,
          $Res Function(ToggleRelatedVideoVisibility) _then) =
      _$ToggleRelatedVideoVisibilityCopyWithImpl;
  @useResult
  $Res call({bool isHideRelated});
}

/// @nodoc
class _$ToggleRelatedVideoVisibilityCopyWithImpl<$Res>
    implements $ToggleRelatedVideoVisibilityCopyWith<$Res> {
  _$ToggleRelatedVideoVisibilityCopyWithImpl(this._self, this._then);

  final ToggleRelatedVideoVisibility _self;
  final $Res Function(ToggleRelatedVideoVisibility) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isHideRelated = null,
  }) {
    return _then(ToggleRelatedVideoVisibility(
      isHideRelated: null == isHideRelated
          ? _self.isHideRelated
          : isHideRelated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SetInstance implements SettingsEvent {
  const SetInstance({required this.instanceApi});

  final String instanceApi;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetInstanceCopyWith<SetInstance> get copyWith =>
      _$SetInstanceCopyWithImpl<SetInstance>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetInstance &&
            (identical(other.instanceApi, instanceApi) ||
                other.instanceApi == instanceApi));
  }

  @override
  int get hashCode => Object.hash(runtimeType, instanceApi);

  @override
  String toString() {
    return 'SettingsEvent.setInstance(instanceApi: $instanceApi)';
  }
}

/// @nodoc
abstract mixin class $SetInstanceCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetInstanceCopyWith(
          SetInstance value, $Res Function(SetInstance) _then) =
      _$SetInstanceCopyWithImpl;
  @useResult
  $Res call({String instanceApi});
}

/// @nodoc
class _$SetInstanceCopyWithImpl<$Res> implements $SetInstanceCopyWith<$Res> {
  _$SetInstanceCopyWithImpl(this._self, this._then);

  final SetInstance _self;
  final $Res Function(SetInstance) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? instanceApi = null,
  }) {
    return _then(SetInstance(
      instanceApi: null == instanceApi
          ? _self.instanceApi
          : instanceApi // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SetYTService implements SettingsEvent {
  const SetYTService({required this.service});

  final YouTubeServices service;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetYTServiceCopyWith<SetYTService> get copyWith =>
      _$SetYTServiceCopyWithImpl<SetYTService>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetYTService &&
            (identical(other.service, service) || other.service == service));
  }

  @override
  int get hashCode => Object.hash(runtimeType, service);

  @override
  String toString() {
    return 'SettingsEvent.setYTService(service: $service)';
  }
}

/// @nodoc
abstract mixin class $SetYTServiceCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetYTServiceCopyWith(
          SetYTService value, $Res Function(SetYTService) _then) =
      _$SetYTServiceCopyWithImpl;
  @useResult
  $Res call({YouTubeServices service});
}

/// @nodoc
class _$SetYTServiceCopyWithImpl<$Res> implements $SetYTServiceCopyWith<$Res> {
  _$SetYTServiceCopyWithImpl(this._self, this._then);

  final SetYTService _self;
  final $Res Function(SetYTService) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? service = null,
  }) {
    return _then(SetYTService(
      service: null == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as YouTubeServices,
    ));
  }
}

/// @nodoc

class TogglePipPlayer implements SettingsEvent {
  const TogglePipPlayer({required this.isPipDisabled});

  final bool isPipDisabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TogglePipPlayerCopyWith<TogglePipPlayer> get copyWith =>
      _$TogglePipPlayerCopyWithImpl<TogglePipPlayer>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TogglePipPlayer &&
            (identical(other.isPipDisabled, isPipDisabled) ||
                other.isPipDisabled == isPipDisabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPipDisabled);

  @override
  String toString() {
    return 'SettingsEvent.togglePipPlayer(isPipDisabled: $isPipDisabled)';
  }
}

/// @nodoc
abstract mixin class $TogglePipPlayerCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $TogglePipPlayerCopyWith(
          TogglePipPlayer value, $Res Function(TogglePipPlayer) _then) =
      _$TogglePipPlayerCopyWithImpl;
  @useResult
  $Res call({bool isPipDisabled});
}

/// @nodoc
class _$TogglePipPlayerCopyWithImpl<$Res>
    implements $TogglePipPlayerCopyWith<$Res> {
  _$TogglePipPlayerCopyWithImpl(this._self, this._then);

  final TogglePipPlayer _self;
  final $Res Function(TogglePipPlayer) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isPipDisabled = null,
  }) {
    return _then(TogglePipPlayer(
      isPipDisabled: null == isPipDisabled
          ? _self.isPipDisabled
          : isPipDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SetSearchFilter implements SettingsEvent {
  const SetSearchFilter({required this.filter});

  final String filter;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetSearchFilterCopyWith<SetSearchFilter> get copyWith =>
      _$SetSearchFilterCopyWithImpl<SetSearchFilter>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetSearchFilter &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @override
  String toString() {
    return 'SettingsEvent.setSearchFilter(filter: $filter)';
  }
}

/// @nodoc
abstract mixin class $SetSearchFilterCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetSearchFilterCopyWith(
          SetSearchFilter value, $Res Function(SetSearchFilter) _then) =
      _$SetSearchFilterCopyWithImpl;
  @useResult
  $Res call({String filter});
}

/// @nodoc
class _$SetSearchFilterCopyWithImpl<$Res>
    implements $SetSearchFilterCopyWith<$Res> {
  _$SetSearchFilterCopyWithImpl(this._self, this._then);

  final SetSearchFilter _self;
  final $Res Function(SetSearchFilter) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? filter = null,
  }) {
    return _then(SetSearchFilter(
      filter: null == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SetVideoFitMode implements SettingsEvent {
  const SetVideoFitMode({required this.fitMode});

  final String fitMode;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetVideoFitModeCopyWith<SetVideoFitMode> get copyWith =>
      _$SetVideoFitModeCopyWithImpl<SetVideoFitMode>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetVideoFitMode &&
            (identical(other.fitMode, fitMode) || other.fitMode == fitMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fitMode);

  @override
  String toString() {
    return 'SettingsEvent.setVideoFitMode(fitMode: $fitMode)';
  }
}

/// @nodoc
abstract mixin class $SetVideoFitModeCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetVideoFitModeCopyWith(
          SetVideoFitMode value, $Res Function(SetVideoFitMode) _then) =
      _$SetVideoFitModeCopyWithImpl;
  @useResult
  $Res call({String fitMode});
}

/// @nodoc
class _$SetVideoFitModeCopyWithImpl<$Res>
    implements $SetVideoFitModeCopyWith<$Res> {
  _$SetVideoFitModeCopyWithImpl(this._self, this._then);

  final SetVideoFitMode _self;
  final $Res Function(SetVideoFitMode) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fitMode = null,
  }) {
    return _then(SetVideoFitMode(
      fitMode: null == fitMode
          ? _self.fitMode
          : fitMode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SetSkipInterval implements SettingsEvent {
  const SetSkipInterval({required this.seconds});

  final int seconds;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetSkipIntervalCopyWith<SetSkipInterval> get copyWith =>
      _$SetSkipIntervalCopyWithImpl<SetSkipInterval>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetSkipInterval &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, seconds);

  @override
  String toString() {
    return 'SettingsEvent.setSkipInterval(seconds: $seconds)';
  }
}

/// @nodoc
abstract mixin class $SetSkipIntervalCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetSkipIntervalCopyWith(
          SetSkipInterval value, $Res Function(SetSkipInterval) _then) =
      _$SetSkipIntervalCopyWithImpl;
  @useResult
  $Res call({int seconds});
}

/// @nodoc
class _$SetSkipIntervalCopyWithImpl<$Res>
    implements $SetSkipIntervalCopyWith<$Res> {
  _$SetSkipIntervalCopyWithImpl(this._self, this._then);

  final SetSkipInterval _self;
  final $Res Function(SetSkipInterval) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? seconds = null,
  }) {
    return _then(SetSkipInterval(
      seconds: null == seconds
          ? _self.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ToggleSponsorBlock implements SettingsEvent {
  const ToggleSponsorBlock({required this.isEnabled});

  final bool isEnabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleSponsorBlockCopyWith<ToggleSponsorBlock> get copyWith =>
      _$ToggleSponsorBlockCopyWithImpl<ToggleSponsorBlock>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleSponsorBlock &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEnabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleSponsorBlock(isEnabled: $isEnabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleSponsorBlockCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleSponsorBlockCopyWith(
          ToggleSponsorBlock value, $Res Function(ToggleSponsorBlock) _then) =
      _$ToggleSponsorBlockCopyWithImpl;
  @useResult
  $Res call({bool isEnabled});
}

/// @nodoc
class _$ToggleSponsorBlockCopyWithImpl<$Res>
    implements $ToggleSponsorBlockCopyWith<$Res> {
  _$ToggleSponsorBlockCopyWithImpl(this._self, this._then);

  final ToggleSponsorBlock _self;
  final $Res Function(ToggleSponsorBlock) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isEnabled = null,
  }) {
    return _then(ToggleSponsorBlock(
      isEnabled: null == isEnabled
          ? _self.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SetSponsorBlockCategories implements SettingsEvent {
  const SetSponsorBlockCategories({required final List<String> categories})
      : _categories = categories;

  final List<String> _categories;
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetSponsorBlockCategoriesCopyWith<SetSponsorBlockCategories> get copyWith =>
      _$SetSponsorBlockCategoriesCopyWithImpl<SetSponsorBlockCategories>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetSponsorBlockCategories &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @override
  String toString() {
    return 'SettingsEvent.setSponsorBlockCategories(categories: $categories)';
  }
}

/// @nodoc
abstract mixin class $SetSponsorBlockCategoriesCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetSponsorBlockCategoriesCopyWith(SetSponsorBlockCategories value,
          $Res Function(SetSponsorBlockCategories) _then) =
      _$SetSponsorBlockCategoriesCopyWithImpl;
  @useResult
  $Res call({List<String> categories});
}

/// @nodoc
class _$SetSponsorBlockCategoriesCopyWithImpl<$Res>
    implements $SetSponsorBlockCategoriesCopyWith<$Res> {
  _$SetSponsorBlockCategoriesCopyWithImpl(this._self, this._then);

  final SetSponsorBlockCategories _self;
  final $Res Function(SetSponsorBlockCategories) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categories = null,
  }) {
    return _then(SetSponsorBlockCategories(
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class ToggleOpenLinksInBrowser implements SettingsEvent {
  const ToggleOpenLinksInBrowser({required this.openInBrowser});

  final bool openInBrowser;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleOpenLinksInBrowserCopyWith<ToggleOpenLinksInBrowser> get copyWith =>
      _$ToggleOpenLinksInBrowserCopyWithImpl<ToggleOpenLinksInBrowser>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleOpenLinksInBrowser &&
            (identical(other.openInBrowser, openInBrowser) ||
                other.openInBrowser == openInBrowser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, openInBrowser);

  @override
  String toString() {
    return 'SettingsEvent.toggleOpenLinksInBrowser(openInBrowser: $openInBrowser)';
  }
}

/// @nodoc
abstract mixin class $ToggleOpenLinksInBrowserCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleOpenLinksInBrowserCopyWith(ToggleOpenLinksInBrowser value,
          $Res Function(ToggleOpenLinksInBrowser) _then) =
      _$ToggleOpenLinksInBrowserCopyWithImpl;
  @useResult
  $Res call({bool openInBrowser});
}

/// @nodoc
class _$ToggleOpenLinksInBrowserCopyWithImpl<$Res>
    implements $ToggleOpenLinksInBrowserCopyWith<$Res> {
  _$ToggleOpenLinksInBrowserCopyWithImpl(this._self, this._then);

  final ToggleOpenLinksInBrowser _self;
  final $Res Function(ToggleOpenLinksInBrowser) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? openInBrowser = null,
  }) {
    return _then(ToggleOpenLinksInBrowser(
      openInBrowser: null == openInBrowser
          ? _self.openInBrowser
          : openInBrowser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SetHomeFeedMode implements SettingsEvent {
  const SetHomeFeedMode({required this.mode});

  final String mode;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetHomeFeedModeCopyWith<SetHomeFeedMode> get copyWith =>
      _$SetHomeFeedModeCopyWithImpl<SetHomeFeedMode>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetHomeFeedMode &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode);

  @override
  String toString() {
    return 'SettingsEvent.setHomeFeedMode(mode: $mode)';
  }
}

/// @nodoc
abstract mixin class $SetHomeFeedModeCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetHomeFeedModeCopyWith(
          SetHomeFeedMode value, $Res Function(SetHomeFeedMode) _then) =
      _$SetHomeFeedModeCopyWithImpl;
  @useResult
  $Res call({String mode});
}

/// @nodoc
class _$SetHomeFeedModeCopyWithImpl<$Res>
    implements $SetHomeFeedModeCopyWith<$Res> {
  _$SetHomeFeedModeCopyWithImpl(this._self, this._then);

  final SetHomeFeedMode _self;
  final $Res Function(SetHomeFeedMode) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mode = null,
  }) {
    return _then(SetHomeFeedMode(
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ToggleAudioFocus implements SettingsEvent {
  const ToggleAudioFocus({required this.isEnabled});

  final bool isEnabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleAudioFocusCopyWith<ToggleAudioFocus> get copyWith =>
      _$ToggleAudioFocusCopyWithImpl<ToggleAudioFocus>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleAudioFocus &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEnabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleAudioFocus(isEnabled: $isEnabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleAudioFocusCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleAudioFocusCopyWith(
          ToggleAudioFocus value, $Res Function(ToggleAudioFocus) _then) =
      _$ToggleAudioFocusCopyWithImpl;
  @useResult
  $Res call({bool isEnabled});
}

/// @nodoc
class _$ToggleAudioFocusCopyWithImpl<$Res>
    implements $ToggleAudioFocusCopyWith<$Res> {
  _$ToggleAudioFocusCopyWithImpl(this._self, this._then);

  final ToggleAudioFocus _self;
  final $Res Function(ToggleAudioFocus) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isEnabled = null,
  }) {
    return _then(ToggleAudioFocus(
      isEnabled: null == isEnabled
          ? _self.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class AddProfile implements SettingsEvent {
  const AddProfile({required this.profileName});

  final String profileName;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddProfileCopyWith<AddProfile> get copyWith =>
      _$AddProfileCopyWithImpl<AddProfile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddProfile &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileName);

  @override
  String toString() {
    return 'SettingsEvent.addProfile(profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $AddProfileCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $AddProfileCopyWith(
          AddProfile value, $Res Function(AddProfile) _then) =
      _$AddProfileCopyWithImpl;
  @useResult
  $Res call({String profileName});
}

/// @nodoc
class _$AddProfileCopyWithImpl<$Res> implements $AddProfileCopyWith<$Res> {
  _$AddProfileCopyWithImpl(this._self, this._then);

  final AddProfile _self;
  final $Res Function(AddProfile) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileName = null,
  }) {
    return _then(AddProfile(
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class DeleteProfile implements SettingsEvent {
  const DeleteProfile({required this.profileName});

  final String profileName;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteProfileCopyWith<DeleteProfile> get copyWith =>
      _$DeleteProfileCopyWithImpl<DeleteProfile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteProfile &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileName);

  @override
  String toString() {
    return 'SettingsEvent.deleteProfile(profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $DeleteProfileCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $DeleteProfileCopyWith(
          DeleteProfile value, $Res Function(DeleteProfile) _then) =
      _$DeleteProfileCopyWithImpl;
  @useResult
  $Res call({String profileName});
}

/// @nodoc
class _$DeleteProfileCopyWithImpl<$Res>
    implements $DeleteProfileCopyWith<$Res> {
  _$DeleteProfileCopyWithImpl(this._self, this._then);

  final DeleteProfile _self;
  final $Res Function(DeleteProfile) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileName = null,
  }) {
    return _then(DeleteProfile(
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SwitchProfile implements SettingsEvent {
  const SwitchProfile({required this.profileName});

  final String profileName;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SwitchProfileCopyWith<SwitchProfile> get copyWith =>
      _$SwitchProfileCopyWithImpl<SwitchProfile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SwitchProfile &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileName);

  @override
  String toString() {
    return 'SettingsEvent.switchProfile(profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $SwitchProfileCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SwitchProfileCopyWith(
          SwitchProfile value, $Res Function(SwitchProfile) _then) =
      _$SwitchProfileCopyWithImpl;
  @useResult
  $Res call({String profileName});
}

/// @nodoc
class _$SwitchProfileCopyWithImpl<$Res>
    implements $SwitchProfileCopyWith<$Res> {
  _$SwitchProfileCopyWithImpl(this._self, this._then);

  final SwitchProfile _self;
  final $Res Function(SwitchProfile) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileName = null,
  }) {
    return _then(SwitchProfile(
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class RenameProfile implements SettingsEvent {
  const RenameProfile({required this.oldName, required this.newName});

  final String oldName;
  final String newName;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RenameProfileCopyWith<RenameProfile> get copyWith =>
      _$RenameProfileCopyWithImpl<RenameProfile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RenameProfile &&
            (identical(other.oldName, oldName) || other.oldName == oldName) &&
            (identical(other.newName, newName) || other.newName == newName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldName, newName);

  @override
  String toString() {
    return 'SettingsEvent.renameProfile(oldName: $oldName, newName: $newName)';
  }
}

/// @nodoc
abstract mixin class $RenameProfileCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $RenameProfileCopyWith(
          RenameProfile value, $Res Function(RenameProfile) _then) =
      _$RenameProfileCopyWithImpl;
  @useResult
  $Res call({String oldName, String newName});
}

/// @nodoc
class _$RenameProfileCopyWithImpl<$Res>
    implements $RenameProfileCopyWith<$Res> {
  _$RenameProfileCopyWithImpl(this._self, this._then);

  final RenameProfile _self;
  final $Res Function(RenameProfile) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? oldName = null,
    Object? newName = null,
  }) {
    return _then(RenameProfile(
      oldName: null == oldName
          ? _self.oldName
          : oldName // ignore: cast_nullable_to_non_nullable
              as String,
      newName: null == newName
          ? _self.newName
          : newName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ExportSubscriptions implements SettingsEvent {
  const ExportSubscriptions({this.profileName = 'default'});

  @JsonKey()
  final String profileName;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExportSubscriptionsCopyWith<ExportSubscriptions> get copyWith =>
      _$ExportSubscriptionsCopyWithImpl<ExportSubscriptions>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExportSubscriptions &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileName);

  @override
  String toString() {
    return 'SettingsEvent.exportSubscriptions(profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $ExportSubscriptionsCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ExportSubscriptionsCopyWith(
          ExportSubscriptions value, $Res Function(ExportSubscriptions) _then) =
      _$ExportSubscriptionsCopyWithImpl;
  @useResult
  $Res call({String profileName});
}

/// @nodoc
class _$ExportSubscriptionsCopyWithImpl<$Res>
    implements $ExportSubscriptionsCopyWith<$Res> {
  _$ExportSubscriptionsCopyWithImpl(this._self, this._then);

  final ExportSubscriptions _self;
  final $Res Function(ExportSubscriptions) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileName = null,
  }) {
    return _then(ExportSubscriptions(
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ImportSubscriptions implements SettingsEvent {
  const ImportSubscriptions(
      {required this.filePath, this.profileName = 'default'});

  final String filePath;
  @JsonKey()
  final String profileName;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ImportSubscriptionsCopyWith<ImportSubscriptions> get copyWith =>
      _$ImportSubscriptionsCopyWithImpl<ImportSubscriptions>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImportSubscriptions &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filePath, profileName);

  @override
  String toString() {
    return 'SettingsEvent.importSubscriptions(filePath: $filePath, profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $ImportSubscriptionsCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ImportSubscriptionsCopyWith(
          ImportSubscriptions value, $Res Function(ImportSubscriptions) _then) =
      _$ImportSubscriptionsCopyWithImpl;
  @useResult
  $Res call({String filePath, String profileName});
}

/// @nodoc
class _$ImportSubscriptionsCopyWithImpl<$Res>
    implements $ImportSubscriptionsCopyWith<$Res> {
  _$ImportSubscriptionsCopyWithImpl(this._self, this._then);

  final ImportSubscriptions _self;
  final $Res Function(ImportSubscriptions) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? filePath = null,
    Object? profileName = null,
  }) {
    return _then(ImportSubscriptions(
      filePath: null == filePath
          ? _self.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SetSubtitleSize implements SettingsEvent {
  const SetSubtitleSize({required this.size});

  final double size;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetSubtitleSizeCopyWith<SetSubtitleSize> get copyWith =>
      _$SetSubtitleSizeCopyWithImpl<SetSubtitleSize>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetSubtitleSize &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(runtimeType, size);

  @override
  String toString() {
    return 'SettingsEvent.setSubtitleSize(size: $size)';
  }
}

/// @nodoc
abstract mixin class $SetSubtitleSizeCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetSubtitleSizeCopyWith(
          SetSubtitleSize value, $Res Function(SetSubtitleSize) _then) =
      _$SetSubtitleSizeCopyWithImpl;
  @useResult
  $Res call({double size});
}

/// @nodoc
class _$SetSubtitleSizeCopyWithImpl<$Res>
    implements $SetSubtitleSizeCopyWith<$Res> {
  _$SetSubtitleSizeCopyWithImpl(this._self, this._then);

  final SetSubtitleSize _self;
  final $Res Function(SetSubtitleSize) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? size = null,
  }) {
    return _then(SetSubtitleSize(
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class ToggleSearchHistoryEnabled implements SettingsEvent {
  const ToggleSearchHistoryEnabled({required this.isEnabled});

  final bool isEnabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleSearchHistoryEnabledCopyWith<ToggleSearchHistoryEnabled>
      get copyWith =>
          _$ToggleSearchHistoryEnabledCopyWithImpl<ToggleSearchHistoryEnabled>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleSearchHistoryEnabled &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEnabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleSearchHistoryEnabled(isEnabled: $isEnabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleSearchHistoryEnabledCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleSearchHistoryEnabledCopyWith(ToggleSearchHistoryEnabled value,
          $Res Function(ToggleSearchHistoryEnabled) _then) =
      _$ToggleSearchHistoryEnabledCopyWithImpl;
  @useResult
  $Res call({bool isEnabled});
}

/// @nodoc
class _$ToggleSearchHistoryEnabledCopyWithImpl<$Res>
    implements $ToggleSearchHistoryEnabledCopyWith<$Res> {
  _$ToggleSearchHistoryEnabledCopyWithImpl(this._self, this._then);

  final ToggleSearchHistoryEnabled _self;
  final $Res Function(ToggleSearchHistoryEnabled) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isEnabled = null,
  }) {
    return _then(ToggleSearchHistoryEnabled(
      isEnabled: null == isEnabled
          ? _self.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleSearchHistoryVisibility implements SettingsEvent {
  const ToggleSearchHistoryVisibility({required this.isVisible});

  final bool isVisible;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleSearchHistoryVisibilityCopyWith<ToggleSearchHistoryVisibility>
      get copyWith => _$ToggleSearchHistoryVisibilityCopyWithImpl<
          ToggleSearchHistoryVisibility>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleSearchHistoryVisibility &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isVisible);

  @override
  String toString() {
    return 'SettingsEvent.toggleSearchHistoryVisibility(isVisible: $isVisible)';
  }
}

/// @nodoc
abstract mixin class $ToggleSearchHistoryVisibilityCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleSearchHistoryVisibilityCopyWith(
          ToggleSearchHistoryVisibility value,
          $Res Function(ToggleSearchHistoryVisibility) _then) =
      _$ToggleSearchHistoryVisibilityCopyWithImpl;
  @useResult
  $Res call({bool isVisible});
}

/// @nodoc
class _$ToggleSearchHistoryVisibilityCopyWithImpl<$Res>
    implements $ToggleSearchHistoryVisibilityCopyWith<$Res> {
  _$ToggleSearchHistoryVisibilityCopyWithImpl(this._self, this._then);

  final ToggleSearchHistoryVisibility _self;
  final $Res Function(ToggleSearchHistoryVisibility) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isVisible = null,
  }) {
    return _then(ToggleSearchHistoryVisibility(
      isVisible: null == isVisible
          ? _self.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleAutoPip implements SettingsEvent {
  const ToggleAutoPip({required this.isEnabled});

  final bool isEnabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleAutoPipCopyWith<ToggleAutoPip> get copyWith =>
      _$ToggleAutoPipCopyWithImpl<ToggleAutoPip>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleAutoPip &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEnabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleAutoPip(isEnabled: $isEnabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleAutoPipCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleAutoPipCopyWith(
          ToggleAutoPip value, $Res Function(ToggleAutoPip) _then) =
      _$ToggleAutoPipCopyWithImpl;
  @useResult
  $Res call({bool isEnabled});
}

/// @nodoc
class _$ToggleAutoPipCopyWithImpl<$Res>
    implements $ToggleAutoPipCopyWith<$Res> {
  _$ToggleAutoPipCopyWithImpl(this._self, this._then);

  final ToggleAutoPip _self;
  final $Res Function(ToggleAutoPip) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isEnabled = null,
  }) {
    return _then(ToggleAutoPip(
      isEnabled: null == isEnabled
          ? _self.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class FetchPipedInstances implements SettingsEvent {
  const FetchPipedInstances({this.forceRefresh = false});

  @JsonKey()
  final bool forceRefresh;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FetchPipedInstancesCopyWith<FetchPipedInstances> get copyWith =>
      _$FetchPipedInstancesCopyWithImpl<FetchPipedInstances>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FetchPipedInstances &&
            (identical(other.forceRefresh, forceRefresh) ||
                other.forceRefresh == forceRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forceRefresh);

  @override
  String toString() {
    return 'SettingsEvent.fetchPipedInstances(forceRefresh: $forceRefresh)';
  }
}

/// @nodoc
abstract mixin class $FetchPipedInstancesCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $FetchPipedInstancesCopyWith(
          FetchPipedInstances value, $Res Function(FetchPipedInstances) _then) =
      _$FetchPipedInstancesCopyWithImpl;
  @useResult
  $Res call({bool forceRefresh});
}

/// @nodoc
class _$FetchPipedInstancesCopyWithImpl<$Res>
    implements $FetchPipedInstancesCopyWith<$Res> {
  _$FetchPipedInstancesCopyWithImpl(this._self, this._then);

  final FetchPipedInstances _self;
  final $Res Function(FetchPipedInstances) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? forceRefresh = null,
  }) {
    return _then(FetchPipedInstances(
      forceRefresh: null == forceRefresh
          ? _self.forceRefresh
          : forceRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class FetchInvidiousInstances implements SettingsEvent {
  const FetchInvidiousInstances({this.forceRefresh = false});

  @JsonKey()
  final bool forceRefresh;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FetchInvidiousInstancesCopyWith<FetchInvidiousInstances> get copyWith =>
      _$FetchInvidiousInstancesCopyWithImpl<FetchInvidiousInstances>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FetchInvidiousInstances &&
            (identical(other.forceRefresh, forceRefresh) ||
                other.forceRefresh == forceRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forceRefresh);

  @override
  String toString() {
    return 'SettingsEvent.fetchInvidiousInstances(forceRefresh: $forceRefresh)';
  }
}

/// @nodoc
abstract mixin class $FetchInvidiousInstancesCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $FetchInvidiousInstancesCopyWith(FetchInvidiousInstances value,
          $Res Function(FetchInvidiousInstances) _then) =
      _$FetchInvidiousInstancesCopyWithImpl;
  @useResult
  $Res call({bool forceRefresh});
}

/// @nodoc
class _$FetchInvidiousInstancesCopyWithImpl<$Res>
    implements $FetchInvidiousInstancesCopyWith<$Res> {
  _$FetchInvidiousInstancesCopyWithImpl(this._self, this._then);

  final FetchInvidiousInstances _self;
  final $Res Function(FetchInvidiousInstances) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? forceRefresh = null,
  }) {
    return _then(FetchInvidiousInstances(
      forceRefresh: null == forceRefresh
          ? _self.forceRefresh
          : forceRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SetLastExportedFilePath implements SettingsEvent {
  const SetLastExportedFilePath({required this.filePath});

  final String? filePath;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetLastExportedFilePathCopyWith<SetLastExportedFilePath> get copyWith =>
      _$SetLastExportedFilePathCopyWithImpl<SetLastExportedFilePath>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetLastExportedFilePath &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filePath);

  @override
  String toString() {
    return 'SettingsEvent.setLastExportedFilePath(filePath: $filePath)';
  }
}

/// @nodoc
abstract mixin class $SetLastExportedFilePathCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetLastExportedFilePathCopyWith(SetLastExportedFilePath value,
          $Res Function(SetLastExportedFilePath) _then) =
      _$SetLastExportedFilePathCopyWithImpl;
  @useResult
  $Res call({String? filePath});
}

/// @nodoc
class _$SetLastExportedFilePathCopyWithImpl<$Res>
    implements $SetLastExportedFilePathCopyWith<$Res> {
  _$SetLastExportedFilePathCopyWithImpl(this._self, this._then);

  final SetLastExportedFilePath _self;
  final $Res Function(SetLastExportedFilePath) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? filePath = freezed,
  }) {
    return _then(SetLastExportedFilePath(
      filePath: freezed == filePath
          ? _self.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class SetSleepTimer implements SettingsEvent {
  const SetSleepTimer({required this.seconds});

  final int seconds;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetSleepTimerCopyWith<SetSleepTimer> get copyWith =>
      _$SetSleepTimerCopyWithImpl<SetSleepTimer>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetSleepTimer &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, seconds);

  @override
  String toString() {
    return 'SettingsEvent.setSleepTimer(seconds: $seconds)';
  }
}

/// @nodoc
abstract mixin class $SetSleepTimerCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetSleepTimerCopyWith(
          SetSleepTimer value, $Res Function(SetSleepTimer) _then) =
      _$SetSleepTimerCopyWithImpl;
  @useResult
  $Res call({int seconds});
}

/// @nodoc
class _$SetSleepTimerCopyWithImpl<$Res>
    implements $SetSleepTimerCopyWith<$Res> {
  _$SetSleepTimerCopyWithImpl(this._self, this._then);

  final SetSleepTimer _self;
  final $Res Function(SetSleepTimer) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? seconds = null,
  }) {
    return _then(SetSleepTimer(
      seconds: null == seconds
          ? _self.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ClearSleepTimer implements SettingsEvent {
  const ClearSleepTimer();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ClearSleepTimer);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsEvent.clearSleepTimer()';
  }
}

/// @nodoc

class ToggleSwipeGestures implements SettingsEvent {
  const ToggleSwipeGestures({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleSwipeGesturesCopyWith<ToggleSwipeGestures> get copyWith =>
      _$ToggleSwipeGesturesCopyWithImpl<ToggleSwipeGestures>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleSwipeGestures &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleSwipeGestures(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleSwipeGesturesCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleSwipeGesturesCopyWith(
          ToggleSwipeGestures value, $Res Function(ToggleSwipeGestures) _then) =
      _$ToggleSwipeGesturesCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleSwipeGesturesCopyWithImpl<$Res>
    implements $ToggleSwipeGesturesCopyWith<$Res> {
  _$ToggleSwipeGesturesCopyWithImpl(this._self, this._then);

  final ToggleSwipeGestures _self;
  final $Res Function(ToggleSwipeGestures) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleSwipeGestures(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleDeArrow implements SettingsEvent {
  const ToggleDeArrow({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleDeArrowCopyWith<ToggleDeArrow> get copyWith =>
      _$ToggleDeArrowCopyWithImpl<ToggleDeArrow>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleDeArrow &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleDeArrow(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleDeArrowCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleDeArrowCopyWith(
          ToggleDeArrow value, $Res Function(ToggleDeArrow) _then) =
      _$ToggleDeArrowCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleDeArrowCopyWithImpl<$Res>
    implements $ToggleDeArrowCopyWith<$Res> {
  _$ToggleDeArrowCopyWithImpl(this._self, this._then);

  final ToggleDeArrow _self;
  final $Res Function(ToggleDeArrow) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleDeArrow(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleBookmarks implements SettingsEvent {
  const ToggleBookmarks({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleBookmarksCopyWith<ToggleBookmarks> get copyWith =>
      _$ToggleBookmarksCopyWithImpl<ToggleBookmarks>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleBookmarks &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.bookmarksToggled(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleBookmarksCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleBookmarksCopyWith(
          ToggleBookmarks value, $Res Function(ToggleBookmarks) _then) =
      _$ToggleBookmarksCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleBookmarksCopyWithImpl<$Res>
    implements $ToggleBookmarksCopyWith<$Res> {
  _$ToggleBookmarksCopyWithImpl(this._self, this._then);

  final ToggleBookmarks _self;
  final $Res Function(ToggleBookmarks) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleBookmarks(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleBookmarkPlaylist implements SettingsEvent {
  const ToggleBookmarkPlaylist(
      {required this.playlistId, required this.bookmarked});

  final String playlistId;
  final bool bookmarked;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleBookmarkPlaylistCopyWith<ToggleBookmarkPlaylist> get copyWith =>
      _$ToggleBookmarkPlaylistCopyWithImpl<ToggleBookmarkPlaylist>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleBookmarkPlaylist &&
            (identical(other.playlistId, playlistId) ||
                other.playlistId == playlistId) &&
            (identical(other.bookmarked, bookmarked) ||
                other.bookmarked == bookmarked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playlistId, bookmarked);

  @override
  String toString() {
    return 'SettingsEvent.toggleBookmarkPlaylist(playlistId: $playlistId, bookmarked: $bookmarked)';
  }
}

/// @nodoc
abstract mixin class $ToggleBookmarkPlaylistCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleBookmarkPlaylistCopyWith(ToggleBookmarkPlaylist value,
          $Res Function(ToggleBookmarkPlaylist) _then) =
      _$ToggleBookmarkPlaylistCopyWithImpl;
  @useResult
  $Res call({String playlistId, bool bookmarked});
}

/// @nodoc
class _$ToggleBookmarkPlaylistCopyWithImpl<$Res>
    implements $ToggleBookmarkPlaylistCopyWith<$Res> {
  _$ToggleBookmarkPlaylistCopyWithImpl(this._self, this._then);

  final ToggleBookmarkPlaylist _self;
  final $Res Function(ToggleBookmarkPlaylist) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? playlistId = null,
    Object? bookmarked = null,
  }) {
    return _then(ToggleBookmarkPlaylist(
      playlistId: null == playlistId
          ? _self.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String,
      bookmarked: null == bookmarked
          ? _self.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleRestrictedMode implements SettingsEvent {
  const ToggleRestrictedMode({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleRestrictedModeCopyWith<ToggleRestrictedMode> get copyWith =>
      _$ToggleRestrictedModeCopyWithImpl<ToggleRestrictedMode>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleRestrictedMode &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.restrictedModeToggled(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleRestrictedModeCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleRestrictedModeCopyWith(ToggleRestrictedMode value,
          $Res Function(ToggleRestrictedMode) _then) =
      _$ToggleRestrictedModeCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleRestrictedModeCopyWithImpl<$Res>
    implements $ToggleRestrictedModeCopyWith<$Res> {
  _$ToggleRestrictedModeCopyWithImpl(this._self, this._then);

  final ToggleRestrictedMode _self;
  final $Res Function(ToggleRestrictedMode) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleRestrictedMode(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleMiniPlayer implements SettingsEvent {
  const ToggleMiniPlayer({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleMiniPlayerCopyWith<ToggleMiniPlayer> get copyWith =>
      _$ToggleMiniPlayerCopyWithImpl<ToggleMiniPlayer>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleMiniPlayer &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.miniPlayerToggled(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleMiniPlayerCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleMiniPlayerCopyWith(
          ToggleMiniPlayer value, $Res Function(ToggleMiniPlayer) _then) =
      _$ToggleMiniPlayerCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleMiniPlayerCopyWithImpl<$Res>
    implements $ToggleMiniPlayerCopyWith<$Res> {
  _$ToggleMiniPlayerCopyWithImpl(this._self, this._then);

  final ToggleMiniPlayer _self;
  final $Res Function(ToggleMiniPlayer) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleMiniPlayer(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SetDownloadQuality implements SettingsEvent {
  const SetDownloadQuality({required this.quality});

  final String quality;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetDownloadQualityCopyWith<SetDownloadQuality> get copyWith =>
      _$SetDownloadQualityCopyWithImpl<SetDownloadQuality>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetDownloadQuality &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quality);

  @override
  String toString() {
    return 'SettingsEvent.downloadQualityChanged(quality: $quality)';
  }
}

/// @nodoc
abstract mixin class $SetDownloadQualityCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetDownloadQualityCopyWith(
          SetDownloadQuality value, $Res Function(SetDownloadQuality) _then) =
      _$SetDownloadQualityCopyWithImpl;
  @useResult
  $Res call({String quality});
}

/// @nodoc
class _$SetDownloadQualityCopyWithImpl<$Res>
    implements $SetDownloadQualityCopyWith<$Res> {
  _$SetDownloadQualityCopyWithImpl(this._self, this._then);

  final SetDownloadQuality _self;
  final $Res Function(SetDownloadQuality) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? quality = null,
  }) {
    return _then(SetDownloadQuality(
      quality: null == quality
          ? _self.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ToggleDownloadSubtitles implements SettingsEvent {
  const ToggleDownloadSubtitles({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleDownloadSubtitlesCopyWith<ToggleDownloadSubtitles> get copyWith =>
      _$ToggleDownloadSubtitlesCopyWithImpl<ToggleDownloadSubtitles>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleDownloadSubtitles &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.downloadSubtitlesToggled(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleDownloadSubtitlesCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleDownloadSubtitlesCopyWith(ToggleDownloadSubtitles value,
          $Res Function(ToggleDownloadSubtitles) _then) =
      _$ToggleDownloadSubtitlesCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleDownloadSubtitlesCopyWithImpl<$Res>
    implements $ToggleDownloadSubtitlesCopyWith<$Res> {
  _$ToggleDownloadSubtitlesCopyWithImpl(this._self, this._then);

  final ToggleDownloadSubtitles _self;
  final $Res Function(ToggleDownloadSubtitles) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleDownloadSubtitles(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleDownloadOverWifiOnly implements SettingsEvent {
  const ToggleDownloadOverWifiOnly({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleDownloadOverWifiOnlyCopyWith<ToggleDownloadOverWifiOnly>
      get copyWith =>
          _$ToggleDownloadOverWifiOnlyCopyWithImpl<ToggleDownloadOverWifiOnly>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleDownloadOverWifiOnly &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.downloadOverWifiOnlyToggled(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleDownloadOverWifiOnlyCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleDownloadOverWifiOnlyCopyWith(ToggleDownloadOverWifiOnly value,
          $Res Function(ToggleDownloadOverWifiOnly) _then) =
      _$ToggleDownloadOverWifiOnlyCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleDownloadOverWifiOnlyCopyWithImpl<$Res>
    implements $ToggleDownloadOverWifiOnlyCopyWith<$Res> {
  _$ToggleDownloadOverWifiOnlyCopyWithImpl(this._self, this._then);

  final ToggleDownloadOverWifiOnly _self;
  final $Res Function(ToggleDownloadOverWifiOnly) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleDownloadOverWifiOnly(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleDownloadAutoDelete implements SettingsEvent {
  const ToggleDownloadAutoDelete({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleDownloadAutoDeleteCopyWith<ToggleDownloadAutoDelete> get copyWith =>
      _$ToggleDownloadAutoDeleteCopyWithImpl<ToggleDownloadAutoDelete>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleDownloadAutoDelete &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.downloadAutoDeleteToggled(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleDownloadAutoDeleteCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleDownloadAutoDeleteCopyWith(ToggleDownloadAutoDelete value,
          $Res Function(ToggleDownloadAutoDelete) _then) =
      _$ToggleDownloadAutoDeleteCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleDownloadAutoDeleteCopyWithImpl<$Res>
    implements $ToggleDownloadAutoDeleteCopyWith<$Res> {
  _$ToggleDownloadAutoDeleteCopyWithImpl(this._self, this._then);

  final ToggleDownloadAutoDelete _self;
  final $Res Function(ToggleDownloadAutoDelete) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleDownloadAutoDelete(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SetPlaybackSpeed implements SettingsEvent {
  const SetPlaybackSpeed({required this.speed});

  final double speed;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetPlaybackSpeedCopyWith<SetPlaybackSpeed> get copyWith =>
      _$SetPlaybackSpeedCopyWithImpl<SetPlaybackSpeed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetPlaybackSpeed &&
            (identical(other.speed, speed) || other.speed == speed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, speed);

  @override
  String toString() {
    return 'SettingsEvent.setPlaybackSpeed(speed: $speed)';
  }
}

/// @nodoc
abstract mixin class $SetPlaybackSpeedCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetPlaybackSpeedCopyWith(
          SetPlaybackSpeed value, $Res Function(SetPlaybackSpeed) _then) =
      _$SetPlaybackSpeedCopyWithImpl;
  @useResult
  $Res call({double speed});
}

/// @nodoc
class _$SetPlaybackSpeedCopyWithImpl<$Res>
    implements $SetPlaybackSpeedCopyWith<$Res> {
  _$SetPlaybackSpeedCopyWithImpl(this._self, this._then);

  final SetPlaybackSpeed _self;
  final $Res Function(SetPlaybackSpeed) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? speed = null,
  }) {
    return _then(SetPlaybackSpeed(
      speed: null == speed
          ? _self.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class ToggleAutoplayNextVideo implements SettingsEvent {
  const ToggleAutoplayNextVideo({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleAutoplayNextVideoCopyWith<ToggleAutoplayNextVideo> get copyWith =>
      _$ToggleAutoplayNextVideoCopyWithImpl<ToggleAutoplayNextVideo>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleAutoplayNextVideo &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleAutoplayNextVideo(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleAutoplayNextVideoCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleAutoplayNextVideoCopyWith(ToggleAutoplayNextVideo value,
          $Res Function(ToggleAutoplayNextVideo) _then) =
      _$ToggleAutoplayNextVideoCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleAutoplayNextVideoCopyWithImpl<$Res>
    implements $ToggleAutoplayNextVideoCopyWith<$Res> {
  _$ToggleAutoplayNextVideoCopyWithImpl(this._self, this._then);

  final ToggleAutoplayNextVideo _self;
  final $Res Function(ToggleAutoplayNextVideo) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleAutoplayNextVideo(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleShowRelatedInQueue implements SettingsEvent {
  const ToggleShowRelatedInQueue({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleShowRelatedInQueueCopyWith<ToggleShowRelatedInQueue> get copyWith =>
      _$ToggleShowRelatedInQueueCopyWithImpl<ToggleShowRelatedInQueue>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleShowRelatedInQueue &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleShowRelatedInQueue(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleShowRelatedInQueueCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleShowRelatedInQueueCopyWith(ToggleShowRelatedInQueue value,
          $Res Function(ToggleShowRelatedInQueue) _then) =
      _$ToggleShowRelatedInQueueCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleShowRelatedInQueueCopyWithImpl<$Res>
    implements $ToggleShowRelatedInQueueCopyWith<$Res> {
  _$ToggleShowRelatedInQueueCopyWithImpl(this._self, this._then);

  final ToggleShowRelatedInQueue _self;
  final $Res Function(ToggleShowRelatedInQueue) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleShowRelatedInQueue(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SetQueueDismissTime implements SettingsEvent {
  const SetQueueDismissTime({required this.seconds});

  final int seconds;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetQueueDismissTimeCopyWith<SetQueueDismissTime> get copyWith =>
      _$SetQueueDismissTimeCopyWithImpl<SetQueueDismissTime>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetQueueDismissTime &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, seconds);

  @override
  String toString() {
    return 'SettingsEvent.setQueueDismissTime(seconds: $seconds)';
  }
}

/// @nodoc
abstract mixin class $SetQueueDismissTimeCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetQueueDismissTimeCopyWith(
          SetQueueDismissTime value, $Res Function(SetQueueDismissTime) _then) =
      _$SetQueueDismissTimeCopyWithImpl;
  @useResult
  $Res call({int seconds});
}

/// @nodoc
class _$SetQueueDismissTimeCopyWithImpl<$Res>
    implements $SetQueueDismissTimeCopyWith<$Res> {
  _$SetQueueDismissTimeCopyWithImpl(this._self, this._then);

  final SetQueueDismissTime _self;
  final $Res Function(SetQueueDismissTime) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? seconds = null,
  }) {
    return _then(SetQueueDismissTime(
      seconds: null == seconds
          ? _self.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class SetAutoplayCountdown implements SettingsEvent {
  const SetAutoplayCountdown({required this.seconds});

  final int seconds;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetAutoplayCountdownCopyWith<SetAutoplayCountdown> get copyWith =>
      _$SetAutoplayCountdownCopyWithImpl<SetAutoplayCountdown>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetAutoplayCountdown &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, seconds);

  @override
  String toString() {
    return 'SettingsEvent.setAutoplayCountdown(seconds: $seconds)';
  }
}

/// @nodoc
abstract mixin class $SetAutoplayCountdownCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetAutoplayCountdownCopyWith(SetAutoplayCountdown value,
          $Res Function(SetAutoplayCountdown) _then) =
      _$SetAutoplayCountdownCopyWithImpl;
  @useResult
  $Res call({int seconds});
}

/// @nodoc
class _$SetAutoplayCountdownCopyWithImpl<$Res>
    implements $SetAutoplayCountdownCopyWith<$Res> {
  _$SetAutoplayCountdownCopyWithImpl(this._self, this._then);

  final SetAutoplayCountdown _self;
  final $Res Function(SetAutoplayCountdown) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? seconds = null,
  }) {
    return _then(SetAutoplayCountdown(
      seconds: null == seconds
          ? _self.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ToggleDisableAutoplayOnCellular implements SettingsEvent {
  const ToggleDisableAutoplayOnCellular({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleDisableAutoplayOnCellularCopyWith<ToggleDisableAutoplayOnCellular>
      get copyWith => _$ToggleDisableAutoplayOnCellularCopyWithImpl<
          ToggleDisableAutoplayOnCellular>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleDisableAutoplayOnCellular &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleDisableAutoplayOnCellular(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleDisableAutoplayOnCellularCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleDisableAutoplayOnCellularCopyWith(
          ToggleDisableAutoplayOnCellular value,
          $Res Function(ToggleDisableAutoplayOnCellular) _then) =
      _$ToggleDisableAutoplayOnCellularCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleDisableAutoplayOnCellularCopyWithImpl<$Res>
    implements $ToggleDisableAutoplayOnCellularCopyWith<$Res> {
  _$ToggleDisableAutoplayOnCellularCopyWithImpl(this._self, this._then);

  final ToggleDisableAutoplayOnCellular _self;
  final $Res Function(ToggleDisableAutoplayOnCellular) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleDisableAutoplayOnCellular(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleAutoQueue implements SettingsEvent {
  const ToggleAutoQueue({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleAutoQueueCopyWith<ToggleAutoQueue> get copyWith =>
      _$ToggleAutoQueueCopyWithImpl<ToggleAutoQueue>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleAutoQueue &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleAutoQueue(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleAutoQueueCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleAutoQueueCopyWith(
          ToggleAutoQueue value, $Res Function(ToggleAutoQueue) _then) =
      _$ToggleAutoQueueCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleAutoQueueCopyWithImpl<$Res>
    implements $ToggleAutoQueueCopyWith<$Res> {
  _$ToggleAutoQueueCopyWithImpl(this._self, this._then);

  final ToggleAutoQueue _self;
  final $Res Function(ToggleAutoQueue) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleAutoQueue(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleBufferPreload implements SettingsEvent {
  const ToggleBufferPreload({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleBufferPreloadCopyWith<ToggleBufferPreload> get copyWith =>
      _$ToggleBufferPreloadCopyWithImpl<ToggleBufferPreload>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleBufferPreload &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleBufferPreload(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleBufferPreloadCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleBufferPreloadCopyWith(
          ToggleBufferPreload value, $Res Function(ToggleBufferPreload) _then) =
      _$ToggleBufferPreloadCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleBufferPreloadCopyWithImpl<$Res>
    implements $ToggleBufferPreloadCopyWith<$Res> {
  _$ToggleBufferPreloadCopyWithImpl(this._self, this._then);

  final ToggleBufferPreload _self;
  final $Res Function(ToggleBufferPreload) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleBufferPreload(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleAutoQualityAdjust implements SettingsEvent {
  const ToggleAutoQualityAdjust({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleAutoQualityAdjustCopyWith<ToggleAutoQualityAdjust> get copyWith =>
      _$ToggleAutoQualityAdjustCopyWithImpl<ToggleAutoQualityAdjust>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleAutoQualityAdjust &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleAutoQualityAdjust(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleAutoQualityAdjustCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleAutoQualityAdjustCopyWith(ToggleAutoQualityAdjust value,
          $Res Function(ToggleAutoQualityAdjust) _then) =
      _$ToggleAutoQualityAdjustCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleAutoQualityAdjustCopyWithImpl<$Res>
    implements $ToggleAutoQualityAdjustCopyWith<$Res> {
  _$ToggleAutoQualityAdjustCopyWithImpl(this._self, this._then);

  final ToggleAutoQualityAdjust _self;
  final $Res Function(ToggleAutoQualityAdjust) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleAutoQualityAdjust(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleBackgroundPlayback implements SettingsEvent {
  const ToggleBackgroundPlayback({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleBackgroundPlaybackCopyWith<ToggleBackgroundPlayback> get copyWith =>
      _$ToggleBackgroundPlaybackCopyWithImpl<ToggleBackgroundPlayback>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleBackgroundPlayback &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleBackgroundPlayback(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleBackgroundPlaybackCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleBackgroundPlaybackCopyWith(ToggleBackgroundPlayback value,
          $Res Function(ToggleBackgroundPlayback) _then) =
      _$ToggleBackgroundPlaybackCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleBackgroundPlaybackCopyWithImpl<$Res>
    implements $ToggleBackgroundPlaybackCopyWith<$Res> {
  _$ToggleBackgroundPlaybackCopyWithImpl(this._self, this._then);

  final ToggleBackgroundPlayback _self;
  final $Res Function(ToggleBackgroundPlayback) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleBackgroundPlayback(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleNotificationControls implements SettingsEvent {
  const ToggleNotificationControls({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleNotificationControlsCopyWith<ToggleNotificationControls>
      get copyWith =>
          _$ToggleNotificationControlsCopyWithImpl<ToggleNotificationControls>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleNotificationControls &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleNotificationControls(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleNotificationControlsCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleNotificationControlsCopyWith(ToggleNotificationControls value,
          $Res Function(ToggleNotificationControls) _then) =
      _$ToggleNotificationControlsCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleNotificationControlsCopyWithImpl<$Res>
    implements $ToggleNotificationControlsCopyWith<$Res> {
  _$ToggleNotificationControlsCopyWithImpl(this._self, this._then);

  final ToggleNotificationControls _self;
  final $Res Function(ToggleNotificationControls) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleNotificationControls(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleDataSaver implements SettingsEvent {
  const ToggleDataSaver({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleDataSaverCopyWith<ToggleDataSaver> get copyWith =>
      _$ToggleDataSaverCopyWithImpl<ToggleDataSaver>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleDataSaver &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleDataSaver(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleDataSaverCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleDataSaverCopyWith(
          ToggleDataSaver value, $Res Function(ToggleDataSaver) _then) =
      _$ToggleDataSaverCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleDataSaverCopyWithImpl<$Res>
    implements $ToggleDataSaverCopyWith<$Res> {
  _$ToggleDataSaverCopyWithImpl(this._self, this._then);

  final ToggleDataSaver _self;
  final $Res Function(ToggleDataSaver) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleDataSaver(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleHideWatchedVideos implements SettingsEvent {
  const ToggleHideWatchedVideos({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleHideWatchedVideosCopyWith<ToggleHideWatchedVideos> get copyWith =>
      _$ToggleHideWatchedVideosCopyWithImpl<ToggleHideWatchedVideos>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleHideWatchedVideos &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleHideWatchedVideos(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleHideWatchedVideosCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleHideWatchedVideosCopyWith(ToggleHideWatchedVideos value,
          $Res Function(ToggleHideWatchedVideos) _then) =
      _$ToggleHideWatchedVideosCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleHideWatchedVideosCopyWithImpl<$Res>
    implements $ToggleHideWatchedVideosCopyWith<$Res> {
  _$ToggleHideWatchedVideosCopyWithImpl(this._self, this._then);

  final ToggleHideWatchedVideos _self;
  final $Res Function(ToggleHideWatchedVideos) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleHideWatchedVideos(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SetMobileDataQuality implements SettingsEvent {
  const SetMobileDataQuality({required this.quality});

  final int quality;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetMobileDataQualityCopyWith<SetMobileDataQuality> get copyWith =>
      _$SetMobileDataQualityCopyWithImpl<SetMobileDataQuality>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetMobileDataQuality &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quality);

  @override
  String toString() {
    return 'SettingsEvent.setMobileDataQuality(quality: $quality)';
  }
}

/// @nodoc
abstract mixin class $SetMobileDataQualityCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetMobileDataQualityCopyWith(SetMobileDataQuality value,
          $Res Function(SetMobileDataQuality) _then) =
      _$SetMobileDataQualityCopyWithImpl;
  @useResult
  $Res call({int quality});
}

/// @nodoc
class _$SetMobileDataQualityCopyWithImpl<$Res>
    implements $SetMobileDataQualityCopyWith<$Res> {
  _$SetMobileDataQualityCopyWithImpl(this._self, this._then);

  final SetMobileDataQuality _self;
  final $Res Function(SetMobileDataQuality) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? quality = null,
  }) {
    return _then(SetMobileDataQuality(
      quality: null == quality
          ? _self.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ToggleDownloadQueueItems implements SettingsEvent {
  const ToggleDownloadQueueItems({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleDownloadQueueItemsCopyWith<ToggleDownloadQueueItems> get copyWith =>
      _$ToggleDownloadQueueItemsCopyWithImpl<ToggleDownloadQueueItems>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleDownloadQueueItems &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleDownloadQueueItems(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleDownloadQueueItemsCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleDownloadQueueItemsCopyWith(ToggleDownloadQueueItems value,
          $Res Function(ToggleDownloadQueueItems) _then) =
      _$ToggleDownloadQueueItemsCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleDownloadQueueItemsCopyWithImpl<$Res>
    implements $ToggleDownloadQueueItemsCopyWith<$Res> {
  _$ToggleDownloadQueueItemsCopyWithImpl(this._self, this._then);

  final ToggleDownloadQueueItems _self;
  final $Res Function(ToggleDownloadQueueItems) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleDownloadQueueItems(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleRichCaptionRendering implements SettingsEvent {
  const ToggleRichCaptionRendering({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleRichCaptionRenderingCopyWith<ToggleRichCaptionRendering>
      get copyWith =>
          _$ToggleRichCaptionRenderingCopyWithImpl<ToggleRichCaptionRendering>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleRichCaptionRendering &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleRichCaptionRendering(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleRichCaptionRenderingCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleRichCaptionRenderingCopyWith(ToggleRichCaptionRendering value,
          $Res Function(ToggleRichCaptionRendering) _then) =
      _$ToggleRichCaptionRenderingCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleRichCaptionRenderingCopyWithImpl<$Res>
    implements $ToggleRichCaptionRenderingCopyWith<$Res> {
  _$ToggleRichCaptionRenderingCopyWithImpl(this._self, this._then);

  final ToggleRichCaptionRendering _self;
  final $Res Function(ToggleRichCaptionRendering) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleRichCaptionRendering(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleBilibiliEnabled implements SettingsEvent {
  const ToggleBilibiliEnabled({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleBilibiliEnabledCopyWith<ToggleBilibiliEnabled> get copyWith =>
      _$ToggleBilibiliEnabledCopyWithImpl<ToggleBilibiliEnabled>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleBilibiliEnabled &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleBilibiliEnabled(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleBilibiliEnabledCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleBilibiliEnabledCopyWith(ToggleBilibiliEnabled value,
          $Res Function(ToggleBilibiliEnabled) _then) =
      _$ToggleBilibiliEnabledCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleBilibiliEnabledCopyWithImpl<$Res>
    implements $ToggleBilibiliEnabledCopyWith<$Res> {
  _$ToggleBilibiliEnabledCopyWithImpl(this._self, this._then);

  final ToggleBilibiliEnabled _self;
  final $Res Function(ToggleBilibiliEnabled) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleBilibiliEnabled(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SetSwipeDirection implements SettingsEvent {
  const SetSwipeDirection({required this.leftToRight});

  final bool leftToRight;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetSwipeDirectionCopyWith<SetSwipeDirection> get copyWith =>
      _$SetSwipeDirectionCopyWithImpl<SetSwipeDirection>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetSwipeDirection &&
            (identical(other.leftToRight, leftToRight) ||
                other.leftToRight == leftToRight));
  }

  @override
  int get hashCode => Object.hash(runtimeType, leftToRight);

  @override
  String toString() {
    return 'SettingsEvent.setSwipeDirection(leftToRight: $leftToRight)';
  }
}

/// @nodoc
abstract mixin class $SetSwipeDirectionCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetSwipeDirectionCopyWith(
          SetSwipeDirection value, $Res Function(SetSwipeDirection) _then) =
      _$SetSwipeDirectionCopyWithImpl;
  @useResult
  $Res call({bool leftToRight});
}

/// @nodoc
class _$SetSwipeDirectionCopyWithImpl<$Res>
    implements $SetSwipeDirectionCopyWith<$Res> {
  _$SetSwipeDirectionCopyWithImpl(this._self, this._then);

  final SetSwipeDirection _self;
  final $Res Function(SetSwipeDirection) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? leftToRight = null,
  }) {
    return _then(SetSwipeDirection(
      leftToRight: null == leftToRight
          ? _self.leftToRight
          : leftToRight // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SetYoutubeService implements SettingsEvent {
  const SetYoutubeService({required this.service});

  final String service;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetYoutubeServiceCopyWith<SetYoutubeService> get copyWith =>
      _$SetYoutubeServiceCopyWithImpl<SetYoutubeService>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetYoutubeService &&
            (identical(other.service, service) || other.service == service));
  }

  @override
  int get hashCode => Object.hash(runtimeType, service);

  @override
  String toString() {
    return 'SettingsEvent.setYoutubeService(service: $service)';
  }
}

/// @nodoc
abstract mixin class $SetYoutubeServiceCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetYoutubeServiceCopyWith(
          SetYoutubeService value, $Res Function(SetYoutubeService) _then) =
      _$SetYoutubeServiceCopyWithImpl;
  @useResult
  $Res call({String service});
}

/// @nodoc
class _$SetYoutubeServiceCopyWithImpl<$Res>
    implements $SetYoutubeServiceCopyWith<$Res> {
  _$SetYoutubeServiceCopyWithImpl(this._self, this._then);

  final SetYoutubeService _self;
  final $Res Function(SetYoutubeService) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? service = null,
  }) {
    return _then(SetYoutubeService(
      service: null == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class BookmarksApplied implements SettingsEvent {
  const BookmarksApplied({required final List<String> selectedPlaylists})
      : _selectedPlaylists = selectedPlaylists;

  final List<String> _selectedPlaylists;
  List<String> get selectedPlaylists {
    if (_selectedPlaylists is EqualUnmodifiableListView)
      return _selectedPlaylists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedPlaylists);
  }

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarksAppliedCopyWith<BookmarksApplied> get copyWith =>
      _$BookmarksAppliedCopyWithImpl<BookmarksApplied>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarksApplied &&
            const DeepCollectionEquality()
                .equals(other._selectedPlaylists, _selectedPlaylists));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selectedPlaylists));

  @override
  String toString() {
    return 'SettingsEvent.bookmarksApplied(selectedPlaylists: $selectedPlaylists)';
  }
}

/// @nodoc
abstract mixin class $BookmarksAppliedCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $BookmarksAppliedCopyWith(
          BookmarksApplied value, $Res Function(BookmarksApplied) _then) =
      _$BookmarksAppliedCopyWithImpl;
  @useResult
  $Res call({List<String> selectedPlaylists});
}

/// @nodoc
class _$BookmarksAppliedCopyWithImpl<$Res>
    implements $BookmarksAppliedCopyWith<$Res> {
  _$BookmarksAppliedCopyWithImpl(this._self, this._then);

  final BookmarksApplied _self;
  final $Res Function(BookmarksApplied) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedPlaylists = null,
  }) {
    return _then(BookmarksApplied(
      selectedPlaylists: null == selectedPlaylists
          ? _self._selectedPlaylists
          : selectedPlaylists // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class RestrictedModeFilterChanged implements SettingsEvent {
  const RestrictedModeFilterChanged({required this.level});

  final RestrictedModeFilterLevel level;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RestrictedModeFilterChangedCopyWith<RestrictedModeFilterChanged>
      get copyWith => _$RestrictedModeFilterChangedCopyWithImpl<
          RestrictedModeFilterChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RestrictedModeFilterChanged &&
            (identical(other.level, level) || other.level == level));
  }

  @override
  int get hashCode => Object.hash(runtimeType, level);

  @override
  String toString() {
    return 'SettingsEvent.restrictedModeFilterChanged(level: $level)';
  }
}

/// @nodoc
abstract mixin class $RestrictedModeFilterChangedCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $RestrictedModeFilterChangedCopyWith(
          RestrictedModeFilterChanged value,
          $Res Function(RestrictedModeFilterChanged) _then) =
      _$RestrictedModeFilterChangedCopyWithImpl;
  @useResult
  $Res call({RestrictedModeFilterLevel level});
}

/// @nodoc
class _$RestrictedModeFilterChangedCopyWithImpl<$Res>
    implements $RestrictedModeFilterChangedCopyWith<$Res> {
  _$RestrictedModeFilterChangedCopyWithImpl(this._self, this._then);

  final RestrictedModeFilterChanged _self;
  final $Res Function(RestrictedModeFilterChanged) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? level = null,
  }) {
    return _then(RestrictedModeFilterChanged(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as RestrictedModeFilterLevel,
    ));
  }
}

/// @nodoc

class MiniPlayerAutoExpandChanged implements SettingsEvent {
  const MiniPlayerAutoExpandChanged({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MiniPlayerAutoExpandChangedCopyWith<MiniPlayerAutoExpandChanged>
      get copyWith => _$MiniPlayerAutoExpandChangedCopyWithImpl<
          MiniPlayerAutoExpandChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MiniPlayerAutoExpandChanged &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.miniPlayerAutoExpandChanged(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $MiniPlayerAutoExpandChangedCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $MiniPlayerAutoExpandChangedCopyWith(
          MiniPlayerAutoExpandChanged value,
          $Res Function(MiniPlayerAutoExpandChanged) _then) =
      _$MiniPlayerAutoExpandChangedCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$MiniPlayerAutoExpandChangedCopyWithImpl<$Res>
    implements $MiniPlayerAutoExpandChangedCopyWith<$Res> {
  _$MiniPlayerAutoExpandChangedCopyWithImpl(this._self, this._then);

  final MiniPlayerAutoExpandChanged _self;
  final $Res Function(MiniPlayerAutoExpandChanged) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(MiniPlayerAutoExpandChanged(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class MiniPlayerTapToExpandChanged implements SettingsEvent {
  const MiniPlayerTapToExpandChanged({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MiniPlayerTapToExpandChangedCopyWith<MiniPlayerTapToExpandChanged>
      get copyWith => _$MiniPlayerTapToExpandChangedCopyWithImpl<
          MiniPlayerTapToExpandChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MiniPlayerTapToExpandChanged &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.miniPlayerTapToExpandChanged(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $MiniPlayerTapToExpandChangedCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $MiniPlayerTapToExpandChangedCopyWith(
          MiniPlayerTapToExpandChanged value,
          $Res Function(MiniPlayerTapToExpandChanged) _then) =
      _$MiniPlayerTapToExpandChangedCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$MiniPlayerTapToExpandChangedCopyWithImpl<$Res>
    implements $MiniPlayerTapToExpandChangedCopyWith<$Res> {
  _$MiniPlayerTapToExpandChangedCopyWithImpl(this._self, this._then);

  final MiniPlayerTapToExpandChanged _self;
  final $Res Function(MiniPlayerTapToExpandChanged) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(MiniPlayerTapToExpandChanged(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class MiniPlayerDoubleTapToExpandChanged implements SettingsEvent {
  const MiniPlayerDoubleTapToExpandChanged({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MiniPlayerDoubleTapToExpandChangedCopyWith<
          MiniPlayerDoubleTapToExpandChanged>
      get copyWith => _$MiniPlayerDoubleTapToExpandChangedCopyWithImpl<
          MiniPlayerDoubleTapToExpandChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MiniPlayerDoubleTapToExpandChanged &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.miniPlayerDoubleTapToExpandChanged(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $MiniPlayerDoubleTapToExpandChangedCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $MiniPlayerDoubleTapToExpandChangedCopyWith(
          MiniPlayerDoubleTapToExpandChanged value,
          $Res Function(MiniPlayerDoubleTapToExpandChanged) _then) =
      _$MiniPlayerDoubleTapToExpandChangedCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$MiniPlayerDoubleTapToExpandChangedCopyWithImpl<$Res>
    implements $MiniPlayerDoubleTapToExpandChangedCopyWith<$Res> {
  _$MiniPlayerDoubleTapToExpandChangedCopyWithImpl(this._self, this._then);

  final MiniPlayerDoubleTapToExpandChanged _self;
  final $Res Function(MiniPlayerDoubleTapToExpandChanged) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(MiniPlayerDoubleTapToExpandChanged(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class DownloadAutoDeleteDaysChanged implements SettingsEvent {
  const DownloadAutoDeleteDaysChanged({required this.days});

  final int days;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DownloadAutoDeleteDaysChangedCopyWith<DownloadAutoDeleteDaysChanged>
      get copyWith => _$DownloadAutoDeleteDaysChangedCopyWithImpl<
          DownloadAutoDeleteDaysChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DownloadAutoDeleteDaysChanged &&
            (identical(other.days, days) || other.days == days));
  }

  @override
  int get hashCode => Object.hash(runtimeType, days);

  @override
  String toString() {
    return 'SettingsEvent.downloadAutoDeleteDaysChanged(days: $days)';
  }
}

/// @nodoc
abstract mixin class $DownloadAutoDeleteDaysChangedCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $DownloadAutoDeleteDaysChangedCopyWith(
          DownloadAutoDeleteDaysChanged value,
          $Res Function(DownloadAutoDeleteDaysChanged) _then) =
      _$DownloadAutoDeleteDaysChangedCopyWithImpl;
  @useResult
  $Res call({int days});
}

/// @nodoc
class _$DownloadAutoDeleteDaysChangedCopyWithImpl<$Res>
    implements $DownloadAutoDeleteDaysChangedCopyWith<$Res> {
  _$DownloadAutoDeleteDaysChangedCopyWithImpl(this._self, this._then);

  final DownloadAutoDeleteDaysChanged _self;
  final $Res Function(DownloadAutoDeleteDaysChanged) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? days = null,
  }) {
    return _then(DownloadAutoDeleteDaysChanged(
      days: null == days
          ? _self.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ContentFilterKeywordsChanged implements SettingsEvent {
  const ContentFilterKeywordsChanged({required final List<String> keywords})
      : _keywords = keywords;

  final List<String> _keywords;
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentFilterKeywordsChangedCopyWith<ContentFilterKeywordsChanged>
      get copyWith => _$ContentFilterKeywordsChangedCopyWithImpl<
          ContentFilterKeywordsChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentFilterKeywordsChanged &&
            const DeepCollectionEquality().equals(other._keywords, _keywords));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_keywords));

  @override
  String toString() {
    return 'SettingsEvent.contentFilterKeywordsChanged(keywords: $keywords)';
  }
}

/// @nodoc
abstract mixin class $ContentFilterKeywordsChangedCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ContentFilterKeywordsChangedCopyWith(
          ContentFilterKeywordsChanged value,
          $Res Function(ContentFilterKeywordsChanged) _then) =
      _$ContentFilterKeywordsChangedCopyWithImpl;
  @useResult
  $Res call({List<String> keywords});
}

/// @nodoc
class _$ContentFilterKeywordsChangedCopyWithImpl<$Res>
    implements $ContentFilterKeywordsChangedCopyWith<$Res> {
  _$ContentFilterKeywordsChangedCopyWithImpl(this._self, this._then);

  final ContentFilterKeywordsChanged _self;
  final $Res Function(ContentFilterKeywordsChanged) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? keywords = null,
  }) {
    return _then(ContentFilterKeywordsChanged(
      keywords: null == keywords
          ? _self._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class ContentFilterChannelsChanged implements SettingsEvent {
  const ContentFilterChannelsChanged({required final List<String> channelIds})
      : _channelIds = channelIds;

  final List<String> _channelIds;
  List<String> get channelIds {
    if (_channelIds is EqualUnmodifiableListView) return _channelIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_channelIds);
  }

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentFilterChannelsChangedCopyWith<ContentFilterChannelsChanged>
      get copyWith => _$ContentFilterChannelsChangedCopyWithImpl<
          ContentFilterChannelsChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentFilterChannelsChanged &&
            const DeepCollectionEquality()
                .equals(other._channelIds, _channelIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_channelIds));

  @override
  String toString() {
    return 'SettingsEvent.contentFilterChannelsChanged(channelIds: $channelIds)';
  }
}

/// @nodoc
abstract mixin class $ContentFilterChannelsChangedCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ContentFilterChannelsChangedCopyWith(
          ContentFilterChannelsChanged value,
          $Res Function(ContentFilterChannelsChanged) _then) =
      _$ContentFilterChannelsChangedCopyWithImpl;
  @useResult
  $Res call({List<String> channelIds});
}

/// @nodoc
class _$ContentFilterChannelsChangedCopyWithImpl<$Res>
    implements $ContentFilterChannelsChangedCopyWith<$Res> {
  _$ContentFilterChannelsChangedCopyWithImpl(this._self, this._then);

  final ContentFilterChannelsChanged _self;
  final $Res Function(ContentFilterChannelsChanged) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelIds = null,
  }) {
    return _then(ContentFilterChannelsChanged(
      channelIds: null == channelIds
          ? _self._channelIds
          : channelIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class ContentFilterHideShortsChanged implements SettingsEvent {
  const ContentFilterHideShortsChanged({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentFilterHideShortsChangedCopyWith<ContentFilterHideShortsChanged>
      get copyWith => _$ContentFilterHideShortsChangedCopyWithImpl<
          ContentFilterHideShortsChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentFilterHideShortsChanged &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.contentFilterHideShortsChanged(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ContentFilterHideShortsChangedCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ContentFilterHideShortsChangedCopyWith(
          ContentFilterHideShortsChanged value,
          $Res Function(ContentFilterHideShortsChanged) _then) =
      _$ContentFilterHideShortsChangedCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ContentFilterHideShortsChangedCopyWithImpl<$Res>
    implements $ContentFilterHideShortsChangedCopyWith<$Res> {
  _$ContentFilterHideShortsChangedCopyWithImpl(this._self, this._then);

  final ContentFilterHideShortsChanged _self;
  final $Res Function(ContentFilterHideShortsChanged) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ContentFilterHideShortsChanged(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ContentFilterHidePaidChanged implements SettingsEvent {
  const ContentFilterHidePaidChanged({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentFilterHidePaidChangedCopyWith<ContentFilterHidePaidChanged>
      get copyWith => _$ContentFilterHidePaidChangedCopyWithImpl<
          ContentFilterHidePaidChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentFilterHidePaidChanged &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.contentFilterHidePaidChanged(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ContentFilterHidePaidChangedCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ContentFilterHidePaidChangedCopyWith(
          ContentFilterHidePaidChanged value,
          $Res Function(ContentFilterHidePaidChanged) _then) =
      _$ContentFilterHidePaidChangedCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ContentFilterHidePaidChangedCopyWithImpl<$Res>
    implements $ContentFilterHidePaidChangedCopyWith<$Res> {
  _$ContentFilterHidePaidChangedCopyWithImpl(this._self, this._then);

  final ContentFilterHidePaidChanged _self;
  final $Res Function(ContentFilterHidePaidChanged) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ContentFilterHidePaidChanged(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class DownloadFolderChanged implements SettingsEvent {
  const DownloadFolderChanged({this.path});

  final String? path;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DownloadFolderChangedCopyWith<DownloadFolderChanged> get copyWith =>
      _$DownloadFolderChangedCopyWithImpl<DownloadFolderChanged>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DownloadFolderChanged &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @override
  String toString() {
    return 'SettingsEvent.downloadFolderChanged(path: $path)';
  }
}

/// @nodoc
abstract mixin class $DownloadFolderChangedCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $DownloadFolderChangedCopyWith(DownloadFolderChanged value,
          $Res Function(DownloadFolderChanged) _then) =
      _$DownloadFolderChangedCopyWithImpl;
  @useResult
  $Res call({String? path});
}

/// @nodoc
class _$DownloadFolderChangedCopyWithImpl<$Res>
    implements $DownloadFolderChangedCopyWith<$Res> {
  _$DownloadFolderChangedCopyWithImpl(this._self, this._then);

  final DownloadFolderChanged _self;
  final $Res Function(DownloadFolderChanged) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? path = freezed,
  }) {
    return _then(DownloadFolderChanged(
      path: freezed == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class ToggleRyd implements SettingsEvent {
  const ToggleRyd({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleRydCopyWith<ToggleRyd> get copyWith =>
      _$ToggleRydCopyWithImpl<ToggleRyd>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleRyd &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.rydToggled(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleRydCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleRydCopyWith(ToggleRyd value, $Res Function(ToggleRyd) _then) =
      _$ToggleRydCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleRydCopyWithImpl<$Res> implements $ToggleRydCopyWith<$Res> {
  _$ToggleRydCopyWithImpl(this._self, this._then);

  final ToggleRyd _self;
  final $Res Function(ToggleRyd) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleRyd(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleLongPressSpeedUp implements SettingsEvent {
  const ToggleLongPressSpeedUp({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleLongPressSpeedUpCopyWith<ToggleLongPressSpeedUp> get copyWith =>
      _$ToggleLongPressSpeedUpCopyWithImpl<ToggleLongPressSpeedUp>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleLongPressSpeedUp &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleLongPressSpeedUp(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleLongPressSpeedUpCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleLongPressSpeedUpCopyWith(ToggleLongPressSpeedUp value,
          $Res Function(ToggleLongPressSpeedUp) _then) =
      _$ToggleLongPressSpeedUpCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleLongPressSpeedUpCopyWithImpl<$Res>
    implements $ToggleLongPressSpeedUpCopyWith<$Res> {
  _$ToggleLongPressSpeedUpCopyWithImpl(this._self, this._then);

  final ToggleLongPressSpeedUp _self;
  final $Res Function(ToggleLongPressSpeedUp) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleLongPressSpeedUp(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleOriginalTitles implements SettingsEvent {
  const ToggleOriginalTitles({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleOriginalTitlesCopyWith<ToggleOriginalTitles> get copyWith =>
      _$ToggleOriginalTitlesCopyWithImpl<ToggleOriginalTitles>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleOriginalTitles &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleOriginalTitles(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleOriginalTitlesCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleOriginalTitlesCopyWith(ToggleOriginalTitles value,
          $Res Function(ToggleOriginalTitles) _then) =
      _$ToggleOriginalTitlesCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleOriginalTitlesCopyWithImpl<$Res>
    implements $ToggleOriginalTitlesCopyWith<$Res> {
  _$ToggleOriginalTitlesCopyWithImpl(this._self, this._then);

  final ToggleOriginalTitles _self;
  final $Res Function(ToggleOriginalTitles) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleOriginalTitles(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleCommentFilter implements SettingsEvent {
  const ToggleCommentFilter({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleCommentFilterCopyWith<ToggleCommentFilter> get copyWith =>
      _$ToggleCommentFilterCopyWithImpl<ToggleCommentFilter>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleCommentFilter &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleCommentFilter(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleCommentFilterCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleCommentFilterCopyWith(
          ToggleCommentFilter value, $Res Function(ToggleCommentFilter) _then) =
      _$ToggleCommentFilterCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleCommentFilterCopyWithImpl<$Res>
    implements $ToggleCommentFilterCopyWith<$Res> {
  _$ToggleCommentFilterCopyWithImpl(this._self, this._then);

  final ToggleCommentFilter _self;
  final $Res Function(ToggleCommentFilter) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleCommentFilter(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SetCommentFilterKeywords implements SettingsEvent {
  const SetCommentFilterKeywords({required final List<String> keywords})
      : _keywords = keywords;

  final List<String> _keywords;
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetCommentFilterKeywordsCopyWith<SetCommentFilterKeywords> get copyWith =>
      _$SetCommentFilterKeywordsCopyWithImpl<SetCommentFilterKeywords>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetCommentFilterKeywords &&
            const DeepCollectionEquality().equals(other._keywords, _keywords));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_keywords));

  @override
  String toString() {
    return 'SettingsEvent.setCommentFilterKeywords(keywords: $keywords)';
  }
}

/// @nodoc
abstract mixin class $SetCommentFilterKeywordsCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetCommentFilterKeywordsCopyWith(SetCommentFilterKeywords value,
          $Res Function(SetCommentFilterKeywords) _then) =
      _$SetCommentFilterKeywordsCopyWithImpl;
  @useResult
  $Res call({List<String> keywords});
}

/// @nodoc
class _$SetCommentFilterKeywordsCopyWithImpl<$Res>
    implements $SetCommentFilterKeywordsCopyWith<$Res> {
  _$SetCommentFilterKeywordsCopyWithImpl(this._self, this._then);

  final SetCommentFilterKeywords _self;
  final $Res Function(SetCommentFilterKeywords) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? keywords = null,
  }) {
    return _then(SetCommentFilterKeywords(
      keywords: null == keywords
          ? _self._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class SetPreferredAudioQuality implements SettingsEvent {
  const SetPreferredAudioQuality({required this.quality});

  final String quality;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetPreferredAudioQualityCopyWith<SetPreferredAudioQuality> get copyWith =>
      _$SetPreferredAudioQualityCopyWithImpl<SetPreferredAudioQuality>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetPreferredAudioQuality &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quality);

  @override
  String toString() {
    return 'SettingsEvent.setPreferredAudioQuality(quality: $quality)';
  }
}

/// @nodoc
abstract mixin class $SetPreferredAudioQualityCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetPreferredAudioQualityCopyWith(SetPreferredAudioQuality value,
          $Res Function(SetPreferredAudioQuality) _then) =
      _$SetPreferredAudioQualityCopyWithImpl;
  @useResult
  $Res call({String quality});
}

/// @nodoc
class _$SetPreferredAudioQualityCopyWithImpl<$Res>
    implements $SetPreferredAudioQualityCopyWith<$Res> {
  _$SetPreferredAudioQualityCopyWithImpl(this._self, this._then);

  final SetPreferredAudioQuality _self;
  final $Res Function(SetPreferredAudioQuality) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? quality = null,
  }) {
    return _then(SetPreferredAudioQuality(
      quality: null == quality
          ? _self.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ToggleScreenLock implements SettingsEvent {
  const ToggleScreenLock({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleScreenLockCopyWith<ToggleScreenLock> get copyWith =>
      _$ToggleScreenLockCopyWithImpl<ToggleScreenLock>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleScreenLock &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleScreenLock(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleScreenLockCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleScreenLockCopyWith(
          ToggleScreenLock value, $Res Function(ToggleScreenLock) _then) =
      _$ToggleScreenLockCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleScreenLockCopyWithImpl<$Res>
    implements $ToggleScreenLockCopyWith<$Res> {
  _$ToggleScreenLockCopyWithImpl(this._self, this._then);

  final ToggleScreenLock _self;
  final $Res Function(ToggleScreenLock) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleScreenLock(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class TogglePinchToZoom implements SettingsEvent {
  const TogglePinchToZoom({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TogglePinchToZoomCopyWith<TogglePinchToZoom> get copyWith =>
      _$TogglePinchToZoomCopyWithImpl<TogglePinchToZoom>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TogglePinchToZoom &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.togglePinchToZoom(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $TogglePinchToZoomCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $TogglePinchToZoomCopyWith(
          TogglePinchToZoom value, $Res Function(TogglePinchToZoom) _then) =
      _$TogglePinchToZoomCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$TogglePinchToZoomCopyWithImpl<$Res>
    implements $TogglePinchToZoomCopyWith<$Res> {
  _$TogglePinchToZoomCopyWithImpl(this._self, this._then);

  final TogglePinchToZoom _self;
  final $Res Function(TogglePinchToZoom) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(TogglePinchToZoom(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleSeekbarThumbnails implements SettingsEvent {
  const ToggleSeekbarThumbnails({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleSeekbarThumbnailsCopyWith<ToggleSeekbarThumbnails> get copyWith =>
      _$ToggleSeekbarThumbnailsCopyWithImpl<ToggleSeekbarThumbnails>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleSeekbarThumbnails &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleSeekbarThumbnails(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleSeekbarThumbnailsCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleSeekbarThumbnailsCopyWith(ToggleSeekbarThumbnails value,
          $Res Function(ToggleSeekbarThumbnails) _then) =
      _$ToggleSeekbarThumbnailsCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleSeekbarThumbnailsCopyWithImpl<$Res>
    implements $ToggleSeekbarThumbnailsCopyWith<$Res> {
  _$ToggleSeekbarThumbnailsCopyWithImpl(this._self, this._then);

  final ToggleSeekbarThumbnails _self;
  final $Res Function(ToggleSeekbarThumbnails) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleSeekbarThumbnails(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class TogglePopupPlayer implements SettingsEvent {
  const TogglePopupPlayer({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TogglePopupPlayerCopyWith<TogglePopupPlayer> get copyWith =>
      _$TogglePopupPlayerCopyWithImpl<TogglePopupPlayer>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TogglePopupPlayer &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.togglePopupPlayer(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $TogglePopupPlayerCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $TogglePopupPlayerCopyWith(
          TogglePopupPlayer value, $Res Function(TogglePopupPlayer) _then) =
      _$TogglePopupPlayerCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$TogglePopupPlayerCopyWithImpl<$Res>
    implements $TogglePopupPlayerCopyWith<$Res> {
  _$TogglePopupPlayerCopyWithImpl(this._self, this._then);

  final TogglePopupPlayer _self;
  final $Res Function(TogglePopupPlayer) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(TogglePopupPlayer(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleLiveChatDanmaku implements SettingsEvent {
  const ToggleLiveChatDanmaku({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleLiveChatDanmakuCopyWith<ToggleLiveChatDanmaku> get copyWith =>
      _$ToggleLiveChatDanmakuCopyWithImpl<ToggleLiveChatDanmaku>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleLiveChatDanmaku &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleLiveChatDanmaku(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleLiveChatDanmakuCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleLiveChatDanmakuCopyWith(ToggleLiveChatDanmaku value,
          $Res Function(ToggleLiveChatDanmaku) _then) =
      _$ToggleLiveChatDanmakuCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleLiveChatDanmakuCopyWithImpl<$Res>
    implements $ToggleLiveChatDanmakuCopyWith<$Res> {
  _$ToggleLiveChatDanmakuCopyWithImpl(this._self, this._then);

  final ToggleLiveChatDanmaku _self;
  final $Res Function(ToggleLiveChatDanmaku) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleLiveChatDanmaku(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleBluetoothSeek implements SettingsEvent {
  const ToggleBluetoothSeek({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleBluetoothSeekCopyWith<ToggleBluetoothSeek> get copyWith =>
      _$ToggleBluetoothSeekCopyWithImpl<ToggleBluetoothSeek>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleBluetoothSeek &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleBluetoothSeek(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleBluetoothSeekCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleBluetoothSeekCopyWith(
          ToggleBluetoothSeek value, $Res Function(ToggleBluetoothSeek) _then) =
      _$ToggleBluetoothSeekCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleBluetoothSeekCopyWithImpl<$Res>
    implements $ToggleBluetoothSeekCopyWith<$Res> {
  _$ToggleBluetoothSeekCopyWithImpl(this._self, this._then);

  final ToggleBluetoothSeek _self;
  final $Res Function(ToggleBluetoothSeek) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleBluetoothSeek(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleMultiSelectLists implements SettingsEvent {
  const ToggleMultiSelectLists({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleMultiSelectListsCopyWith<ToggleMultiSelectLists> get copyWith =>
      _$ToggleMultiSelectListsCopyWithImpl<ToggleMultiSelectLists>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleMultiSelectLists &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleMultiSelectLists(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleMultiSelectListsCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleMultiSelectListsCopyWith(ToggleMultiSelectLists value,
          $Res Function(ToggleMultiSelectLists) _then) =
      _$ToggleMultiSelectListsCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleMultiSelectListsCopyWithImpl<$Res>
    implements $ToggleMultiSelectListsCopyWith<$Res> {
  _$ToggleMultiSelectListsCopyWithImpl(this._self, this._then);

  final ToggleMultiSelectLists _self;
  final $Res Function(ToggleMultiSelectLists) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleMultiSelectLists(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleSbExclusiveMarker implements SettingsEvent {
  const ToggleSbExclusiveMarker({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleSbExclusiveMarkerCopyWith<ToggleSbExclusiveMarker> get copyWith =>
      _$ToggleSbExclusiveMarkerCopyWithImpl<ToggleSbExclusiveMarker>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleSbExclusiveMarker &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleSbExclusiveMarker(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleSbExclusiveMarkerCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleSbExclusiveMarkerCopyWith(ToggleSbExclusiveMarker value,
          $Res Function(ToggleSbExclusiveMarker) _then) =
      _$ToggleSbExclusiveMarkerCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleSbExclusiveMarkerCopyWithImpl<$Res>
    implements $ToggleSbExclusiveMarkerCopyWith<$Res> {
  _$ToggleSbExclusiveMarkerCopyWithImpl(this._self, this._then);

  final ToggleSbExclusiveMarker _self;
  final $Res Function(ToggleSbExclusiveMarker) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleSbExclusiveMarker(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleSbForDownloads implements SettingsEvent {
  const ToggleSbForDownloads({required this.enabled});

  final bool enabled;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleSbForDownloadsCopyWith<ToggleSbForDownloads> get copyWith =>
      _$ToggleSbForDownloadsCopyWithImpl<ToggleSbForDownloads>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleSbForDownloads &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'SettingsEvent.toggleSbForDownloads(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleSbForDownloadsCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleSbForDownloadsCopyWith(ToggleSbForDownloads value,
          $Res Function(ToggleSbForDownloads) _then) =
      _$ToggleSbForDownloadsCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ToggleSbForDownloadsCopyWithImpl<$Res>
    implements $ToggleSbForDownloadsCopyWith<$Res> {
  _$ToggleSbForDownloadsCopyWithImpl(this._self, this._then);

  final ToggleSbForDownloads _self;
  final $Res Function(ToggleSbForDownloads) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ToggleSbForDownloads(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SetYoutubeCookie implements SettingsEvent {
  const SetYoutubeCookie({required this.cookie});

  final String cookie;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetYoutubeCookieCopyWith<SetYoutubeCookie> get copyWith =>
      _$SetYoutubeCookieCopyWithImpl<SetYoutubeCookie>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetYoutubeCookie &&
            (identical(other.cookie, cookie) || other.cookie == cookie));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cookie);

  @override
  String toString() {
    return 'SettingsEvent.setYoutubeCookie(cookie: $cookie)';
  }
}

/// @nodoc
abstract mixin class $SetYoutubeCookieCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SetYoutubeCookieCopyWith(
          SetYoutubeCookie value, $Res Function(SetYoutubeCookie) _then) =
      _$SetYoutubeCookieCopyWithImpl;
  @useResult
  $Res call({String cookie});
}

/// @nodoc
class _$SetYoutubeCookieCopyWithImpl<$Res>
    implements $SetYoutubeCookieCopyWith<$Res> {
  _$SetYoutubeCookieCopyWithImpl(this._self, this._then);

  final SetYoutubeCookie _self;
  final $Res Function(SetYoutubeCookie) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cookie = null,
  }) {
    return _then(SetYoutubeCookie(
      cookie: null == cookie
          ? _self.cookie
          : cookie // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ClearYoutubeCookie implements SettingsEvent {
  const ClearYoutubeCookie();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ClearYoutubeCookie);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsEvent.clearYoutubeCookie()';
  }
}

/// @nodoc

class SavePipedSession implements SettingsEvent {
  const SavePipedSession({required this.token, required this.username});

  final String token;
  final String username;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavePipedSessionCopyWith<SavePipedSession> get copyWith =>
      _$SavePipedSessionCopyWithImpl<SavePipedSession>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavePipedSession &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token, username);

  @override
  String toString() {
    return 'SettingsEvent.savePipedSession(token: $token, username: $username)';
  }
}

/// @nodoc
abstract mixin class $SavePipedSessionCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SavePipedSessionCopyWith(
          SavePipedSession value, $Res Function(SavePipedSession) _then) =
      _$SavePipedSessionCopyWithImpl;
  @useResult
  $Res call({String token, String username});
}

/// @nodoc
class _$SavePipedSessionCopyWithImpl<$Res>
    implements $SavePipedSessionCopyWith<$Res> {
  _$SavePipedSessionCopyWithImpl(this._self, this._then);

  final SavePipedSession _self;
  final $Res Function(SavePipedSession) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = null,
    Object? username = null,
  }) {
    return _then(SavePipedSession(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ClearPipedSession implements SettingsEvent {
  const ClearPipedSession();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ClearPipedSession);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsEvent.clearPipedSession()';
  }
}

/// @nodoc
mixin _$SettingsState {
  String get defaultLanguage;
  String get defaultQuality;
  String get defaultRegion;
  String get themeMode;
  String? get version;
  bool get isHistoryVisible;
  bool get isDislikeVisible;
  bool get isHlsPlayer;
  bool get isHideComments;
  bool get isHideRelated;
  List<Instance> get pipedInstances;
  ApiStatus get pipedInstanceStatus;
  String get instance;
  List<Instance> get invidiousInstances;
  ApiStatus get invidiousInstanceStatus;
  String get ytService;
  bool get initialized;
  ApiStatus get settingsStatus;
  bool get isPipDisabled; // Connection status tracking for UI feedback
  String? get connectingToInstance;
  bool
      get isTestingConnection; // Track if user's preferred instance failed (for showing snackbar)
  bool get userInstanceFailed;
  String? get failedInstanceName; // Search filter
  String
      get searchFilter; // Video fit mode (contain, cover, fill, fitWidth, fitHeight)
  String get videoFitMode; // Skip interval in seconds (for double-tap skip)
  int get skipInterval; // SponsorBlock settings
  bool get isSponsorBlockEnabled;
  List<String> get sponsorBlockCategories; // Open links in external browser
  bool get openLinksInBrowser; // Home feed display mode
  String get homeFeedMode; // Audio focus / pause on interruption
  bool get isAudioFocusEnabled; // Profiles
  String get currentProfile;
  List<String> get profiles; // Subtitle size (font size in pixels)
  double get subtitleSize; // Last exported file path (for sharing)
  String? get lastExportedFilePath; // Search history privacy
  bool get isSearchHistoryEnabled;
  bool
      get isSearchHistoryVisible; // Auto PiP (enter PiP when pressing home button while video is playing)
  bool get isAutoPipEnabled;
  SleepTimerConfig? get sleepTimerConfig;
  bool? get isSwipeGesturesEnabled;
  bool? get isDeArrowEnabled;
  bool? get isBookmarksEnabled;
  List<String>? get bookmarkedPlaylists;
  bool? get isRestrictedModeEnabled;
  bool? get isMiniPlayerEnabled;
  String? get downloadQuality;
  bool? get isDownloadSubtitlesEnabled;
  bool? get isDownloadOverWifiOnlyEnabled;
  bool? get isDownloadAutoDeleteEnabled;
  double? get playbackSpeed;
  bool? get isAutoplayNextVideoEnabled;
  bool? get isShowRelatedInQueueEnabled;
  int? get queueDismissTime;
  int? get autoplayCountdown;
  bool? get isDisableAutoplayOnCellularEnabled;
  bool? get isAutoQueueEnabled;
  bool? get isBufferPreloadEnabled;
  bool? get isAutoQualityAdjustEnabled;
  bool? get isBackgroundPlaybackEnabled;
  bool? get isNotificationControlsEnabled;
  bool? get isDataSaverEnabled;
  bool? get isHideWatchedVideosEnabled;
  int? get mobileDataQuality;
  bool? get isDownloadQueueItemsEnabled;
  bool? get isRichCaptionRenderingEnabled;
  bool? get isBilibiliEnabled;
  bool? get isSwipeLeftToRight;
  bool? get isMiniPlayerAutoExpandEnabled;
  bool? get isMiniPlayerTapToExpandEnabled;
  bool? get isMiniPlayerDoubleTapToExpandEnabled;
  RestrictedModeFilterLevel? get restrictedModeFilterLevel;
  int? get downloadAutoDeleteDays;
  List<String>? get contentFilterKeywords;
  List<String>? get contentFilterBlockedChannels;
  bool? get contentFilterHideShorts;
  bool? get contentFilterHidePaid;
  String? get downloadFolderPath;
  bool? get isRydEnabled; // Phase 18
  bool? get isLongPressSpeedUpEnabled;
  bool? get isOriginalTitlesEnabled;
  bool? get isCommentFilterEnabled;
  List<String>? get commentFilterKeywords;
  String? get preferredAudioQuality;
  bool? get isScreenLockEnabled;
  bool? get isPinchToZoomEnabled;
  bool? get isAudioOnlyEnabled;
  bool? get isSeekbarThumbnailsEnabled;
  bool? get isPopupPlayerEnabled;
  bool? get isLiveChatDanmakuEnabled;
  bool? get isBluetoothSeekEnabled;
  bool? get isMultiSelectListsEnabled;
  bool? get isSbExclusiveMarkerEnabled;
  bool? get isSbForDownloadsEnabled;
  String? get youtubeCookie;
  String? get pipedAuthToken;
  String? get pipedAuthUsername;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      _$SettingsStateCopyWithImpl<SettingsState>(
          this as SettingsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsState &&
            (identical(other.defaultLanguage, defaultLanguage) ||
                other.defaultLanguage == defaultLanguage) &&
            (identical(other.defaultQuality, defaultQuality) ||
                other.defaultQuality == defaultQuality) &&
            (identical(other.defaultRegion, defaultRegion) ||
                other.defaultRegion == defaultRegion) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.isHistoryVisible, isHistoryVisible) ||
                other.isHistoryVisible == isHistoryVisible) &&
            (identical(other.isDislikeVisible, isDislikeVisible) ||
                other.isDislikeVisible == isDislikeVisible) &&
            (identical(other.isHlsPlayer, isHlsPlayer) ||
                other.isHlsPlayer == isHlsPlayer) &&
            (identical(other.isHideComments, isHideComments) ||
                other.isHideComments == isHideComments) &&
            (identical(other.isHideRelated, isHideRelated) ||
                other.isHideRelated == isHideRelated) &&
            const DeepCollectionEquality()
                .equals(other.pipedInstances, pipedInstances) &&
            (identical(other.pipedInstanceStatus, pipedInstanceStatus) ||
                other.pipedInstanceStatus == pipedInstanceStatus) &&
            (identical(other.instance, instance) ||
                other.instance == instance) &&
            const DeepCollectionEquality()
                .equals(other.invidiousInstances, invidiousInstances) &&
            (identical(other.invidiousInstanceStatus, invidiousInstanceStatus) ||
                other.invidiousInstanceStatus == invidiousInstanceStatus) &&
            (identical(other.ytService, ytService) ||
                other.ytService == ytService) &&
            (identical(other.initialized, initialized) ||
                other.initialized == initialized) &&
            (identical(other.settingsStatus, settingsStatus) ||
                other.settingsStatus == settingsStatus) &&
            (identical(other.isPipDisabled, isPipDisabled) ||
                other.isPipDisabled == isPipDisabled) &&
            (identical(other.connectingToInstance, connectingToInstance) ||
                other.connectingToInstance == connectingToInstance) &&
            (identical(other.isTestingConnection, isTestingConnection) ||
                other.isTestingConnection == isTestingConnection) &&
            (identical(other.userInstanceFailed, userInstanceFailed) ||
                other.userInstanceFailed == userInstanceFailed) &&
            (identical(other.failedInstanceName, failedInstanceName) ||
                other.failedInstanceName == failedInstanceName) &&
            (identical(other.searchFilter, searchFilter) ||
                other.searchFilter == searchFilter) &&
            (identical(other.videoFitMode, videoFitMode) ||
                other.videoFitMode == videoFitMode) &&
            (identical(other.skipInterval, skipInterval) ||
                other.skipInterval == skipInterval) &&
            (identical(other.isSponsorBlockEnabled, isSponsorBlockEnabled) ||
                other.isSponsorBlockEnabled == isSponsorBlockEnabled) &&
            const DeepCollectionEquality()
                .equals(other.sponsorBlockCategories, sponsorBlockCategories) &&
            (identical(other.openLinksInBrowser, openLinksInBrowser) ||
                other.openLinksInBrowser == openLinksInBrowser) &&
            (identical(other.homeFeedMode, homeFeedMode) ||
                other.homeFeedMode == homeFeedMode) &&
            (identical(other.isAudioFocusEnabled, isAudioFocusEnabled) ||
                other.isAudioFocusEnabled == isAudioFocusEnabled) &&
            (identical(other.currentProfile, currentProfile) ||
                other.currentProfile == currentProfile) &&
            const DeepCollectionEquality().equals(other.profiles, profiles) &&
            (identical(other.subtitleSize, subtitleSize) ||
                other.subtitleSize == subtitleSize) &&
            (identical(other.lastExportedFilePath, lastExportedFilePath) ||
                other.lastExportedFilePath == lastExportedFilePath) &&
            (identical(other.isSearchHistoryEnabled, isSearchHistoryEnabled) ||
                other.isSearchHistoryEnabled == isSearchHistoryEnabled) &&
            (identical(other.isSearchHistoryVisible, isSearchHistoryVisible) ||
                other.isSearchHistoryVisible == isSearchHistoryVisible) &&
            (identical(other.isAutoPipEnabled, isAutoPipEnabled) ||
                other.isAutoPipEnabled == isAutoPipEnabled) &&
            (identical(other.sleepTimerConfig, sleepTimerConfig) || other.sleepTimerConfig == sleepTimerConfig) &&
            (identical(other.isSwipeGesturesEnabled, isSwipeGesturesEnabled) || other.isSwipeGesturesEnabled == isSwipeGesturesEnabled) &&
            (identical(other.isDeArrowEnabled, isDeArrowEnabled) || other.isDeArrowEnabled == isDeArrowEnabled) &&
            (identical(other.isBookmarksEnabled, isBookmarksEnabled) || other.isBookmarksEnabled == isBookmarksEnabled) &&
            const DeepCollectionEquality().equals(other.bookmarkedPlaylists, bookmarkedPlaylists) &&
            (identical(other.isRestrictedModeEnabled, isRestrictedModeEnabled) || other.isRestrictedModeEnabled == isRestrictedModeEnabled) &&
            (identical(other.isMiniPlayerEnabled, isMiniPlayerEnabled) || other.isMiniPlayerEnabled == isMiniPlayerEnabled) &&
            (identical(other.downloadQuality, downloadQuality) || other.downloadQuality == downloadQuality) &&
            (identical(other.isDownloadSubtitlesEnabled, isDownloadSubtitlesEnabled) || other.isDownloadSubtitlesEnabled == isDownloadSubtitlesEnabled) &&
            (identical(other.isDownloadOverWifiOnlyEnabled, isDownloadOverWifiOnlyEnabled) || other.isDownloadOverWifiOnlyEnabled == isDownloadOverWifiOnlyEnabled) &&
            (identical(other.isDownloadAutoDeleteEnabled, isDownloadAutoDeleteEnabled) || other.isDownloadAutoDeleteEnabled == isDownloadAutoDeleteEnabled) &&
            (identical(other.playbackSpeed, playbackSpeed) || other.playbackSpeed == playbackSpeed) &&
            (identical(other.isAutoplayNextVideoEnabled, isAutoplayNextVideoEnabled) || other.isAutoplayNextVideoEnabled == isAutoplayNextVideoEnabled) &&
            (identical(other.isShowRelatedInQueueEnabled, isShowRelatedInQueueEnabled) || other.isShowRelatedInQueueEnabled == isShowRelatedInQueueEnabled) &&
            (identical(other.queueDismissTime, queueDismissTime) || other.queueDismissTime == queueDismissTime) &&
            (identical(other.autoplayCountdown, autoplayCountdown) || other.autoplayCountdown == autoplayCountdown) &&
            (identical(other.isDisableAutoplayOnCellularEnabled, isDisableAutoplayOnCellularEnabled) || other.isDisableAutoplayOnCellularEnabled == isDisableAutoplayOnCellularEnabled) &&
            (identical(other.isAutoQueueEnabled, isAutoQueueEnabled) || other.isAutoQueueEnabled == isAutoQueueEnabled) &&
            (identical(other.isBufferPreloadEnabled, isBufferPreloadEnabled) || other.isBufferPreloadEnabled == isBufferPreloadEnabled) &&
            (identical(other.isAutoQualityAdjustEnabled, isAutoQualityAdjustEnabled) || other.isAutoQualityAdjustEnabled == isAutoQualityAdjustEnabled) &&
            (identical(other.isBackgroundPlaybackEnabled, isBackgroundPlaybackEnabled) || other.isBackgroundPlaybackEnabled == isBackgroundPlaybackEnabled) &&
            (identical(other.isNotificationControlsEnabled, isNotificationControlsEnabled) || other.isNotificationControlsEnabled == isNotificationControlsEnabled) &&
            (identical(other.isDataSaverEnabled, isDataSaverEnabled) || other.isDataSaverEnabled == isDataSaverEnabled) &&
            (identical(other.isHideWatchedVideosEnabled, isHideWatchedVideosEnabled) || other.isHideWatchedVideosEnabled == isHideWatchedVideosEnabled) &&
            (identical(other.mobileDataQuality, mobileDataQuality) || other.mobileDataQuality == mobileDataQuality) &&
            (identical(other.isDownloadQueueItemsEnabled, isDownloadQueueItemsEnabled) || other.isDownloadQueueItemsEnabled == isDownloadQueueItemsEnabled) &&
            (identical(other.isRichCaptionRenderingEnabled, isRichCaptionRenderingEnabled) || other.isRichCaptionRenderingEnabled == isRichCaptionRenderingEnabled) &&
            (identical(other.isBilibiliEnabled, isBilibiliEnabled) || other.isBilibiliEnabled == isBilibiliEnabled) &&
            (identical(other.isSwipeLeftToRight, isSwipeLeftToRight) || other.isSwipeLeftToRight == isSwipeLeftToRight) &&
            (identical(other.isMiniPlayerAutoExpandEnabled, isMiniPlayerAutoExpandEnabled) || other.isMiniPlayerAutoExpandEnabled == isMiniPlayerAutoExpandEnabled) &&
            (identical(other.isMiniPlayerTapToExpandEnabled, isMiniPlayerTapToExpandEnabled) || other.isMiniPlayerTapToExpandEnabled == isMiniPlayerTapToExpandEnabled) &&
            (identical(other.isMiniPlayerDoubleTapToExpandEnabled, isMiniPlayerDoubleTapToExpandEnabled) || other.isMiniPlayerDoubleTapToExpandEnabled == isMiniPlayerDoubleTapToExpandEnabled) &&
            (identical(other.restrictedModeFilterLevel, restrictedModeFilterLevel) || other.restrictedModeFilterLevel == restrictedModeFilterLevel) &&
            (identical(other.downloadAutoDeleteDays, downloadAutoDeleteDays) || other.downloadAutoDeleteDays == downloadAutoDeleteDays) &&
            const DeepCollectionEquality().equals(other.contentFilterKeywords, contentFilterKeywords) &&
            const DeepCollectionEquality().equals(other.contentFilterBlockedChannels, contentFilterBlockedChannels) &&
            (identical(other.contentFilterHideShorts, contentFilterHideShorts) || other.contentFilterHideShorts == contentFilterHideShorts) &&
            (identical(other.contentFilterHidePaid, contentFilterHidePaid) || other.contentFilterHidePaid == contentFilterHidePaid) &&
            (identical(other.downloadFolderPath, downloadFolderPath) || other.downloadFolderPath == downloadFolderPath) &&
            (identical(other.isRydEnabled, isRydEnabled) || other.isRydEnabled == isRydEnabled) &&
            (identical(other.isLongPressSpeedUpEnabled, isLongPressSpeedUpEnabled) || other.isLongPressSpeedUpEnabled == isLongPressSpeedUpEnabled) &&
            (identical(other.isOriginalTitlesEnabled, isOriginalTitlesEnabled) || other.isOriginalTitlesEnabled == isOriginalTitlesEnabled) &&
            (identical(other.isCommentFilterEnabled, isCommentFilterEnabled) || other.isCommentFilterEnabled == isCommentFilterEnabled) &&
            const DeepCollectionEquality().equals(other.commentFilterKeywords, commentFilterKeywords) &&
            (identical(other.preferredAudioQuality, preferredAudioQuality) || other.preferredAudioQuality == preferredAudioQuality) &&
            (identical(other.isScreenLockEnabled, isScreenLockEnabled) || other.isScreenLockEnabled == isScreenLockEnabled) &&
            (identical(other.isPinchToZoomEnabled, isPinchToZoomEnabled) || other.isPinchToZoomEnabled == isPinchToZoomEnabled) &&
            (identical(other.isAudioOnlyEnabled, isAudioOnlyEnabled) || other.isAudioOnlyEnabled == isAudioOnlyEnabled) &&
            (identical(other.isSeekbarThumbnailsEnabled, isSeekbarThumbnailsEnabled) || other.isSeekbarThumbnailsEnabled == isSeekbarThumbnailsEnabled) &&
            (identical(other.isPopupPlayerEnabled, isPopupPlayerEnabled) || other.isPopupPlayerEnabled == isPopupPlayerEnabled) &&
            (identical(other.isLiveChatDanmakuEnabled, isLiveChatDanmakuEnabled) || other.isLiveChatDanmakuEnabled == isLiveChatDanmakuEnabled) &&
            (identical(other.isBluetoothSeekEnabled, isBluetoothSeekEnabled) || other.isBluetoothSeekEnabled == isBluetoothSeekEnabled) &&
            (identical(other.isMultiSelectListsEnabled, isMultiSelectListsEnabled) || other.isMultiSelectListsEnabled == isMultiSelectListsEnabled) &&
            (identical(other.isSbExclusiveMarkerEnabled, isSbExclusiveMarkerEnabled) || other.isSbExclusiveMarkerEnabled == isSbExclusiveMarkerEnabled) &&
            (identical(other.isSbForDownloadsEnabled, isSbForDownloadsEnabled) || other.isSbForDownloadsEnabled == isSbForDownloadsEnabled) &&
            (identical(other.youtubeCookie, youtubeCookie) || other.youtubeCookie == youtubeCookie) &&
            (identical(other.pipedAuthToken, pipedAuthToken) || other.pipedAuthToken == pipedAuthToken) &&
            (identical(other.pipedAuthUsername, pipedAuthUsername) || other.pipedAuthUsername == pipedAuthUsername));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        defaultLanguage,
        defaultQuality,
        defaultRegion,
        themeMode,
        version,
        isHistoryVisible,
        isDislikeVisible,
        isHlsPlayer,
        isHideComments,
        isHideRelated,
        const DeepCollectionEquality().hash(pipedInstances),
        pipedInstanceStatus,
        instance,
        const DeepCollectionEquality().hash(invidiousInstances),
        invidiousInstanceStatus,
        ytService,
        initialized,
        settingsStatus,
        isPipDisabled,
        connectingToInstance,
        isTestingConnection,
        userInstanceFailed,
        failedInstanceName,
        searchFilter,
        videoFitMode,
        skipInterval,
        isSponsorBlockEnabled,
        const DeepCollectionEquality().hash(sponsorBlockCategories),
        openLinksInBrowser,
        homeFeedMode,
        isAudioFocusEnabled,
        currentProfile,
        const DeepCollectionEquality().hash(profiles),
        subtitleSize,
        lastExportedFilePath,
        isSearchHistoryEnabled,
        isSearchHistoryVisible,
        isAutoPipEnabled,
        sleepTimerConfig,
        isSwipeGesturesEnabled,
        isDeArrowEnabled,
        isBookmarksEnabled,
        const DeepCollectionEquality().hash(bookmarkedPlaylists),
        isRestrictedModeEnabled,
        isMiniPlayerEnabled,
        downloadQuality,
        isDownloadSubtitlesEnabled,
        isDownloadOverWifiOnlyEnabled,
        isDownloadAutoDeleteEnabled,
        playbackSpeed,
        isAutoplayNextVideoEnabled,
        isShowRelatedInQueueEnabled,
        queueDismissTime,
        autoplayCountdown,
        isDisableAutoplayOnCellularEnabled,
        isAutoQueueEnabled,
        isBufferPreloadEnabled,
        isAutoQualityAdjustEnabled,
        isBackgroundPlaybackEnabled,
        isNotificationControlsEnabled,
        isDataSaverEnabled,
        isHideWatchedVideosEnabled,
        mobileDataQuality,
        isDownloadQueueItemsEnabled,
        isRichCaptionRenderingEnabled,
        isBilibiliEnabled,
        isSwipeLeftToRight,
        isMiniPlayerAutoExpandEnabled,
        isMiniPlayerTapToExpandEnabled,
        isMiniPlayerDoubleTapToExpandEnabled,
        restrictedModeFilterLevel,
        downloadAutoDeleteDays,
        const DeepCollectionEquality().hash(contentFilterKeywords),
        const DeepCollectionEquality().hash(contentFilterBlockedChannels),
        contentFilterHideShorts,
        contentFilterHidePaid,
        downloadFolderPath,
        isRydEnabled,
        isLongPressSpeedUpEnabled,
        isOriginalTitlesEnabled,
        isCommentFilterEnabled,
        const DeepCollectionEquality().hash(commentFilterKeywords),
        preferredAudioQuality,
        isScreenLockEnabled,
        isPinchToZoomEnabled,
        isAudioOnlyEnabled,
        isSeekbarThumbnailsEnabled,
        isPopupPlayerEnabled,
        isLiveChatDanmakuEnabled,
        isBluetoothSeekEnabled,
        isMultiSelectListsEnabled,
        isSbExclusiveMarkerEnabled,
        isSbForDownloadsEnabled,
        youtubeCookie,
        pipedAuthToken,
        pipedAuthUsername
      ]);

  @override
  String toString() {
    return 'SettingsState(defaultLanguage: $defaultLanguage, defaultQuality: $defaultQuality, defaultRegion: $defaultRegion, themeMode: $themeMode, version: $version, isHistoryVisible: $isHistoryVisible, isDislikeVisible: $isDislikeVisible, isHlsPlayer: $isHlsPlayer, isHideComments: $isHideComments, isHideRelated: $isHideRelated, pipedInstances: $pipedInstances, pipedInstanceStatus: $pipedInstanceStatus, instance: $instance, invidiousInstances: $invidiousInstances, invidiousInstanceStatus: $invidiousInstanceStatus, ytService: $ytService, initialized: $initialized, settingsStatus: $settingsStatus, isPipDisabled: $isPipDisabled, connectingToInstance: $connectingToInstance, isTestingConnection: $isTestingConnection, userInstanceFailed: $userInstanceFailed, failedInstanceName: $failedInstanceName, searchFilter: $searchFilter, videoFitMode: $videoFitMode, skipInterval: $skipInterval, isSponsorBlockEnabled: $isSponsorBlockEnabled, sponsorBlockCategories: $sponsorBlockCategories, openLinksInBrowser: $openLinksInBrowser, homeFeedMode: $homeFeedMode, isAudioFocusEnabled: $isAudioFocusEnabled, currentProfile: $currentProfile, profiles: $profiles, subtitleSize: $subtitleSize, lastExportedFilePath: $lastExportedFilePath, isSearchHistoryEnabled: $isSearchHistoryEnabled, isSearchHistoryVisible: $isSearchHistoryVisible, isAutoPipEnabled: $isAutoPipEnabled, sleepTimerConfig: $sleepTimerConfig, isSwipeGesturesEnabled: $isSwipeGesturesEnabled, isDeArrowEnabled: $isDeArrowEnabled, isBookmarksEnabled: $isBookmarksEnabled, bookmarkedPlaylists: $bookmarkedPlaylists, isRestrictedModeEnabled: $isRestrictedModeEnabled, isMiniPlayerEnabled: $isMiniPlayerEnabled, downloadQuality: $downloadQuality, isDownloadSubtitlesEnabled: $isDownloadSubtitlesEnabled, isDownloadOverWifiOnlyEnabled: $isDownloadOverWifiOnlyEnabled, isDownloadAutoDeleteEnabled: $isDownloadAutoDeleteEnabled, playbackSpeed: $playbackSpeed, isAutoplayNextVideoEnabled: $isAutoplayNextVideoEnabled, isShowRelatedInQueueEnabled: $isShowRelatedInQueueEnabled, queueDismissTime: $queueDismissTime, autoplayCountdown: $autoplayCountdown, isDisableAutoplayOnCellularEnabled: $isDisableAutoplayOnCellularEnabled, isAutoQueueEnabled: $isAutoQueueEnabled, isBufferPreloadEnabled: $isBufferPreloadEnabled, isAutoQualityAdjustEnabled: $isAutoQualityAdjustEnabled, isBackgroundPlaybackEnabled: $isBackgroundPlaybackEnabled, isNotificationControlsEnabled: $isNotificationControlsEnabled, isDataSaverEnabled: $isDataSaverEnabled, isHideWatchedVideosEnabled: $isHideWatchedVideosEnabled, mobileDataQuality: $mobileDataQuality, isDownloadQueueItemsEnabled: $isDownloadQueueItemsEnabled, isRichCaptionRenderingEnabled: $isRichCaptionRenderingEnabled, isBilibiliEnabled: $isBilibiliEnabled, isSwipeLeftToRight: $isSwipeLeftToRight, isMiniPlayerAutoExpandEnabled: $isMiniPlayerAutoExpandEnabled, isMiniPlayerTapToExpandEnabled: $isMiniPlayerTapToExpandEnabled, isMiniPlayerDoubleTapToExpandEnabled: $isMiniPlayerDoubleTapToExpandEnabled, restrictedModeFilterLevel: $restrictedModeFilterLevel, downloadAutoDeleteDays: $downloadAutoDeleteDays, contentFilterKeywords: $contentFilterKeywords, contentFilterBlockedChannels: $contentFilterBlockedChannels, contentFilterHideShorts: $contentFilterHideShorts, contentFilterHidePaid: $contentFilterHidePaid, downloadFolderPath: $downloadFolderPath, isRydEnabled: $isRydEnabled, isLongPressSpeedUpEnabled: $isLongPressSpeedUpEnabled, isOriginalTitlesEnabled: $isOriginalTitlesEnabled, isCommentFilterEnabled: $isCommentFilterEnabled, commentFilterKeywords: $commentFilterKeywords, preferredAudioQuality: $preferredAudioQuality, isScreenLockEnabled: $isScreenLockEnabled, isPinchToZoomEnabled: $isPinchToZoomEnabled, isAudioOnlyEnabled: $isAudioOnlyEnabled, isSeekbarThumbnailsEnabled: $isSeekbarThumbnailsEnabled, isPopupPlayerEnabled: $isPopupPlayerEnabled, isLiveChatDanmakuEnabled: $isLiveChatDanmakuEnabled, isBluetoothSeekEnabled: $isBluetoothSeekEnabled, isMultiSelectListsEnabled: $isMultiSelectListsEnabled, isSbExclusiveMarkerEnabled: $isSbExclusiveMarkerEnabled, isSbForDownloadsEnabled: $isSbForDownloadsEnabled, youtubeCookie: $youtubeCookie, pipedAuthToken: $pipedAuthToken, pipedAuthUsername: $pipedAuthUsername)';
  }
}

/// @nodoc
abstract mixin class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) _then) =
      _$SettingsStateCopyWithImpl;
  @useResult
  $Res call(
      {String defaultLanguage,
      String defaultQuality,
      String defaultRegion,
      String themeMode,
      String? version,
      bool isHistoryVisible,
      bool isDislikeVisible,
      bool isHlsPlayer,
      bool isHideComments,
      bool isHideRelated,
      List<Instance> pipedInstances,
      ApiStatus pipedInstanceStatus,
      String instance,
      List<Instance> invidiousInstances,
      ApiStatus invidiousInstanceStatus,
      String ytService,
      bool initialized,
      ApiStatus settingsStatus,
      bool isPipDisabled,
      String? connectingToInstance,
      bool isTestingConnection,
      bool userInstanceFailed,
      String? failedInstanceName,
      String searchFilter,
      String videoFitMode,
      int skipInterval,
      bool isSponsorBlockEnabled,
      List<String> sponsorBlockCategories,
      bool openLinksInBrowser,
      String homeFeedMode,
      bool isAudioFocusEnabled,
      String currentProfile,
      List<String> profiles,
      double subtitleSize,
      String? lastExportedFilePath,
      bool isSearchHistoryEnabled,
      bool isSearchHistoryVisible,
      bool isAutoPipEnabled,
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
      bool? isLongPressSpeedUpEnabled,
      bool? isOriginalTitlesEnabled,
      bool? isCommentFilterEnabled,
      List<String>? commentFilterKeywords,
      String? preferredAudioQuality,
      bool? isScreenLockEnabled,
      bool? isPinchToZoomEnabled,
      bool? isAudioOnlyEnabled,
      bool? isSeekbarThumbnailsEnabled,
      bool? isPopupPlayerEnabled,
      bool? isLiveChatDanmakuEnabled,
      bool? isBluetoothSeekEnabled,
      bool? isMultiSelectListsEnabled,
      bool? isSbExclusiveMarkerEnabled,
      bool? isSbForDownloadsEnabled,
      String? youtubeCookie,
      String? pipedAuthToken,
      String? pipedAuthUsername});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._self, this._then);

  final SettingsState _self;
  final $Res Function(SettingsState) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultLanguage = null,
    Object? defaultQuality = null,
    Object? defaultRegion = null,
    Object? themeMode = null,
    Object? version = freezed,
    Object? isHistoryVisible = null,
    Object? isDislikeVisible = null,
    Object? isHlsPlayer = null,
    Object? isHideComments = null,
    Object? isHideRelated = null,
    Object? pipedInstances = null,
    Object? pipedInstanceStatus = null,
    Object? instance = null,
    Object? invidiousInstances = null,
    Object? invidiousInstanceStatus = null,
    Object? ytService = null,
    Object? initialized = null,
    Object? settingsStatus = null,
    Object? isPipDisabled = null,
    Object? connectingToInstance = freezed,
    Object? isTestingConnection = null,
    Object? userInstanceFailed = null,
    Object? failedInstanceName = freezed,
    Object? searchFilter = null,
    Object? videoFitMode = null,
    Object? skipInterval = null,
    Object? isSponsorBlockEnabled = null,
    Object? sponsorBlockCategories = null,
    Object? openLinksInBrowser = null,
    Object? homeFeedMode = null,
    Object? isAudioFocusEnabled = null,
    Object? currentProfile = null,
    Object? profiles = null,
    Object? subtitleSize = null,
    Object? lastExportedFilePath = freezed,
    Object? isSearchHistoryEnabled = null,
    Object? isSearchHistoryVisible = null,
    Object? isAutoPipEnabled = null,
    Object? sleepTimerConfig = freezed,
    Object? isSwipeGesturesEnabled = freezed,
    Object? isDeArrowEnabled = freezed,
    Object? isBookmarksEnabled = freezed,
    Object? bookmarkedPlaylists = freezed,
    Object? isRestrictedModeEnabled = freezed,
    Object? isMiniPlayerEnabled = freezed,
    Object? downloadQuality = freezed,
    Object? isDownloadSubtitlesEnabled = freezed,
    Object? isDownloadOverWifiOnlyEnabled = freezed,
    Object? isDownloadAutoDeleteEnabled = freezed,
    Object? playbackSpeed = freezed,
    Object? isAutoplayNextVideoEnabled = freezed,
    Object? isShowRelatedInQueueEnabled = freezed,
    Object? queueDismissTime = freezed,
    Object? autoplayCountdown = freezed,
    Object? isDisableAutoplayOnCellularEnabled = freezed,
    Object? isAutoQueueEnabled = freezed,
    Object? isBufferPreloadEnabled = freezed,
    Object? isAutoQualityAdjustEnabled = freezed,
    Object? isBackgroundPlaybackEnabled = freezed,
    Object? isNotificationControlsEnabled = freezed,
    Object? isDataSaverEnabled = freezed,
    Object? isHideWatchedVideosEnabled = freezed,
    Object? mobileDataQuality = freezed,
    Object? isDownloadQueueItemsEnabled = freezed,
    Object? isRichCaptionRenderingEnabled = freezed,
    Object? isBilibiliEnabled = freezed,
    Object? isSwipeLeftToRight = freezed,
    Object? isMiniPlayerAutoExpandEnabled = freezed,
    Object? isMiniPlayerTapToExpandEnabled = freezed,
    Object? isMiniPlayerDoubleTapToExpandEnabled = freezed,
    Object? restrictedModeFilterLevel = freezed,
    Object? downloadAutoDeleteDays = freezed,
    Object? contentFilterKeywords = freezed,
    Object? contentFilterBlockedChannels = freezed,
    Object? contentFilterHideShorts = freezed,
    Object? contentFilterHidePaid = freezed,
    Object? downloadFolderPath = freezed,
    Object? isRydEnabled = freezed,
    Object? isLongPressSpeedUpEnabled = freezed,
    Object? isOriginalTitlesEnabled = freezed,
    Object? isCommentFilterEnabled = freezed,
    Object? commentFilterKeywords = freezed,
    Object? preferredAudioQuality = freezed,
    Object? isScreenLockEnabled = freezed,
    Object? isPinchToZoomEnabled = freezed,
    Object? isAudioOnlyEnabled = freezed,
    Object? isSeekbarThumbnailsEnabled = freezed,
    Object? isPopupPlayerEnabled = freezed,
    Object? isLiveChatDanmakuEnabled = freezed,
    Object? isBluetoothSeekEnabled = freezed,
    Object? isMultiSelectListsEnabled = freezed,
    Object? isSbExclusiveMarkerEnabled = freezed,
    Object? isSbForDownloadsEnabled = freezed,
    Object? youtubeCookie = freezed,
    Object? pipedAuthToken = freezed,
    Object? pipedAuthUsername = freezed,
  }) {
    return _then(_self.copyWith(
      defaultLanguage: null == defaultLanguage
          ? _self.defaultLanguage
          : defaultLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      defaultQuality: null == defaultQuality
          ? _self.defaultQuality
          : defaultQuality // ignore: cast_nullable_to_non_nullable
              as String,
      defaultRegion: null == defaultRegion
          ? _self.defaultRegion
          : defaultRegion // ignore: cast_nullable_to_non_nullable
              as String,
      themeMode: null == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as String,
      version: freezed == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      isHistoryVisible: null == isHistoryVisible
          ? _self.isHistoryVisible
          : isHistoryVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isDislikeVisible: null == isDislikeVisible
          ? _self.isDislikeVisible
          : isDislikeVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isHlsPlayer: null == isHlsPlayer
          ? _self.isHlsPlayer
          : isHlsPlayer // ignore: cast_nullable_to_non_nullable
              as bool,
      isHideComments: null == isHideComments
          ? _self.isHideComments
          : isHideComments // ignore: cast_nullable_to_non_nullable
              as bool,
      isHideRelated: null == isHideRelated
          ? _self.isHideRelated
          : isHideRelated // ignore: cast_nullable_to_non_nullable
              as bool,
      pipedInstances: null == pipedInstances
          ? _self.pipedInstances
          : pipedInstances // ignore: cast_nullable_to_non_nullable
              as List<Instance>,
      pipedInstanceStatus: null == pipedInstanceStatus
          ? _self.pipedInstanceStatus
          : pipedInstanceStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      instance: null == instance
          ? _self.instance
          : instance // ignore: cast_nullable_to_non_nullable
              as String,
      invidiousInstances: null == invidiousInstances
          ? _self.invidiousInstances
          : invidiousInstances // ignore: cast_nullable_to_non_nullable
              as List<Instance>,
      invidiousInstanceStatus: null == invidiousInstanceStatus
          ? _self.invidiousInstanceStatus
          : invidiousInstanceStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      ytService: null == ytService
          ? _self.ytService
          : ytService // ignore: cast_nullable_to_non_nullable
              as String,
      initialized: null == initialized
          ? _self.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      settingsStatus: null == settingsStatus
          ? _self.settingsStatus
          : settingsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isPipDisabled: null == isPipDisabled
          ? _self.isPipDisabled
          : isPipDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      connectingToInstance: freezed == connectingToInstance
          ? _self.connectingToInstance
          : connectingToInstance // ignore: cast_nullable_to_non_nullable
              as String?,
      isTestingConnection: null == isTestingConnection
          ? _self.isTestingConnection
          : isTestingConnection // ignore: cast_nullable_to_non_nullable
              as bool,
      userInstanceFailed: null == userInstanceFailed
          ? _self.userInstanceFailed
          : userInstanceFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      failedInstanceName: freezed == failedInstanceName
          ? _self.failedInstanceName
          : failedInstanceName // ignore: cast_nullable_to_non_nullable
              as String?,
      searchFilter: null == searchFilter
          ? _self.searchFilter
          : searchFilter // ignore: cast_nullable_to_non_nullable
              as String,
      videoFitMode: null == videoFitMode
          ? _self.videoFitMode
          : videoFitMode // ignore: cast_nullable_to_non_nullable
              as String,
      skipInterval: null == skipInterval
          ? _self.skipInterval
          : skipInterval // ignore: cast_nullable_to_non_nullable
              as int,
      isSponsorBlockEnabled: null == isSponsorBlockEnabled
          ? _self.isSponsorBlockEnabled
          : isSponsorBlockEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      sponsorBlockCategories: null == sponsorBlockCategories
          ? _self.sponsorBlockCategories
          : sponsorBlockCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      openLinksInBrowser: null == openLinksInBrowser
          ? _self.openLinksInBrowser
          : openLinksInBrowser // ignore: cast_nullable_to_non_nullable
              as bool,
      homeFeedMode: null == homeFeedMode
          ? _self.homeFeedMode
          : homeFeedMode // ignore: cast_nullable_to_non_nullable
              as String,
      isAudioFocusEnabled: null == isAudioFocusEnabled
          ? _self.isAudioFocusEnabled
          : isAudioFocusEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      currentProfile: null == currentProfile
          ? _self.currentProfile
          : currentProfile // ignore: cast_nullable_to_non_nullable
              as String,
      profiles: null == profiles
          ? _self.profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subtitleSize: null == subtitleSize
          ? _self.subtitleSize
          : subtitleSize // ignore: cast_nullable_to_non_nullable
              as double,
      lastExportedFilePath: freezed == lastExportedFilePath
          ? _self.lastExportedFilePath
          : lastExportedFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isSearchHistoryEnabled: null == isSearchHistoryEnabled
          ? _self.isSearchHistoryEnabled
          : isSearchHistoryEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchHistoryVisible: null == isSearchHistoryVisible
          ? _self.isSearchHistoryVisible
          : isSearchHistoryVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isAutoPipEnabled: null == isAutoPipEnabled
          ? _self.isAutoPipEnabled
          : isAutoPipEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      sleepTimerConfig: freezed == sleepTimerConfig
          ? _self.sleepTimerConfig
          : sleepTimerConfig // ignore: cast_nullable_to_non_nullable
              as SleepTimerConfig?,
      isSwipeGesturesEnabled: freezed == isSwipeGesturesEnabled
          ? _self.isSwipeGesturesEnabled
          : isSwipeGesturesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeArrowEnabled: freezed == isDeArrowEnabled
          ? _self.isDeArrowEnabled
          : isDeArrowEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBookmarksEnabled: freezed == isBookmarksEnabled
          ? _self.isBookmarksEnabled
          : isBookmarksEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      bookmarkedPlaylists: freezed == bookmarkedPlaylists
          ? _self.bookmarkedPlaylists
          : bookmarkedPlaylists // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isRestrictedModeEnabled: freezed == isRestrictedModeEnabled
          ? _self.isRestrictedModeEnabled
          : isRestrictedModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMiniPlayerEnabled: freezed == isMiniPlayerEnabled
          ? _self.isMiniPlayerEnabled
          : isMiniPlayerEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      downloadQuality: freezed == downloadQuality
          ? _self.downloadQuality
          : downloadQuality // ignore: cast_nullable_to_non_nullable
              as String?,
      isDownloadSubtitlesEnabled: freezed == isDownloadSubtitlesEnabled
          ? _self.isDownloadSubtitlesEnabled
          : isDownloadSubtitlesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDownloadOverWifiOnlyEnabled: freezed == isDownloadOverWifiOnlyEnabled
          ? _self.isDownloadOverWifiOnlyEnabled
          : isDownloadOverWifiOnlyEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDownloadAutoDeleteEnabled: freezed == isDownloadAutoDeleteEnabled
          ? _self.isDownloadAutoDeleteEnabled
          : isDownloadAutoDeleteEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      playbackSpeed: freezed == playbackSpeed
          ? _self.playbackSpeed
          : playbackSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      isAutoplayNextVideoEnabled: freezed == isAutoplayNextVideoEnabled
          ? _self.isAutoplayNextVideoEnabled
          : isAutoplayNextVideoEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isShowRelatedInQueueEnabled: freezed == isShowRelatedInQueueEnabled
          ? _self.isShowRelatedInQueueEnabled
          : isShowRelatedInQueueEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      queueDismissTime: freezed == queueDismissTime
          ? _self.queueDismissTime
          : queueDismissTime // ignore: cast_nullable_to_non_nullable
              as int?,
      autoplayCountdown: freezed == autoplayCountdown
          ? _self.autoplayCountdown
          : autoplayCountdown // ignore: cast_nullable_to_non_nullable
              as int?,
      isDisableAutoplayOnCellularEnabled: freezed ==
              isDisableAutoplayOnCellularEnabled
          ? _self.isDisableAutoplayOnCellularEnabled
          : isDisableAutoplayOnCellularEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAutoQueueEnabled: freezed == isAutoQueueEnabled
          ? _self.isAutoQueueEnabled
          : isAutoQueueEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBufferPreloadEnabled: freezed == isBufferPreloadEnabled
          ? _self.isBufferPreloadEnabled
          : isBufferPreloadEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAutoQualityAdjustEnabled: freezed == isAutoQualityAdjustEnabled
          ? _self.isAutoQualityAdjustEnabled
          : isAutoQualityAdjustEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBackgroundPlaybackEnabled: freezed == isBackgroundPlaybackEnabled
          ? _self.isBackgroundPlaybackEnabled
          : isBackgroundPlaybackEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNotificationControlsEnabled: freezed == isNotificationControlsEnabled
          ? _self.isNotificationControlsEnabled
          : isNotificationControlsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDataSaverEnabled: freezed == isDataSaverEnabled
          ? _self.isDataSaverEnabled
          : isDataSaverEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isHideWatchedVideosEnabled: freezed == isHideWatchedVideosEnabled
          ? _self.isHideWatchedVideosEnabled
          : isHideWatchedVideosEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobileDataQuality: freezed == mobileDataQuality
          ? _self.mobileDataQuality
          : mobileDataQuality // ignore: cast_nullable_to_non_nullable
              as int?,
      isDownloadQueueItemsEnabled: freezed == isDownloadQueueItemsEnabled
          ? _self.isDownloadQueueItemsEnabled
          : isDownloadQueueItemsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRichCaptionRenderingEnabled: freezed == isRichCaptionRenderingEnabled
          ? _self.isRichCaptionRenderingEnabled
          : isRichCaptionRenderingEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBilibiliEnabled: freezed == isBilibiliEnabled
          ? _self.isBilibiliEnabled
          : isBilibiliEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSwipeLeftToRight: freezed == isSwipeLeftToRight
          ? _self.isSwipeLeftToRight
          : isSwipeLeftToRight // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMiniPlayerAutoExpandEnabled: freezed == isMiniPlayerAutoExpandEnabled
          ? _self.isMiniPlayerAutoExpandEnabled
          : isMiniPlayerAutoExpandEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMiniPlayerTapToExpandEnabled: freezed == isMiniPlayerTapToExpandEnabled
          ? _self.isMiniPlayerTapToExpandEnabled
          : isMiniPlayerTapToExpandEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMiniPlayerDoubleTapToExpandEnabled: freezed ==
              isMiniPlayerDoubleTapToExpandEnabled
          ? _self.isMiniPlayerDoubleTapToExpandEnabled
          : isMiniPlayerDoubleTapToExpandEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      restrictedModeFilterLevel: freezed == restrictedModeFilterLevel
          ? _self.restrictedModeFilterLevel
          : restrictedModeFilterLevel // ignore: cast_nullable_to_non_nullable
              as RestrictedModeFilterLevel?,
      downloadAutoDeleteDays: freezed == downloadAutoDeleteDays
          ? _self.downloadAutoDeleteDays
          : downloadAutoDeleteDays // ignore: cast_nullable_to_non_nullable
              as int?,
      contentFilterKeywords: freezed == contentFilterKeywords
          ? _self.contentFilterKeywords
          : contentFilterKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      contentFilterBlockedChannels: freezed == contentFilterBlockedChannels
          ? _self.contentFilterBlockedChannels
          : contentFilterBlockedChannels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      contentFilterHideShorts: freezed == contentFilterHideShorts
          ? _self.contentFilterHideShorts
          : contentFilterHideShorts // ignore: cast_nullable_to_non_nullable
              as bool?,
      contentFilterHidePaid: freezed == contentFilterHidePaid
          ? _self.contentFilterHidePaid
          : contentFilterHidePaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      downloadFolderPath: freezed == downloadFolderPath
          ? _self.downloadFolderPath
          : downloadFolderPath // ignore: cast_nullable_to_non_nullable
              as String?,
      isRydEnabled: freezed == isRydEnabled
          ? _self.isRydEnabled
          : isRydEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLongPressSpeedUpEnabled: freezed == isLongPressSpeedUpEnabled
          ? _self.isLongPressSpeedUpEnabled
          : isLongPressSpeedUpEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOriginalTitlesEnabled: freezed == isOriginalTitlesEnabled
          ? _self.isOriginalTitlesEnabled
          : isOriginalTitlesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCommentFilterEnabled: freezed == isCommentFilterEnabled
          ? _self.isCommentFilterEnabled
          : isCommentFilterEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      commentFilterKeywords: freezed == commentFilterKeywords
          ? _self.commentFilterKeywords
          : commentFilterKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      preferredAudioQuality: freezed == preferredAudioQuality
          ? _self.preferredAudioQuality
          : preferredAudioQuality // ignore: cast_nullable_to_non_nullable
              as String?,
      isScreenLockEnabled: freezed == isScreenLockEnabled
          ? _self.isScreenLockEnabled
          : isScreenLockEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPinchToZoomEnabled: freezed == isPinchToZoomEnabled
          ? _self.isPinchToZoomEnabled
          : isPinchToZoomEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAudioOnlyEnabled: freezed == isAudioOnlyEnabled
          ? _self.isAudioOnlyEnabled
          : isAudioOnlyEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSeekbarThumbnailsEnabled: freezed == isSeekbarThumbnailsEnabled
          ? _self.isSeekbarThumbnailsEnabled
          : isSeekbarThumbnailsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPopupPlayerEnabled: freezed == isPopupPlayerEnabled
          ? _self.isPopupPlayerEnabled
          : isPopupPlayerEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLiveChatDanmakuEnabled: freezed == isLiveChatDanmakuEnabled
          ? _self.isLiveChatDanmakuEnabled
          : isLiveChatDanmakuEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBluetoothSeekEnabled: freezed == isBluetoothSeekEnabled
          ? _self.isBluetoothSeekEnabled
          : isBluetoothSeekEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMultiSelectListsEnabled: freezed == isMultiSelectListsEnabled
          ? _self.isMultiSelectListsEnabled
          : isMultiSelectListsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSbExclusiveMarkerEnabled: freezed == isSbExclusiveMarkerEnabled
          ? _self.isSbExclusiveMarkerEnabled
          : isSbExclusiveMarkerEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSbForDownloadsEnabled: freezed == isSbForDownloadsEnabled
          ? _self.isSbForDownloadsEnabled
          : isSbForDownloadsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      youtubeCookie: freezed == youtubeCookie
          ? _self.youtubeCookie
          : youtubeCookie // ignore: cast_nullable_to_non_nullable
              as String?,
      pipedAuthToken: freezed == pipedAuthToken
          ? _self.pipedAuthToken
          : pipedAuthToken // ignore: cast_nullable_to_non_nullable
              as String?,
      pipedAuthUsername: freezed == pipedAuthUsername
          ? _self.pipedAuthUsername
          : pipedAuthUsername // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Initial value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Initial value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Initial value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String defaultLanguage,
            String defaultQuality,
            String defaultRegion,
            String themeMode,
            String? version,
            bool isHistoryVisible,
            bool isDislikeVisible,
            bool isHlsPlayer,
            bool isHideComments,
            bool isHideRelated,
            List<Instance> pipedInstances,
            ApiStatus pipedInstanceStatus,
            String instance,
            List<Instance> invidiousInstances,
            ApiStatus invidiousInstanceStatus,
            String ytService,
            bool initialized,
            ApiStatus settingsStatus,
            bool isPipDisabled,
            String? connectingToInstance,
            bool isTestingConnection,
            bool userInstanceFailed,
            String? failedInstanceName,
            String searchFilter,
            String videoFitMode,
            int skipInterval,
            bool isSponsorBlockEnabled,
            List<String> sponsorBlockCategories,
            bool openLinksInBrowser,
            String homeFeedMode,
            bool isAudioFocusEnabled,
            String currentProfile,
            List<String> profiles,
            double subtitleSize,
            String? lastExportedFilePath,
            bool isSearchHistoryEnabled,
            bool isSearchHistoryVisible,
            bool isAutoPipEnabled,
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
            bool? isLongPressSpeedUpEnabled,
            bool? isOriginalTitlesEnabled,
            bool? isCommentFilterEnabled,
            List<String>? commentFilterKeywords,
            String? preferredAudioQuality,
            bool? isScreenLockEnabled,
            bool? isPinchToZoomEnabled,
            bool? isAudioOnlyEnabled,
            bool? isSeekbarThumbnailsEnabled,
            bool? isPopupPlayerEnabled,
            bool? isLiveChatDanmakuEnabled,
            bool? isBluetoothSeekEnabled,
            bool? isMultiSelectListsEnabled,
            bool? isSbExclusiveMarkerEnabled,
            bool? isSbForDownloadsEnabled,
            String? youtubeCookie,
            String? pipedAuthToken,
            String? pipedAuthUsername)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(
            _that.defaultLanguage,
            _that.defaultQuality,
            _that.defaultRegion,
            _that.themeMode,
            _that.version,
            _that.isHistoryVisible,
            _that.isDislikeVisible,
            _that.isHlsPlayer,
            _that.isHideComments,
            _that.isHideRelated,
            _that.pipedInstances,
            _that.pipedInstanceStatus,
            _that.instance,
            _that.invidiousInstances,
            _that.invidiousInstanceStatus,
            _that.ytService,
            _that.initialized,
            _that.settingsStatus,
            _that.isPipDisabled,
            _that.connectingToInstance,
            _that.isTestingConnection,
            _that.userInstanceFailed,
            _that.failedInstanceName,
            _that.searchFilter,
            _that.videoFitMode,
            _that.skipInterval,
            _that.isSponsorBlockEnabled,
            _that.sponsorBlockCategories,
            _that.openLinksInBrowser,
            _that.homeFeedMode,
            _that.isAudioFocusEnabled,
            _that.currentProfile,
            _that.profiles,
            _that.subtitleSize,
            _that.lastExportedFilePath,
            _that.isSearchHistoryEnabled,
            _that.isSearchHistoryVisible,
            _that.isAutoPipEnabled,
            _that.sleepTimerConfig,
            _that.isSwipeGesturesEnabled,
            _that.isDeArrowEnabled,
            _that.isBookmarksEnabled,
            _that.bookmarkedPlaylists,
            _that.isRestrictedModeEnabled,
            _that.isMiniPlayerEnabled,
            _that.downloadQuality,
            _that.isDownloadSubtitlesEnabled,
            _that.isDownloadOverWifiOnlyEnabled,
            _that.isDownloadAutoDeleteEnabled,
            _that.playbackSpeed,
            _that.isAutoplayNextVideoEnabled,
            _that.isShowRelatedInQueueEnabled,
            _that.queueDismissTime,
            _that.autoplayCountdown,
            _that.isDisableAutoplayOnCellularEnabled,
            _that.isAutoQueueEnabled,
            _that.isBufferPreloadEnabled,
            _that.isAutoQualityAdjustEnabled,
            _that.isBackgroundPlaybackEnabled,
            _that.isNotificationControlsEnabled,
            _that.isDataSaverEnabled,
            _that.isHideWatchedVideosEnabled,
            _that.mobileDataQuality,
            _that.isDownloadQueueItemsEnabled,
            _that.isRichCaptionRenderingEnabled,
            _that.isBilibiliEnabled,
            _that.isSwipeLeftToRight,
            _that.isMiniPlayerAutoExpandEnabled,
            _that.isMiniPlayerTapToExpandEnabled,
            _that.isMiniPlayerDoubleTapToExpandEnabled,
            _that.restrictedModeFilterLevel,
            _that.downloadAutoDeleteDays,
            _that.contentFilterKeywords,
            _that.contentFilterBlockedChannels,
            _that.contentFilterHideShorts,
            _that.contentFilterHidePaid,
            _that.downloadFolderPath,
            _that.isRydEnabled,
            _that.isLongPressSpeedUpEnabled,
            _that.isOriginalTitlesEnabled,
            _that.isCommentFilterEnabled,
            _that.commentFilterKeywords,
            _that.preferredAudioQuality,
            _that.isScreenLockEnabled,
            _that.isPinchToZoomEnabled,
            _that.isAudioOnlyEnabled,
            _that.isSeekbarThumbnailsEnabled,
            _that.isPopupPlayerEnabled,
            _that.isLiveChatDanmakuEnabled,
            _that.isBluetoothSeekEnabled,
            _that.isMultiSelectListsEnabled,
            _that.isSbExclusiveMarkerEnabled,
            _that.isSbForDownloadsEnabled,
            _that.youtubeCookie,
            _that.pipedAuthToken,
            _that.pipedAuthUsername);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String defaultLanguage,
            String defaultQuality,
            String defaultRegion,
            String themeMode,
            String? version,
            bool isHistoryVisible,
            bool isDislikeVisible,
            bool isHlsPlayer,
            bool isHideComments,
            bool isHideRelated,
            List<Instance> pipedInstances,
            ApiStatus pipedInstanceStatus,
            String instance,
            List<Instance> invidiousInstances,
            ApiStatus invidiousInstanceStatus,
            String ytService,
            bool initialized,
            ApiStatus settingsStatus,
            bool isPipDisabled,
            String? connectingToInstance,
            bool isTestingConnection,
            bool userInstanceFailed,
            String? failedInstanceName,
            String searchFilter,
            String videoFitMode,
            int skipInterval,
            bool isSponsorBlockEnabled,
            List<String> sponsorBlockCategories,
            bool openLinksInBrowser,
            String homeFeedMode,
            bool isAudioFocusEnabled,
            String currentProfile,
            List<String> profiles,
            double subtitleSize,
            String? lastExportedFilePath,
            bool isSearchHistoryEnabled,
            bool isSearchHistoryVisible,
            bool isAutoPipEnabled,
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
            bool? isLongPressSpeedUpEnabled,
            bool? isOriginalTitlesEnabled,
            bool? isCommentFilterEnabled,
            List<String>? commentFilterKeywords,
            String? preferredAudioQuality,
            bool? isScreenLockEnabled,
            bool? isPinchToZoomEnabled,
            bool? isAudioOnlyEnabled,
            bool? isSeekbarThumbnailsEnabled,
            bool? isPopupPlayerEnabled,
            bool? isLiveChatDanmakuEnabled,
            bool? isBluetoothSeekEnabled,
            bool? isMultiSelectListsEnabled,
            bool? isSbExclusiveMarkerEnabled,
            bool? isSbForDownloadsEnabled,
            String? youtubeCookie,
            String? pipedAuthToken,
            String? pipedAuthUsername)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return $default(
            _that.defaultLanguage,
            _that.defaultQuality,
            _that.defaultRegion,
            _that.themeMode,
            _that.version,
            _that.isHistoryVisible,
            _that.isDislikeVisible,
            _that.isHlsPlayer,
            _that.isHideComments,
            _that.isHideRelated,
            _that.pipedInstances,
            _that.pipedInstanceStatus,
            _that.instance,
            _that.invidiousInstances,
            _that.invidiousInstanceStatus,
            _that.ytService,
            _that.initialized,
            _that.settingsStatus,
            _that.isPipDisabled,
            _that.connectingToInstance,
            _that.isTestingConnection,
            _that.userInstanceFailed,
            _that.failedInstanceName,
            _that.searchFilter,
            _that.videoFitMode,
            _that.skipInterval,
            _that.isSponsorBlockEnabled,
            _that.sponsorBlockCategories,
            _that.openLinksInBrowser,
            _that.homeFeedMode,
            _that.isAudioFocusEnabled,
            _that.currentProfile,
            _that.profiles,
            _that.subtitleSize,
            _that.lastExportedFilePath,
            _that.isSearchHistoryEnabled,
            _that.isSearchHistoryVisible,
            _that.isAutoPipEnabled,
            _that.sleepTimerConfig,
            _that.isSwipeGesturesEnabled,
            _that.isDeArrowEnabled,
            _that.isBookmarksEnabled,
            _that.bookmarkedPlaylists,
            _that.isRestrictedModeEnabled,
            _that.isMiniPlayerEnabled,
            _that.downloadQuality,
            _that.isDownloadSubtitlesEnabled,
            _that.isDownloadOverWifiOnlyEnabled,
            _that.isDownloadAutoDeleteEnabled,
            _that.playbackSpeed,
            _that.isAutoplayNextVideoEnabled,
            _that.isShowRelatedInQueueEnabled,
            _that.queueDismissTime,
            _that.autoplayCountdown,
            _that.isDisableAutoplayOnCellularEnabled,
            _that.isAutoQueueEnabled,
            _that.isBufferPreloadEnabled,
            _that.isAutoQualityAdjustEnabled,
            _that.isBackgroundPlaybackEnabled,
            _that.isNotificationControlsEnabled,
            _that.isDataSaverEnabled,
            _that.isHideWatchedVideosEnabled,
            _that.mobileDataQuality,
            _that.isDownloadQueueItemsEnabled,
            _that.isRichCaptionRenderingEnabled,
            _that.isBilibiliEnabled,
            _that.isSwipeLeftToRight,
            _that.isMiniPlayerAutoExpandEnabled,
            _that.isMiniPlayerTapToExpandEnabled,
            _that.isMiniPlayerDoubleTapToExpandEnabled,
            _that.restrictedModeFilterLevel,
            _that.downloadAutoDeleteDays,
            _that.contentFilterKeywords,
            _that.contentFilterBlockedChannels,
            _that.contentFilterHideShorts,
            _that.contentFilterHidePaid,
            _that.downloadFolderPath,
            _that.isRydEnabled,
            _that.isLongPressSpeedUpEnabled,
            _that.isOriginalTitlesEnabled,
            _that.isCommentFilterEnabled,
            _that.commentFilterKeywords,
            _that.preferredAudioQuality,
            _that.isScreenLockEnabled,
            _that.isPinchToZoomEnabled,
            _that.isAudioOnlyEnabled,
            _that.isSeekbarThumbnailsEnabled,
            _that.isPopupPlayerEnabled,
            _that.isLiveChatDanmakuEnabled,
            _that.isBluetoothSeekEnabled,
            _that.isMultiSelectListsEnabled,
            _that.isSbExclusiveMarkerEnabled,
            _that.isSbForDownloadsEnabled,
            _that.youtubeCookie,
            _that.pipedAuthToken,
            _that.pipedAuthUsername);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String defaultLanguage,
            String defaultQuality,
            String defaultRegion,
            String themeMode,
            String? version,
            bool isHistoryVisible,
            bool isDislikeVisible,
            bool isHlsPlayer,
            bool isHideComments,
            bool isHideRelated,
            List<Instance> pipedInstances,
            ApiStatus pipedInstanceStatus,
            String instance,
            List<Instance> invidiousInstances,
            ApiStatus invidiousInstanceStatus,
            String ytService,
            bool initialized,
            ApiStatus settingsStatus,
            bool isPipDisabled,
            String? connectingToInstance,
            bool isTestingConnection,
            bool userInstanceFailed,
            String? failedInstanceName,
            String searchFilter,
            String videoFitMode,
            int skipInterval,
            bool isSponsorBlockEnabled,
            List<String> sponsorBlockCategories,
            bool openLinksInBrowser,
            String homeFeedMode,
            bool isAudioFocusEnabled,
            String currentProfile,
            List<String> profiles,
            double subtitleSize,
            String? lastExportedFilePath,
            bool isSearchHistoryEnabled,
            bool isSearchHistoryVisible,
            bool isAutoPipEnabled,
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
            bool? isLongPressSpeedUpEnabled,
            bool? isOriginalTitlesEnabled,
            bool? isCommentFilterEnabled,
            List<String>? commentFilterKeywords,
            String? preferredAudioQuality,
            bool? isScreenLockEnabled,
            bool? isPinchToZoomEnabled,
            bool? isAudioOnlyEnabled,
            bool? isSeekbarThumbnailsEnabled,
            bool? isPopupPlayerEnabled,
            bool? isLiveChatDanmakuEnabled,
            bool? isBluetoothSeekEnabled,
            bool? isMultiSelectListsEnabled,
            bool? isSbExclusiveMarkerEnabled,
            bool? isSbForDownloadsEnabled,
            String? youtubeCookie,
            String? pipedAuthToken,
            String? pipedAuthUsername)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(
            _that.defaultLanguage,
            _that.defaultQuality,
            _that.defaultRegion,
            _that.themeMode,
            _that.version,
            _that.isHistoryVisible,
            _that.isDislikeVisible,
            _that.isHlsPlayer,
            _that.isHideComments,
            _that.isHideRelated,
            _that.pipedInstances,
            _that.pipedInstanceStatus,
            _that.instance,
            _that.invidiousInstances,
            _that.invidiousInstanceStatus,
            _that.ytService,
            _that.initialized,
            _that.settingsStatus,
            _that.isPipDisabled,
            _that.connectingToInstance,
            _that.isTestingConnection,
            _that.userInstanceFailed,
            _that.failedInstanceName,
            _that.searchFilter,
            _that.videoFitMode,
            _that.skipInterval,
            _that.isSponsorBlockEnabled,
            _that.sponsorBlockCategories,
            _that.openLinksInBrowser,
            _that.homeFeedMode,
            _that.isAudioFocusEnabled,
            _that.currentProfile,
            _that.profiles,
            _that.subtitleSize,
            _that.lastExportedFilePath,
            _that.isSearchHistoryEnabled,
            _that.isSearchHistoryVisible,
            _that.isAutoPipEnabled,
            _that.sleepTimerConfig,
            _that.isSwipeGesturesEnabled,
            _that.isDeArrowEnabled,
            _that.isBookmarksEnabled,
            _that.bookmarkedPlaylists,
            _that.isRestrictedModeEnabled,
            _that.isMiniPlayerEnabled,
            _that.downloadQuality,
            _that.isDownloadSubtitlesEnabled,
            _that.isDownloadOverWifiOnlyEnabled,
            _that.isDownloadAutoDeleteEnabled,
            _that.playbackSpeed,
            _that.isAutoplayNextVideoEnabled,
            _that.isShowRelatedInQueueEnabled,
            _that.queueDismissTime,
            _that.autoplayCountdown,
            _that.isDisableAutoplayOnCellularEnabled,
            _that.isAutoQueueEnabled,
            _that.isBufferPreloadEnabled,
            _that.isAutoQualityAdjustEnabled,
            _that.isBackgroundPlaybackEnabled,
            _that.isNotificationControlsEnabled,
            _that.isDataSaverEnabled,
            _that.isHideWatchedVideosEnabled,
            _that.mobileDataQuality,
            _that.isDownloadQueueItemsEnabled,
            _that.isRichCaptionRenderingEnabled,
            _that.isBilibiliEnabled,
            _that.isSwipeLeftToRight,
            _that.isMiniPlayerAutoExpandEnabled,
            _that.isMiniPlayerTapToExpandEnabled,
            _that.isMiniPlayerDoubleTapToExpandEnabled,
            _that.restrictedModeFilterLevel,
            _that.downloadAutoDeleteDays,
            _that.contentFilterKeywords,
            _that.contentFilterBlockedChannels,
            _that.contentFilterHideShorts,
            _that.contentFilterHidePaid,
            _that.downloadFolderPath,
            _that.isRydEnabled,
            _that.isLongPressSpeedUpEnabled,
            _that.isOriginalTitlesEnabled,
            _that.isCommentFilterEnabled,
            _that.commentFilterKeywords,
            _that.preferredAudioQuality,
            _that.isScreenLockEnabled,
            _that.isPinchToZoomEnabled,
            _that.isAudioOnlyEnabled,
            _that.isSeekbarThumbnailsEnabled,
            _that.isPopupPlayerEnabled,
            _that.isLiveChatDanmakuEnabled,
            _that.isBluetoothSeekEnabled,
            _that.isMultiSelectListsEnabled,
            _that.isSbExclusiveMarkerEnabled,
            _that.isSbForDownloadsEnabled,
            _that.youtubeCookie,
            _that.pipedAuthToken,
            _that.pipedAuthUsername);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial extends SettingsState {
  const _Initial(
      {required this.defaultLanguage,
      required this.defaultQuality,
      required this.defaultRegion,
      required this.themeMode,
      required this.version,
      required this.isHistoryVisible,
      required this.isDislikeVisible,
      required this.isHlsPlayer,
      required this.isHideComments,
      required this.isHideRelated,
      required final List<Instance> pipedInstances,
      required this.pipedInstanceStatus,
      required this.instance,
      required final List<Instance> invidiousInstances,
      required this.invidiousInstanceStatus,
      required this.ytService,
      required this.initialized,
      required this.settingsStatus,
      required this.isPipDisabled,
      required this.connectingToInstance,
      required this.isTestingConnection,
      required this.userInstanceFailed,
      required this.failedInstanceName,
      required this.searchFilter,
      required this.videoFitMode,
      required this.skipInterval,
      required this.isSponsorBlockEnabled,
      required final List<String> sponsorBlockCategories,
      required this.openLinksInBrowser,
      required this.homeFeedMode,
      required this.isAudioFocusEnabled,
      required this.currentProfile,
      required final List<String> profiles,
      required this.subtitleSize,
      required this.lastExportedFilePath,
      required this.isSearchHistoryEnabled,
      required this.isSearchHistoryVisible,
      required this.isAutoPipEnabled,
      this.sleepTimerConfig,
      this.isSwipeGesturesEnabled,
      this.isDeArrowEnabled,
      this.isBookmarksEnabled,
      final List<String>? bookmarkedPlaylists,
      this.isRestrictedModeEnabled,
      this.isMiniPlayerEnabled,
      this.downloadQuality,
      this.isDownloadSubtitlesEnabled,
      this.isDownloadOverWifiOnlyEnabled,
      this.isDownloadAutoDeleteEnabled,
      this.playbackSpeed,
      this.isAutoplayNextVideoEnabled,
      this.isShowRelatedInQueueEnabled,
      this.queueDismissTime,
      this.autoplayCountdown,
      this.isDisableAutoplayOnCellularEnabled,
      this.isAutoQueueEnabled,
      this.isBufferPreloadEnabled,
      this.isAutoQualityAdjustEnabled,
      this.isBackgroundPlaybackEnabled,
      this.isNotificationControlsEnabled,
      this.isDataSaverEnabled,
      this.isHideWatchedVideosEnabled,
      this.mobileDataQuality,
      this.isDownloadQueueItemsEnabled,
      this.isRichCaptionRenderingEnabled,
      this.isBilibiliEnabled,
      this.isSwipeLeftToRight,
      this.isMiniPlayerAutoExpandEnabled,
      this.isMiniPlayerTapToExpandEnabled,
      this.isMiniPlayerDoubleTapToExpandEnabled,
      this.restrictedModeFilterLevel,
      this.downloadAutoDeleteDays,
      final List<String>? contentFilterKeywords,
      final List<String>? contentFilterBlockedChannels,
      this.contentFilterHideShorts,
      this.contentFilterHidePaid,
      this.downloadFolderPath,
      this.isRydEnabled,
      this.isLongPressSpeedUpEnabled,
      this.isOriginalTitlesEnabled,
      this.isCommentFilterEnabled,
      final List<String>? commentFilterKeywords,
      this.preferredAudioQuality,
      this.isScreenLockEnabled,
      this.isPinchToZoomEnabled,
      this.isAudioOnlyEnabled,
      this.isSeekbarThumbnailsEnabled,
      this.isPopupPlayerEnabled,
      this.isLiveChatDanmakuEnabled,
      this.isBluetoothSeekEnabled,
      this.isMultiSelectListsEnabled,
      this.isSbExclusiveMarkerEnabled,
      this.isSbForDownloadsEnabled,
      this.youtubeCookie,
      this.pipedAuthToken,
      this.pipedAuthUsername})
      : _pipedInstances = pipedInstances,
        _invidiousInstances = invidiousInstances,
        _sponsorBlockCategories = sponsorBlockCategories,
        _profiles = profiles,
        _bookmarkedPlaylists = bookmarkedPlaylists,
        _contentFilterKeywords = contentFilterKeywords,
        _contentFilterBlockedChannels = contentFilterBlockedChannels,
        _commentFilterKeywords = commentFilterKeywords,
        super._();

  @override
  final String defaultLanguage;
  @override
  final String defaultQuality;
  @override
  final String defaultRegion;
  @override
  final String themeMode;
  @override
  final String? version;
  @override
  final bool isHistoryVisible;
  @override
  final bool isDislikeVisible;
  @override
  final bool isHlsPlayer;
  @override
  final bool isHideComments;
  @override
  final bool isHideRelated;
  final List<Instance> _pipedInstances;
  @override
  List<Instance> get pipedInstances {
    if (_pipedInstances is EqualUnmodifiableListView) return _pipedInstances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pipedInstances);
  }

  @override
  final ApiStatus pipedInstanceStatus;
  @override
  final String instance;
  final List<Instance> _invidiousInstances;
  @override
  List<Instance> get invidiousInstances {
    if (_invidiousInstances is EqualUnmodifiableListView)
      return _invidiousInstances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invidiousInstances);
  }

  @override
  final ApiStatus invidiousInstanceStatus;
  @override
  final String ytService;
  @override
  final bool initialized;
  @override
  final ApiStatus settingsStatus;
  @override
  final bool isPipDisabled;
// Connection status tracking for UI feedback
  @override
  final String? connectingToInstance;
  @override
  final bool isTestingConnection;
// Track if user's preferred instance failed (for showing snackbar)
  @override
  final bool userInstanceFailed;
  @override
  final String? failedInstanceName;
// Search filter
  @override
  final String searchFilter;
// Video fit mode (contain, cover, fill, fitWidth, fitHeight)
  @override
  final String videoFitMode;
// Skip interval in seconds (for double-tap skip)
  @override
  final int skipInterval;
// SponsorBlock settings
  @override
  final bool isSponsorBlockEnabled;
  final List<String> _sponsorBlockCategories;
  @override
  List<String> get sponsorBlockCategories {
    if (_sponsorBlockCategories is EqualUnmodifiableListView)
      return _sponsorBlockCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sponsorBlockCategories);
  }

// Open links in external browser
  @override
  final bool openLinksInBrowser;
// Home feed display mode
  @override
  final String homeFeedMode;
// Audio focus / pause on interruption
  @override
  final bool isAudioFocusEnabled;
// Profiles
  @override
  final String currentProfile;
  final List<String> _profiles;
  @override
  List<String> get profiles {
    if (_profiles is EqualUnmodifiableListView) return _profiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profiles);
  }

// Subtitle size (font size in pixels)
  @override
  final double subtitleSize;
// Last exported file path (for sharing)
  @override
  final String? lastExportedFilePath;
// Search history privacy
  @override
  final bool isSearchHistoryEnabled;
  @override
  final bool isSearchHistoryVisible;
// Auto PiP (enter PiP when pressing home button while video is playing)
  @override
  final bool isAutoPipEnabled;
  @override
  final SleepTimerConfig? sleepTimerConfig;
  @override
  final bool? isSwipeGesturesEnabled;
  @override
  final bool? isDeArrowEnabled;
  @override
  final bool? isBookmarksEnabled;
  final List<String>? _bookmarkedPlaylists;
  @override
  List<String>? get bookmarkedPlaylists {
    final value = _bookmarkedPlaylists;
    if (value == null) return null;
    if (_bookmarkedPlaylists is EqualUnmodifiableListView)
      return _bookmarkedPlaylists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isRestrictedModeEnabled;
  @override
  final bool? isMiniPlayerEnabled;
  @override
  final String? downloadQuality;
  @override
  final bool? isDownloadSubtitlesEnabled;
  @override
  final bool? isDownloadOverWifiOnlyEnabled;
  @override
  final bool? isDownloadAutoDeleteEnabled;
  @override
  final double? playbackSpeed;
  @override
  final bool? isAutoplayNextVideoEnabled;
  @override
  final bool? isShowRelatedInQueueEnabled;
  @override
  final int? queueDismissTime;
  @override
  final int? autoplayCountdown;
  @override
  final bool? isDisableAutoplayOnCellularEnabled;
  @override
  final bool? isAutoQueueEnabled;
  @override
  final bool? isBufferPreloadEnabled;
  @override
  final bool? isAutoQualityAdjustEnabled;
  @override
  final bool? isBackgroundPlaybackEnabled;
  @override
  final bool? isNotificationControlsEnabled;
  @override
  final bool? isDataSaverEnabled;
  @override
  final bool? isHideWatchedVideosEnabled;
  @override
  final int? mobileDataQuality;
  @override
  final bool? isDownloadQueueItemsEnabled;
  @override
  final bool? isRichCaptionRenderingEnabled;
  @override
  final bool? isBilibiliEnabled;
  @override
  final bool? isSwipeLeftToRight;
  @override
  final bool? isMiniPlayerAutoExpandEnabled;
  @override
  final bool? isMiniPlayerTapToExpandEnabled;
  @override
  final bool? isMiniPlayerDoubleTapToExpandEnabled;
  @override
  final RestrictedModeFilterLevel? restrictedModeFilterLevel;
  @override
  final int? downloadAutoDeleteDays;
  final List<String>? _contentFilterKeywords;
  @override
  List<String>? get contentFilterKeywords {
    final value = _contentFilterKeywords;
    if (value == null) return null;
    if (_contentFilterKeywords is EqualUnmodifiableListView)
      return _contentFilterKeywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _contentFilterBlockedChannels;
  @override
  List<String>? get contentFilterBlockedChannels {
    final value = _contentFilterBlockedChannels;
    if (value == null) return null;
    if (_contentFilterBlockedChannels is EqualUnmodifiableListView)
      return _contentFilterBlockedChannels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? contentFilterHideShorts;
  @override
  final bool? contentFilterHidePaid;
  @override
  final String? downloadFolderPath;
  @override
  final bool? isRydEnabled;
// Phase 18
  @override
  final bool? isLongPressSpeedUpEnabled;
  @override
  final bool? isOriginalTitlesEnabled;
  @override
  final bool? isCommentFilterEnabled;
  final List<String>? _commentFilterKeywords;
  @override
  List<String>? get commentFilterKeywords {
    final value = _commentFilterKeywords;
    if (value == null) return null;
    if (_commentFilterKeywords is EqualUnmodifiableListView)
      return _commentFilterKeywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? preferredAudioQuality;
  @override
  final bool? isScreenLockEnabled;
  @override
  final bool? isPinchToZoomEnabled;
  @override
  final bool? isAudioOnlyEnabled;
  @override
  final bool? isSeekbarThumbnailsEnabled;
  @override
  final bool? isPopupPlayerEnabled;
  @override
  final bool? isLiveChatDanmakuEnabled;
  @override
  final bool? isBluetoothSeekEnabled;
  @override
  final bool? isMultiSelectListsEnabled;
  @override
  final bool? isSbExclusiveMarkerEnabled;
  @override
  final bool? isSbForDownloadsEnabled;
  @override
  final String? youtubeCookie;
  @override
  final String? pipedAuthToken;
  @override
  final String? pipedAuthUsername;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            (identical(other.defaultLanguage, defaultLanguage) ||
                other.defaultLanguage == defaultLanguage) &&
            (identical(other.defaultQuality, defaultQuality) ||
                other.defaultQuality == defaultQuality) &&
            (identical(other.defaultRegion, defaultRegion) ||
                other.defaultRegion == defaultRegion) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.isHistoryVisible, isHistoryVisible) ||
                other.isHistoryVisible == isHistoryVisible) &&
            (identical(other.isDislikeVisible, isDislikeVisible) ||
                other.isDislikeVisible == isDislikeVisible) &&
            (identical(other.isHlsPlayer, isHlsPlayer) ||
                other.isHlsPlayer == isHlsPlayer) &&
            (identical(other.isHideComments, isHideComments) ||
                other.isHideComments == isHideComments) &&
            (identical(other.isHideRelated, isHideRelated) ||
                other.isHideRelated == isHideRelated) &&
            const DeepCollectionEquality()
                .equals(other._pipedInstances, _pipedInstances) &&
            (identical(other.pipedInstanceStatus, pipedInstanceStatus) ||
                other.pipedInstanceStatus == pipedInstanceStatus) &&
            (identical(other.instance, instance) ||
                other.instance == instance) &&
            const DeepCollectionEquality()
                .equals(other._invidiousInstances, _invidiousInstances) &&
            (identical(other.invidiousInstanceStatus, invidiousInstanceStatus) ||
                other.invidiousInstanceStatus == invidiousInstanceStatus) &&
            (identical(other.ytService, ytService) ||
                other.ytService == ytService) &&
            (identical(other.initialized, initialized) ||
                other.initialized == initialized) &&
            (identical(other.settingsStatus, settingsStatus) ||
                other.settingsStatus == settingsStatus) &&
            (identical(other.isPipDisabled, isPipDisabled) ||
                other.isPipDisabled == isPipDisabled) &&
            (identical(other.connectingToInstance, connectingToInstance) ||
                other.connectingToInstance == connectingToInstance) &&
            (identical(other.isTestingConnection, isTestingConnection) ||
                other.isTestingConnection == isTestingConnection) &&
            (identical(other.userInstanceFailed, userInstanceFailed) ||
                other.userInstanceFailed == userInstanceFailed) &&
            (identical(other.failedInstanceName, failedInstanceName) ||
                other.failedInstanceName == failedInstanceName) &&
            (identical(other.searchFilter, searchFilter) ||
                other.searchFilter == searchFilter) &&
            (identical(other.videoFitMode, videoFitMode) ||
                other.videoFitMode == videoFitMode) &&
            (identical(other.skipInterval, skipInterval) ||
                other.skipInterval == skipInterval) &&
            (identical(other.isSponsorBlockEnabled, isSponsorBlockEnabled) ||
                other.isSponsorBlockEnabled == isSponsorBlockEnabled) &&
            const DeepCollectionEquality().equals(
                other._sponsorBlockCategories, _sponsorBlockCategories) &&
            (identical(other.openLinksInBrowser, openLinksInBrowser) ||
                other.openLinksInBrowser == openLinksInBrowser) &&
            (identical(other.homeFeedMode, homeFeedMode) ||
                other.homeFeedMode == homeFeedMode) &&
            (identical(other.isAudioFocusEnabled, isAudioFocusEnabled) ||
                other.isAudioFocusEnabled == isAudioFocusEnabled) &&
            (identical(other.currentProfile, currentProfile) ||
                other.currentProfile == currentProfile) &&
            const DeepCollectionEquality().equals(other._profiles, _profiles) &&
            (identical(other.subtitleSize, subtitleSize) ||
                other.subtitleSize == subtitleSize) &&
            (identical(other.lastExportedFilePath, lastExportedFilePath) ||
                other.lastExportedFilePath == lastExportedFilePath) &&
            (identical(other.isSearchHistoryEnabled, isSearchHistoryEnabled) ||
                other.isSearchHistoryEnabled == isSearchHistoryEnabled) &&
            (identical(other.isSearchHistoryVisible, isSearchHistoryVisible) ||
                other.isSearchHistoryVisible == isSearchHistoryVisible) &&
            (identical(other.isAutoPipEnabled, isAutoPipEnabled) ||
                other.isAutoPipEnabled == isAutoPipEnabled) &&
            (identical(other.sleepTimerConfig, sleepTimerConfig) || other.sleepTimerConfig == sleepTimerConfig) &&
            (identical(other.isSwipeGesturesEnabled, isSwipeGesturesEnabled) || other.isSwipeGesturesEnabled == isSwipeGesturesEnabled) &&
            (identical(other.isDeArrowEnabled, isDeArrowEnabled) || other.isDeArrowEnabled == isDeArrowEnabled) &&
            (identical(other.isBookmarksEnabled, isBookmarksEnabled) || other.isBookmarksEnabled == isBookmarksEnabled) &&
            const DeepCollectionEquality().equals(other._bookmarkedPlaylists, _bookmarkedPlaylists) &&
            (identical(other.isRestrictedModeEnabled, isRestrictedModeEnabled) || other.isRestrictedModeEnabled == isRestrictedModeEnabled) &&
            (identical(other.isMiniPlayerEnabled, isMiniPlayerEnabled) || other.isMiniPlayerEnabled == isMiniPlayerEnabled) &&
            (identical(other.downloadQuality, downloadQuality) || other.downloadQuality == downloadQuality) &&
            (identical(other.isDownloadSubtitlesEnabled, isDownloadSubtitlesEnabled) || other.isDownloadSubtitlesEnabled == isDownloadSubtitlesEnabled) &&
            (identical(other.isDownloadOverWifiOnlyEnabled, isDownloadOverWifiOnlyEnabled) || other.isDownloadOverWifiOnlyEnabled == isDownloadOverWifiOnlyEnabled) &&
            (identical(other.isDownloadAutoDeleteEnabled, isDownloadAutoDeleteEnabled) || other.isDownloadAutoDeleteEnabled == isDownloadAutoDeleteEnabled) &&
            (identical(other.playbackSpeed, playbackSpeed) || other.playbackSpeed == playbackSpeed) &&
            (identical(other.isAutoplayNextVideoEnabled, isAutoplayNextVideoEnabled) || other.isAutoplayNextVideoEnabled == isAutoplayNextVideoEnabled) &&
            (identical(other.isShowRelatedInQueueEnabled, isShowRelatedInQueueEnabled) || other.isShowRelatedInQueueEnabled == isShowRelatedInQueueEnabled) &&
            (identical(other.queueDismissTime, queueDismissTime) || other.queueDismissTime == queueDismissTime) &&
            (identical(other.autoplayCountdown, autoplayCountdown) || other.autoplayCountdown == autoplayCountdown) &&
            (identical(other.isDisableAutoplayOnCellularEnabled, isDisableAutoplayOnCellularEnabled) || other.isDisableAutoplayOnCellularEnabled == isDisableAutoplayOnCellularEnabled) &&
            (identical(other.isAutoQueueEnabled, isAutoQueueEnabled) || other.isAutoQueueEnabled == isAutoQueueEnabled) &&
            (identical(other.isBufferPreloadEnabled, isBufferPreloadEnabled) || other.isBufferPreloadEnabled == isBufferPreloadEnabled) &&
            (identical(other.isAutoQualityAdjustEnabled, isAutoQualityAdjustEnabled) || other.isAutoQualityAdjustEnabled == isAutoQualityAdjustEnabled) &&
            (identical(other.isBackgroundPlaybackEnabled, isBackgroundPlaybackEnabled) || other.isBackgroundPlaybackEnabled == isBackgroundPlaybackEnabled) &&
            (identical(other.isNotificationControlsEnabled, isNotificationControlsEnabled) || other.isNotificationControlsEnabled == isNotificationControlsEnabled) &&
            (identical(other.isDataSaverEnabled, isDataSaverEnabled) || other.isDataSaverEnabled == isDataSaverEnabled) &&
            (identical(other.isHideWatchedVideosEnabled, isHideWatchedVideosEnabled) || other.isHideWatchedVideosEnabled == isHideWatchedVideosEnabled) &&
            (identical(other.mobileDataQuality, mobileDataQuality) || other.mobileDataQuality == mobileDataQuality) &&
            (identical(other.isDownloadQueueItemsEnabled, isDownloadQueueItemsEnabled) || other.isDownloadQueueItemsEnabled == isDownloadQueueItemsEnabled) &&
            (identical(other.isRichCaptionRenderingEnabled, isRichCaptionRenderingEnabled) || other.isRichCaptionRenderingEnabled == isRichCaptionRenderingEnabled) &&
            (identical(other.isBilibiliEnabled, isBilibiliEnabled) || other.isBilibiliEnabled == isBilibiliEnabled) &&
            (identical(other.isSwipeLeftToRight, isSwipeLeftToRight) || other.isSwipeLeftToRight == isSwipeLeftToRight) &&
            (identical(other.isMiniPlayerAutoExpandEnabled, isMiniPlayerAutoExpandEnabled) || other.isMiniPlayerAutoExpandEnabled == isMiniPlayerAutoExpandEnabled) &&
            (identical(other.isMiniPlayerTapToExpandEnabled, isMiniPlayerTapToExpandEnabled) || other.isMiniPlayerTapToExpandEnabled == isMiniPlayerTapToExpandEnabled) &&
            (identical(other.isMiniPlayerDoubleTapToExpandEnabled, isMiniPlayerDoubleTapToExpandEnabled) || other.isMiniPlayerDoubleTapToExpandEnabled == isMiniPlayerDoubleTapToExpandEnabled) &&
            (identical(other.restrictedModeFilterLevel, restrictedModeFilterLevel) || other.restrictedModeFilterLevel == restrictedModeFilterLevel) &&
            (identical(other.downloadAutoDeleteDays, downloadAutoDeleteDays) || other.downloadAutoDeleteDays == downloadAutoDeleteDays) &&
            const DeepCollectionEquality().equals(other._contentFilterKeywords, _contentFilterKeywords) &&
            const DeepCollectionEquality().equals(other._contentFilterBlockedChannels, _contentFilterBlockedChannels) &&
            (identical(other.contentFilterHideShorts, contentFilterHideShorts) || other.contentFilterHideShorts == contentFilterHideShorts) &&
            (identical(other.contentFilterHidePaid, contentFilterHidePaid) || other.contentFilterHidePaid == contentFilterHidePaid) &&
            (identical(other.downloadFolderPath, downloadFolderPath) || other.downloadFolderPath == downloadFolderPath) &&
            (identical(other.isRydEnabled, isRydEnabled) || other.isRydEnabled == isRydEnabled) &&
            (identical(other.isLongPressSpeedUpEnabled, isLongPressSpeedUpEnabled) || other.isLongPressSpeedUpEnabled == isLongPressSpeedUpEnabled) &&
            (identical(other.isOriginalTitlesEnabled, isOriginalTitlesEnabled) || other.isOriginalTitlesEnabled == isOriginalTitlesEnabled) &&
            (identical(other.isCommentFilterEnabled, isCommentFilterEnabled) || other.isCommentFilterEnabled == isCommentFilterEnabled) &&
            const DeepCollectionEquality().equals(other._commentFilterKeywords, _commentFilterKeywords) &&
            (identical(other.preferredAudioQuality, preferredAudioQuality) || other.preferredAudioQuality == preferredAudioQuality) &&
            (identical(other.isScreenLockEnabled, isScreenLockEnabled) || other.isScreenLockEnabled == isScreenLockEnabled) &&
            (identical(other.isPinchToZoomEnabled, isPinchToZoomEnabled) || other.isPinchToZoomEnabled == isPinchToZoomEnabled) &&
            (identical(other.isAudioOnlyEnabled, isAudioOnlyEnabled) || other.isAudioOnlyEnabled == isAudioOnlyEnabled) &&
            (identical(other.isSeekbarThumbnailsEnabled, isSeekbarThumbnailsEnabled) || other.isSeekbarThumbnailsEnabled == isSeekbarThumbnailsEnabled) &&
            (identical(other.isPopupPlayerEnabled, isPopupPlayerEnabled) || other.isPopupPlayerEnabled == isPopupPlayerEnabled) &&
            (identical(other.isLiveChatDanmakuEnabled, isLiveChatDanmakuEnabled) || other.isLiveChatDanmakuEnabled == isLiveChatDanmakuEnabled) &&
            (identical(other.isBluetoothSeekEnabled, isBluetoothSeekEnabled) || other.isBluetoothSeekEnabled == isBluetoothSeekEnabled) &&
            (identical(other.isMultiSelectListsEnabled, isMultiSelectListsEnabled) || other.isMultiSelectListsEnabled == isMultiSelectListsEnabled) &&
            (identical(other.isSbExclusiveMarkerEnabled, isSbExclusiveMarkerEnabled) || other.isSbExclusiveMarkerEnabled == isSbExclusiveMarkerEnabled) &&
            (identical(other.isSbForDownloadsEnabled, isSbForDownloadsEnabled) || other.isSbForDownloadsEnabled == isSbForDownloadsEnabled) &&
            (identical(other.youtubeCookie, youtubeCookie) || other.youtubeCookie == youtubeCookie) &&
            (identical(other.pipedAuthToken, pipedAuthToken) || other.pipedAuthToken == pipedAuthToken) &&
            (identical(other.pipedAuthUsername, pipedAuthUsername) || other.pipedAuthUsername == pipedAuthUsername));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        defaultLanguage,
        defaultQuality,
        defaultRegion,
        themeMode,
        version,
        isHistoryVisible,
        isDislikeVisible,
        isHlsPlayer,
        isHideComments,
        isHideRelated,
        const DeepCollectionEquality().hash(_pipedInstances),
        pipedInstanceStatus,
        instance,
        const DeepCollectionEquality().hash(_invidiousInstances),
        invidiousInstanceStatus,
        ytService,
        initialized,
        settingsStatus,
        isPipDisabled,
        connectingToInstance,
        isTestingConnection,
        userInstanceFailed,
        failedInstanceName,
        searchFilter,
        videoFitMode,
        skipInterval,
        isSponsorBlockEnabled,
        const DeepCollectionEquality().hash(_sponsorBlockCategories),
        openLinksInBrowser,
        homeFeedMode,
        isAudioFocusEnabled,
        currentProfile,
        const DeepCollectionEquality().hash(_profiles),
        subtitleSize,
        lastExportedFilePath,
        isSearchHistoryEnabled,
        isSearchHistoryVisible,
        isAutoPipEnabled,
        sleepTimerConfig,
        isSwipeGesturesEnabled,
        isDeArrowEnabled,
        isBookmarksEnabled,
        const DeepCollectionEquality().hash(_bookmarkedPlaylists),
        isRestrictedModeEnabled,
        isMiniPlayerEnabled,
        downloadQuality,
        isDownloadSubtitlesEnabled,
        isDownloadOverWifiOnlyEnabled,
        isDownloadAutoDeleteEnabled,
        playbackSpeed,
        isAutoplayNextVideoEnabled,
        isShowRelatedInQueueEnabled,
        queueDismissTime,
        autoplayCountdown,
        isDisableAutoplayOnCellularEnabled,
        isAutoQueueEnabled,
        isBufferPreloadEnabled,
        isAutoQualityAdjustEnabled,
        isBackgroundPlaybackEnabled,
        isNotificationControlsEnabled,
        isDataSaverEnabled,
        isHideWatchedVideosEnabled,
        mobileDataQuality,
        isDownloadQueueItemsEnabled,
        isRichCaptionRenderingEnabled,
        isBilibiliEnabled,
        isSwipeLeftToRight,
        isMiniPlayerAutoExpandEnabled,
        isMiniPlayerTapToExpandEnabled,
        isMiniPlayerDoubleTapToExpandEnabled,
        restrictedModeFilterLevel,
        downloadAutoDeleteDays,
        const DeepCollectionEquality().hash(_contentFilterKeywords),
        const DeepCollectionEquality().hash(_contentFilterBlockedChannels),
        contentFilterHideShorts,
        contentFilterHidePaid,
        downloadFolderPath,
        isRydEnabled,
        isLongPressSpeedUpEnabled,
        isOriginalTitlesEnabled,
        isCommentFilterEnabled,
        const DeepCollectionEquality().hash(_commentFilterKeywords),
        preferredAudioQuality,
        isScreenLockEnabled,
        isPinchToZoomEnabled,
        isAudioOnlyEnabled,
        isSeekbarThumbnailsEnabled,
        isPopupPlayerEnabled,
        isLiveChatDanmakuEnabled,
        isBluetoothSeekEnabled,
        isMultiSelectListsEnabled,
        isSbExclusiveMarkerEnabled,
        isSbForDownloadsEnabled,
        youtubeCookie,
        pipedAuthToken,
        pipedAuthUsername
      ]);

  @override
  String toString() {
    return 'SettingsState(defaultLanguage: $defaultLanguage, defaultQuality: $defaultQuality, defaultRegion: $defaultRegion, themeMode: $themeMode, version: $version, isHistoryVisible: $isHistoryVisible, isDislikeVisible: $isDislikeVisible, isHlsPlayer: $isHlsPlayer, isHideComments: $isHideComments, isHideRelated: $isHideRelated, pipedInstances: $pipedInstances, pipedInstanceStatus: $pipedInstanceStatus, instance: $instance, invidiousInstances: $invidiousInstances, invidiousInstanceStatus: $invidiousInstanceStatus, ytService: $ytService, initialized: $initialized, settingsStatus: $settingsStatus, isPipDisabled: $isPipDisabled, connectingToInstance: $connectingToInstance, isTestingConnection: $isTestingConnection, userInstanceFailed: $userInstanceFailed, failedInstanceName: $failedInstanceName, searchFilter: $searchFilter, videoFitMode: $videoFitMode, skipInterval: $skipInterval, isSponsorBlockEnabled: $isSponsorBlockEnabled, sponsorBlockCategories: $sponsorBlockCategories, openLinksInBrowser: $openLinksInBrowser, homeFeedMode: $homeFeedMode, isAudioFocusEnabled: $isAudioFocusEnabled, currentProfile: $currentProfile, profiles: $profiles, subtitleSize: $subtitleSize, lastExportedFilePath: $lastExportedFilePath, isSearchHistoryEnabled: $isSearchHistoryEnabled, isSearchHistoryVisible: $isSearchHistoryVisible, isAutoPipEnabled: $isAutoPipEnabled, sleepTimerConfig: $sleepTimerConfig, isSwipeGesturesEnabled: $isSwipeGesturesEnabled, isDeArrowEnabled: $isDeArrowEnabled, isBookmarksEnabled: $isBookmarksEnabled, bookmarkedPlaylists: $bookmarkedPlaylists, isRestrictedModeEnabled: $isRestrictedModeEnabled, isMiniPlayerEnabled: $isMiniPlayerEnabled, downloadQuality: $downloadQuality, isDownloadSubtitlesEnabled: $isDownloadSubtitlesEnabled, isDownloadOverWifiOnlyEnabled: $isDownloadOverWifiOnlyEnabled, isDownloadAutoDeleteEnabled: $isDownloadAutoDeleteEnabled, playbackSpeed: $playbackSpeed, isAutoplayNextVideoEnabled: $isAutoplayNextVideoEnabled, isShowRelatedInQueueEnabled: $isShowRelatedInQueueEnabled, queueDismissTime: $queueDismissTime, autoplayCountdown: $autoplayCountdown, isDisableAutoplayOnCellularEnabled: $isDisableAutoplayOnCellularEnabled, isAutoQueueEnabled: $isAutoQueueEnabled, isBufferPreloadEnabled: $isBufferPreloadEnabled, isAutoQualityAdjustEnabled: $isAutoQualityAdjustEnabled, isBackgroundPlaybackEnabled: $isBackgroundPlaybackEnabled, isNotificationControlsEnabled: $isNotificationControlsEnabled, isDataSaverEnabled: $isDataSaverEnabled, isHideWatchedVideosEnabled: $isHideWatchedVideosEnabled, mobileDataQuality: $mobileDataQuality, isDownloadQueueItemsEnabled: $isDownloadQueueItemsEnabled, isRichCaptionRenderingEnabled: $isRichCaptionRenderingEnabled, isBilibiliEnabled: $isBilibiliEnabled, isSwipeLeftToRight: $isSwipeLeftToRight, isMiniPlayerAutoExpandEnabled: $isMiniPlayerAutoExpandEnabled, isMiniPlayerTapToExpandEnabled: $isMiniPlayerTapToExpandEnabled, isMiniPlayerDoubleTapToExpandEnabled: $isMiniPlayerDoubleTapToExpandEnabled, restrictedModeFilterLevel: $restrictedModeFilterLevel, downloadAutoDeleteDays: $downloadAutoDeleteDays, contentFilterKeywords: $contentFilterKeywords, contentFilterBlockedChannels: $contentFilterBlockedChannels, contentFilterHideShorts: $contentFilterHideShorts, contentFilterHidePaid: $contentFilterHidePaid, downloadFolderPath: $downloadFolderPath, isRydEnabled: $isRydEnabled, isLongPressSpeedUpEnabled: $isLongPressSpeedUpEnabled, isOriginalTitlesEnabled: $isOriginalTitlesEnabled, isCommentFilterEnabled: $isCommentFilterEnabled, commentFilterKeywords: $commentFilterKeywords, preferredAudioQuality: $preferredAudioQuality, isScreenLockEnabled: $isScreenLockEnabled, isPinchToZoomEnabled: $isPinchToZoomEnabled, isAudioOnlyEnabled: $isAudioOnlyEnabled, isSeekbarThumbnailsEnabled: $isSeekbarThumbnailsEnabled, isPopupPlayerEnabled: $isPopupPlayerEnabled, isLiveChatDanmakuEnabled: $isLiveChatDanmakuEnabled, isBluetoothSeekEnabled: $isBluetoothSeekEnabled, isMultiSelectListsEnabled: $isMultiSelectListsEnabled, isSbExclusiveMarkerEnabled: $isSbExclusiveMarkerEnabled, isSbForDownloadsEnabled: $isSbForDownloadsEnabled, youtubeCookie: $youtubeCookie, pipedAuthToken: $pipedAuthToken, pipedAuthUsername: $pipedAuthUsername)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String defaultLanguage,
      String defaultQuality,
      String defaultRegion,
      String themeMode,
      String? version,
      bool isHistoryVisible,
      bool isDislikeVisible,
      bool isHlsPlayer,
      bool isHideComments,
      bool isHideRelated,
      List<Instance> pipedInstances,
      ApiStatus pipedInstanceStatus,
      String instance,
      List<Instance> invidiousInstances,
      ApiStatus invidiousInstanceStatus,
      String ytService,
      bool initialized,
      ApiStatus settingsStatus,
      bool isPipDisabled,
      String? connectingToInstance,
      bool isTestingConnection,
      bool userInstanceFailed,
      String? failedInstanceName,
      String searchFilter,
      String videoFitMode,
      int skipInterval,
      bool isSponsorBlockEnabled,
      List<String> sponsorBlockCategories,
      bool openLinksInBrowser,
      String homeFeedMode,
      bool isAudioFocusEnabled,
      String currentProfile,
      List<String> profiles,
      double subtitleSize,
      String? lastExportedFilePath,
      bool isSearchHistoryEnabled,
      bool isSearchHistoryVisible,
      bool isAutoPipEnabled,
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
      bool? isLongPressSpeedUpEnabled,
      bool? isOriginalTitlesEnabled,
      bool? isCommentFilterEnabled,
      List<String>? commentFilterKeywords,
      String? preferredAudioQuality,
      bool? isScreenLockEnabled,
      bool? isPinchToZoomEnabled,
      bool? isAudioOnlyEnabled,
      bool? isSeekbarThumbnailsEnabled,
      bool? isPopupPlayerEnabled,
      bool? isLiveChatDanmakuEnabled,
      bool? isBluetoothSeekEnabled,
      bool? isMultiSelectListsEnabled,
      bool? isSbExclusiveMarkerEnabled,
      bool? isSbForDownloadsEnabled,
      String? youtubeCookie,
      String? pipedAuthToken,
      String? pipedAuthUsername});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? defaultLanguage = null,
    Object? defaultQuality = null,
    Object? defaultRegion = null,
    Object? themeMode = null,
    Object? version = freezed,
    Object? isHistoryVisible = null,
    Object? isDislikeVisible = null,
    Object? isHlsPlayer = null,
    Object? isHideComments = null,
    Object? isHideRelated = null,
    Object? pipedInstances = null,
    Object? pipedInstanceStatus = null,
    Object? instance = null,
    Object? invidiousInstances = null,
    Object? invidiousInstanceStatus = null,
    Object? ytService = null,
    Object? initialized = null,
    Object? settingsStatus = null,
    Object? isPipDisabled = null,
    Object? connectingToInstance = freezed,
    Object? isTestingConnection = null,
    Object? userInstanceFailed = null,
    Object? failedInstanceName = freezed,
    Object? searchFilter = null,
    Object? videoFitMode = null,
    Object? skipInterval = null,
    Object? isSponsorBlockEnabled = null,
    Object? sponsorBlockCategories = null,
    Object? openLinksInBrowser = null,
    Object? homeFeedMode = null,
    Object? isAudioFocusEnabled = null,
    Object? currentProfile = null,
    Object? profiles = null,
    Object? subtitleSize = null,
    Object? lastExportedFilePath = freezed,
    Object? isSearchHistoryEnabled = null,
    Object? isSearchHistoryVisible = null,
    Object? isAutoPipEnabled = null,
    Object? sleepTimerConfig = freezed,
    Object? isSwipeGesturesEnabled = freezed,
    Object? isDeArrowEnabled = freezed,
    Object? isBookmarksEnabled = freezed,
    Object? bookmarkedPlaylists = freezed,
    Object? isRestrictedModeEnabled = freezed,
    Object? isMiniPlayerEnabled = freezed,
    Object? downloadQuality = freezed,
    Object? isDownloadSubtitlesEnabled = freezed,
    Object? isDownloadOverWifiOnlyEnabled = freezed,
    Object? isDownloadAutoDeleteEnabled = freezed,
    Object? playbackSpeed = freezed,
    Object? isAutoplayNextVideoEnabled = freezed,
    Object? isShowRelatedInQueueEnabled = freezed,
    Object? queueDismissTime = freezed,
    Object? autoplayCountdown = freezed,
    Object? isDisableAutoplayOnCellularEnabled = freezed,
    Object? isAutoQueueEnabled = freezed,
    Object? isBufferPreloadEnabled = freezed,
    Object? isAutoQualityAdjustEnabled = freezed,
    Object? isBackgroundPlaybackEnabled = freezed,
    Object? isNotificationControlsEnabled = freezed,
    Object? isDataSaverEnabled = freezed,
    Object? isHideWatchedVideosEnabled = freezed,
    Object? mobileDataQuality = freezed,
    Object? isDownloadQueueItemsEnabled = freezed,
    Object? isRichCaptionRenderingEnabled = freezed,
    Object? isBilibiliEnabled = freezed,
    Object? isSwipeLeftToRight = freezed,
    Object? isMiniPlayerAutoExpandEnabled = freezed,
    Object? isMiniPlayerTapToExpandEnabled = freezed,
    Object? isMiniPlayerDoubleTapToExpandEnabled = freezed,
    Object? restrictedModeFilterLevel = freezed,
    Object? downloadAutoDeleteDays = freezed,
    Object? contentFilterKeywords = freezed,
    Object? contentFilterBlockedChannels = freezed,
    Object? contentFilterHideShorts = freezed,
    Object? contentFilterHidePaid = freezed,
    Object? downloadFolderPath = freezed,
    Object? isRydEnabled = freezed,
    Object? isLongPressSpeedUpEnabled = freezed,
    Object? isOriginalTitlesEnabled = freezed,
    Object? isCommentFilterEnabled = freezed,
    Object? commentFilterKeywords = freezed,
    Object? preferredAudioQuality = freezed,
    Object? isScreenLockEnabled = freezed,
    Object? isPinchToZoomEnabled = freezed,
    Object? isAudioOnlyEnabled = freezed,
    Object? isSeekbarThumbnailsEnabled = freezed,
    Object? isPopupPlayerEnabled = freezed,
    Object? isLiveChatDanmakuEnabled = freezed,
    Object? isBluetoothSeekEnabled = freezed,
    Object? isMultiSelectListsEnabled = freezed,
    Object? isSbExclusiveMarkerEnabled = freezed,
    Object? isSbForDownloadsEnabled = freezed,
    Object? youtubeCookie = freezed,
    Object? pipedAuthToken = freezed,
    Object? pipedAuthUsername = freezed,
  }) {
    return _then(_Initial(
      defaultLanguage: null == defaultLanguage
          ? _self.defaultLanguage
          : defaultLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      defaultQuality: null == defaultQuality
          ? _self.defaultQuality
          : defaultQuality // ignore: cast_nullable_to_non_nullable
              as String,
      defaultRegion: null == defaultRegion
          ? _self.defaultRegion
          : defaultRegion // ignore: cast_nullable_to_non_nullable
              as String,
      themeMode: null == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as String,
      version: freezed == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      isHistoryVisible: null == isHistoryVisible
          ? _self.isHistoryVisible
          : isHistoryVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isDislikeVisible: null == isDislikeVisible
          ? _self.isDislikeVisible
          : isDislikeVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isHlsPlayer: null == isHlsPlayer
          ? _self.isHlsPlayer
          : isHlsPlayer // ignore: cast_nullable_to_non_nullable
              as bool,
      isHideComments: null == isHideComments
          ? _self.isHideComments
          : isHideComments // ignore: cast_nullable_to_non_nullable
              as bool,
      isHideRelated: null == isHideRelated
          ? _self.isHideRelated
          : isHideRelated // ignore: cast_nullable_to_non_nullable
              as bool,
      pipedInstances: null == pipedInstances
          ? _self._pipedInstances
          : pipedInstances // ignore: cast_nullable_to_non_nullable
              as List<Instance>,
      pipedInstanceStatus: null == pipedInstanceStatus
          ? _self.pipedInstanceStatus
          : pipedInstanceStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      instance: null == instance
          ? _self.instance
          : instance // ignore: cast_nullable_to_non_nullable
              as String,
      invidiousInstances: null == invidiousInstances
          ? _self._invidiousInstances
          : invidiousInstances // ignore: cast_nullable_to_non_nullable
              as List<Instance>,
      invidiousInstanceStatus: null == invidiousInstanceStatus
          ? _self.invidiousInstanceStatus
          : invidiousInstanceStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      ytService: null == ytService
          ? _self.ytService
          : ytService // ignore: cast_nullable_to_non_nullable
              as String,
      initialized: null == initialized
          ? _self.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      settingsStatus: null == settingsStatus
          ? _self.settingsStatus
          : settingsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isPipDisabled: null == isPipDisabled
          ? _self.isPipDisabled
          : isPipDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      connectingToInstance: freezed == connectingToInstance
          ? _self.connectingToInstance
          : connectingToInstance // ignore: cast_nullable_to_non_nullable
              as String?,
      isTestingConnection: null == isTestingConnection
          ? _self.isTestingConnection
          : isTestingConnection // ignore: cast_nullable_to_non_nullable
              as bool,
      userInstanceFailed: null == userInstanceFailed
          ? _self.userInstanceFailed
          : userInstanceFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      failedInstanceName: freezed == failedInstanceName
          ? _self.failedInstanceName
          : failedInstanceName // ignore: cast_nullable_to_non_nullable
              as String?,
      searchFilter: null == searchFilter
          ? _self.searchFilter
          : searchFilter // ignore: cast_nullable_to_non_nullable
              as String,
      videoFitMode: null == videoFitMode
          ? _self.videoFitMode
          : videoFitMode // ignore: cast_nullable_to_non_nullable
              as String,
      skipInterval: null == skipInterval
          ? _self.skipInterval
          : skipInterval // ignore: cast_nullable_to_non_nullable
              as int,
      isSponsorBlockEnabled: null == isSponsorBlockEnabled
          ? _self.isSponsorBlockEnabled
          : isSponsorBlockEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      sponsorBlockCategories: null == sponsorBlockCategories
          ? _self._sponsorBlockCategories
          : sponsorBlockCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      openLinksInBrowser: null == openLinksInBrowser
          ? _self.openLinksInBrowser
          : openLinksInBrowser // ignore: cast_nullable_to_non_nullable
              as bool,
      homeFeedMode: null == homeFeedMode
          ? _self.homeFeedMode
          : homeFeedMode // ignore: cast_nullable_to_non_nullable
              as String,
      isAudioFocusEnabled: null == isAudioFocusEnabled
          ? _self.isAudioFocusEnabled
          : isAudioFocusEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      currentProfile: null == currentProfile
          ? _self.currentProfile
          : currentProfile // ignore: cast_nullable_to_non_nullable
              as String,
      profiles: null == profiles
          ? _self._profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subtitleSize: null == subtitleSize
          ? _self.subtitleSize
          : subtitleSize // ignore: cast_nullable_to_non_nullable
              as double,
      lastExportedFilePath: freezed == lastExportedFilePath
          ? _self.lastExportedFilePath
          : lastExportedFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isSearchHistoryEnabled: null == isSearchHistoryEnabled
          ? _self.isSearchHistoryEnabled
          : isSearchHistoryEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchHistoryVisible: null == isSearchHistoryVisible
          ? _self.isSearchHistoryVisible
          : isSearchHistoryVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isAutoPipEnabled: null == isAutoPipEnabled
          ? _self.isAutoPipEnabled
          : isAutoPipEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      sleepTimerConfig: freezed == sleepTimerConfig
          ? _self.sleepTimerConfig
          : sleepTimerConfig // ignore: cast_nullable_to_non_nullable
              as SleepTimerConfig?,
      isSwipeGesturesEnabled: freezed == isSwipeGesturesEnabled
          ? _self.isSwipeGesturesEnabled
          : isSwipeGesturesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeArrowEnabled: freezed == isDeArrowEnabled
          ? _self.isDeArrowEnabled
          : isDeArrowEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBookmarksEnabled: freezed == isBookmarksEnabled
          ? _self.isBookmarksEnabled
          : isBookmarksEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      bookmarkedPlaylists: freezed == bookmarkedPlaylists
          ? _self._bookmarkedPlaylists
          : bookmarkedPlaylists // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isRestrictedModeEnabled: freezed == isRestrictedModeEnabled
          ? _self.isRestrictedModeEnabled
          : isRestrictedModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMiniPlayerEnabled: freezed == isMiniPlayerEnabled
          ? _self.isMiniPlayerEnabled
          : isMiniPlayerEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      downloadQuality: freezed == downloadQuality
          ? _self.downloadQuality
          : downloadQuality // ignore: cast_nullable_to_non_nullable
              as String?,
      isDownloadSubtitlesEnabled: freezed == isDownloadSubtitlesEnabled
          ? _self.isDownloadSubtitlesEnabled
          : isDownloadSubtitlesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDownloadOverWifiOnlyEnabled: freezed == isDownloadOverWifiOnlyEnabled
          ? _self.isDownloadOverWifiOnlyEnabled
          : isDownloadOverWifiOnlyEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDownloadAutoDeleteEnabled: freezed == isDownloadAutoDeleteEnabled
          ? _self.isDownloadAutoDeleteEnabled
          : isDownloadAutoDeleteEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      playbackSpeed: freezed == playbackSpeed
          ? _self.playbackSpeed
          : playbackSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      isAutoplayNextVideoEnabled: freezed == isAutoplayNextVideoEnabled
          ? _self.isAutoplayNextVideoEnabled
          : isAutoplayNextVideoEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isShowRelatedInQueueEnabled: freezed == isShowRelatedInQueueEnabled
          ? _self.isShowRelatedInQueueEnabled
          : isShowRelatedInQueueEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      queueDismissTime: freezed == queueDismissTime
          ? _self.queueDismissTime
          : queueDismissTime // ignore: cast_nullable_to_non_nullable
              as int?,
      autoplayCountdown: freezed == autoplayCountdown
          ? _self.autoplayCountdown
          : autoplayCountdown // ignore: cast_nullable_to_non_nullable
              as int?,
      isDisableAutoplayOnCellularEnabled: freezed ==
              isDisableAutoplayOnCellularEnabled
          ? _self.isDisableAutoplayOnCellularEnabled
          : isDisableAutoplayOnCellularEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAutoQueueEnabled: freezed == isAutoQueueEnabled
          ? _self.isAutoQueueEnabled
          : isAutoQueueEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBufferPreloadEnabled: freezed == isBufferPreloadEnabled
          ? _self.isBufferPreloadEnabled
          : isBufferPreloadEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAutoQualityAdjustEnabled: freezed == isAutoQualityAdjustEnabled
          ? _self.isAutoQualityAdjustEnabled
          : isAutoQualityAdjustEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBackgroundPlaybackEnabled: freezed == isBackgroundPlaybackEnabled
          ? _self.isBackgroundPlaybackEnabled
          : isBackgroundPlaybackEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNotificationControlsEnabled: freezed == isNotificationControlsEnabled
          ? _self.isNotificationControlsEnabled
          : isNotificationControlsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDataSaverEnabled: freezed == isDataSaverEnabled
          ? _self.isDataSaverEnabled
          : isDataSaverEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isHideWatchedVideosEnabled: freezed == isHideWatchedVideosEnabled
          ? _self.isHideWatchedVideosEnabled
          : isHideWatchedVideosEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobileDataQuality: freezed == mobileDataQuality
          ? _self.mobileDataQuality
          : mobileDataQuality // ignore: cast_nullable_to_non_nullable
              as int?,
      isDownloadQueueItemsEnabled: freezed == isDownloadQueueItemsEnabled
          ? _self.isDownloadQueueItemsEnabled
          : isDownloadQueueItemsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRichCaptionRenderingEnabled: freezed == isRichCaptionRenderingEnabled
          ? _self.isRichCaptionRenderingEnabled
          : isRichCaptionRenderingEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBilibiliEnabled: freezed == isBilibiliEnabled
          ? _self.isBilibiliEnabled
          : isBilibiliEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSwipeLeftToRight: freezed == isSwipeLeftToRight
          ? _self.isSwipeLeftToRight
          : isSwipeLeftToRight // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMiniPlayerAutoExpandEnabled: freezed == isMiniPlayerAutoExpandEnabled
          ? _self.isMiniPlayerAutoExpandEnabled
          : isMiniPlayerAutoExpandEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMiniPlayerTapToExpandEnabled: freezed == isMiniPlayerTapToExpandEnabled
          ? _self.isMiniPlayerTapToExpandEnabled
          : isMiniPlayerTapToExpandEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMiniPlayerDoubleTapToExpandEnabled: freezed ==
              isMiniPlayerDoubleTapToExpandEnabled
          ? _self.isMiniPlayerDoubleTapToExpandEnabled
          : isMiniPlayerDoubleTapToExpandEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      restrictedModeFilterLevel: freezed == restrictedModeFilterLevel
          ? _self.restrictedModeFilterLevel
          : restrictedModeFilterLevel // ignore: cast_nullable_to_non_nullable
              as RestrictedModeFilterLevel?,
      downloadAutoDeleteDays: freezed == downloadAutoDeleteDays
          ? _self.downloadAutoDeleteDays
          : downloadAutoDeleteDays // ignore: cast_nullable_to_non_nullable
              as int?,
      contentFilterKeywords: freezed == contentFilterKeywords
          ? _self._contentFilterKeywords
          : contentFilterKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      contentFilterBlockedChannels: freezed == contentFilterBlockedChannels
          ? _self._contentFilterBlockedChannels
          : contentFilterBlockedChannels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      contentFilterHideShorts: freezed == contentFilterHideShorts
          ? _self.contentFilterHideShorts
          : contentFilterHideShorts // ignore: cast_nullable_to_non_nullable
              as bool?,
      contentFilterHidePaid: freezed == contentFilterHidePaid
          ? _self.contentFilterHidePaid
          : contentFilterHidePaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      downloadFolderPath: freezed == downloadFolderPath
          ? _self.downloadFolderPath
          : downloadFolderPath // ignore: cast_nullable_to_non_nullable
              as String?,
      isRydEnabled: freezed == isRydEnabled
          ? _self.isRydEnabled
          : isRydEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLongPressSpeedUpEnabled: freezed == isLongPressSpeedUpEnabled
          ? _self.isLongPressSpeedUpEnabled
          : isLongPressSpeedUpEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOriginalTitlesEnabled: freezed == isOriginalTitlesEnabled
          ? _self.isOriginalTitlesEnabled
          : isOriginalTitlesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCommentFilterEnabled: freezed == isCommentFilterEnabled
          ? _self.isCommentFilterEnabled
          : isCommentFilterEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      commentFilterKeywords: freezed == commentFilterKeywords
          ? _self._commentFilterKeywords
          : commentFilterKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      preferredAudioQuality: freezed == preferredAudioQuality
          ? _self.preferredAudioQuality
          : preferredAudioQuality // ignore: cast_nullable_to_non_nullable
              as String?,
      isScreenLockEnabled: freezed == isScreenLockEnabled
          ? _self.isScreenLockEnabled
          : isScreenLockEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPinchToZoomEnabled: freezed == isPinchToZoomEnabled
          ? _self.isPinchToZoomEnabled
          : isPinchToZoomEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAudioOnlyEnabled: freezed == isAudioOnlyEnabled
          ? _self.isAudioOnlyEnabled
          : isAudioOnlyEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSeekbarThumbnailsEnabled: freezed == isSeekbarThumbnailsEnabled
          ? _self.isSeekbarThumbnailsEnabled
          : isSeekbarThumbnailsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPopupPlayerEnabled: freezed == isPopupPlayerEnabled
          ? _self.isPopupPlayerEnabled
          : isPopupPlayerEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLiveChatDanmakuEnabled: freezed == isLiveChatDanmakuEnabled
          ? _self.isLiveChatDanmakuEnabled
          : isLiveChatDanmakuEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBluetoothSeekEnabled: freezed == isBluetoothSeekEnabled
          ? _self.isBluetoothSeekEnabled
          : isBluetoothSeekEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMultiSelectListsEnabled: freezed == isMultiSelectListsEnabled
          ? _self.isMultiSelectListsEnabled
          : isMultiSelectListsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSbExclusiveMarkerEnabled: freezed == isSbExclusiveMarkerEnabled
          ? _self.isSbExclusiveMarkerEnabled
          : isSbExclusiveMarkerEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSbForDownloadsEnabled: freezed == isSbForDownloadsEnabled
          ? _self.isSbForDownloadsEnabled
          : isSbForDownloadsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      youtubeCookie: freezed == youtubeCookie
          ? _self.youtubeCookie
          : youtubeCookie // ignore: cast_nullable_to_non_nullable
              as String?,
      pipedAuthToken: freezed == pipedAuthToken
          ? _self.pipedAuthToken
          : pipedAuthToken // ignore: cast_nullable_to_non_nullable
              as String?,
      pipedAuthUsername: freezed == pipedAuthUsername
          ? _self.pipedAuthUsername
          : pipedAuthUsername // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
