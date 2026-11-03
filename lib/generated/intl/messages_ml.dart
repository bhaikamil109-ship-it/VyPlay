// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ml locale. All the
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
  String get localeName => 'ml';

  static String m0(name) => "${name}-ലേക്ക് ചേർത്തു";

  static String m1(device) => "${device}-ലേക്ക് കാസ്റ്റ് ചെയ്യുന്നു";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'സബ്സ്ക്രൈബർമാർ ഇല്ല', one: 'സബ്സ്ക്രൈബർ', other: 'സബ്സ്ക്രൈബർമാർ')}";

  static String m3(name) => "${name} ഇല്ലാതാക്കണമോ?";

  static String m4(title) => "ഡൗൺലോഡ് പരാജയപ്പെട്ടു: ${title}";

  static String m5(count) =>
      "${Intl.plural(count, one: 'മറുപടി', other: 'മറുപടികൾ')}";

  static String m6(count) => "${count} മിനിറ്റ്";

  static String m7(count) => "${count} മിനിറ്റ്";

  static String m8(count) => "${count} വീഡിയോകൾ";

  static String m9(count) =>
      "${Intl.plural(count, zero: 'കാഴ്ചക്കാർ ഇല്ല', one: 'കാഴ്ച', other: 'കാഴ്ചക്കാർ')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("എന്നെക്കുറിച്ച്"),
    "addProfile": MessageLookupByLibrary.simpleMessage("പ്രൊഫൈൽ ചേർക്കുക"),
    "addToQueue": MessageLookupByLibrary.simpleMessage("ക്യൂവിലേക്ക് ചേർക്കുക"),
    "addVideosHint": MessageLookupByLibrary.simpleMessage(
      "ഒരു വീഡിയോ പ്ലേലിസ്റ്റിൽ സേവ് ചെയ്യാൻ അതിൽ ദീർഘനേരം അമർത്തുക",
    ),
    "addedToPlayNext": MessageLookupByLibrary.simpleMessage(
      "അടുത്തതായി പ്ലേ ചെയ്യാൻ ചേർത്തു",
    ),
    "addedToPlaylist": m0,
    "addedToQueue": MessageLookupByLibrary.simpleMessage(
      "ക്യൂവിലേക്ക് ചേർത്തു",
    ),
    "all": MessageLookupByLibrary.simpleMessage("എല്ലാം"),
    "audio": MessageLookupByLibrary.simpleMessage("ഓഡിയോ"),
    "audioFocus": MessageLookupByLibrary.simpleMessage("ഓഡിയോ ഫോക്കസ്"),
    "audioFocusDescription": MessageLookupByLibrary.simpleMessage(
      "തടസ്സങ്ങളിൽ പ്ലേബാക്ക് താൽക്കാലികമായി നിർത്തുക",
    ),
    "audioOnly": MessageLookupByLibrary.simpleMessage("ഓഡിയോ മാത്രം"),
    "audioQuality": MessageLookupByLibrary.simpleMessage("ഓഡിയോ നിലവാരം"),
    "autoPip": MessageLookupByLibrary.simpleMessage("സ്വയമേവ പിക്ചർ-ഇൻ-പിക്ചർ"),
    "autoPipDescription": MessageLookupByLibrary.simpleMessage(
      "പ്ലേബാക്ക് സമയത്ത് ഹോം ബട്ടൺ അമർത്തുമ്പോൾ സ്വയമേവ PiP മോഡിലേക്ക് പോകുക",
    ),
    "autoScrollOff": MessageLookupByLibrary.simpleMessage(
      "സ്വയമേവ സ്ക്രോൾ ഓഫ്",
    ),
    "autoScrollOn": MessageLookupByLibrary.simpleMessage("സ്വയമേവ സ്ക്രോൾ ഓൺ"),
    "backupRestore": MessageLookupByLibrary.simpleMessage(
      "ബാക്കപ്പും പുനഃസ്ഥാപനവും",
    ),
    "backupRestoreDescription": MessageLookupByLibrary.simpleMessage(
      "നിങ്ങളുടെ സബ്സ്ക്രിപ്ഷനുകൾ എക്സ്പോർട്ട് അല്ലെങ്കിൽ ഇംപോർട്ട് ചെയ്യുക",
    ),
    "canada": MessageLookupByLibrary.simpleMessage("കാനഡ"),
    "cancel": MessageLookupByLibrary.simpleMessage("റദ്ദാക്കുക"),
    "cancelled": MessageLookupByLibrary.simpleMessage("റദ്ദാക്കി"),
    "cannotDeleteDefault": MessageLookupByLibrary.simpleMessage(
      "സ്ഥിരസ്ഥിതി പ്രൊഫൈൽ ഇല്ലാതാക്കാനാവില്ല",
    ),
    "cannotRenameDefault": MessageLookupByLibrary.simpleMessage(
      "സ്ഥിരസ്ഥിതി പ്രൊഫൈൽ പേരുമാറ്റാനാവില്ല",
    ),
    "castConnected": MessageLookupByLibrary.simpleMessage("ബന്ധിപ്പിച്ചു"),
    "castConnectedTo": m1,
    "castFailed": MessageLookupByLibrary.simpleMessage(
      "ഈ വീഡിയോ കാസ്റ്റ് ചെയ്യാനാവില്ല",
    ),
    "castStop": MessageLookupByLibrary.simpleMessage("കാസ്റ്റിംഗ് നിർത്തുക"),
    "castTitle": MessageLookupByLibrary.simpleMessage("കാസ്റ്റ്"),
    "castUnavailable": MessageLookupByLibrary.simpleMessage(
      "ഈ ഉപകരണത്തിൽ കാസ്റ്റിംഗ് ലഭ്യമല്ല",
    ),
    "channelSubscribers": m2,
    "channels": MessageLookupByLibrary.simpleMessage("ചാനലുകൾ"),
    "clearAll": MessageLookupByLibrary.simpleMessage("എല്ലാം മായ്ക്കുക"),
    "clearAllHistory": MessageLookupByLibrary.simpleMessage(
      "ചരിത്രമെല്ലാം മായ്ക്കുക",
    ),
    "clearAllHistoryConfirm": MessageLookupByLibrary.simpleMessage(
      "കാഴ്ചാ ചരിത്രമെല്ലാം മായ്ക്കണമെന്ന് ഉറപ്പാണോ?",
    ),
    "clearAllSaved": MessageLookupByLibrary.simpleMessage(
      "സേവ് ചെയ്തതെല്ലാം മായ്ക്കുക",
    ),
    "clearAllSavedConfirm": MessageLookupByLibrary.simpleMessage(
      "സേവ് ചെയ്ത എല്ലാ വീഡിയോകളും നീക്കം ചെയ്യണമെന്ന് ഉറപ്പാണോ?",
    ),
    "clearLogs": MessageLookupByLibrary.simpleMessage("ലോഗുകൾ മായ്ക്കുക"),
    "commentAuthorNotFound": MessageLookupByLibrary.simpleMessage(
      "കണ്ടെത്തിയില്ല",
    ),
    "commentsDisabled": MessageLookupByLibrary.simpleMessage(
      "കമന്റുകൾ പ്രവർത്തനരഹിതമാണ്",
    ),
    "commonSettingsTitle": MessageLookupByLibrary.simpleMessage("പൊതുവായവ"),
    "completed": MessageLookupByLibrary.simpleMessage("പൂർത്തിയായി"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "ക്ലിപ്പ്ബോർഡിലേക്ക് പകർത്തി",
    ),
    "copyLink": MessageLookupByLibrary.simpleMessage("ലിങ്ക് പകർത്തുക"),
    "createAction": MessageLookupByLibrary.simpleMessage("സൃഷ്ടിക്കുക"),
    "dateAdded": MessageLookupByLibrary.simpleMessage("ചേർത്ത തീയതി"),
    "debugConsole": MessageLookupByLibrary.simpleMessage("ഡീബഗ് കൺസോൾ"),
    "defaultProfile": MessageLookupByLibrary.simpleMessage("സ്ഥിരസ്ഥിതി"),
    "defaultQuality": MessageLookupByLibrary.simpleMessage("സാധാരണ ക്വാളിറ്റി"),
    "delete": MessageLookupByLibrary.simpleMessage("ഇല്ലാതാക്കുക"),
    "deleteDownload": MessageLookupByLibrary.simpleMessage(
      "ഡൗൺലോഡ് ഇല്ലാതാക്കുക",
    ),
    "deleteDownloadConfirm": MessageLookupByLibrary.simpleMessage(
      "ഈ ഡൗൺലോഡ് ഇല്ലാതാക്കണമെന്ന് ഉറപ്പാണോ?",
    ),
    "deletePlaylistAction": MessageLookupByLibrary.simpleMessage(
      "പ്ലേലിസ്റ്റ് ഇല്ലാതാക്കുക",
    ),
    "deletePlaylistConfirm": m3,
    "deletePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "പ്ലേലിസ്റ്റ് ഇല്ലാതാക്കുക",
    ),
    "deleteProfile": MessageLookupByLibrary.simpleMessage(
      "പ്രൊഫൈൽ ഇല്ലാതാക്കുക",
    ),
    "deleteVideo": MessageLookupByLibrary.simpleMessage("വീഡിയോ ഇല്ലാതാക്കുക"),
    "deleteVideoConfirm": MessageLookupByLibrary.simpleMessage(
      "ഈ വീഡിയോ നീക്കം ചെയ്യണമെന്ന് ഉറപ്പാണോ?",
    ),
    "developer": MessageLookupByLibrary.simpleMessage("ഡെവലപ്പർ"),
    "disablePipPlayer": MessageLookupByLibrary.simpleMessage(
      "PIP പ്ലേയർ പ്രവർത്തനരഹിതമാക്കുക",
    ),
    "disableVideoHistory": MessageLookupByLibrary.simpleMessage(
      "കണ്ട വീഡിയോകൾ മറച്ചുവെക്കുക",
    ),
    "dislike": MessageLookupByLibrary.simpleMessage("ഇഷ്ടമില്ല"),
    "distractionFree": MessageLookupByLibrary.simpleMessage(
      "ശ്രദ്ധ തിരിയാതിരിക്കാൻ",
    ),
    "download": MessageLookupByLibrary.simpleMessage("ഡൗൺലോഡ്"),
    "downloadFailed": m4,
    "downloadStarted": MessageLookupByLibrary.simpleMessage(
      "ഡൗൺലോഡ് ആരംഭിച്ചു",
    ),
    "downloadType": MessageLookupByLibrary.simpleMessage("ഡൗൺലോഡ് തരം"),
    "downloading": MessageLookupByLibrary.simpleMessage("ഡൗൺലോഡ് ചെയ്യുന്നു"),
    "downloadingAudio": MessageLookupByLibrary.simpleMessage(
      "ഓഡിയോ ഡൗൺലോഡ് ചെയ്യുന്നു",
    ),
    "downloadingVideo": MessageLookupByLibrary.simpleMessage(
      "വീഡിയോ ഡൗൺലോഡ് ചെയ്യുന്നു",
    ),
    "downloads": MessageLookupByLibrary.simpleMessage("ഡൗൺലോഡുകൾ"),
    "duration": MessageLookupByLibrary.simpleMessage("ദൈർഘ്യം"),
    "enableHlsPlayerDescription": MessageLookupByLibrary.simpleMessage(
      "എല്ലാ ക്വാളിറ്റി ഓപ്ഷനുകളും ലഭ്യമാകാൻ HLS പ്ലെയർ ഓൺ ചെയ്യുക. പിശകുകൾ സംഭവിച്ചാൽ ഓഫ് ചെയ്യുക.",
    ),
    "exportData": MessageLookupByLibrary.simpleMessage(
      "ഡാറ്റ എക്സ്പോർട്ട് ചെയ്യുക",
    ),
    "exportSubscriptions": MessageLookupByLibrary.simpleMessage(
      "സബ്സ്ക്രിപ്ഷനുകൾ എക്സ്പോർട്ട് ചെയ്യുക",
    ),
    "exportSuccess": MessageLookupByLibrary.simpleMessage(
      "എക്സ്പോർട്ട് വിജയിച്ചു",
    ),
    "failed": MessageLookupByLibrary.simpleMessage("പരാജയപ്പെട്ടു"),
    "failedToOpenFile": MessageLookupByLibrary.simpleMessage(
      "ഫയൽ തുറക്കാനായില്ല",
    ),
    "fileNotFound": MessageLookupByLibrary.simpleMessage("ഫയൽ കണ്ടെത്തിയില്ല"),
    "filterAll": MessageLookupByLibrary.simpleMessage("എല്ലാം"),
    "filterChannels": MessageLookupByLibrary.simpleMessage("ചാനലുകൾ"),
    "filterMusic": MessageLookupByLibrary.simpleMessage("സംഗീതം"),
    "filterPlaylists": MessageLookupByLibrary.simpleMessage("പ്ലേലിസ്റ്റുകൾ"),
    "filterVideos": MessageLookupByLibrary.simpleMessage("വീഡിയോകൾ"),
    "france": MessageLookupByLibrary.simpleMessage("ഫ്രാൻസ്"),
    "hideComments": MessageLookupByLibrary.simpleMessage("കമൻ്റുകൾ മറയ്ക്കുക"),
    "hideCommentsButtonFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "വാച്ച് സ്ക്രീനിൽ നിന്ന് കമൻ്റുകൾ മറയ്ക്കുക.",
    ),
    "hideRelated": MessageLookupByLibrary.simpleMessage(
      "അനുബന്ധപ്പെട്ടവ മറയ്ക്കുക",
    ),
    "hideRelatedVideosFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "വാച്ച് സ്ക്രീനിൽ നിന്ന് അനുബന്ധ വീഡിയോകൾ മറയ്ക്കുക",
    ),
    "history": MessageLookupByLibrary.simpleMessage("കണ്ടു കഴിഞ്ഞത്"),
    "hlsPlayer": MessageLookupByLibrary.simpleMessage("HLS പ്ലെയർ"),
    "home": MessageLookupByLibrary.simpleMessage("ഹോം"),
    "homeFeedMode": MessageLookupByLibrary.simpleMessage("ഹോം ഫീഡ്"),
    "homeFeedModeAuto": MessageLookupByLibrary.simpleMessage("സ്വയമേവ"),
    "homeFeedModeAutoHint": MessageLookupByLibrary.simpleMessage(
      "സബ്സ്ക്രിപ്ഷനുകൾ ഉണ്ടെങ്കിൽ അവ, അല്ലെങ്കിൽ ട്രെൻഡിംഗ് കാണിക്കുക",
    ),
    "homeFeedModeFeedOnly": MessageLookupByLibrary.simpleMessage(
      "സബ്സ്ക്രിപ്ഷനുകൾ",
    ),
    "homeFeedModeFeedOnlyHint": MessageLookupByLibrary.simpleMessage(
      "സബ്സ്ക്രൈബ് ചെയ്ത ചാനലുകളുടെ വീഡിയോകൾ മാത്രം കാണിക്കുക",
    ),
    "homeFeedModeTrendingOnly": MessageLookupByLibrary.simpleMessage(
      "ട്രെൻഡിംഗ്",
    ),
    "homeFeedModeTrendingOnlyHint": MessageLookupByLibrary.simpleMessage(
      "എപ്പോഴും ട്രെൻഡിംഗ് വീഡിയോകൾ മാത്രം കാണിക്കുക",
    ),
    "imageCacheLabel": MessageLookupByLibrary.simpleMessage("ഇമേജ് കാഷെ"),
    "importData": MessageLookupByLibrary.simpleMessage(
      "ഡാറ്റ ഇംപോർട്ട് ചെയ്യുക",
    ),
    "importError": MessageLookupByLibrary.simpleMessage(
      "ഇംപോർട്ട് പരാജയപ്പെട്ടു",
    ),
    "importSubscriptions": MessageLookupByLibrary.simpleMessage(
      "സബ്സ്ക്രിപ്ഷനുകൾ ഇംപോർട്ട് ചെയ്യുക",
    ),
    "importSuccess": MessageLookupByLibrary.simpleMessage(
      "ഇംപോർട്ട് വിജയിച്ചു",
    ),
    "includeTitle": MessageLookupByLibrary.simpleMessage(
      "ശീർഷകം ഉൾപ്പെടുത്തുക",
    ),
    "india": MessageLookupByLibrary.simpleMessage("ഇന്ത്യ"),
    "instances": MessageLookupByLibrary.simpleMessage("Instances"),
    "interaction": MessageLookupByLibrary.simpleMessage("ഇടപെടൽ"),
    "intro": MessageLookupByLibrary.simpleMessage("ആമുഖം"),
    "language": MessageLookupByLibrary.simpleMessage("ഭാഷ"),
    "library": MessageLookupByLibrary.simpleMessage("ലൈബ്രറി"),
    "like": MessageLookupByLibrary.simpleMessage("ഇഷ്ടം"),
    "localPlaylists": MessageLookupByLibrary.simpleMessage("പ്ലേലിസ്റ്റുകൾ"),
    "logsLabel": MessageLookupByLibrary.simpleMessage("ലോഗുകൾ"),
    "merging": MessageLookupByLibrary.simpleMessage("ലയിപ്പിക്കുന്നു"),
    "musicOfftopic": MessageLookupByLibrary.simpleMessage(
      "സംഗീതം: സംഗീതമല്ലാത്തത്",
    ),
    "netherlands": MessageLookupByLibrary.simpleMessage("നെതർലാൻഡ്‌സ്"),
    "newNameHint": MessageLookupByLibrary.simpleMessage("പുതിയ പേര്"),
    "newPlaylist": MessageLookupByLibrary.simpleMessage("പുതിയ പ്ലേലിസ്റ്റ്"),
    "newPlaylistShort": MessageLookupByLibrary.simpleMessage("+ പുതിയത്"),
    "newProfileName": MessageLookupByLibrary.simpleMessage(
      "പുതിയ പ്രൊഫൈൽ പേര്",
    ),
    "newVideoNotifications": MessageLookupByLibrary.simpleMessage(
      "പുതിയ വീഡിയോ അറിയിപ്പുകൾ",
    ),
    "newVideoNotificationsDescription": MessageLookupByLibrary.simpleMessage(
      "നിങ്ങൾ സബ്സ്ക്രൈബ് ചെയ്ത ചാനലുകൾ അപ്ലോഡ് ചെയ്യുമ്പോൾ അറിയിപ്പ് ലഭിക്കുക",
    ),
    "noCommentsFound": MessageLookupByLibrary.simpleMessage(
      "അഭിപ്രായങ്ങൾ ലഭ്യമല്ല.",
    ),
    "noDownloads": MessageLookupByLibrary.simpleMessage("ഡൗൺലോഡുകളില്ല"),
    "noDownloadsHint": MessageLookupByLibrary.simpleMessage(
      "ഡൗൺലോഡ് ചെയ്ത വീഡിയോകൾ ഇവിടെ വരും",
    ),
    "noHistory": MessageLookupByLibrary.simpleMessage("കാഴ്ചാ ചരിത്രമില്ല"),
    "noLogs": MessageLookupByLibrary.simpleMessage("ഇതുവരെ ലോഗുകളില്ല"),
    "noPlaylists": MessageLookupByLibrary.simpleMessage(
      "പ്ലേലിസ്റ്റുകൾ ലഭ്യമല്ല",
    ),
    "noPlaylistsYet": MessageLookupByLibrary.simpleMessage(
      "ഇതുവരെ പ്ലേലിസ്റ്റുകളില്ല.\nസൃഷ്ടിക്കാൻ + അമർത്തുക.",
    ),
    "noPlaylistsYetPicker": MessageLookupByLibrary.simpleMessage(
      "ഇതുവരെ പ്ലേലിസ്റ്റുകളില്ല.\nസൃഷ്ടിക്കാൻ + പുതിയത് അമർത്തുക.",
    ),
    "noSavedVideos": MessageLookupByLibrary.simpleMessage(
      "സേവ് ചെയ്ത വീഡിയോകളില്ല",
    ),
    "noShorts": MessageLookupByLibrary.simpleMessage("Shorts ലഭ്യമല്ല"),
    "noShortsHint": MessageLookupByLibrary.simpleMessage(
      "Short videos will appear here",
    ),
    "noSubscriptions": MessageLookupByLibrary.simpleMessage(
      "സബ്സ്ക്രിപ്ഷനുകൾ ഇല്ല",
    ),
    "noSubscriptionsHint": MessageLookupByLibrary.simpleMessage(
      "ചാനലുകൾ സബ്സ്ക്രൈബ് ചെയ്താൽ അവയുടെ വീഡിയോകൾ ഇവിടെ കാണാം",
    ),
    "noUploadDate": MessageLookupByLibrary.simpleMessage("തീയതി ഇല്ല"),
    "noUploaderName": MessageLookupByLibrary.simpleMessage("പേര് ലഭ്യമല്ല"),
    "noVideoAvailableChangedToHls": MessageLookupByLibrary.simpleMessage(
      "കാണാൻ സ്രോതസ്സ് ഇല്ല, സ്വയം HLS ആയി മാറ്റിയിരിക്കുന്നു",
    ),
    "noVideoDescription": MessageLookupByLibrary.simpleMessage("വിവരണം ഇല്ല"),
    "noVideoTitle": MessageLookupByLibrary.simpleMessage("ശീർഷകം ഇല്ല"),
    "noVideosFound": MessageLookupByLibrary.simpleMessage(
      "വീഡിയോകൾ കണ്ടെത്തിയില്ല",
    ),
    "noVideosInPlaylist": MessageLookupByLibrary.simpleMessage(
      "ഇതുവരെ വീഡിയോകളില്ല",
    ),
    "notificationsDenied": MessageLookupByLibrary.simpleMessage(
      "അറിയിപ്പ് അനുമതി നിഷേധിച്ചു",
    ),
    "openInBrowser": MessageLookupByLibrary.simpleMessage("ബ്രൗസറിൽ തുറക്കുക"),
    "openLinksExternally": MessageLookupByLibrary.simpleMessage(
      "ലിങ്കുകൾ ബാഹ്യ ബ്രൗസറിൽ തുറക്കുക",
    ),
    "outro": MessageLookupByLibrary.simpleMessage("സമാപനം"),
    "pause": MessageLookupByLibrary.simpleMessage("നിർത്തുക"),
    "pauseOnCall": MessageLookupByLibrary.simpleMessage("ഫോൺ കോളിൽ നിർത്തുക"),
    "pauseOnHeadphones": MessageLookupByLibrary.simpleMessage(
      "ഹെഡ്ഫോൺ വിച്ഛേദിക്കുമ്പോൾ നിർത്തുക",
    ),
    "paused": MessageLookupByLibrary.simpleMessage("താൽക്കാലികമായി നിർത്തി"),
    "pending": MessageLookupByLibrary.simpleMessage("കാത്തിരിക്കുന്നു"),
    "pinned": MessageLookupByLibrary.simpleMessage("പിൻ ചെയ്തത്"),
    "platformLabel": MessageLookupByLibrary.simpleMessage("പ്ലാറ്റ്ഫോം"),
    "playAll": MessageLookupByLibrary.simpleMessage("എല്ലാം പ്ലേ ചെയ്യുക"),
    "playNext": MessageLookupByLibrary.simpleMessage("അടുത്തത് പ്ലേ ചെയ്യുക"),
    "playlist": MessageLookupByLibrary.simpleMessage("പ്ലേലിസ്റ്റ്"),
    "playlistNameHint": MessageLookupByLibrary.simpleMessage(
      "പ്ലേലിസ്റ്റ് പേര്",
    ),
    "playlistNotFound": MessageLookupByLibrary.simpleMessage(
      "പ്ലേലിസ്റ്റ് കണ്ടെത്തിയില്ല",
    ),
    "playlists": MessageLookupByLibrary.simpleMessage("പ്ലേലിസ്റ്റുകൾ"),
    "profileInUse": MessageLookupByLibrary.simpleMessage("സജീവം"),
    "profileName": MessageLookupByLibrary.simpleMessage("പ്രൊഫൈൽ പേര്"),
    "profiles": MessageLookupByLibrary.simpleMessage("പ്രൊഫൈലുകൾ"),
    "profilesDescription": MessageLookupByLibrary.simpleMessage(
      "വ്യത്യസ്ത അക്കൗണ്ടുകൾക്കോ മുൻഗണനകൾക്കോ വേറിട്ട പ്രൊഫൈലുകൾ സൃഷ്ടിക്കുക",
    ),
    "quality1080p": MessageLookupByLibrary.simpleMessage("1080p"),
    "quality1440p": MessageLookupByLibrary.simpleMessage("1440p"),
    "quality144p": MessageLookupByLibrary.simpleMessage("144p"),
    "quality240p": MessageLookupByLibrary.simpleMessage("240p"),
    "quality360p": MessageLookupByLibrary.simpleMessage("360p"),
    "quality480p": MessageLookupByLibrary.simpleMessage("480p"),
    "quality720p": MessageLookupByLibrary.simpleMessage("720p"),
    "queue": MessageLookupByLibrary.simpleMessage("ക്യൂ"),
    "queueClear": MessageLookupByLibrary.simpleMessage("മായ്ക്കുക"),
    "queueEmpty": MessageLookupByLibrary.simpleMessage("ക്യൂ ശൂന്യമാണ്"),
    "queueShuffle": MessageLookupByLibrary.simpleMessage("ഷഫിൾ"),
    "readMoreText": MessageLookupByLibrary.simpleMessage("കൂടുതൽ വായിക്കുക"),
    "recentSearches": MessageLookupByLibrary.simpleMessage("സമീപകാല തിരയലുകൾ"),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "refreshToLoad": MessageLookupByLibrary.simpleMessage(
      "പുതുക്കാൻ താഴേക്ക് വലിക്കുക",
    ),
    "region": MessageLookupByLibrary.simpleMessage("പ്രദേശം"),
    "relatedTitle": MessageLookupByLibrary.simpleMessage("സംബന്ധിച്ചവ"),
    "removeFromHistory": MessageLookupByLibrary.simpleMessage(
      "ചരിത്രത്തിൽ നിന്ന് നീക്കുക",
    ),
    "removeFromQueue": MessageLookupByLibrary.simpleMessage(
      "ക്യൂവിൽ നിന്ന് നീക്കുക",
    ),
    "removeFromSaved": MessageLookupByLibrary.simpleMessage(
      "സേവ് ചെയ്തവയിൽ നിന്ന് നീക്കുക",
    ),
    "renameAction": MessageLookupByLibrary.simpleMessage("പേരുമാറ്റുക"),
    "renamePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "പ്ലേലിസ്റ്റ് പേരുമാറ്റുക",
    ),
    "renameProfile": MessageLookupByLibrary.simpleMessage(
      "പ്രൊഫൈൽ പേരുമാറ്റുക",
    ),
    "repliesNotSupported": MessageLookupByLibrary.simpleMessage(
      "മറുപടികൾ ഇപ്പോൾ ലഭ്യമല്ല",
    ),
    "repliesPlural": m5,
    "resume": MessageLookupByLibrary.simpleMessage("തുടരുക"),
    "retrieveDislikeCounts": MessageLookupByLibrary.simpleMessage(
      "ഡിസ്ലൈക്ക് എണ്ണങ്ങൾ വീണ്ടെടുക്കുക",
    ),
    "retrieveDislikes": MessageLookupByLibrary.simpleMessage(
      "ഡിസ്ലൈക്കുകൾ വീണ്ടെടുക്കുക",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("വീണ്ടും ശ്രമിക്കുക"),
    "saveToDevice": MessageLookupByLibrary.simpleMessage(
      "ഉപകരണത്തിൽ സേവ് ചെയ്യുക",
    ),
    "saveToDeviceFailed": MessageLookupByLibrary.simpleMessage(
      "ഉപകരണത്തിൽ സേവ് ചെയ്യാൻ പരാജയപ്പെട്ടു",
    ),
    "saveToPlaylist": MessageLookupByLibrary.simpleMessage(
      "പ്ലേലിസ്റ്റിൽ സേവ് ചെയ്യുക",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("സേവ് ചെയ്‌തത്"),
    "savedToDevice": MessageLookupByLibrary.simpleMessage(
      "ഉപകരണത്തിൽ സേവ് ചെയ്തു",
    ),
    "savedVideosTitle": MessageLookupByLibrary.simpleMessage("സേവ് ചെയ്‌തവ"),
    "savingToDevice": MessageLookupByLibrary.simpleMessage(
      "ഉപകരണത്തിൽ സേവ് ചെയ്യുന്നു...",
    ),
    "search": MessageLookupByLibrary.simpleMessage("തിരയുക"),
    "searchFilters": MessageLookupByLibrary.simpleMessage("ഫിൽട്ടറുകൾ"),
    "searchForVideosChannels": MessageLookupByLibrary.simpleMessage(
      "വീഡിയോകൾ, ചാനലുകൾ, പ്ലേലിസ്റ്റുകൾ തിരയുക",
    ),
    "searchHistoryEnabled": MessageLookupByLibrary.simpleMessage(
      "തിരയൽ ചരിത്രം സേവ് ചെയ്യുക",
    ),
    "searchHistoryEnabledDescription": MessageLookupByLibrary.simpleMessage(
      "വേഗത്തിലുള്ള ആക്സസിനായി തിരയൽ ചോദ്യങ്ങൾ സേവ് ചെയ്യുക",
    ),
    "searchSavedVideos": MessageLookupByLibrary.simpleMessage(
      "സേവ് ചെയ്ത വീഡിയോകളിൽ തിരയുക...",
    ),
    "searchSubscriptions": MessageLookupByLibrary.simpleMessage(
      "സബ്സ്ക്രിപ്ഷനുകളിൽ തിരയുക...",
    ),
    "searchYouTube": MessageLookupByLibrary.simpleMessage(
      "YouTube-ൽ തിരയുക...",
    ),
    "seconds": MessageLookupByLibrary.simpleMessage("സെക്കൻഡ്"),
    "selectAll": MessageLookupByLibrary.simpleMessage("എല്ലാം തിരഞ്ഞെടുക്കുക"),
    "selectFile": MessageLookupByLibrary.simpleMessage("ഫയൽ തിരഞ്ഞെടുക്കുക"),
    "selectVideos": MessageLookupByLibrary.simpleMessage(
      "വീഡിയോകൾ തിരഞ്ഞെടുക്കുക",
    ),
    "selected": MessageLookupByLibrary.simpleMessage("തിരഞ്ഞെടുത്തു"),
    "selfPromotion": MessageLookupByLibrary.simpleMessage("സ്വയം പ്രചാരണം"),
    "serviceExplode": MessageLookupByLibrary.simpleMessage("Explode"),
    "serviceInvidious": MessageLookupByLibrary.simpleMessage("Invidious"),
    "serviceNewPipe": MessageLookupByLibrary.simpleMessage("NewPipe Extractor"),
    "servicePiped": MessageLookupByLibrary.simpleMessage("Piped"),
    "settings": MessageLookupByLibrary.simpleMessage("ക്രമീകരണങ്ങൾ"),
    "share": MessageLookupByLibrary.simpleMessage("പങ്കിടുക"),
    "shareLogs": MessageLookupByLibrary.simpleMessage("ലോഗുകൾ പങ്കിടുക"),
    "shareVia": MessageLookupByLibrary.simpleMessage("പങ്കിടുക"),
    "shorts": MessageLookupByLibrary.simpleMessage("Shorts"),
    "showLessText": MessageLookupByLibrary.simpleMessage("കുറച്ചത് കാണിക്കുക"),
    "showSearchHistory": MessageLookupByLibrary.simpleMessage(
      "തിരയൽ ചരിത്രം കാണിക്കുക",
    ),
    "showSearchHistoryDescription": MessageLookupByLibrary.simpleMessage(
      "തിരയൽ സ്ക്രീനിൽ സമീപകാല തിരയലുകൾ കാണിക്കുക",
    ),
    "skipInterval": MessageLookupByLibrary.simpleMessage("സ്കിപ്പ് ഇടവേള"),
    "skipIntervalDescription": MessageLookupByLibrary.simpleMessage(
      "ഇരട്ട ടാപ്പ് സ്കിപ്പ് ദൈർഘ്യം സെക്കൻഡിൽ",
    ),
    "sleepTimer": MessageLookupByLibrary.simpleMessage("സ്ലീപ്പ് ടൈമർ"),
    "sleepTimerCustom": MessageLookupByLibrary.simpleMessage("ഇഷ്ടാനുസൃതം"),
    "sleepTimerCustomTitle": MessageLookupByLibrary.simpleMessage(
      "ഇഷ്ടാനുസൃത ടൈമർ",
    ),
    "sleepTimerEndOfVideo": MessageLookupByLibrary.simpleMessage(
      "വീഡിയോ അവസാനിക്കുമ്പോൾ",
    ),
    "sleepTimerEnded": MessageLookupByLibrary.simpleMessage(
      "സ്ലീപ്പ് ടൈമർ അവസാനിച്ചു",
    ),
    "sleepTimerEnterMinutes": MessageLookupByLibrary.simpleMessage(
      "മിനിറ്റുകൾ നൽകുക",
    ),
    "sleepTimerMinutes": m6,
    "sleepTimerMinutesShort": m7,
    "sleepTimerOff": MessageLookupByLibrary.simpleMessage("ഓഫ്"),
    "sleepTimerSet": MessageLookupByLibrary.simpleMessage("സെറ്റ് ചെയ്യുക"),
    "sort": MessageLookupByLibrary.simpleMessage("ക്രമീകരിക്കുക"),
    "sortBy": MessageLookupByLibrary.simpleMessage("ക്രമീകരിക്കുക"),
    "sponsor": MessageLookupByLibrary.simpleMessage("സ്പോൺസർ"),
    "sponsorBlock": MessageLookupByLibrary.simpleMessage("SponsorBlock"),
    "sponsorBlockCategories": MessageLookupByLibrary.simpleMessage(
      "ഒഴിവാക്കേണ്ട വിഭാഗങ്ങൾ",
    ),
    "sponsorBlockDescription": MessageLookupByLibrary.simpleMessage(
      "സ്പോൺസർ ചെയ്ത ഭാഗങ്ങൾ സ്വയമേവ ഒഴിവാക്കുക",
    ),
    "startDownload": MessageLookupByLibrary.simpleMessage("ഡൗൺലോഡ് ആരംഭിക്കുക"),
    "startSavingVideos": MessageLookupByLibrary.simpleMessage(
      "പിന്നീട് കാണാൻ വീഡിയോകൾ സേവ് ചെയ്യാൻ തുടങ്ങുക",
    ),
    "subscribe": MessageLookupByLibrary.simpleMessage("സബ്സ്ക്രൈബ്"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("സബ്സ്ക്രിപ്ഷനുകൾ"),
    "subtitleSize": MessageLookupByLibrary.simpleMessage("സബ്ടൈറ്റിൽ വലിപ്പം"),
    "subtitleSizeDescription": MessageLookupByLibrary.simpleMessage(
      "വീഡിയോയിലെ സബ്ടൈറ്റിലുകളുടെ വലിപ്പം ക്രമീകരിക്കുക",
    ),
    "subtitleSizeExtraLarge": MessageLookupByLibrary.simpleMessage(
      "വളരെ വലുത്",
    ),
    "subtitleSizeLarge": MessageLookupByLibrary.simpleMessage("വലുത്"),
    "subtitleSizeMedium": MessageLookupByLibrary.simpleMessage("ഇടത്തരം"),
    "subtitleSizeSmall": MessageLookupByLibrary.simpleMessage("ചെറുത്"),
    "swipeDownToDismissDisabled": MessageLookupByLibrary.simpleMessage(
      "\'സ്വൈപ്പ് ഡൗൺ ചെയ്ത് ഡിസ്മിസ് ചെയ്യൽ\' പ്രവർത്തനരഹിതമാക്കിയിരിക്കുന്നു",
    ),
    "swipeUpToDismissEnabled": MessageLookupByLibrary.simpleMessage(
      "\'സ്വൈപ്പ് അപ്പ് ചെയ്ത് ഡിസ്മിസ് ചെയ്യൽ\' പ്രവർത്തന സജ്ജമാക്കിയിരിക്കുന്നു",
    ),
    "switchProfile": MessageLookupByLibrary.simpleMessage("പ്രൊഫൈൽ മാറ്റുക"),
    "switchRegion": MessageLookupByLibrary.simpleMessage(
      "മികച്ച ഫലങ്ങൾക്കായി ദയവായി വ്യത്യസ്തമായ ഒരു പ്രദേശത്തിലേക്ക് മാറുന്നതു പരിഗണിക്കുക.",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("തീം"),
    "themeDark": MessageLookupByLibrary.simpleMessage("ഡാർക്ക്"),
    "themeDynamic": MessageLookupByLibrary.simpleMessage("Material You"),
    "themeLight": MessageLookupByLibrary.simpleMessage("ലൈറ്റ്"),
    "themeOled": MessageLookupByLibrary.simpleMessage("OLED ബ്ലാക്ക്"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("സിസ്റ്റം"),
    "thereIsNoSavedOrHistoryVideos": MessageLookupByLibrary.simpleMessage(
      "സേവ് ചെയ്‌ത/കണ്ടുകഴിഞ്ഞ വീഡിയോകൾ ഇല്ല",
    ),
    "thereIsNoSavedVideos": MessageLookupByLibrary.simpleMessage(
      "സേവ് ചെയ്‌ത വീഡിയോകൾ ഇല്ല",
    ),
    "title": MessageLookupByLibrary.simpleMessage("ശീർഷകം"),
    "translators": MessageLookupByLibrary.simpleMessage("പരിഭാഷകർ"),
    "trending": MessageLookupByLibrary.simpleMessage("ട്രെൻഡിംഗ്"),
    "unitedKingdom": MessageLookupByLibrary.simpleMessage("യുണൈറ്റഡ് കിംഗ്ഡം"),
    "unitedStates": MessageLookupByLibrary.simpleMessage(
      "യുണൈറ്റഡ് സ്റ്റേറ്റ്സ്",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("അജ്ഞാതം"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "അജ്ഞാതമായ ഒരു പിശക് സംഭവിച്ചു",
    ),
    "unknownQuality": MessageLookupByLibrary.simpleMessage("അജ്ഞാത ക്വാളിറ്റി"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage(
      "അൺസബ്സ്ക്രൈബ് ചെയ്യുക",
    ),
    "unsubscribeConfirm": MessageLookupByLibrary.simpleMessage(
      "ഈ ചാനലിൽ നിന്ന് അൺസബ്സ്ക്രൈബ് ചെയ്യണമോ?",
    ),
    "version": MessageLookupByLibrary.simpleMessage("പതിപ്പ്"),
    "video": MessageLookupByLibrary.simpleMessage("വീഡിയോ"),
    "videoAudio": MessageLookupByLibrary.simpleMessage("വീഡിയോ+ഓഡിയോ"),
    "videoCountLabel": m8,
    "videoFit": MessageLookupByLibrary.simpleMessage("വീഡിയോ ഫിറ്റ്"),
    "videoFitContain": MessageLookupByLibrary.simpleMessage("ഉൾപ്പെടുത്തുക"),
    "videoFitCover": MessageLookupByLibrary.simpleMessage("നിറയ്ക്കുക"),
    "videoFitFill": MessageLookupByLibrary.simpleMessage("വലിച്ചുനീട്ടുക"),
    "videoFitFitHeight": MessageLookupByLibrary.simpleMessage(
      "ഉയരത്തിൽ ഒതുക്കുക",
    ),
    "videoFitFitWidth": MessageLookupByLibrary.simpleMessage(
      "വീതിയിൽ ഒതുക്കുക",
    ),
    "videoOnly": MessageLookupByLibrary.simpleMessage("വീഡിയോ മാത്രം"),
    "videoQuality": MessageLookupByLibrary.simpleMessage("വീഡിയോ നിലവാരം"),
    "videoViews": m9,
    "videoWithAudio": MessageLookupByLibrary.simpleMessage("വീഡിയോ + ഓഡിയോ"),
    "videos": MessageLookupByLibrary.simpleMessage("വീഡിയോകൾ"),
    "views": MessageLookupByLibrary.simpleMessage("കാഴ്ചകൾ"),
    "watchSomeVideos": MessageLookupByLibrary.simpleMessage(
      "നിങ്ങൾ കാണുന്ന വീഡിയോകൾ ഇവിടെ വരും",
    ),
    "youtubeService": MessageLookupByLibrary.simpleMessage("YouTube സേവനം"),
  };
}
