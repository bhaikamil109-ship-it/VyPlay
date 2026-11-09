// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'hi';

  static String m0(name) => "Added to ${name}";

  static String m1(device) => "Casting to ${device}";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'No subscribers', one: 'subscriber', other: 'subscribers')}";

  static String m3(name) => "Delete ${name}?";

  static String m4(title) => "डाउनलोड विफल";

  static String m5(count) =>
      "${Intl.plural(count, one: 'Reply', other: 'Replies')}";

  static String m6(count) => "${count} minutes";

  static String m7(count) => "${count} min";

  static String m8(count) => "${count} videos";

  static String m9(count) =>
      "${Intl.plural(count, zero: 'No views', one: 'view', other: 'views')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("ऐप के बारे में"),
    "add": MessageLookupByLibrary.simpleMessage("Add"),
    "addProfile": MessageLookupByLibrary.simpleMessage("Add Profile"),
    "addToQueue": MessageLookupByLibrary.simpleMessage("Add to queue"),
    "addVideosHint": MessageLookupByLibrary.simpleMessage(
      "Long-press a video to save it to a playlist",
    ),
    "addedToPlayNext": MessageLookupByLibrary.simpleMessage(
      "Added to play next",
    ),
    "addedToPlaylist": m0,
    "addedToQueue": MessageLookupByLibrary.simpleMessage("Added to queue"),
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "audio": MessageLookupByLibrary.simpleMessage("Audio"),
    "audioFocus": MessageLookupByLibrary.simpleMessage("Audio Focus"),
    "audioFocusDescription": MessageLookupByLibrary.simpleMessage(
      "Pause playback on interruptions",
    ),
    "audioOnly": MessageLookupByLibrary.simpleMessage("केवल ऑडियो"),
    "audioQuality": MessageLookupByLibrary.simpleMessage("Audio Quality"),
    "autoDeleteAfter": MessageLookupByLibrary.simpleMessage(
      "Auto delete after",
    ),
    "autoDeleteDescription": MessageLookupByLibrary.simpleMessage(
      "Automatically delete old downloads",
    ),
    "autoDeleteDownloads": MessageLookupByLibrary.simpleMessage("Auto Delete"),
    "autoExpandDescription": MessageLookupByLibrary.simpleMessage(
      "Automatically expand mini player on video end",
    ),
    "autoExpandMiniPlayer": MessageLookupByLibrary.simpleMessage("Auto Expand"),
    "autoPip": MessageLookupByLibrary.simpleMessage("Auto Picture-in-Picture"),
    "autoPipDescription": MessageLookupByLibrary.simpleMessage(
      "Automatically enter PiP mode when pressing home button while video is playing",
    ),
    "autoQualityAdjust": MessageLookupByLibrary.simpleMessage(
      "Auto Quality Adjustment",
    ),
    "autoQualityAdjustDescription": MessageLookupByLibrary.simpleMessage(
      "Automatically adjust video quality based on network speed",
    ),
    "autoQueue": MessageLookupByLibrary.simpleMessage("Auto-Queue"),
    "autoQueueDescription": MessageLookupByLibrary.simpleMessage(
      "Continue playback by auto-adding related videos to queue",
    ),
    "autoScrollOff": MessageLookupByLibrary.simpleMessage("Auto-scroll off"),
    "autoScrollOn": MessageLookupByLibrary.simpleMessage("Auto-scroll on"),
    "autoplayCountdown": MessageLookupByLibrary.simpleMessage(
      "Autoplay Countdown",
    ),
    "autoplayCountdownDescription": MessageLookupByLibrary.simpleMessage(
      "Show a countdown before autoplaying the next video",
    ),
    "autoplayNextVideo": MessageLookupByLibrary.simpleMessage(
      "Autoplay Next Video",
    ),
    "autoplayNextVideoDescription": MessageLookupByLibrary.simpleMessage(
      "Automatically play the next video when current video ends",
    ),
    "backgroundPlayback": MessageLookupByLibrary.simpleMessage(
      "Background Playback",
    ),
    "backgroundPlaybackDescription": MessageLookupByLibrary.simpleMessage(
      "Continue audio playback when app is in background",
    ),
    "backupRestore": MessageLookupByLibrary.simpleMessage("Backup & Restore"),
    "backupRestoreDescription": MessageLookupByLibrary.simpleMessage(
      "Export or import your subscriptions",
    ),
    "bilibiliEnabled": MessageLookupByLibrary.simpleMessage("Bilibili"),
    "bilibiliEnabledDescription": MessageLookupByLibrary.simpleMessage(
      "Enable Bilibili video support and service",
    ),
    "blockedChannels": MessageLookupByLibrary.simpleMessage(
      "Blocked channel IDs",
    ),
    "blockedChannelsHint": MessageLookupByLibrary.simpleMessage(
      "Add a channel ID",
    ),
    "blockedKeywords": MessageLookupByLibrary.simpleMessage("Blocked keywords"),
    "blockedKeywordsHint": MessageLookupByLibrary.simpleMessage(
      "Add a keyword or /regex/",
    ),
    "bookmarkedPlaylists": MessageLookupByLibrary.simpleMessage(
      "Bookmarked Playlists",
    ),
    "bookmarks": MessageLookupByLibrary.simpleMessage("Playlist Bookmarks"),
    "bookmarksDescription": MessageLookupByLibrary.simpleMessage(
      "Bookmark your favorite playlists for quick access",
    ),
    "bookmarksEnabled": MessageLookupByLibrary.simpleMessage(
      "Bookmarks Enabled",
    ),
    "bufferPreload": MessageLookupByLibrary.simpleMessage("Buffer Preloading"),
    "bufferPreloadDescription": MessageLookupByLibrary.simpleMessage(
      "Preload buffer for the next video",
    ),
    "canada": MessageLookupByLibrary.simpleMessage("Canada"),
    "cancel": MessageLookupByLibrary.simpleMessage("रद्द करें"),
    "cancelTimer": MessageLookupByLibrary.simpleMessage("Cancel Timer"),
    "cancelled": MessageLookupByLibrary.simpleMessage("रद्द किया गया"),
    "cannotDeleteDefault": MessageLookupByLibrary.simpleMessage(
      "Cannot delete default profile",
    ),
    "cannotRenameDefault": MessageLookupByLibrary.simpleMessage(
      "Cannot rename default profile",
    ),
    "castConnected": MessageLookupByLibrary.simpleMessage("Connected"),
    "castConnectedTo": m1,
    "castFailed": MessageLookupByLibrary.simpleMessage(
      "This video cannot be cast",
    ),
    "castStop": MessageLookupByLibrary.simpleMessage("Stop casting"),
    "castTitle": MessageLookupByLibrary.simpleMessage("Cast"),
    "castUnavailable": MessageLookupByLibrary.simpleMessage(
      "Cast is not available on this device",
    ),
    "channelSubscribers": m2,
    "channels": MessageLookupByLibrary.simpleMessage("चैनल"),
    "clearAll": MessageLookupByLibrary.simpleMessage("सब साफ़ करें"),
    "clearAllHistory": MessageLookupByLibrary.simpleMessage(
      "Clear all history",
    ),
    "clearAllHistoryConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to clear all watch history?",
    ),
    "clearAllSaved": MessageLookupByLibrary.simpleMessage("Clear all saved"),
    "clearAllSavedConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to remove all saved videos?",
    ),
    "clearLogs": MessageLookupByLibrary.simpleMessage("Clear logs"),
    "clearSleepTimer": MessageLookupByLibrary.simpleMessage(
      "Clear Sleep Timer",
    ),
    "commentAuthorNotFound": MessageLookupByLibrary.simpleMessage("Not found"),
    "commentsDisabled": MessageLookupByLibrary.simpleMessage(
      "Comments are disabled",
    ),
    "commonSettingsTitle": MessageLookupByLibrary.simpleMessage("Common"),
    "completed": MessageLookupByLibrary.simpleMessage("पूरा हुआ"),
    "contentFilterAdvanced": MessageLookupByLibrary.simpleMessage(
      "Advanced content filter",
    ),
    "contentFilterAdvancedDescription": MessageLookupByLibrary.simpleMessage(
      "Hide videos by keyword, channel or type. Keywords wrapped in slashes are treated as regular expressions.",
    ),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Copied to clipboard",
    ),
    "copyLink": MessageLookupByLibrary.simpleMessage("लिंक कॉपी करें"),
    "create": MessageLookupByLibrary.simpleMessage("Create"),
    "createAction": MessageLookupByLibrary.simpleMessage("Create"),
    "createFirstGroup": MessageLookupByLibrary.simpleMessage(
      "Create your first subscription group to organize channels",
    ),
    "customTimer": MessageLookupByLibrary.simpleMessage("Custom Timer"),
    "customTimerDescription": MessageLookupByLibrary.simpleMessage(
      "Set a custom duration for the timer",
    ),
    "dataSaver": MessageLookupByLibrary.simpleMessage("Data Saver Mode"),
    "dataSaverDescription": MessageLookupByLibrary.simpleMessage(
      "Reduce data usage while streaming videos",
    ),
    "dateAdded": MessageLookupByLibrary.simpleMessage("Date added"),
    "dearrow": MessageLookupByLibrary.simpleMessage("DeArrow"),
    "dearrowDescription": MessageLookupByLibrary.simpleMessage(
      "Get better titles and thumbnails without clickbait",
    ),
    "dearrowInfo": MessageLookupByLibrary.simpleMessage(
      "DeArrow provides cleaner titles and thumbnails. Works best when enabled.",
    ),
    "debugConsole": MessageLookupByLibrary.simpleMessage("Debug Console"),
    "defaultPlaybackSpeed": MessageLookupByLibrary.simpleMessage(
      "Default Speed",
    ),
    "defaultProfile": MessageLookupByLibrary.simpleMessage("Default"),
    "defaultQuality": MessageLookupByLibrary.simpleMessage("Default Quality"),
    "delete": MessageLookupByLibrary.simpleMessage("हटाएं"),
    "deleteDownload": MessageLookupByLibrary.simpleMessage("Delete Download"),
    "deleteDownloadConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this download?",
    ),
    "deleteGroup": MessageLookupByLibrary.simpleMessage("Delete Group"),
    "deleteGroupConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this group? Channels will not be deleted.",
    ),
    "deletePlaylistAction": MessageLookupByLibrary.simpleMessage(
      "Delete playlist",
    ),
    "deletePlaylistConfirm": m3,
    "deletePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "Delete Playlist",
    ),
    "deleteProfile": MessageLookupByLibrary.simpleMessage("प्रोफ़ाइल हटाएं"),
    "deleteVideo": MessageLookupByLibrary.simpleMessage("Delete video"),
    "deleteVideoConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to remove this video?",
    ),
    "developer": MessageLookupByLibrary.simpleMessage("Developer"),
    "disableAutoplayOnCellular": MessageLookupByLibrary.simpleMessage(
      "Disable Autoplay on Cellular",
    ),
    "disableAutoplayOnCellularDescription":
        MessageLookupByLibrary.simpleMessage(
          "Don\'t autoplay videos when using mobile data",
        ),
    "disablePipPlayer": MessageLookupByLibrary.simpleMessage(
      "Disable PIP player",
    ),
    "disableVideoHistory": MessageLookupByLibrary.simpleMessage(
      "Disable video history",
    ),
    "dislike": MessageLookupByLibrary.simpleMessage("नापसंद"),
    "distractionFree": MessageLookupByLibrary.simpleMessage("Distraction Free"),
    "doubleTapToExpandDescription": MessageLookupByLibrary.simpleMessage(
      "Double tap mini player to expand",
    ),
    "doubleTapToExpandMiniPlayer": MessageLookupByLibrary.simpleMessage(
      "Double Tap to Expand",
    ),
    "download": MessageLookupByLibrary.simpleMessage("डाउनलोड"),
    "downloadAutoDelete": MessageLookupByLibrary.simpleMessage(
      "Auto Delete After Watch",
    ),
    "downloadAutoDeleteDescription": MessageLookupByLibrary.simpleMessage(
      "Automatically delete downloaded videos after watching",
    ),
    "downloadFailed": m4,
    "downloadOverWifiOnly": MessageLookupByLibrary.simpleMessage(
      "Download Over Wi-Fi Only",
    ),
    "downloadOverWifiOnlyDescription": MessageLookupByLibrary.simpleMessage(
      "Only download when connected to Wi-Fi",
    ),
    "downloadPreferences": MessageLookupByLibrary.simpleMessage(
      "Download Preferences",
    ),
    "downloadPreferencesDescription": MessageLookupByLibrary.simpleMessage(
      "Configure download preferences",
    ),
    "downloadQuality": MessageLookupByLibrary.simpleMessage("Download Quality"),
    "downloadQueueItems": MessageLookupByLibrary.simpleMessage(
      "Download Queue Items",
    ),
    "downloadQueueItemsDescription": MessageLookupByLibrary.simpleMessage(
      "Download videos that are added to the queue",
    ),
    "downloadStarted": MessageLookupByLibrary.simpleMessage("डाउनलोड शुरू हुआ"),
    "downloadSubtitles": MessageLookupByLibrary.simpleMessage(
      "Download Subtitles",
    ),
    "downloadSubtitlesDescription": MessageLookupByLibrary.simpleMessage(
      "Automatically download subtitles with videos",
    ),
    "downloadType": MessageLookupByLibrary.simpleMessage("Download Type"),
    "downloading": MessageLookupByLibrary.simpleMessage("डाउनलोड हो रहा है"),
    "downloadingAudio": MessageLookupByLibrary.simpleMessage(
      "Downloading audio",
    ),
    "downloadingVideo": MessageLookupByLibrary.simpleMessage(
      "Downloading video",
    ),
    "downloads": MessageLookupByLibrary.simpleMessage("डाउनलोड"),
    "duration": MessageLookupByLibrary.simpleMessage("Duration"),
    "enableHlsPlayerDescription": MessageLookupByLibrary.simpleMessage(
      "Enable HLS player to unlock all quality options. Disable if errors occur.",
    ),
    "enableSwipeGestures": MessageLookupByLibrary.simpleMessage(
      "Enable Swipe Gestures",
    ),
    "exportData": MessageLookupByLibrary.simpleMessage("Export Data"),
    "exportSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Export Subscriptions",
    ),
    "exportSuccess": MessageLookupByLibrary.simpleMessage("Export successful"),
    "failed": MessageLookupByLibrary.simpleMessage("विफल"),
    "failedToOpenFile": MessageLookupByLibrary.simpleMessage(
      "Failed to open file",
    ),
    "fileNotFound": MessageLookupByLibrary.simpleMessage("File not found"),
    "filterAll": MessageLookupByLibrary.simpleMessage("All"),
    "filterChannels": MessageLookupByLibrary.simpleMessage("Channels"),
    "filterLevel": MessageLookupByLibrary.simpleMessage("Filter Level"),
    "filterMusic": MessageLookupByLibrary.simpleMessage("Music"),
    "filterPlaylists": MessageLookupByLibrary.simpleMessage("Playlists"),
    "filterStandardDescription": MessageLookupByLibrary.simpleMessage(
      "Standard filtering - blocks most inappropriate content",
    ),
    "filterStrictDescription": MessageLookupByLibrary.simpleMessage(
      "Strict filtering - blocks all potentially inappropriate content",
    ),
    "filterVideos": MessageLookupByLibrary.simpleMessage("Videos"),
    "france": MessageLookupByLibrary.simpleMessage("France"),
    "gestureControls": MessageLookupByLibrary.simpleMessage("Gesture Controls"),
    "gestureControlsDescription": MessageLookupByLibrary.simpleMessage(
      "Swipe gestures for video playback",
    ),
    "groupChannelCount": MessageLookupByLibrary.simpleMessage("0 channels"),
    "groupCreated": MessageLookupByLibrary.simpleMessage(
      "Group created successfully",
    ),
    "groupDeleted": MessageLookupByLibrary.simpleMessage("Group deleted"),
    "groupNameHint": MessageLookupByLibrary.simpleMessage("Enter group name"),
    "groupRenamed": MessageLookupByLibrary.simpleMessage("Group renamed"),
    "hideComments": MessageLookupByLibrary.simpleMessage("Hide Comments"),
    "hideCommentsButtonFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "Hide comments button from watch screen.",
    ),
    "hidePaidPromotions": MessageLookupByLibrary.simpleMessage(
      "Hide paid promotions",
    ),
    "hidePaidPromotionsDescription": MessageLookupByLibrary.simpleMessage(
      "Hide paid, membership-only and promoted videos.",
    ),
    "hideRelated": MessageLookupByLibrary.simpleMessage("Hide Related"),
    "hideRelatedVideosFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "Hide related videos from watch screen",
    ),
    "hideShorts": MessageLookupByLibrary.simpleMessage("Hide Shorts"),
    "hideShortsDescription": MessageLookupByLibrary.simpleMessage(
      "Hide YouTube Shorts entries from feeds.",
    ),
    "hideWatchedVideos": MessageLookupByLibrary.simpleMessage(
      "Hide Watched Videos",
    ),
    "hideWatchedVideosDescription": MessageLookupByLibrary.simpleMessage(
      "Don\'t show already watched videos in feeds",
    ),
    "history": MessageLookupByLibrary.simpleMessage("इतिहास"),
    "hlsPlayer": MessageLookupByLibrary.simpleMessage("Hls Player"),
    "home": MessageLookupByLibrary.simpleMessage("होम"),
    "homeFeedMode": MessageLookupByLibrary.simpleMessage("Home Feed"),
    "homeFeedModeAuto": MessageLookupByLibrary.simpleMessage("Auto"),
    "homeFeedModeAutoHint": MessageLookupByLibrary.simpleMessage(
      "Show subscriptions if available, otherwise trending",
    ),
    "homeFeedModeFeedOnly": MessageLookupByLibrary.simpleMessage(
      "Subscriptions",
    ),
    "homeFeedModeFeedOnlyHint": MessageLookupByLibrary.simpleMessage(
      "Only show videos from subscribed channels",
    ),
    "homeFeedModeTrendingOnly": MessageLookupByLibrary.simpleMessage(
      "Trending",
    ),
    "homeFeedModeTrendingOnlyHint": MessageLookupByLibrary.simpleMessage(
      "Always show trending videos only",
    ),
    "imageCacheLabel": MessageLookupByLibrary.simpleMessage("Image Cache"),
    "importData": MessageLookupByLibrary.simpleMessage("Import Data"),
    "importError": MessageLookupByLibrary.simpleMessage("Import failed"),
    "importSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Import Subscriptions",
    ),
    "importSuccess": MessageLookupByLibrary.simpleMessage("Import successful"),
    "includeSubtitles": MessageLookupByLibrary.simpleMessage(
      "Include Subtitles",
    ),
    "includeSubtitlesDescription": MessageLookupByLibrary.simpleMessage(
      "Include subtitles in downloaded videos",
    ),
    "includeTitle": MessageLookupByLibrary.simpleMessage("Include title"),
    "india": MessageLookupByLibrary.simpleMessage("India"),
    "instances": MessageLookupByLibrary.simpleMessage("Instances"),
    "interaction": MessageLookupByLibrary.simpleMessage("Interaction"),
    "intro": MessageLookupByLibrary.simpleMessage("Intro"),
    "isBookmarksEnabled": MessageLookupByLibrary.simpleMessage(
      "Is Bookmarks Enabled",
    ),
    "isDeArrowEnabled": MessageLookupByLibrary.simpleMessage(
      "Is DeArrow Enabled",
    ),
    "isDownloadAutoDeleteEnabled": MessageLookupByLibrary.simpleMessage(
      "Is Download Auto Delete Enabled",
    ),
    "isDownloadOverWifiOnlyEnabled": MessageLookupByLibrary.simpleMessage(
      "Is Download Over Wi-Fi Only Enabled",
    ),
    "isDownloadSubtitlesEnabled": MessageLookupByLibrary.simpleMessage(
      "Is Download Subtitles Enabled",
    ),
    "isMiniPlayerEnabled": MessageLookupByLibrary.simpleMessage(
      "Is Mini Player Enabled",
    ),
    "isRestrictedModeEnabled": MessageLookupByLibrary.simpleMessage(
      "Is Restricted Mode Enabled",
    ),
    "isSwipeGesturesEnabled": MessageLookupByLibrary.simpleMessage(
      "Is Swipe Gestures Enabled",
    ),
    "language": MessageLookupByLibrary.simpleMessage("भाषा"),
    "library": MessageLookupByLibrary.simpleMessage("लाइब्रेरी"),
    "like": MessageLookupByLibrary.simpleMessage("पसंद"),
    "localPlaylists": MessageLookupByLibrary.simpleMessage("Playlists"),
    "logsLabel": MessageLookupByLibrary.simpleMessage("Logs"),
    "managePlaylists": MessageLookupByLibrary.simpleMessage("Manage Playlists"),
    "merging": MessageLookupByLibrary.simpleMessage("मर्ज हो रहा है"),
    "miniPlayer": MessageLookupByLibrary.simpleMessage("Mini Player"),
    "miniPlayerDescription": MessageLookupByLibrary.simpleMessage(
      "Play videos in a small floating window",
    ),
    "miniPlayerEnabled": MessageLookupByLibrary.simpleMessage(
      "Mini Player Enabled",
    ),
    "mobileDataQuality": MessageLookupByLibrary.simpleMessage(
      "Mobile Data Quality",
    ),
    "mobileDataQualityDescription": MessageLookupByLibrary.simpleMessage(
      "Video quality for mobile data connections",
    ),
    "musicOfftopic": MessageLookupByLibrary.simpleMessage("Music: Non-Music"),
    "netherlands": MessageLookupByLibrary.simpleMessage("Netherlands"),
    "newGroup": MessageLookupByLibrary.simpleMessage("New Group"),
    "newNameHint": MessageLookupByLibrary.simpleMessage("New name"),
    "newPlaylist": MessageLookupByLibrary.simpleMessage("New Playlist"),
    "newPlaylistShort": MessageLookupByLibrary.simpleMessage("+ New"),
    "newProfileName": MessageLookupByLibrary.simpleMessage("New Profile Name"),
    "newVideoNotifications": MessageLookupByLibrary.simpleMessage(
      "New upload notifications",
    ),
    "newVideoNotificationsDescription": MessageLookupByLibrary.simpleMessage(
      "Get notified when channels you subscribe to upload",
    ),
    "noCommentsFound": MessageLookupByLibrary.simpleMessage(
      "No Comments Found",
    ),
    "noDownloads": MessageLookupByLibrary.simpleMessage("कोई डाउनलोड नहीं"),
    "noDownloadsHint": MessageLookupByLibrary.simpleMessage(
      "Downloaded videos will appear here",
    ),
    "noGroupsYet": MessageLookupByLibrary.simpleMessage("No groups yet"),
    "noHistory": MessageLookupByLibrary.simpleMessage("कोई इतिहास नहीं"),
    "noLogs": MessageLookupByLibrary.simpleMessage("No logs yet"),
    "noPlaylists": MessageLookupByLibrary.simpleMessage(
      "No playlists available",
    ),
    "noPlaylistsSelected": MessageLookupByLibrary.simpleMessage(
      "No playlists selected",
    ),
    "noPlaylistsYet": MessageLookupByLibrary.simpleMessage(
      "No playlists yet.\nTap + to create one.",
    ),
    "noPlaylistsYetPicker": MessageLookupByLibrary.simpleMessage(
      "No playlists yet.\nTap + New to create one.",
    ),
    "noSavedVideos": MessageLookupByLibrary.simpleMessage("No saved videos"),
    "noShorts": MessageLookupByLibrary.simpleMessage("No shorts available"),
    "noShortsHint": MessageLookupByLibrary.simpleMessage(
      "छोटे वीडियो यहाँ दिखेंगे",
    ),
    "noSubscriptions": MessageLookupByLibrary.simpleMessage(
      "कोई सब्सक्रिप्शन नहीं",
    ),
    "noSubscriptionsHint": MessageLookupByLibrary.simpleMessage(
      "Subscribe to channels to see their videos here",
    ),
    "noUploadDate": MessageLookupByLibrary.simpleMessage("No date"),
    "noUploaderName": MessageLookupByLibrary.simpleMessage("No name"),
    "noVideoAvailableChangedToHls": MessageLookupByLibrary.simpleMessage(
      "No video source available, automatically changed to hls",
    ),
    "noVideoDescription": MessageLookupByLibrary.simpleMessage(
      "No description",
    ),
    "noVideoTitle": MessageLookupByLibrary.simpleMessage("No title"),
    "noVideosFound": MessageLookupByLibrary.simpleMessage("No videos found"),
    "noVideosInPlaylist": MessageLookupByLibrary.simpleMessage("No videos yet"),
    "notificationControls": MessageLookupByLibrary.simpleMessage(
      "Notification Controls",
    ),
    "notificationControlsDescription": MessageLookupByLibrary.simpleMessage(
      "Show media playback controls in notification",
    ),
    "notificationsDenied": MessageLookupByLibrary.simpleMessage(
      "Notification permission was denied",
    ),
    "openInBrowser": MessageLookupByLibrary.simpleMessage("ब्राउज़र में खोलें"),
    "openLinksExternally": MessageLookupByLibrary.simpleMessage(
      "Open links in external browser",
    ),
    "organizeSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Organize your subscriptions into groups",
    ),
    "outro": MessageLookupByLibrary.simpleMessage("Outro"),
    "pause": MessageLookupByLibrary.simpleMessage("रोकें"),
    "pauseOnCall": MessageLookupByLibrary.simpleMessage("Pause on Phone Call"),
    "pauseOnHeadphones": MessageLookupByLibrary.simpleMessage(
      "Pause on Headphone Disconnect",
    ),
    "pauseTimer": MessageLookupByLibrary.simpleMessage("Pause Timer"),
    "paused": MessageLookupByLibrary.simpleMessage("रोका गया"),
    "pending": MessageLookupByLibrary.simpleMessage("प्रतीक्षारत"),
    "pinned": MessageLookupByLibrary.simpleMessage("Pinned"),
    "platformLabel": MessageLookupByLibrary.simpleMessage("Platform"),
    "playAll": MessageLookupByLibrary.simpleMessage("Play all"),
    "playNext": MessageLookupByLibrary.simpleMessage("Play next"),
    "playbackSpeed": MessageLookupByLibrary.simpleMessage("Playback Speed"),
    "playbackSpeedDescription": MessageLookupByLibrary.simpleMessage(
      "Set default playback speed for videos",
    ),
    "playlist": MessageLookupByLibrary.simpleMessage("Playlist"),
    "playlistBookmarks": MessageLookupByLibrary.simpleMessage(
      "Playlist Bookmarks",
    ),
    "playlistBookmarksDescription": MessageLookupByLibrary.simpleMessage(
      "Automatically bookmark playlists you subscribe to.",
    ),
    "playlistNameHint": MessageLookupByLibrary.simpleMessage("Playlist name"),
    "playlistNotFound": MessageLookupByLibrary.simpleMessage(
      "Playlist not found",
    ),
    "playlists": MessageLookupByLibrary.simpleMessage("प्लेलिस्ट"),
    "profileInUse": MessageLookupByLibrary.simpleMessage("Active"),
    "profileName": MessageLookupByLibrary.simpleMessage("Profile Name"),
    "profiles": MessageLookupByLibrary.simpleMessage("प्रोफ़ाइल"),
    "profilesDescription": MessageLookupByLibrary.simpleMessage(
      "Create separate profiles for different accounts or preferences",
    ),
    "quality1080p": MessageLookupByLibrary.simpleMessage("1080p"),
    "quality1440p": MessageLookupByLibrary.simpleMessage("1440p"),
    "quality144p": MessageLookupByLibrary.simpleMessage("144p"),
    "quality240p": MessageLookupByLibrary.simpleMessage("240p"),
    "quality360p": MessageLookupByLibrary.simpleMessage("360p"),
    "quality480p": MessageLookupByLibrary.simpleMessage("480p"),
    "quality720p": MessageLookupByLibrary.simpleMessage("720p"),
    "queue": MessageLookupByLibrary.simpleMessage("Queue"),
    "queueAutoDismiss": MessageLookupByLibrary.simpleMessage(
      "Auto Dismiss Queue",
    ),
    "queueAutoDismissDescription": MessageLookupByLibrary.simpleMessage(
      "Automatically hide queue after a set time",
    ),
    "queueClear": MessageLookupByLibrary.simpleMessage("Clear"),
    "queueDismissTimeout": MessageLookupByLibrary.simpleMessage(
      "Queue Dismiss Timeout",
    ),
    "queueEmpty": MessageLookupByLibrary.simpleMessage("Queue is empty"),
    "queueShuffle": MessageLookupByLibrary.simpleMessage("Shuffle"),
    "quickOptions": MessageLookupByLibrary.simpleMessage("Quick Options"),
    "readMoreText": MessageLookupByLibrary.simpleMessage("Read more"),
    "recentSearches": MessageLookupByLibrary.simpleMessage("Recent searches"),
    "refresh": MessageLookupByLibrary.simpleMessage("रीफ्रेश करें"),
    "refreshToLoad": MessageLookupByLibrary.simpleMessage(
      "Pull down to refresh",
    ),
    "region": MessageLookupByLibrary.simpleMessage("क्षेत्र"),
    "relatedTitle": MessageLookupByLibrary.simpleMessage("Related"),
    "removeFromHistory": MessageLookupByLibrary.simpleMessage(
      "Remove from history",
    ),
    "removeFromQueue": MessageLookupByLibrary.simpleMessage(
      "Remove from queue",
    ),
    "removeFromSaved": MessageLookupByLibrary.simpleMessage(
      "Remove from saved",
    ),
    "renameAction": MessageLookupByLibrary.simpleMessage("Rename"),
    "renameGroup": MessageLookupByLibrary.simpleMessage("Rename Group"),
    "renamePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "Rename Playlist",
    ),
    "renameProfile": MessageLookupByLibrary.simpleMessage("Rename Profile"),
    "repeatAll": MessageLookupByLibrary.simpleMessage("सभी दोहराएँ"),
    "repeatOff": MessageLookupByLibrary.simpleMessage("दोहराव बंद"),
    "repeatOne": MessageLookupByLibrary.simpleMessage("एक दोहराएँ"),
    "repliesNotSupported": MessageLookupByLibrary.simpleMessage(
      "Replies are not available yet",
    ),
    "repliesPlural": m5,
    "restrictedMode": MessageLookupByLibrary.simpleMessage("Restricted Mode"),
    "restrictedModeDescription": MessageLookupByLibrary.simpleMessage(
      "Filter out potentially mature content",
    ),
    "restrictedModeEnabled": MessageLookupByLibrary.simpleMessage(
      "Restricted Mode Enabled",
    ),
    "resume": MessageLookupByLibrary.simpleMessage("जारी रखें"),
    "resumeTimer": MessageLookupByLibrary.simpleMessage("Resume Timer"),
    "retrieveDislikeCounts": MessageLookupByLibrary.simpleMessage(
      "Retrieve dislike counts",
    ),
    "retrieveDislikes": MessageLookupByLibrary.simpleMessage(
      "Retrieve Dislikes",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("फिर कोशिश करें"),
    "richCaptionRendering": MessageLookupByLibrary.simpleMessage(
      "Rich Caption Rendering",
    ),
    "richCaptionRenderingDescription": MessageLookupByLibrary.simpleMessage(
      "Render captions with styling and formatting",
    ),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "saveToDevice": MessageLookupByLibrary.simpleMessage("Save to Device"),
    "saveToDeviceFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to save to device",
    ),
    "saveToPlaylist": MessageLookupByLibrary.simpleMessage("Save to playlist"),
    "saved": MessageLookupByLibrary.simpleMessage("सेव किए गए"),
    "savedToDevice": MessageLookupByLibrary.simpleMessage("Saved to device"),
    "savedVideosTitle": MessageLookupByLibrary.simpleMessage("Saved Videos"),
    "savingToDevice": MessageLookupByLibrary.simpleMessage(
      "Saving to device...",
    ),
    "search": MessageLookupByLibrary.simpleMessage("खोज"),
    "searchFilters": MessageLookupByLibrary.simpleMessage("Filters"),
    "searchForVideosChannels": MessageLookupByLibrary.simpleMessage(
      "Search for videos, channels, and playlists",
    ),
    "searchHistoryEnabled": MessageLookupByLibrary.simpleMessage(
      "Save Search History",
    ),
    "searchHistoryEnabledDescription": MessageLookupByLibrary.simpleMessage(
      "Save your search queries for quick access",
    ),
    "searchSavedVideos": MessageLookupByLibrary.simpleMessage(
      "Search saved videos...",
    ),
    "searchSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Search subscriptions...",
    ),
    "searchYouTube": MessageLookupByLibrary.simpleMessage("Search YouTube..."),
    "seconds": MessageLookupByLibrary.simpleMessage("seconds"),
    "selectAll": MessageLookupByLibrary.simpleMessage("सब चुनें"),
    "selectFile": MessageLookupByLibrary.simpleMessage("Select File"),
    "selectPlaylists": MessageLookupByLibrary.simpleMessage("Select Playlists"),
    "selectVideos": MessageLookupByLibrary.simpleMessage("Select videos"),
    "selected": MessageLookupByLibrary.simpleMessage("selected"),
    "selectedPlaylists": MessageLookupByLibrary.simpleMessage(
      "Selected Playlists",
    ),
    "selfPromotion": MessageLookupByLibrary.simpleMessage("Self Promotion"),
    "service": MessageLookupByLibrary.simpleMessage("Service"),
    "serviceDescription": MessageLookupByLibrary.simpleMessage(
      "Choose your video service provider",
    ),
    "serviceExplode": MessageLookupByLibrary.simpleMessage("Explode"),
    "serviceInvidious": MessageLookupByLibrary.simpleMessage("Invidious"),
    "serviceNewPipe": MessageLookupByLibrary.simpleMessage("NewPipe Extractor"),
    "servicePiped": MessageLookupByLibrary.simpleMessage("Piped"),
    "setDownloadQuality": MessageLookupByLibrary.simpleMessage(
      "Set Download Quality",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("सेटिंग्स"),
    "share": MessageLookupByLibrary.simpleMessage("शेयर"),
    "shareLogs": MessageLookupByLibrary.simpleMessage("Share logs"),
    "shareVia": MessageLookupByLibrary.simpleMessage("Share via"),
    "shorts": MessageLookupByLibrary.simpleMessage("शॉर्ट्स"),
    "showLessText": MessageLookupByLibrary.simpleMessage("Show less"),
    "showRelatedInQueue": MessageLookupByLibrary.simpleMessage(
      "Show Related Videos in Queue",
    ),
    "showRelatedInQueueDescription": MessageLookupByLibrary.simpleMessage(
      "Automatically add related videos to the playlist queue",
    ),
    "showSearchHistory": MessageLookupByLibrary.simpleMessage(
      "Show Search History",
    ),
    "showSearchHistoryDescription": MessageLookupByLibrary.simpleMessage(
      "Display your recent searches in search screen",
    ),
    "skipInterval": MessageLookupByLibrary.simpleMessage("Skip Interval"),
    "skipIntervalDescription": MessageLookupByLibrary.simpleMessage(
      "Double-tap skip duration in seconds",
    ),
    "sleepTimer": MessageLookupByLibrary.simpleMessage("स्लीप टाइमर"),
    "sleepTimerCancelled": MessageLookupByLibrary.simpleMessage(
      "Sleep timer cancelled",
    ),
    "sleepTimerCustom": MessageLookupByLibrary.simpleMessage("Custom"),
    "sleepTimerCustomTitle": MessageLookupByLibrary.simpleMessage(
      "Custom timer",
    ),
    "sleepTimerDescription": MessageLookupByLibrary.simpleMessage(
      "Pause playback after a set duration",
    ),
    "sleepTimerEndOfVideo": MessageLookupByLibrary.simpleMessage(
      "End of video",
    ),
    "sleepTimerEnded": MessageLookupByLibrary.simpleMessage(
      "स्लीप टाइमर समाप्त",
    ),
    "sleepTimerEnterMinutes": MessageLookupByLibrary.simpleMessage(
      "Enter minutes",
    ),
    "sleepTimerMinutes": m6,
    "sleepTimerMinutesShort": m7,
    "sleepTimerOff": MessageLookupByLibrary.simpleMessage("Off"),
    "sleepTimerSet": MessageLookupByLibrary.simpleMessage("सेट"),
    "sort": MessageLookupByLibrary.simpleMessage("Sort"),
    "sortBy": MessageLookupByLibrary.simpleMessage("क्रमबद्ध करें"),
    "sponsor": MessageLookupByLibrary.simpleMessage("Sponsor"),
    "sponsorBlock": MessageLookupByLibrary.simpleMessage("स्पॉन्सरब्लॉक"),
    "sponsorBlockCategories": MessageLookupByLibrary.simpleMessage(
      "Skip Categories",
    ),
    "sponsorBlockDescription": MessageLookupByLibrary.simpleMessage(
      "Skip sponsored segments automatically",
    ),
    "startDownload": MessageLookupByLibrary.simpleMessage("Start Download"),
    "startSavingVideos": MessageLookupByLibrary.simpleMessage(
      "Start saving videos to watch later",
    ),
    "subscribe": MessageLookupByLibrary.simpleMessage("सब्सक्राइब"),
    "subscriptionGroups": MessageLookupByLibrary.simpleMessage(
      "Subscription Groups",
    ),
    "subscriptions": MessageLookupByLibrary.simpleMessage("सब्सक्रिप्शन"),
    "subtitleSize": MessageLookupByLibrary.simpleMessage("Subtitle Size"),
    "subtitleSizeDescription": MessageLookupByLibrary.simpleMessage(
      "Adjust the size of subtitles on video",
    ),
    "subtitleSizeExtraLarge": MessageLookupByLibrary.simpleMessage(
      "Extra Large",
    ),
    "subtitleSizeLarge": MessageLookupByLibrary.simpleMessage("Large"),
    "subtitleSizeMedium": MessageLookupByLibrary.simpleMessage("Medium"),
    "subtitleSizeSmall": MessageLookupByLibrary.simpleMessage("Small"),
    "swipeDirection": MessageLookupByLibrary.simpleMessage("Swipe Direction"),
    "swipeDirectionDescription": MessageLookupByLibrary.simpleMessage(
      "Content swipe direction (left-to-right or right-to-left)",
    ),
    "swipeDownToDismissDisabled": MessageLookupByLibrary.simpleMessage(
      "\'Swipe down to dismiss\' disabled",
    ),
    "swipeForBrightness": MessageLookupByLibrary.simpleMessage(
      "Swipe for Brightness",
    ),
    "swipeForBrightnessDescription": MessageLookupByLibrary.simpleMessage(
      "Swipe up/down on left side to adjust brightness",
    ),
    "swipeForVolume": MessageLookupByLibrary.simpleMessage("Swipe for Volume"),
    "swipeForVolumeDescription": MessageLookupByLibrary.simpleMessage(
      "Swipe up/down on right side to adjust volume",
    ),
    "swipeToSeek": MessageLookupByLibrary.simpleMessage("Swipe to Seek"),
    "swipeToSeekDescription": MessageLookupByLibrary.simpleMessage(
      "Swipe left/right on video to seek forward/backward",
    ),
    "swipeUpToDismissEnabled": MessageLookupByLibrary.simpleMessage(
      "\'Swipe up to dismiss\' enabled",
    ),
    "switchProfile": MessageLookupByLibrary.simpleMessage("प्रोफ़ाइल बदलें"),
    "switchRegion": MessageLookupByLibrary.simpleMessage(
      "Please consider switching to a different region for better results.",
    ),
    "switchToBilibili": MessageLookupByLibrary.simpleMessage(
      "Switch to Bilibili",
    ),
    "switchToBilibiliDescription": MessageLookupByLibrary.simpleMessage(
      "Change service from YouTube to Bilibili",
    ),
    "tapToExpandDescription": MessageLookupByLibrary.simpleMessage(
      "Tap mini player to expand to full screen",
    ),
    "tapToExpandMiniPlayer": MessageLookupByLibrary.simpleMessage(
      "Tap to Expand",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("थीम"),
    "themeDark": MessageLookupByLibrary.simpleMessage("गहरा"),
    "themeDynamic": MessageLookupByLibrary.simpleMessage("मटेरियल यू"),
    "themeLight": MessageLookupByLibrary.simpleMessage("हल्का"),
    "themeOled": MessageLookupByLibrary.simpleMessage("OLED ब्लैक"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("सिस्टम"),
    "thereIsNoSavedOrHistoryVideos": MessageLookupByLibrary.simpleMessage(
      "There are no saved/history videos",
    ),
    "thereIsNoSavedVideos": MessageLookupByLibrary.simpleMessage(
      "There are no saved videos",
    ),
    "timerAlreadyFinished": MessageLookupByLibrary.simpleMessage(
      "Playback will not be affected",
    ),
    "timerFinished": MessageLookupByLibrary.simpleMessage("Timer finished"),
    "timerPaused": MessageLookupByLibrary.simpleMessage("Timer is paused"),
    "timerRunning": MessageLookupByLibrary.simpleMessage("Timer is running"),
    "title": MessageLookupByLibrary.simpleMessage("Title"),
    "toggleBookmarkPlaylist": MessageLookupByLibrary.simpleMessage(
      "Toggle Bookmark Playlist",
    ),
    "toggleBookmarks": MessageLookupByLibrary.simpleMessage("Toggle Bookmarks"),
    "toggleDeArrow": MessageLookupByLibrary.simpleMessage("Toggle DeArrow"),
    "toggleDownloadAutoDelete": MessageLookupByLibrary.simpleMessage(
      "Toggle Download Auto Delete",
    ),
    "toggleDownloadOverWifiOnly": MessageLookupByLibrary.simpleMessage(
      "Toggle Download Over Wi-Fi Only",
    ),
    "toggleDownloadSubtitles": MessageLookupByLibrary.simpleMessage(
      "Toggle Download Subtitles",
    ),
    "toggleMiniPlayer": MessageLookupByLibrary.simpleMessage(
      "Toggle Mini Player",
    ),
    "toggleRestrictedMode": MessageLookupByLibrary.simpleMessage(
      "Toggle Restricted Mode",
    ),
    "toggleSwipeGestures": MessageLookupByLibrary.simpleMessage(
      "Toggle Swipe Gestures",
    ),
    "translators": MessageLookupByLibrary.simpleMessage("Translators"),
    "trending": MessageLookupByLibrary.simpleMessage("ट्रेंडिंग"),
    "unitedKingdom": MessageLookupByLibrary.simpleMessage("United Kingdom"),
    "unitedStates": MessageLookupByLibrary.simpleMessage("United States"),
    "unknown": MessageLookupByLibrary.simpleMessage("unknown"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "An unknown error occurred",
    ),
    "unknownQuality": MessageLookupByLibrary.simpleMessage("Unknown Quality"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("अनसब्सक्राइब"),
    "unsubscribeConfirm": MessageLookupByLibrary.simpleMessage(
      "Unsubscribe from this channel?",
    ),
    "version": MessageLookupByLibrary.simpleMessage("संस्करण"),
    "video": MessageLookupByLibrary.simpleMessage("Video"),
    "videoAudio": MessageLookupByLibrary.simpleMessage("Video+Audio"),
    "videoCountLabel": m8,
    "videoFit": MessageLookupByLibrary.simpleMessage("Video Fit"),
    "videoFitContain": MessageLookupByLibrary.simpleMessage("Contain"),
    "videoFitCover": MessageLookupByLibrary.simpleMessage("Cover"),
    "videoFitFill": MessageLookupByLibrary.simpleMessage("Fill"),
    "videoFitFitHeight": MessageLookupByLibrary.simpleMessage("Fit Height"),
    "videoFitFitWidth": MessageLookupByLibrary.simpleMessage("Fit Width"),
    "videoOnly": MessageLookupByLibrary.simpleMessage("केवल वीडियो"),
    "videoQuality": MessageLookupByLibrary.simpleMessage("वीडियो क्वालिटी"),
    "videoViews": m9,
    "videoWithAudio": MessageLookupByLibrary.simpleMessage("वीडियो + ऑडियो"),
    "videos": MessageLookupByLibrary.simpleMessage("वीडियो"),
    "views": MessageLookupByLibrary.simpleMessage("व्यूज़"),
    "watchSomeVideos": MessageLookupByLibrary.simpleMessage(
      "आपके देखे वीडियो यहाँ दिखेंगे",
    ),
    "youtube": MessageLookupByLibrary.simpleMessage("YouTube"),
    "youtubeService": MessageLookupByLibrary.simpleMessage("यूट्यूब सेवा"),
  };
}
