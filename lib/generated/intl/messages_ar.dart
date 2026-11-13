// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(name) => "أضيف إلى ${name}";

  static String m1(device) => "جارٍ البث إلى ${device}";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'لا مشتركين', one: 'مشترك', two: 'مشتركين', few: 'مشتركين', many: 'مشتركين', other: 'مشتركين')}";

  static String m3(name) => "حذف ${name}؟";

  static String m4(title) => "فشل التنزيل: ${title}";

  static String m5(count) =>
      "${Intl.plural(count, zero: '', one: 'تعليق', two: 'تعليقات', few: 'تعليقات', many: 'تعليقات', other: 'تعليقات')}";

  static String m6(count) => "${count} دقيقة";

  static String m7(count) => "${count} د";

  static String m8(count) => "${count} مقطع";

  static String m9(count) =>
      "${Intl.plural(count, zero: 'لا مشاهدات', one: 'مشاهدة', two: 'مشاهدات', few: 'مشاهدات', many: 'مشاهدات', other: 'مشاهدات')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("حول"),
    "addProfile": MessageLookupByLibrary.simpleMessage("إضافة ملف شخصي"),
    "addToQueue": MessageLookupByLibrary.simpleMessage(
      "إضافة إلى قائمة الانتظار",
    ),
    "addVideosHint": MessageLookupByLibrary.simpleMessage(
      "اضغط مطولًا على فيديو لحفظه في قائمة تشغيل",
    ),
    "addedToPlayNext": MessageLookupByLibrary.simpleMessage(
      "أضيف للتشغيل التالي",
    ),
    "addedToPlaylist": m0,
    "addedToQueue": MessageLookupByLibrary.simpleMessage(
      "أضيف إلى قائمة الانتظار",
    ),
    "all": MessageLookupByLibrary.simpleMessage("الكل"),
    "audio": MessageLookupByLibrary.simpleMessage("صوت"),
    "audioFocus": MessageLookupByLibrary.simpleMessage("تركيز الصوت"),
    "audioFocusDescription": MessageLookupByLibrary.simpleMessage(
      "إيقاف التشغيل مؤقتًا عند المقاطعات",
    ),
    "audioOnly": MessageLookupByLibrary.simpleMessage("صوت فقط"),
    "audioQuality": MessageLookupByLibrary.simpleMessage("جودة الصوت"),
    "autoPip": MessageLookupByLibrary.simpleMessage("صورة داخل صورة تلقائية"),
    "autoPipDescription": MessageLookupByLibrary.simpleMessage(
      "الدخول تلقائيًا إلى وضع PiP عند الضغط على زر الرئيسية أثناء تشغيل الفيديو",
    ),
    "autoScrollOff": MessageLookupByLibrary.simpleMessage(
      "التمرير التلقائي معطّل",
    ),
    "autoScrollOn": MessageLookupByLibrary.simpleMessage(
      "التمرير التلقائي مفعّل",
    ),
    "backupRestore": MessageLookupByLibrary.simpleMessage(
      "النسخ الاحتياطي والاستعادة",
    ),
    "backupRestoreDescription": MessageLookupByLibrary.simpleMessage(
      "تصدير أو استيراد اشتراكاتك",
    ),
    "canada": MessageLookupByLibrary.simpleMessage("كندا"),
    "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "cancelled": MessageLookupByLibrary.simpleMessage("ملغى"),
    "cannotDeleteDefault": MessageLookupByLibrary.simpleMessage(
      "لا يمكن حذف الملف الشخصي الافتراضي",
    ),
    "cannotRenameDefault": MessageLookupByLibrary.simpleMessage(
      "لا يمكن إعادة تسمية الملف الشخصي الافتراضي",
    ),
    "castConnected": MessageLookupByLibrary.simpleMessage("متصل"),
    "castConnectedTo": m1,
    "castFailed": MessageLookupByLibrary.simpleMessage(
      "لا يمكن بث هذا الفيديو",
    ),
    "castStop": MessageLookupByLibrary.simpleMessage("إيقاف البث"),
    "castTitle": MessageLookupByLibrary.simpleMessage("بث"),
    "castUnavailable": MessageLookupByLibrary.simpleMessage(
      "البث غير متاح على هذا الجهاز",
    ),
    "channelSubscribers": m2,
    "channels": MessageLookupByLibrary.simpleMessage("القنوات"),
    "checkNow": MessageLookupByLibrary.simpleMessage("Check now"),
    "checkNowDone": MessageLookupByLibrary.simpleMessage(
      "Checked for new uploads.",
    ),
    "clearAll": MessageLookupByLibrary.simpleMessage("مسح الكل"),
    "clearAllHistory": MessageLookupByLibrary.simpleMessage("مسح كل السجل"),
    "clearAllHistoryConfirm": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد من مسح كل سجل المشاهدة؟",
    ),
    "clearAllSaved": MessageLookupByLibrary.simpleMessage("مسح كل المحفوظات"),
    "clearAllSavedConfirm": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد من إزالة جميع مقاطع الفيديو المحفوظة؟",
    ),
    "clearLogs": MessageLookupByLibrary.simpleMessage("مسح السجلات"),
    "commentAuthorNotFound": MessageLookupByLibrary.simpleMessage("غير متاح"),
    "commentsDisabled": MessageLookupByLibrary.simpleMessage("التعليقات معطلة"),
    "commonSettingsTitle": MessageLookupByLibrary.simpleMessage("شائع"),
    "completed": MessageLookupByLibrary.simpleMessage("مكتمل"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "تم النسخ إلى الحافظة",
    ),
    "copyLink": MessageLookupByLibrary.simpleMessage("نسخ الرابط"),
    "createAction": MessageLookupByLibrary.simpleMessage("إنشاء"),
    "dateAdded": MessageLookupByLibrary.simpleMessage("تاريخ الإضافة"),
    "debugConsole": MessageLookupByLibrary.simpleMessage("وحدة تحكم التصحيح"),
    "defaultProfile": MessageLookupByLibrary.simpleMessage("افتراضي"),
    "defaultQuality": MessageLookupByLibrary.simpleMessage("الجودة الافتراضية"),
    "delete": MessageLookupByLibrary.simpleMessage("حذف"),
    "deleteDownload": MessageLookupByLibrary.simpleMessage("حذف التنزيل"),
    "deleteDownloadConfirm": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد من حذف هذا التنزيل؟",
    ),
    "deletePlaylistAction": MessageLookupByLibrary.simpleMessage(
      "حذف قائمة التشغيل",
    ),
    "deletePlaylistConfirm": m3,
    "deletePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "حذف قائمة التشغيل",
    ),
    "deleteProfile": MessageLookupByLibrary.simpleMessage("حذف الملف الشخصي"),
    "deleteVideo": MessageLookupByLibrary.simpleMessage("حذف الفيديو"),
    "deleteVideoConfirm": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد من إزالة هذا الفيديو؟",
    ),
    "developer": MessageLookupByLibrary.simpleMessage("المطور"),
    "disablePipPlayer": MessageLookupByLibrary.simpleMessage(
      "Disable PIP player",
    ),
    "disableVideoHistory": MessageLookupByLibrary.simpleMessage(
      "عطل تاريخ المشاهدة",
    ),
    "dislike": MessageLookupByLibrary.simpleMessage("عدم إعجاب"),
    "distractionFree": MessageLookupByLibrary.simpleMessage("بلا تشتت"),
    "download": MessageLookupByLibrary.simpleMessage("تنزيل"),
    "downloadAll": MessageLookupByLibrary.simpleMessage("Download all"),
    "downloadAllFailed": MessageLookupByLibrary.simpleMessage(
      "Could not queue playlist downloads.",
    ),
    "downloadAllQueued": MessageLookupByLibrary.simpleMessage(
      "Playlist videos added to the download queue.",
    ),
    "downloadFailed": m4,
    "downloadFileMissing": MessageLookupByLibrary.simpleMessage(
      "The downloaded file could not be opened. It may have been deleted.",
    ),
    "downloadFolderNotWritable": MessageLookupByLibrary.simpleMessage(
      "This folder is not writable.",
    ),
    "downloadFolderReady": MessageLookupByLibrary.simpleMessage(
      "Writable — downloads will be saved here.",
    ),
    "downloadFolderRejected": MessageLookupByLibrary.simpleMessage(
      "That folder cannot be used. Nothing was changed.",
    ),
    "downloadFolderSaved": MessageLookupByLibrary.simpleMessage(
      "Download folder updated.",
    ),
    "downloadFolderUnavailable": MessageLookupByLibrary.simpleMessage(
      "This folder is no longer available.",
    ),
    "downloadStarted": MessageLookupByLibrary.simpleMessage("بدأ التنزيل"),
    "downloadType": MessageLookupByLibrary.simpleMessage("نوع التنزيل"),
    "downloading": MessageLookupByLibrary.simpleMessage("جارٍ التنزيل"),
    "downloadingAudio": MessageLookupByLibrary.simpleMessage(
      "جارٍ تنزيل الصوت",
    ),
    "downloadingVideo": MessageLookupByLibrary.simpleMessage(
      "جارٍ تنزيل الفيديو",
    ),
    "downloads": MessageLookupByLibrary.simpleMessage("التنزيلات"),
    "duration": MessageLookupByLibrary.simpleMessage("المدة"),
    "enableHlsPlayerDescription": MessageLookupByLibrary.simpleMessage(
      "شغل مشغل المباشر لتفعيل كل اختيارات الجودة، عطله عند ظهور أي أخطاء.",
    ),
    "exitApp": MessageLookupByLibrary.simpleMessage("Exit"),
    "exitConfirmMessage": MessageLookupByLibrary.simpleMessage(
      "Playback will stop.",
    ),
    "exitConfirmTitle": MessageLookupByLibrary.simpleMessage("Exit VyPlay?"),
    "exportData": MessageLookupByLibrary.simpleMessage("تصدير البيانات"),
    "exportSubscriptions": MessageLookupByLibrary.simpleMessage(
      "تصدير الاشتراكات",
    ),
    "exportSuccess": MessageLookupByLibrary.simpleMessage("تم التصدير بنجاح"),
    "failed": MessageLookupByLibrary.simpleMessage("فشل"),
    "failedToOpenFile": MessageLookupByLibrary.simpleMessage("فشل فتح الملف"),
    "fileNotFound": MessageLookupByLibrary.simpleMessage("الملف غير موجود"),
    "filterAll": MessageLookupByLibrary.simpleMessage("الكل"),
    "filterChannels": MessageLookupByLibrary.simpleMessage("القنوات"),
    "filterMusic": MessageLookupByLibrary.simpleMessage("الموسيقى"),
    "filterPlaylists": MessageLookupByLibrary.simpleMessage("قوائم التشغيل"),
    "filterVideos": MessageLookupByLibrary.simpleMessage("مقاطع الفيديو"),
    "france": MessageLookupByLibrary.simpleMessage("فرنسا"),
    "hideComments": MessageLookupByLibrary.simpleMessage("إخفاء التعليقات"),
    "hideCommentsButtonFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "إخفاء زر التعليقات من شاشة المشاهدة.",
    ),
    "hideRelated": MessageLookupByLibrary.simpleMessage("إخفاء المرتبط"),
    "hideRelatedVideosFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "إخفاء الفيديوهات المرتبطة من شاشة المشاهدة",
    ),
    "history": MessageLookupByLibrary.simpleMessage("التاريخ"),
    "hlsPlayer": MessageLookupByLibrary.simpleMessage("مشغل المباشر"),
    "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
    "homeFeedMode": MessageLookupByLibrary.simpleMessage("الصفحة الرئيسية"),
    "homeFeedModeAuto": MessageLookupByLibrary.simpleMessage("تلقائي"),
    "homeFeedModeAutoHint": MessageLookupByLibrary.simpleMessage(
      "إظهار الاشتراكات إن وُجدت، وإلا الرائج",
    ),
    "homeFeedModeFeedOnly": MessageLookupByLibrary.simpleMessage("الاشتراكات"),
    "homeFeedModeFeedOnlyHint": MessageLookupByLibrary.simpleMessage(
      "إظهار مقاطع القنوات المشترك بها فقط",
    ),
    "homeFeedModeTrendingOnly": MessageLookupByLibrary.simpleMessage("الرائج"),
    "homeFeedModeTrendingOnlyHint": MessageLookupByLibrary.simpleMessage(
      "إظهار المقاطع الرائجة دائمًا فقط",
    ),
    "imageCacheLabel": MessageLookupByLibrary.simpleMessage(
      "ذاكرة الصور المؤقتة",
    ),
    "importData": MessageLookupByLibrary.simpleMessage("استيراد البيانات"),
    "importError": MessageLookupByLibrary.simpleMessage("فشل الاستيراد"),
    "importSubscriptions": MessageLookupByLibrary.simpleMessage(
      "استيراد الاشتراكات",
    ),
    "importSuccess": MessageLookupByLibrary.simpleMessage("تم الاستيراد بنجاح"),
    "includeTitle": MessageLookupByLibrary.simpleMessage("تضمين العنوان"),
    "india": MessageLookupByLibrary.simpleMessage("الهند"),
    "instances": MessageLookupByLibrary.simpleMessage("فوريات"),
    "interaction": MessageLookupByLibrary.simpleMessage("تفاعل"),
    "intro": MessageLookupByLibrary.simpleMessage("مقدمة"),
    "language": MessageLookupByLibrary.simpleMessage("اللغة"),
    "library": MessageLookupByLibrary.simpleMessage("المكتبة"),
    "like": MessageLookupByLibrary.simpleMessage("إعجاب"),
    "localPlaylists": MessageLookupByLibrary.simpleMessage("قوائم التشغيل"),
    "logsLabel": MessageLookupByLibrary.simpleMessage("السجلات"),
    "merging": MessageLookupByLibrary.simpleMessage("جارٍ الدمج"),
    "musicOfftopic": MessageLookupByLibrary.simpleMessage("موسيقى: غير موسيقي"),
    "netherlands": MessageLookupByLibrary.simpleMessage("هولندا"),
    "newNameHint": MessageLookupByLibrary.simpleMessage("اسم جديد"),
    "newPlaylist": MessageLookupByLibrary.simpleMessage("قائمة تشغيل جديدة"),
    "newPlaylistShort": MessageLookupByLibrary.simpleMessage("+ جديد"),
    "newProfileName": MessageLookupByLibrary.simpleMessage("اسم ملف شخصي جديد"),
    "newVideoNotifications": MessageLookupByLibrary.simpleMessage(
      "إشعارات الرفع الجديد",
    ),
    "newVideoNotificationsDescription": MessageLookupByLibrary.simpleMessage(
      "احصل على إشعار عند رفع القنوات التي تشترك بها",
    ),
    "noCommentsFound": MessageLookupByLibrary.simpleMessage(
      "No Comments Found",
    ),
    "noDownloads": MessageLookupByLibrary.simpleMessage("لا توجد تنزيلات"),
    "noDownloadsHint": MessageLookupByLibrary.simpleMessage(
      "ستظهر المقاطع التي تم تنزيلها هنا",
    ),
    "noHistory": MessageLookupByLibrary.simpleMessage("لا يوجد سجل مشاهدة"),
    "noLogs": MessageLookupByLibrary.simpleMessage("لا توجد سجلات بعد"),
    "noPlaylists": MessageLookupByLibrary.simpleMessage("لا توجد قوائم تشغيل"),
    "noPlaylistsYet": MessageLookupByLibrary.simpleMessage(
      "لا توجد قوائم تشغيل بعد.\nاضغط + لإنشاء واحدة.",
    ),
    "noPlaylistsYetPicker": MessageLookupByLibrary.simpleMessage(
      "لا توجد قوائم تشغيل بعد.\nاضغط + جديد لإنشاء واحدة.",
    ),
    "noSavedVideos": MessageLookupByLibrary.simpleMessage(
      "لا توجد مقاطع محفوظة",
    ),
    "noShorts": MessageLookupByLibrary.simpleMessage("لا توجد مقاطع Shorts"),
    "noShortsHint": MessageLookupByLibrary.simpleMessage(
      "Short videos will appear here",
    ),
    "noSubscriptions": MessageLookupByLibrary.simpleMessage("لا توجد اشتراكات"),
    "noSubscriptionsHint": MessageLookupByLibrary.simpleMessage(
      "اشترك في القنوات لرؤية مقاطعها هنا",
    ),
    "noUploadDate": MessageLookupByLibrary.simpleMessage("بلا تاريخ"),
    "noUploaderName": MessageLookupByLibrary.simpleMessage("بدون اسم"),
    "noVideoAvailableChangedToHls": MessageLookupByLibrary.simpleMessage(
      "لا يوجد مصدر للفيديو، تغير أوتوماتيكيا إلى المباشر",
    ),
    "noVideoDescription": MessageLookupByLibrary.simpleMessage("لا يوجد وصف"),
    "noVideoTitle": MessageLookupByLibrary.simpleMessage("بلا عنوان"),
    "noVideosFound": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على مقاطع",
    ),
    "noVideosInPlaylist": MessageLookupByLibrary.simpleMessage(
      "لا توجد مقاطع بعد",
    ),
    "notificationsDenied": MessageLookupByLibrary.simpleMessage(
      "تم رفض إذن الإشعارات",
    ),
    "openDownloadedFile": MessageLookupByLibrary.simpleMessage("Open"),
    "openInBrowser": MessageLookupByLibrary.simpleMessage("فتح في المتصفح"),
    "openLinksExternally": MessageLookupByLibrary.simpleMessage(
      "فتح الروابط في المتصفح الخارجي",
    ),
    "outro": MessageLookupByLibrary.simpleMessage("خاتمة"),
    "pause": MessageLookupByLibrary.simpleMessage("إيقاف مؤقت"),
    "pauseOnCall": MessageLookupByLibrary.simpleMessage(
      "إيقاف مؤقت عند مكالمة هاتفية",
    ),
    "pauseOnHeadphones": MessageLookupByLibrary.simpleMessage(
      "إيقاف مؤقت عند فصل السماعات",
    ),
    "paused": MessageLookupByLibrary.simpleMessage("متوقف مؤقتًا"),
    "pending": MessageLookupByLibrary.simpleMessage("قيد الانتظار"),
    "pinned": MessageLookupByLibrary.simpleMessage("مثبت"),
    "platformLabel": MessageLookupByLibrary.simpleMessage("المنصة"),
    "playAll": MessageLookupByLibrary.simpleMessage("تشغيل الكل"),
    "playNext": MessageLookupByLibrary.simpleMessage("تشغيل التالي"),
    "playlist": MessageLookupByLibrary.simpleMessage("قائمة تشغيل"),
    "playlistNameHint": MessageLookupByLibrary.simpleMessage(
      "اسم قائمة التشغيل",
    ),
    "playlistNotFound": MessageLookupByLibrary.simpleMessage(
      "قائمة التشغيل غير موجودة",
    ),
    "playlistOrder": MessageLookupByLibrary.simpleMessage("Playlist order"),
    "playlists": MessageLookupByLibrary.simpleMessage("قوائم التشغيل"),
    "pluginCapabilityChannel": MessageLookupByLibrary.simpleMessage(
      "Channel metadata",
    ),
    "pluginCapabilityDiagnostics": MessageLookupByLibrary.simpleMessage(
      "Diagnostics",
    ),
    "pluginCapabilityNetwork": MessageLookupByLibrary.simpleMessage(
      "Network access",
    ),
    "pluginCapabilityPlayback": MessageLookupByLibrary.simpleMessage(
      "Playback",
    ),
    "pluginCapabilitySearch": MessageLookupByLibrary.simpleMessage(
      "Search content",
    ),
    "pluginCapabilitySettingsRead": MessageLookupByLibrary.simpleMessage(
      "Read settings",
    ),
    "pluginCapabilityTrending": MessageLookupByLibrary.simpleMessage(
      "Trending / home feed",
    ),
    "pluginContributions": MessageLookupByLibrary.simpleMessage(
      "Plugin contributions",
    ),
    "pluginContributionsDescription": MessageLookupByLibrary.simpleMessage(
      "Extensions published by installed plugins. A contribution appears once its plugin is enabled and the capability it needs is granted.",
    ),
    "pluginContributionsNone": MessageLookupByLibrary.simpleMessage(
      "No plugin contributions available yet.",
    ),
    "pluginInfo": MessageLookupByLibrary.simpleMessage("Plugin info"),
    "pluginMenuContributions": MessageLookupByLibrary.simpleMessage(
      "Plugin menu items",
    ),
    "pluginPermissions": MessageLookupByLibrary.simpleMessage(
      "Permissions of plugins",
    ),
    "pluginPermissionsAllGranted": MessageLookupByLibrary.simpleMessage(
      "All granted",
    ),
    "pluginPermissionsApplyNow": MessageLookupByLibrary.simpleMessage(
      "Apply now",
    ),
    "pluginPermissionsCustomDescription": MessageLookupByLibrary.simpleMessage(
      "Some capabilities for this plugin have been revoked. Revoked capabilities cannot be used until re-granted.",
    ),
    "pluginPermissionsCustomPolicy": MessageLookupByLibrary.simpleMessage(
      "Custom policy",
    ),
    "pluginPermissionsDefaultDescription": MessageLookupByLibrary.simpleMessage(
      "This plugin has not been restricted. It may use every capability it declared. You can revoke individual capabilities below.",
    ),
    "pluginPermissionsDefaultPolicy": MessageLookupByLibrary.simpleMessage(
      "Default policy",
    ),
    "pluginPermissionsDenied": MessageLookupByLibrary.simpleMessage("denied"),
    "pluginPermissionsDescription": MessageLookupByLibrary.simpleMessage(
      "Control which capabilities each installed plugin can use.",
    ),
    "pluginPermissionsGranted": MessageLookupByLibrary.simpleMessage("granted"),
    "pluginPermissionsNone": MessageLookupByLibrary.simpleMessage(
      "No plugins installed yet.",
    ),
    "pluginPermissionsNoneDeclared": MessageLookupByLibrary.simpleMessage(
      "This plugin does not declare any capabilities.",
    ),
    "pluginPermissionsNotDeclared": MessageLookupByLibrary.simpleMessage(
      "Not declared by this plugin",
    ),
    "pluginPermissionsReloadRequiredDescription":
        MessageLookupByLibrary.simpleMessage(
          "To apply new permissions to a running plugin, it must be disabled and re-enabled. Its current session keeps the old permissions until reloaded.",
        ),
    "pluginPermissionsReloadRequiredTitle":
        MessageLookupByLibrary.simpleMessage(
          "Permission change requires reload",
        ),
    "pluginPermissionsReloaded": MessageLookupByLibrary.simpleMessage(
      "Plugin permissions applied.",
    ),
    "pluginPermissionsRestricted": MessageLookupByLibrary.simpleMessage(
      "Restricted capabilities",
    ),
    "pluginPermissionsRestrictedDescription": MessageLookupByLibrary.simpleMessage(
      "The following capabilities were declared by the plugin but are not granted. The plugin cannot use them until you grant them here.",
    ),
    "profileInUse": MessageLookupByLibrary.simpleMessage("نشط"),
    "profileName": MessageLookupByLibrary.simpleMessage("اسم الملف الشخصي"),
    "profiles": MessageLookupByLibrary.simpleMessage("الملفات الشخصية"),
    "profilesDescription": MessageLookupByLibrary.simpleMessage(
      "أنشئ ملفات شخصية منفصلة لحسابات أو تفضيلات مختلفة",
    ),
    "quality1080p": MessageLookupByLibrary.simpleMessage("1080p"),
    "quality1440p": MessageLookupByLibrary.simpleMessage("1440p"),
    "quality144p": MessageLookupByLibrary.simpleMessage("144p"),
    "quality240p": MessageLookupByLibrary.simpleMessage("240p"),
    "quality360p": MessageLookupByLibrary.simpleMessage("360p"),
    "quality480p": MessageLookupByLibrary.simpleMessage("480p"),
    "quality720p": MessageLookupByLibrary.simpleMessage("720p"),
    "queue": MessageLookupByLibrary.simpleMessage("قائمة الانتظار"),
    "queueClear": MessageLookupByLibrary.simpleMessage("مسح"),
    "queueEmpty": MessageLookupByLibrary.simpleMessage("قائمة الانتظار فارغة"),
    "queueShuffle": MessageLookupByLibrary.simpleMessage("خلط"),
    "readMoreText": MessageLookupByLibrary.simpleMessage("اقرأ المزيد"),
    "recentSearches": MessageLookupByLibrary.simpleMessage(
      "عمليات البحث الأخيرة",
    ),
    "recheckFolder": MessageLookupByLibrary.simpleMessage("Re-check"),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "refreshToLoad": MessageLookupByLibrary.simpleMessage(
      "اسحب للأسفل للتحديث",
    ),
    "region": MessageLookupByLibrary.simpleMessage("المنطقة"),
    "relatedTitle": MessageLookupByLibrary.simpleMessage("مرتبط"),
    "removeFromHistory": MessageLookupByLibrary.simpleMessage("إزالة من السجل"),
    "removeFromQueue": MessageLookupByLibrary.simpleMessage(
      "إزالة من قائمة الانتظار",
    ),
    "removeFromSaved": MessageLookupByLibrary.simpleMessage(
      "إزالة من المحفوظات",
    ),
    "renameAction": MessageLookupByLibrary.simpleMessage("إعادة تسمية"),
    "renamePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "إعادة تسمية قائمة التشغيل",
    ),
    "renameProfile": MessageLookupByLibrary.simpleMessage(
      "إعادة تسمية الملف الشخصي",
    ),
    "repliesNotSupported": MessageLookupByLibrary.simpleMessage(
      "الردود غير متاحة بعد",
    ),
    "repliesPlural": m5,
    "resume": MessageLookupByLibrary.simpleMessage("استئناف"),
    "retrieveDislikeCounts": MessageLookupByLibrary.simpleMessage(
      "أظهر عدد عدم الإعجابات",
    ),
    "retrieveDislikes": MessageLookupByLibrary.simpleMessage(
      "أظهر عدم الإعجابات",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
    "retryDownload": MessageLookupByLibrary.simpleMessage("Retry"),
    "saveToDevice": MessageLookupByLibrary.simpleMessage("حفظ على الجهاز"),
    "saveToDeviceFailed": MessageLookupByLibrary.simpleMessage(
      "فشل الحفظ على الجهاز",
    ),
    "saveToPlaylist": MessageLookupByLibrary.simpleMessage(
      "حفظ في قائمة تشغيل",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("المحفوظات"),
    "savedToDevice": MessageLookupByLibrary.simpleMessage(
      "تم الحفظ على الجهاز",
    ),
    "savedVideosTitle": MessageLookupByLibrary.simpleMessage(
      "الفيديوهات المحفوظة",
    ),
    "savingToDevice": MessageLookupByLibrary.simpleMessage(
      "جارٍ الحفظ على الجهاز...",
    ),
    "search": MessageLookupByLibrary.simpleMessage("بحث"),
    "searchFilters": MessageLookupByLibrary.simpleMessage("عوامل التصفية"),
    "searchForVideosChannels": MessageLookupByLibrary.simpleMessage(
      "ابحث عن مقاطع وقنوات وقوائم تشغيل",
    ),
    "searchHistoryEnabled": MessageLookupByLibrary.simpleMessage(
      "حفظ سجل البحث",
    ),
    "searchHistoryEnabledDescription": MessageLookupByLibrary.simpleMessage(
      "احفظ استعلامات البحث للوصول السريع",
    ),
    "searchInPlaylist": MessageLookupByLibrary.simpleMessage(
      "Search in playlist",
    ),
    "searchSavedVideos": MessageLookupByLibrary.simpleMessage(
      "ابحث في المقاطع المحفوظة...",
    ),
    "searchSubscriptions": MessageLookupByLibrary.simpleMessage(
      "ابحث في الاشتراكات...",
    ),
    "searchYouTube": MessageLookupByLibrary.simpleMessage("ابحث في يوتيوب..."),
    "seconds": MessageLookupByLibrary.simpleMessage("ثانية"),
    "selectAll": MessageLookupByLibrary.simpleMessage("تحديد الكل"),
    "selectFile": MessageLookupByLibrary.simpleMessage("اختر ملفًا"),
    "selectVideos": MessageLookupByLibrary.simpleMessage("تحديد مقاطع الفيديو"),
    "selected": MessageLookupByLibrary.simpleMessage("محدد"),
    "selfPromotion": MessageLookupByLibrary.simpleMessage("ترويج ذاتي"),
    "serviceExplode": MessageLookupByLibrary.simpleMessage("Explode"),
    "serviceInvidious": MessageLookupByLibrary.simpleMessage("Invidious"),
    "serviceNewPipe": MessageLookupByLibrary.simpleMessage("NewPipe Extractor"),
    "servicePiped": MessageLookupByLibrary.simpleMessage("Piped"),
    "settings": MessageLookupByLibrary.simpleMessage("الإعدادات"),
    "share": MessageLookupByLibrary.simpleMessage("مشاركة"),
    "shareDownloadedFile": MessageLookupByLibrary.simpleMessage("Share"),
    "shareLogs": MessageLookupByLibrary.simpleMessage("مشاركة السجلات"),
    "shareVia": MessageLookupByLibrary.simpleMessage("مشاركة عبر"),
    "shorts": MessageLookupByLibrary.simpleMessage("Shorts"),
    "showLessText": MessageLookupByLibrary.simpleMessage("إظهار أقل"),
    "showSearchHistory": MessageLookupByLibrary.simpleMessage(
      "إظهار سجل البحث",
    ),
    "showSearchHistoryDescription": MessageLookupByLibrary.simpleMessage(
      "عرض عمليات البحث الأخيرة في شاشة البحث",
    ),
    "skipInterval": MessageLookupByLibrary.simpleMessage("فاصل التخطي"),
    "skipIntervalDescription": MessageLookupByLibrary.simpleMessage(
      "مدة التخطي بالنقر المزدوج بالثواني",
    ),
    "sleepTimer": MessageLookupByLibrary.simpleMessage("مؤقت النوم"),
    "sleepTimerCustom": MessageLookupByLibrary.simpleMessage("مخصص"),
    "sleepTimerCustomTitle": MessageLookupByLibrary.simpleMessage("مؤقت مخصص"),
    "sleepTimerEndOfVideo": MessageLookupByLibrary.simpleMessage(
      "نهاية الفيديو",
    ),
    "sleepTimerEnded": MessageLookupByLibrary.simpleMessage("انتهى مؤقت النوم"),
    "sleepTimerEnterMinutes": MessageLookupByLibrary.simpleMessage(
      "أدخل الدقائق",
    ),
    "sleepTimerMinutes": m6,
    "sleepTimerMinutesShort": m7,
    "sleepTimerOff": MessageLookupByLibrary.simpleMessage("إيقاف"),
    "sleepTimerSet": MessageLookupByLibrary.simpleMessage("تعيين"),
    "sort": MessageLookupByLibrary.simpleMessage("ترتيب"),
    "sortAToZ": MessageLookupByLibrary.simpleMessage("Title A–Z"),
    "sortBy": MessageLookupByLibrary.simpleMessage("ترتيب حسب"),
    "sortZToA": MessageLookupByLibrary.simpleMessage("Title Z–A"),
    "sponsor": MessageLookupByLibrary.simpleMessage("رعاية"),
    "sponsorBlock": MessageLookupByLibrary.simpleMessage("SponsorBlock"),
    "sponsorBlockCategories": MessageLookupByLibrary.simpleMessage(
      "فئات التخطي",
    ),
    "sponsorBlockDescription": MessageLookupByLibrary.simpleMessage(
      "تخطي المقاطع الممولة تلقائيًا",
    ),
    "startDownload": MessageLookupByLibrary.simpleMessage("بدء التنزيل"),
    "startSavingVideos": MessageLookupByLibrary.simpleMessage(
      "ابدأ بحفظ المقاطع للمشاهدة لاحقًا",
    ),
    "subscribe": MessageLookupByLibrary.simpleMessage("اشتراك"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("الاشتراكات"),
    "subtitleSize": MessageLookupByLibrary.simpleMessage("حجم الترجمة"),
    "subtitleSizeDescription": MessageLookupByLibrary.simpleMessage(
      "ضبط حجم الترجمة على الفيديو",
    ),
    "subtitleSizeExtraLarge": MessageLookupByLibrary.simpleMessage("كبير جدًا"),
    "subtitleSizeLarge": MessageLookupByLibrary.simpleMessage("كبير"),
    "subtitleSizeMedium": MessageLookupByLibrary.simpleMessage("متوسط"),
    "subtitleSizeSmall": MessageLookupByLibrary.simpleMessage("صغير"),
    "swipeDownToDismissDisabled": MessageLookupByLibrary.simpleMessage(
      "\'Swipe down to dismiss\' disabled",
    ),
    "swipeUpToDismissEnabled": MessageLookupByLibrary.simpleMessage(
      "\'Swipe up to dismiss\' enabled",
    ),
    "switchProfile": MessageLookupByLibrary.simpleMessage("تبديل الملف الشخصي"),
    "switchRegion": MessageLookupByLibrary.simpleMessage(
      "من فضلك غير المنطقة لنتائج فُضْلى.",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("المظهر"),
    "themeDark": MessageLookupByLibrary.simpleMessage("داكن"),
    "themeDynamic": MessageLookupByLibrary.simpleMessage("Material You"),
    "themeLight": MessageLookupByLibrary.simpleMessage("فاتح"),
    "themeOled": MessageLookupByLibrary.simpleMessage("أسود OLED"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("النظام"),
    "thereIsNoSavedOrHistoryVideos": MessageLookupByLibrary.simpleMessage(
      "لا يوجد فيديوهات/تاريخ محفوظ",
    ),
    "thereIsNoSavedVideos": MessageLookupByLibrary.simpleMessage(
      "لا يوجد فيديوهات محفوظة",
    ),
    "title": MessageLookupByLibrary.simpleMessage("العنوان"),
    "translators": MessageLookupByLibrary.simpleMessage("المترجمين"),
    "trending": MessageLookupByLibrary.simpleMessage("شائع"),
    "unitedKingdom": MessageLookupByLibrary.simpleMessage("المملكة المتحدة"),
    "unitedStates": MessageLookupByLibrary.simpleMessage("الولايات المتحدة"),
    "unknown": MessageLookupByLibrary.simpleMessage("غير معرف"),
    "unknownError": MessageLookupByLibrary.simpleMessage("حدث خطأ غير معروف"),
    "unknownQuality": MessageLookupByLibrary.simpleMessage("جودة غير محددة"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("إلغاء الاشتراك"),
    "unsubscribeConfirm": MessageLookupByLibrary.simpleMessage(
      "إلغاء الاشتراك في هذه القناة؟",
    ),
    "version": MessageLookupByLibrary.simpleMessage("النسخة"),
    "video": MessageLookupByLibrary.simpleMessage("فيديو"),
    "videoAudio": MessageLookupByLibrary.simpleMessage("فيديو+صوت"),
    "videoCountLabel": m8,
    "videoFit": MessageLookupByLibrary.simpleMessage("ملاءمة الفيديو"),
    "videoFitContain": MessageLookupByLibrary.simpleMessage("احتواء"),
    "videoFitCover": MessageLookupByLibrary.simpleMessage("تغطية"),
    "videoFitFill": MessageLookupByLibrary.simpleMessage("ملء"),
    "videoFitFitHeight": MessageLookupByLibrary.simpleMessage(
      "ملاءمة الارتفاع",
    ),
    "videoFitFitWidth": MessageLookupByLibrary.simpleMessage("ملاءمة العرض"),
    "videoOnly": MessageLookupByLibrary.simpleMessage("فيديو فقط"),
    "videoQuality": MessageLookupByLibrary.simpleMessage("جودة الفيديو"),
    "videoViews": m9,
    "videoWithAudio": MessageLookupByLibrary.simpleMessage("فيديو + صوت"),
    "videos": MessageLookupByLibrary.simpleMessage("مقاطع الفيديو"),
    "views": MessageLookupByLibrary.simpleMessage("مشاهدة"),
    "watchSomeVideos": MessageLookupByLibrary.simpleMessage(
      "ستظهر المقاطع التي تشاهدها هنا",
    ),
    "youtubeService": MessageLookupByLibrary.simpleMessage("خدمة يوتيوب"),
  };
}
