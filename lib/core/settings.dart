const selectedDefaultLanguage = 'default-language';
const selectedDefaultQuality = 'default-quality';
const selectedDefaultRegion = 'default-region';
const selectedTheme = 'theme';
const historyVisibility = 'history-visibility';
const dislikeVisibility = 'dislike-visibility';
const hlsPlayer = 'hls-player';
const commentsVisibility = 'comments-visibility';
const relatedVideoVisibility = 'related-video-visibility';
const instanceApiUrl = 'instance-api';
const youtubeService = 'yt-service';
const pipDisabled = 'pip-disabled';

// Search filters
const searchFilterKey = 'search-filter';

// Video fit mode
const videoFitModeKey = 'video-fit-mode';

// Skip interval (in seconds)
const skipIntervalKey = 'skip-interval';

// SponsorBlock settings
const sponsorBlockEnabledKey = 'sponsorblock-enabled';
const sponsorBlockCategoriesKey = 'sponsorblock-categories';

// Open links in browser
const openLinksInBrowserKey = 'open-links-browser';

// Home feed mode (feedOrTrending, feedOnly, trendingOnly)
const homeFeedModeKey = 'home-feed-mode';

// Audio focus / pause on interruption
const audioFocusEnabledKey = 'audio-focus-enabled';

// Subtitle size (font size in pixels)
const subtitleSizeKey = 'subtitle-size';

// Profiles
const currentProfileKey = 'current-profile';
const profilesListKey = 'profiles-list';

// Sync
const syncEnabledKey = 'sync-enabled';
const lastSyncedKey = 'last-synced';

// Search history privacy
const searchHistoryEnabledKey = 'search-history-enabled';
const searchHistoryVisibilityKey = 'search-history-visibility';

// Auto PiP (enter PiP when pressing home button while video is playing)
const autoPipEnabledKey = 'auto-pip-enabled';

// Sleep timer
const sleepTimerKey = 'sleep-timer';

// Swipe gestures
const enableSwipeGesturesKey = 'enable-swipe-gestures';
const swipeSensitivityKey = 'swipe-sensitivity';

// DeArrow
const dearrowEnabledKey = 'dearrow-enabled';

// Playlist Bookmarks
const bookmarksEnabledKey = 'bookmarks-enabled';
const bookmarkPlaylistsKey = 'bookmarked-playlists';

// Content Filtering
const restrictedModeKey = 'restricted-mode';

// Mini Player
const miniPlayerEnabledKey = 'mini-player-enabled';

// Download Preferences
const downloadQualityKey = 'download-quality';
const downloadSubtitlesKey = 'download-subtitles';
const downloadOverWifiOnlyKey = 'download-over-wifi-only';
const downloadAutoDeleteKey = 'download-auto-delete';

// Playback speed (default playback speed for videos)
const playbackSpeedKey = 'playback-speed';

// Autoplay next video when current video ends
const autoplayNextVideoKey = 'autoplay-next-video';

// Show related videos in playback queue
const showRelatedInQueueKey = 'show-related-in-queue';

// Queue auto-dismiss time in seconds (0 = never dismiss)
const queueDismissTimeKey = 'queue-dismiss-time';

// Autoplay countdown seconds (0 = no countdown)
const autoplayCountdownKey = 'autoplay-countdown';

// Disable autoplay on cellular/mobile data
const disableAutoplayOnCellularKey = 'disable-autoplay-cellular';

// Auto-queue: continue playlist by auto-adding related stream when queue ends
const autoQueueKey = 'auto-queue';

// Buffer preloading (preload next video buffer)
const bufferPreloadKey = 'buffer-preload';

// Video quality auto-adjust based on network
const autoQualityAdjustKey = 'auto-quality-adjust';

// Background playback (audio continues in background)
const backgroundPlaybackKey = 'background-playback';

// Notification controls (lock screen/media notification)
const notificationControlsKey = 'notification-controls';

// Data saver mode
const dataSaverKey = 'data-saver';

// Hide watched videos in feeds
const hideWatchedVideosKey = 'hide-watched-videos';

// Quality for mobile data (specific setting)
const mobileDataQualityKey = 'mobile-data-quality';

// Download items in queue
const downloadQueueItemsKey = 'download-queue-items';

// Rich caption rendering
const richCaptionRenderingKey = 'rich-caption-rendering';

// Bilibili video support (enable/disable Bilibili as a service)
const bilibiliEnabledKey = 'bilibili-enabled';

// Content swipe direction (left-to-right or right-to-left)
const swipeDirectionKey = 'swipe-direction';

// Mini player expansion behaviour
const miniPlayerAutoExpandKey = 'mini-player-auto-expand';
const miniPlayerTapToExpandKey = 'mini-player-tap-to-expand';
const miniPlayerDoubleTapToExpandKey = 'mini-player-double-tap-to-expand';

// Selected playlists for playlist bookmarks
const bookmarkedPlaylistsKey = 'bookmarked-playlists';

// Restricted mode filter level (standard, strict)
const restrictedModeFilterKey = 'restricted-mode-filter';

// Days after which auto-deleted downloads are removed
const downloadAutoDeleteDaysKey = 'download-auto-delete-days';

// Repeat mode for the playback queue (off, all, one)
const repeatModeKey = 'repeat-mode';

// New-upload notifications for subscribed channels
const notifyNewVideosKey = 'notify-new-videos';
const notifyLastCheckKey = 'notify-last-check';
const notifySeenVideosKey = 'notify-seen-videos';

// Advanced content filter: keyword blocklist (one per line, /regex/ supported)
// and channel-ID blocklist, plus Shorts and paid/promoted video hiding.
const contentFilterKeywordsKey = 'content-filter-keywords';
const contentFilterChannelsKey = 'content-filter-channels';
const contentFilterHideShortsKey = 'content-filter-hide-shorts';
const contentFilterHidePaidKey = 'content-filter-hide-paid';

// Custom download folder (absolute path; may point at removable/SD storage)
const downloadFolderPathKey = 'download_folder_path';

// Return YouTube Dislike fallback for dislike counts
const rydEnabledKey = 'ryd-enabled';

// ===== Phase 18: PipePipe / NewPipe / LibreTube parity features =====
const longPressSpeedUpKey = 'long-press-speed-up';
const originalTitlesKey = 'original-titles';
const commentFilterEnabledKey = 'comment-filter-enabled';
const commentFilterKeywordsKey = 'comment-filter-keywords';
const preferredAudioQualityKey = 'preferred-audio-quality';
const screenLockEnabledKey = 'screen-lock-enabled';
const pinchToZoomEnabledKey = 'pinch-to-zoom-enabled';
const seekbarThumbnailsKey = 'seekbar-thumbnails';
const popupPlayerEnabledKey = 'popup-player-enabled';
const liveChatDanmakuEnabledKey = 'live-chat-danmaku-enabled';
const bluetoothSeekEnabledKey = 'bluetooth-seek-enabled';
const multiSelectListsEnabledKey = 'multi-select-lists-enabled';
const sbExclusiveMarkerKey = 'sb-exclusive-marker';
const sbForDownloadsKey = 'sb-for-downloads';

// YouTube cookie used for age-restricted / members-only streams
const youtubeCookieKey = 'youtube-cookie';

// Piped account session (token + username)
const pipedAuthTokenKey = 'piped-auth-token';
const pipedAuthUsernameKey = 'piped-auth-username';
