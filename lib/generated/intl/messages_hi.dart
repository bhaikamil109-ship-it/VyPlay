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

  static String m0(name) => "प्लेलिस्ट ${name} में जोड़ा";

  static String m1(device) => "${device} पर कास्ट हो रहा है";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'कोई सब्सक्राइबर नहीं', one: 'सब्सक्राइबर', other: 'सब्सक्राइबर')}";

  static String m3(name) => "${name} हटाएं?";

  static String m4(title) => "डाउनलोड विफल: ${title}";

  static String m5(count) =>
      "${Intl.plural(count, zero: '', one: 'जवाब', other: 'जवाब')}";

  static String m6(count) => "${count} मिनट";

  static String m7(count) => "${count} मि";

  static String m8(count) => "${count} वीडियो";

  static String m9(count) =>
      "${Intl.plural(count, zero: 'कोई व्यूज़ नहीं', one: 'व्यू', other: 'व्यूज़')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage(
      "ऐप के बारे में",
    ),
    "addProfile": MessageLookupByLibrary.simpleMessage(
      "Add Profile",
    ),
    "addToQueue": MessageLookupByLibrary.simpleMessage(
      "Add to queue",
    ),
    "addVideosHint": MessageLookupByLibrary.simpleMessage(
      "Long-press a video to save it to a playlist",
    ),
    "addedToPlayNext": MessageLookupByLibrary.simpleMessage(
      "Added to play next",
    ),
    "addedToPlaylist": m0,
    "addedToQueue": MessageLookupByLibrary.simpleMessage(
      "Added to queue",
    ),
    "all": MessageLookupByLibrary.simpleMessage(
      "All",
    ),
    "audio": MessageLookupByLibrary.simpleMessage(
      "Audio",
    ),
    "audioFocus": MessageLookupByLibrary.simpleMessage(
      "Audio Focus",
    ),
    "audioFocusDescription": MessageLookupByLibrary.simpleMessage(
      "Pause playback on interruptions",
    ),
    "audioOnly": MessageLookupByLibrary.simpleMessage(
      "केवल ऑडियो",
    ),
    "audioQuality": MessageLookupByLibrary.simpleMessage(
      "Audio Quality",
    ),
    "autoPip": MessageLookupByLibrary.simpleMessage(
      "Auto Picture-in-Picture",
    ),
    "autoPipDescription": MessageLookupByLibrary.simpleMessage(
      "Automatically enter PiP mode when pressing home button while video is playing",
    ),
    "autoScrollOff": MessageLookupByLibrary.simpleMessage(
      "Auto-scroll off",
    ),
    "autoScrollOn": MessageLookupByLibrary.simpleMessage(
      "Auto-scroll on",
    ),
    "backupRestore": MessageLookupByLibrary.simpleMessage(
      "Backup & Restore",
    ),
    "backupRestoreDescription": MessageLookupByLibrary.simpleMessage(
      "Export or import your subscriptions",
    ),
    "canada": MessageLookupByLibrary.simpleMessage(
      "Canada",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage(
      "रद्द करें",
    ),
    "cancelled": MessageLookupByLibrary.simpleMessage(
      "रद्द किया गया",
    ),
    "cannotDeleteDefault": MessageLookupByLibrary.simpleMessage(
      "Cannot delete default profile",
    ),
    "cannotRenameDefault": MessageLookupByLibrary.simpleMessage(
      "Cannot rename default profile",
    ),
    "castConnected": MessageLookupByLibrary.simpleMessage(
      "Connected",
    ),
    "castConnectedTo": m1,
    "castFailed": MessageLookupByLibrary.simpleMessage(
      "This video cannot be cast",
    ),
    "castStop": MessageLookupByLibrary.simpleMessage(
      "Stop casting",
    ),
    "castTitle": MessageLookupByLibrary.simpleMessage(
      "Cast",
    ),
    "castUnavailable": MessageLookupByLibrary.simpleMessage(
      "Cast is not available on this device",
    ),
    "channelSubscribers": m2,
    "channels": MessageLookupByLibrary.simpleMessage(
      "चैनल",
    ),
    "clearAll": MessageLookupByLibrary.simpleMessage(
      "सब साफ़ करें",
    ),
    "clearAllHistory": MessageLookupByLibrary.simpleMessage(
      "Clear all history",
    ),
    "clearAllHistoryConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to clear all watch history?",
    ),
    "clearAllSaved": MessageLookupByLibrary.simpleMessage(
      "Clear all saved",
    ),
    "clearAllSavedConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to remove all saved videos?",
    ),
    "clearLogs": MessageLookupByLibrary.simpleMessage(
      "Clear logs",
    ),
    "commentAuthorNotFound": MessageLookupByLibrary.simpleMessage(
      "Not found",
    ),
    "commentsDisabled": MessageLookupByLibrary.simpleMessage(
      "Comments are disabled",
    ),
    "commonSettingsTitle": MessageLookupByLibrary.simpleMessage(
      "Common",
    ),
    "completed": MessageLookupByLibrary.simpleMessage(
      "पूरा हुआ",
    ),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Copied to clipboard",
    ),
    "copyLink": MessageLookupByLibrary.simpleMessage(
      "लिंक कॉपी करें",
    ),
    "createAction": MessageLookupByLibrary.simpleMessage(
      "Create",
    ),
    "dateAdded": MessageLookupByLibrary.simpleMessage(
      "Date added",
    ),
    "debugConsole": MessageLookupByLibrary.simpleMessage(
      "Debug Console",
    ),
    "defaultProfile": MessageLookupByLibrary.simpleMessage(
      "Default",
    ),
    "defaultQuality": MessageLookupByLibrary.simpleMessage(
      "Default Quality",
    ),
    "delete": MessageLookupByLibrary.simpleMessage(
      "हटाएं",
    ),
    "deleteDownload": MessageLookupByLibrary.simpleMessage(
      "Delete Download",
    ),
    "deleteDownloadConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this download?",
    ),
    "deletePlaylistAction": MessageLookupByLibrary.simpleMessage(
      "Delete playlist",
    ),
    "deletePlaylistConfirm": m3,
    "deletePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "Delete Playlist",
    ),
    "deleteProfile": MessageLookupByLibrary.simpleMessage(
      "प्रोफ़ाइल हटाएं",
    ),
    "deleteVideo": MessageLookupByLibrary.simpleMessage(
      "Delete video",
    ),
    "deleteVideoConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to remove this video?",
    ),
    "developer": MessageLookupByLibrary.simpleMessage(
      "Developer",
    ),
    "disablePipPlayer": MessageLookupByLibrary.simpleMessage(
      "Disable PIP player",
    ),
    "disableVideoHistory": MessageLookupByLibrary.simpleMessage(
      "Disable video history",
    ),
    "dislike": MessageLookupByLibrary.simpleMessage(
      "नापसंद",
    ),
    "distractionFree": MessageLookupByLibrary.simpleMessage(
      "Distraction Free",
    ),
    "download": MessageLookupByLibrary.simpleMessage(
      "डाउनलोड",
    ),
    "downloadFailed": m4,
    "downloadStarted": MessageLookupByLibrary.simpleMessage(
      "डाउनलोड शुरू हुआ",
    ),
    "downloadType": MessageLookupByLibrary.simpleMessage(
      "Download Type",
    ),
    "downloading": MessageLookupByLibrary.simpleMessage(
      "डाउनलोड हो रहा है",
    ),
    "downloadingAudio": MessageLookupByLibrary.simpleMessage(
      "Downloading audio",
    ),
    "downloadingVideo": MessageLookupByLibrary.simpleMessage(
      "Downloading video",
    ),
    "downloads": MessageLookupByLibrary.simpleMessage(
      "डाउनलोड",
    ),
    "duration": MessageLookupByLibrary.simpleMessage(
      "Duration",
    ),
    "enableHlsPlayerDescription": MessageLookupByLibrary.simpleMessage(
      "Enable HLS player to unlock all quality options. Disable if errors occur.",
    ),
    "exportData": MessageLookupByLibrary.simpleMessage(
      "Export Data",
    ),
    "exportSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Export Subscriptions",
    ),
    "exportSuccess": MessageLookupByLibrary.simpleMessage(
      "Export successful",
    ),
    "failed": MessageLookupByLibrary.simpleMessage(
      "विफल",
    ),
    "failedToOpenFile": MessageLookupByLibrary.simpleMessage(
      "Failed to open file",
    ),
    "fileNotFound": MessageLookupByLibrary.simpleMessage(
      "File not found",
    ),
    "filterAll": MessageLookupByLibrary.simpleMessage(
      "All",
    ),
    "filterChannels": MessageLookupByLibrary.simpleMessage(
      "Channels",
    ),
    "filterMusic": MessageLookupByLibrary.simpleMessage(
      "Music",
    ),
    "filterPlaylists": MessageLookupByLibrary.simpleMessage(
      "Playlists",
    ),
    "filterVideos": MessageLookupByLibrary.simpleMessage(
      "Videos",
    ),
    "france": MessageLookupByLibrary.simpleMessage(
      "France",
    ),
    "hideComments": MessageLookupByLibrary.simpleMessage(
      "Hide Comments",
    ),
    "hideCommentsButtonFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "Hide comments button from watch screen.",
    ),
    "hideRelated": MessageLookupByLibrary.simpleMessage(
      "Hide Related",
    ),
    "hideRelatedVideosFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "Hide related videos from watch screen",
    ),
    "history": MessageLookupByLibrary.simpleMessage(
      "इतिहास",
    ),
    "hlsPlayer": MessageLookupByLibrary.simpleMessage(
      "Hls Player",
    ),
    "home": MessageLookupByLibrary.simpleMessage(
      "होम",
    ),
    "homeFeedMode": MessageLookupByLibrary.simpleMessage(
      "Home Feed",
    ),
    "homeFeedModeAuto": MessageLookupByLibrary.simpleMessage(
      "Auto",
    ),
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
    "imageCacheLabel": MessageLookupByLibrary.simpleMessage(
      "Image Cache",
    ),
    "importData": MessageLookupByLibrary.simpleMessage(
      "Import Data",
    ),
    "importError": MessageLookupByLibrary.simpleMessage(
      "Import failed",
    ),
    "importSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Import Subscriptions",
    ),
    "importSuccess": MessageLookupByLibrary.simpleMessage(
      "Import successful",
    ),
    "includeTitle": MessageLookupByLibrary.simpleMessage(
      "Include title",
    ),
    "india": MessageLookupByLibrary.simpleMessage(
      "India",
    ),
    "instances": MessageLookupByLibrary.simpleMessage(
      "Instances",
    ),
    "interaction": MessageLookupByLibrary.simpleMessage(
      "Interaction",
    ),
    "intro": MessageLookupByLibrary.simpleMessage(
      "Intro",
    ),
    "language": MessageLookupByLibrary.simpleMessage(
      "भाषा",
    ),
    "library": MessageLookupByLibrary.simpleMessage(
      "लाइब्रेरी",
    ),
    "like": MessageLookupByLibrary.simpleMessage(
      "पसंद",
    ),
    "localPlaylists": MessageLookupByLibrary.simpleMessage(
      "Playlists",
    ),
    "logsLabel": MessageLookupByLibrary.simpleMessage(
      "Logs",
    ),
    "merging": MessageLookupByLibrary.simpleMessage(
      "मर्ज हो रहा है",
    ),
    "musicOfftopic": MessageLookupByLibrary.simpleMessage(
      "Music: Non-Music",
    ),
    "netherlands": MessageLookupByLibrary.simpleMessage(
      "Netherlands",
    ),
    "newNameHint": MessageLookupByLibrary.simpleMessage(
      "New name",
    ),
    "newPlaylist": MessageLookupByLibrary.simpleMessage(
      "New Playlist",
    ),
    "newPlaylistShort": MessageLookupByLibrary.simpleMessage(
      "+ New",
    ),
    "newProfileName": MessageLookupByLibrary.simpleMessage(
      "New Profile Name",
    ),
    "newVideoNotifications": MessageLookupByLibrary.simpleMessage(
      "New upload notifications",
    ),
    "newVideoNotificationsDescription": MessageLookupByLibrary.simpleMessage(
      "Get notified when channels you subscribe to upload",
    ),
    "noCommentsFound": MessageLookupByLibrary.simpleMessage(
      "No Comments Found",
    ),
    "noDownloads": MessageLookupByLibrary.simpleMessage(
      "कोई डाउनलोड नहीं",
    ),
    "noDownloadsHint": MessageLookupByLibrary.simpleMessage(
      "Downloaded videos will appear here",
    ),
    "noHistory": MessageLookupByLibrary.simpleMessage(
      "कोई इतिहास नहीं",
    ),
    "noLogs": MessageLookupByLibrary.simpleMessage(
      "No logs yet",
    ),
    "noPlaylists": MessageLookupByLibrary.simpleMessage(
      "No playlists available",
    ),
    "noPlaylistsYet": MessageLookupByLibrary.simpleMessage(
      "No playlists yet.\nTap + to create one.",
    ),
    "noPlaylistsYetPicker": MessageLookupByLibrary.simpleMessage(
      "No playlists yet.\nTap + New to create one.",
    ),
    "noSavedVideos": MessageLookupByLibrary.simpleMessage(
      "No saved videos",
    ),
    "noShorts": MessageLookupByLibrary.simpleMessage(
      "No shorts available",
    ),
    "noShortsHint": MessageLookupByLibrary.simpleMessage(
      "छोटे वीडियो यहाँ दिखेंगे",
    ),
    "noSubscriptions": MessageLookupByLibrary.simpleMessage(
      "कोई सब्सक्रिप्शन नहीं",
    ),
    "noSubscriptionsHint": MessageLookupByLibrary.simpleMessage(
      "Subscribe to channels to see their videos here",
    ),
    "noUploadDate": MessageLookupByLibrary.simpleMessage(
      "No date",
    ),
    "noUploaderName": MessageLookupByLibrary.simpleMessage(
      "No name",
    ),
    "noVideoAvailableChangedToHls": MessageLookupByLibrary.simpleMessage(
      "No video source available, automatically changed to hls",
    ),
    "noVideoDescription": MessageLookupByLibrary.simpleMessage(
      "No description",
    ),
    "noVideoTitle": MessageLookupByLibrary.simpleMessage(
      "No title",
    ),
    "noVideosFound": MessageLookupByLibrary.simpleMessage(
      "No videos found",
    ),
    "noVideosInPlaylist": MessageLookupByLibrary.simpleMessage(
      "No videos yet",
    ),
    "notificationsDenied": MessageLookupByLibrary.simpleMessage(
      "Notification permission was denied",
    ),
    "openInBrowser": MessageLookupByLibrary.simpleMessage(
      "ब्राउज़र में खोलें",
    ),
    "openLinksExternally": MessageLookupByLibrary.simpleMessage(
      "Open links in external browser",
    ),
    "outro": MessageLookupByLibrary.simpleMessage(
      "Outro",
    ),
    "pause": MessageLookupByLibrary.simpleMessage(
      "रोकें",
    ),
    "pauseOnCall": MessageLookupByLibrary.simpleMessage(
      "Pause on Phone Call",
    ),
    "pauseOnHeadphones": MessageLookupByLibrary.simpleMessage(
      "Pause on Headphone Disconnect",
    ),
    "paused": MessageLookupByLibrary.simpleMessage(
      "रोका गया",
    ),
    "pending": MessageLookupByLibrary.simpleMessage(
      "प्रतीक्षारत",
    ),
    "pinned": MessageLookupByLibrary.simpleMessage(
      "Pinned",
    ),
    "platformLabel": MessageLookupByLibrary.simpleMessage(
      "Platform",
    ),
    "playAll": MessageLookupByLibrary.simpleMessage(
      "Play all",
    ),
    "playNext": MessageLookupByLibrary.simpleMessage(
      "Play next",
    ),
    "playlist": MessageLookupByLibrary.simpleMessage(
      "Playlist",
    ),
    "playlistNameHint": MessageLookupByLibrary.simpleMessage(
      "Playlist name",
    ),
    "playlistNotFound": MessageLookupByLibrary.simpleMessage(
      "Playlist not found",
    ),
    "playlists": MessageLookupByLibrary.simpleMessage(
      "प्लेलिस्ट",
    ),
    "profileInUse": MessageLookupByLibrary.simpleMessage(
      "Active",
    ),
    "profileName": MessageLookupByLibrary.simpleMessage(
      "Profile Name",
    ),
    "profiles": MessageLookupByLibrary.simpleMessage(
      "प्रोफ़ाइल",
    ),
    "profilesDescription": MessageLookupByLibrary.simpleMessage(
      "Create separate profiles for different accounts or preferences",
    ),
    "quality1080p": MessageLookupByLibrary.simpleMessage(
      "1080p",
    ),
    "quality1440p": MessageLookupByLibrary.simpleMessage(
      "1440p",
    ),
    "quality144p": MessageLookupByLibrary.simpleMessage(
      "144p",
    ),
    "quality240p": MessageLookupByLibrary.simpleMessage(
      "240p",
    ),
    "quality360p": MessageLookupByLibrary.simpleMessage(
      "360p",
    ),
    "quality480p": MessageLookupByLibrary.simpleMessage(
      "480p",
    ),
    "quality720p": MessageLookupByLibrary.simpleMessage(
      "720p",
    ),
    "queue": MessageLookupByLibrary.simpleMessage(
      "Queue",
    ),
    "queueClear": MessageLookupByLibrary.simpleMessage(
      "Clear",
    ),
    "queueEmpty": MessageLookupByLibrary.simpleMessage(
      "Queue is empty",
    ),
    "queueShuffle": MessageLookupByLibrary.simpleMessage(
      "Shuffle",
    ),
    "readMoreText": MessageLookupByLibrary.simpleMessage(
      "Read more",
    ),
    "recentSearches": MessageLookupByLibrary.simpleMessage(
      "Recent searches",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage(
      "रीफ्रेश करें",
    ),
    "refreshToLoad": MessageLookupByLibrary.simpleMessage(
      "Pull down to refresh",
    ),
    "region": MessageLookupByLibrary.simpleMessage(
      "क्षेत्र",
    ),
    "relatedTitle": MessageLookupByLibrary.simpleMessage(
      "Related",
    ),
    "removeFromHistory": MessageLookupByLibrary.simpleMessage(
      "Remove from history",
    ),
    "removeFromQueue": MessageLookupByLibrary.simpleMessage(
      "Remove from queue",
    ),
    "removeFromSaved": MessageLookupByLibrary.simpleMessage(
      "Remove from saved",
    ),
    "renameAction": MessageLookupByLibrary.simpleMessage(
      "Rename",
    ),
    "renamePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "Rename Playlist",
    ),
    "renameProfile": MessageLookupByLibrary.simpleMessage(
      "Rename Profile",
    ),
    "repliesNotSupported": MessageLookupByLibrary.simpleMessage(
      "Replies are not available yet",
    ),
    "repliesPlural": m5,
    "resume": MessageLookupByLibrary.simpleMessage(
      "जारी रखें",
    ),
    "retrieveDislikeCounts": MessageLookupByLibrary.simpleMessage(
      "Retrieve dislike counts",
    ),
    "retrieveDislikes": MessageLookupByLibrary.simpleMessage(
      "Retrieve Dislikes",
    ),
    "retry": MessageLookupByLibrary.simpleMessage(
      "फिर कोशिश करें",
    ),
    "saveToDevice": MessageLookupByLibrary.simpleMessage(
      "Save to Device",
    ),
    "saveToDeviceFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to save to device",
    ),
    "saveToPlaylist": MessageLookupByLibrary.simpleMessage(
      "Save to playlist",
    ),
    "saved": MessageLookupByLibrary.simpleMessage(
      "सेव किए गए",
    ),
    "savedToDevice": MessageLookupByLibrary.simpleMessage(
      "Saved to device",
    ),
    "savedVideosTitle": MessageLookupByLibrary.simpleMessage(
      "Saved Videos",
    ),
    "savingToDevice": MessageLookupByLibrary.simpleMessage(
      "Saving to device...",
    ),
    "search": MessageLookupByLibrary.simpleMessage(
      "खोज",
    ),
    "searchFilters": MessageLookupByLibrary.simpleMessage(
      "Filters",
    ),
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
    "searchYouTube": MessageLookupByLibrary.simpleMessage(
      "Search YouTube...",
    ),
    "seconds": MessageLookupByLibrary.simpleMessage(
      "seconds",
    ),
    "selectAll": MessageLookupByLibrary.simpleMessage(
      "सब चुनें",
    ),
    "selectFile": MessageLookupByLibrary.simpleMessage(
      "Select File",
    ),
    "selectVideos": MessageLookupByLibrary.simpleMessage(
      "Select videos",
    ),
    "selected": MessageLookupByLibrary.simpleMessage(
      "selected",
    ),
    "selfPromotion": MessageLookupByLibrary.simpleMessage(
      "Self Promotion",
    ),
    "serviceExplode": MessageLookupByLibrary.simpleMessage(
      "Explode",
    ),
    "serviceInvidious": MessageLookupByLibrary.simpleMessage(
      "Invidious",
    ),
    "serviceNewPipe": MessageLookupByLibrary.simpleMessage(
      "NewPipe Extractor",
    ),
    "servicePiped": MessageLookupByLibrary.simpleMessage(
      "Piped",
    ),
    "settings": MessageLookupByLibrary.simpleMessage(
      "सेटिंग्स",
    ),
    "share": MessageLookupByLibrary.simpleMessage(
      "शेयर",
    ),
    "shareLogs": MessageLookupByLibrary.simpleMessage(
      "Share logs",
    ),
    "shareVia": MessageLookupByLibrary.simpleMessage(
      "Share via",
    ),
    "shorts": MessageLookupByLibrary.simpleMessage(
      "शॉर्ट्स",
    ),
    "showLessText": MessageLookupByLibrary.simpleMessage(
      "Show less",
    ),
    "showSearchHistory": MessageLookupByLibrary.simpleMessage(
      "Show Search History",
    ),
    "showSearchHistoryDescription": MessageLookupByLibrary.simpleMessage(
      "Display your recent searches in search screen",
    ),
    "skipInterval": MessageLookupByLibrary.simpleMessage(
      "Skip Interval",
    ),
    "skipIntervalDescription": MessageLookupByLibrary.simpleMessage(
      "Double-tap skip duration in seconds",
    ),
    "sleepTimer": MessageLookupByLibrary.simpleMessage(
      "स्लीप टाइमर",
    ),
    "sleepTimerCustom": MessageLookupByLibrary.simpleMessage(
      "Custom",
    ),
    "sleepTimerCustomTitle": MessageLookupByLibrary.simpleMessage(
      "Custom timer",
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
    "sleepTimerOff": MessageLookupByLibrary.simpleMessage(
      "Off",
    ),
    "sleepTimerSet": MessageLookupByLibrary.simpleMessage(
      "सेट",
    ),
    "sort": MessageLookupByLibrary.simpleMessage(
      "Sort",
    ),
    "sortBy": MessageLookupByLibrary.simpleMessage(
      "क्रमबद्ध करें",
    ),
    "sponsor": MessageLookupByLibrary.simpleMessage(
      "Sponsor",
    ),
    "sponsorBlock": MessageLookupByLibrary.simpleMessage(
      "स्पॉन्सरब्लॉक",
    ),
    "sponsorBlockCategories": MessageLookupByLibrary.simpleMessage(
      "Skip Categories",
    ),
    "sponsorBlockDescription": MessageLookupByLibrary.simpleMessage(
      "Skip sponsored segments automatically",
    ),
    "startDownload": MessageLookupByLibrary.simpleMessage(
      "Start Download",
    ),
    "startSavingVideos": MessageLookupByLibrary.simpleMessage(
      "Start saving videos to watch later",
    ),
    "subscribe": MessageLookupByLibrary.simpleMessage(
      "सब्सक्राइब",
    ),
    "subscriptions": MessageLookupByLibrary.simpleMessage(
      "सब्सक्रिप्शन",
    ),
    "subtitleSize": MessageLookupByLibrary.simpleMessage(
      "Subtitle Size",
    ),
    "subtitleSizeDescription": MessageLookupByLibrary.simpleMessage(
      "Adjust the size of subtitles on video",
    ),
    "subtitleSizeExtraLarge": MessageLookupByLibrary.simpleMessage(
      "Extra Large",
    ),
    "subtitleSizeLarge": MessageLookupByLibrary.simpleMessage(
      "Large",
    ),
    "subtitleSizeMedium": MessageLookupByLibrary.simpleMessage(
      "Medium",
    ),
    "subtitleSizeSmall": MessageLookupByLibrary.simpleMessage(
      "Small",
    ),
    "swipeDownToDismissDisabled": MessageLookupByLibrary.simpleMessage(
      "'Swipe down to dismiss' disabled",
    ),
    "swipeUpToDismissEnabled": MessageLookupByLibrary.simpleMessage(
      "'Swipe up to dismiss' enabled",
    ),
    "switchProfile": MessageLookupByLibrary.simpleMessage(
      "प्रोफ़ाइल बदलें",
    ),
    "switchRegion": MessageLookupByLibrary.simpleMessage(
      "Please consider switching to a different region for better results.",
    ),
    "theme": MessageLookupByLibrary.simpleMessage(
      "थीम",
    ),
    "themeDark": MessageLookupByLibrary.simpleMessage(
      "गहरा",
    ),
    "themeDynamic": MessageLookupByLibrary.simpleMessage(
      "मटेरियल यू",
    ),
    "themeLight": MessageLookupByLibrary.simpleMessage(
      "हल्का",
    ),
    "themeOled": MessageLookupByLibrary.simpleMessage(
      "OLED ब्लैक",
    ),
    "themeSystem": MessageLookupByLibrary.simpleMessage(
      "सिस्टम",
    ),
    "thereIsNoSavedOrHistoryVideos": MessageLookupByLibrary.simpleMessage(
      "There are no saved/history videos",
    ),
    "thereIsNoSavedVideos": MessageLookupByLibrary.simpleMessage(
      "There are no saved videos",
    ),
    "title": MessageLookupByLibrary.simpleMessage(
      "Title",
    ),
    "translators": MessageLookupByLibrary.simpleMessage(
      "Translators",
    ),
    "trending": MessageLookupByLibrary.simpleMessage(
      "ट्रेंडिंग",
    ),
    "unitedKingdom": MessageLookupByLibrary.simpleMessage(
      "United Kingdom",
    ),
    "unitedStates": MessageLookupByLibrary.simpleMessage(
      "United States",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage(
      "unknown",
    ),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "An unknown error occurred",
    ),
    "unknownQuality": MessageLookupByLibrary.simpleMessage(
      "Unknown Quality",
    ),
    "unsubscribe": MessageLookupByLibrary.simpleMessage(
      "अनसब्सक्राइब",
    ),
    "unsubscribeConfirm": MessageLookupByLibrary.simpleMessage(
      "Unsubscribe from this channel?",
    ),
    "version": MessageLookupByLibrary.simpleMessage(
      "संस्करण",
    ),
    "video": MessageLookupByLibrary.simpleMessage(
      "Video",
    ),
    "videoAudio": MessageLookupByLibrary.simpleMessage(
      "Video+Audio",
    ),
    "videoCountLabel": m8,
    "videoFit": MessageLookupByLibrary.simpleMessage(
      "Video Fit",
    ),
    "videoFitContain": MessageLookupByLibrary.simpleMessage(
      "Contain",
    ),
    "videoFitCover": MessageLookupByLibrary.simpleMessage(
      "Cover",
    ),
    "videoFitFill": MessageLookupByLibrary.simpleMessage(
      "Fill",
    ),
    "videoFitFitHeight": MessageLookupByLibrary.simpleMessage(
      "Fit Height",
    ),
    "videoFitFitWidth": MessageLookupByLibrary.simpleMessage(
      "Fit Width",
    ),
    "videoOnly": MessageLookupByLibrary.simpleMessage(
      "केवल वीडियो",
    ),
    "videoQuality": MessageLookupByLibrary.simpleMessage(
      "वीडियो क्वालिटी",
    ),
    "videoViews": m9,
    "videoWithAudio": MessageLookupByLibrary.simpleMessage(
      "वीडियो + ऑडियो",
    ),
    "videos": MessageLookupByLibrary.simpleMessage(
      "वीडियो",
    ),
    "views": MessageLookupByLibrary.simpleMessage(
      "व्यूज़",
    ),
    "watchSomeVideos": MessageLookupByLibrary.simpleMessage(
      "आपके देखे वीडियो यहाँ दिखेंगे",
    ),
    "youtubeService": MessageLookupByLibrary.simpleMessage(
      "यूट्यूब सेवा",
    ),
  };
}
