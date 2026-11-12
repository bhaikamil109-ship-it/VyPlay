// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a tr locale. All the
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
  String get localeName => 'tr';

  static String m0(name) => "${name} listesine eklendi";

  static String m1(device) => "${device} cihazına yayınlanıyor";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'Abone yok', one: 'abone', other: 'abone')}";

  static String m3(name) => "${name} silinsin mi?";

  static String m4(title) => "İndirme başarısız: ${title}";

  static String m5(count) =>
      "${Intl.plural(count, one: 'Yanıt', other: 'Yanıt')}";

  static String m6(count) => "${count} dakika";

  static String m7(count) => "${count} dk";

  static String m8(count) => "${count} video";

  static String m9(count) =>
      "${Intl.plural(count, zero: 'Görüntüleme yok', one: 'görüntüleme', other: 'görüntüleme')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Hakkında"),
    "addProfile": MessageLookupByLibrary.simpleMessage("Profil Ekle"),
    "addToQueue": MessageLookupByLibrary.simpleMessage("Sıraya ekle"),
    "addVideosHint": MessageLookupByLibrary.simpleMessage(
      "Bir videoyu oynatma listesine kaydetmek için uzun basın",
    ),
    "addedToPlayNext": MessageLookupByLibrary.simpleMessage(
      "Sıradaki olarak eklendi",
    ),
    "addedToPlaylist": m0,
    "addedToQueue": MessageLookupByLibrary.simpleMessage("Sıraya eklendi"),
    "all": MessageLookupByLibrary.simpleMessage("Tümü"),
    "audio": MessageLookupByLibrary.simpleMessage("Ses"),
    "audioFocus": MessageLookupByLibrary.simpleMessage("Ses Odağı"),
    "audioFocusDescription": MessageLookupByLibrary.simpleMessage(
      "Kesintilerde oynatmayı duraklat",
    ),
    "audioOnly": MessageLookupByLibrary.simpleMessage("Yalnızca Ses"),
    "audioQuality": MessageLookupByLibrary.simpleMessage("Ses Kalitesi"),
    "autoPip": MessageLookupByLibrary.simpleMessage(
      "Otomatik Resim İçinde Resim",
    ),
    "autoPipDescription": MessageLookupByLibrary.simpleMessage(
      "Video oynarken ana ekran tuşuna basıldığında otomatik olarak PiP moduna geç",
    ),
    "autoScrollOff": MessageLookupByLibrary.simpleMessage(
      "Otomatik kaydırma kapalı",
    ),
    "autoScrollOn": MessageLookupByLibrary.simpleMessage(
      "Otomatik kaydırma açık",
    ),
    "backupRestore": MessageLookupByLibrary.simpleMessage(
      "Yedekle ve Geri Yükle",
    ),
    "backupRestoreDescription": MessageLookupByLibrary.simpleMessage(
      "Aboneliklerinizi dışa veya içe aktarın",
    ),
    "canada": MessageLookupByLibrary.simpleMessage("Kanada"),
    "cancel": MessageLookupByLibrary.simpleMessage("İptal"),
    "cancelled": MessageLookupByLibrary.simpleMessage("İptal edildi"),
    "cannotDeleteDefault": MessageLookupByLibrary.simpleMessage(
      "Varsayılan profil silinemez",
    ),
    "cannotRenameDefault": MessageLookupByLibrary.simpleMessage(
      "Varsayılan profil yeniden adlandırılamaz",
    ),
    "castConnected": MessageLookupByLibrary.simpleMessage("Bağlandı"),
    "castConnectedTo": m1,
    "castFailed": MessageLookupByLibrary.simpleMessage(
      "Bu video yayınlanamıyor",
    ),
    "castStop": MessageLookupByLibrary.simpleMessage("Yayını durdur"),
    "castTitle": MessageLookupByLibrary.simpleMessage("Yayınla"),
    "castUnavailable": MessageLookupByLibrary.simpleMessage(
      "Yayınlama bu cihazda kullanılamıyor",
    ),
    "channelSubscribers": m2,
    "channels": MessageLookupByLibrary.simpleMessage("Kanallar"),
    "clearAll": MessageLookupByLibrary.simpleMessage("Tümünü temizle"),
    "clearAllHistory": MessageLookupByLibrary.simpleMessage(
      "Tüm geçmişi temizle",
    ),
    "clearAllHistoryConfirm": MessageLookupByLibrary.simpleMessage(
      "Tüm izleme geçmişini temizlemek istediğinizden emin misiniz?",
    ),
    "clearAllSaved": MessageLookupByLibrary.simpleMessage(
      "Tüm kayıtlıları temizle",
    ),
    "clearAllSavedConfirm": MessageLookupByLibrary.simpleMessage(
      "Tüm kayıtlı videoları kaldırmak istediğinizden emin misiniz?",
    ),
    "clearLogs": MessageLookupByLibrary.simpleMessage("Günlükleri temizle"),
    "commentAuthorNotFound": MessageLookupByLibrary.simpleMessage("Bulunamadı"),
    "commentsDisabled": MessageLookupByLibrary.simpleMessage(
      "Yorumlar devre dışı",
    ),
    "commonSettingsTitle": MessageLookupByLibrary.simpleMessage("Genel"),
    "completed": MessageLookupByLibrary.simpleMessage("Tamamlandı"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Panoya kopyalandı",
    ),
    "copyLink": MessageLookupByLibrary.simpleMessage("Bağlantıyı kopyala"),
    "createAction": MessageLookupByLibrary.simpleMessage("Oluştur"),
    "dateAdded": MessageLookupByLibrary.simpleMessage("Eklenme tarihi"),
    "debugConsole": MessageLookupByLibrary.simpleMessage(
      "Hata Ayıklama Konsolu",
    ),
    "defaultProfile": MessageLookupByLibrary.simpleMessage("Varsayılan"),
    "defaultQuality": MessageLookupByLibrary.simpleMessage("Varsayılan Kalite"),
    "delete": MessageLookupByLibrary.simpleMessage("Sil"),
    "deleteDownload": MessageLookupByLibrary.simpleMessage("İndirmeyi Sil"),
    "deleteDownloadConfirm": MessageLookupByLibrary.simpleMessage(
      "Bu indirmeyi silmek istediğinizden emin misiniz?",
    ),
    "deletePlaylistAction": MessageLookupByLibrary.simpleMessage(
      "Oynatma listesini sil",
    ),
    "deletePlaylistConfirm": m3,
    "deletePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "Oynatma Listesini Sil",
    ),
    "deleteProfile": MessageLookupByLibrary.simpleMessage("Profili Sil"),
    "deleteVideo": MessageLookupByLibrary.simpleMessage("Videoyu sil"),
    "deleteVideoConfirm": MessageLookupByLibrary.simpleMessage(
      "Bu videoyu kaldırmak istediğinizden emin misiniz?",
    ),
    "developer": MessageLookupByLibrary.simpleMessage("Geliştirici"),
    "disablePipPlayer": MessageLookupByLibrary.simpleMessage(
      "Disable PIP player",
    ),
    "disableVideoHistory": MessageLookupByLibrary.simpleMessage(
      "Video geçmişini devre dışı bırak",
    ),
    "dislike": MessageLookupByLibrary.simpleMessage("Beğenme"),
    "distractionFree": MessageLookupByLibrary.simpleMessage(
      "Dikkat Dağıtmayan",
    ),
    "download": MessageLookupByLibrary.simpleMessage("İndir"),
    "downloadFailed": m4,
    "downloadStarted": MessageLookupByLibrary.simpleMessage("İndirme başladı"),
    "downloadType": MessageLookupByLibrary.simpleMessage("İndirme Türü"),
    "downloading": MessageLookupByLibrary.simpleMessage("İndiriliyor"),
    "downloadingAudio": MessageLookupByLibrary.simpleMessage("Ses indiriliyor"),
    "downloadingVideo": MessageLookupByLibrary.simpleMessage(
      "Video indiriliyor",
    ),
    "downloads": MessageLookupByLibrary.simpleMessage("İndirilenler"),
    "duration": MessageLookupByLibrary.simpleMessage("Süre"),
    "enableHlsPlayerDescription": MessageLookupByLibrary.simpleMessage(
      "Tüm kalite seçeneklerini açmak için HLS oynatıcıyı etkinleştirin. Hata oluşursa devre dışı bırakın.",
    ),
    "exportData": MessageLookupByLibrary.simpleMessage("Verileri Dışa Aktar"),
    "exportSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Abonelikleri Dışa Aktar",
    ),
    "exportSuccess": MessageLookupByLibrary.simpleMessage(
      "Dışa aktarma başarılı",
    ),
    "failed": MessageLookupByLibrary.simpleMessage("Başarısız"),
    "failedToOpenFile": MessageLookupByLibrary.simpleMessage("Dosya açılamadı"),
    "fileNotFound": MessageLookupByLibrary.simpleMessage("Dosya bulunamadı"),
    "filterAll": MessageLookupByLibrary.simpleMessage("Tümü"),
    "filterChannels": MessageLookupByLibrary.simpleMessage("Kanallar"),
    "filterMusic": MessageLookupByLibrary.simpleMessage("Müzik"),
    "filterPlaylists": MessageLookupByLibrary.simpleMessage(
      "Oynatma listeleri",
    ),
    "filterVideos": MessageLookupByLibrary.simpleMessage("Videolar"),
    "france": MessageLookupByLibrary.simpleMessage("Fransa"),
    "hideComments": MessageLookupByLibrary.simpleMessage("Yorumları Gizle"),
    "hideCommentsButtonFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "İzleme ekranından yorum butonunu gizle",
    ),
    "hideRelated": MessageLookupByLibrary.simpleMessage(
      "İlgili Videoları Gizle",
    ),
    "hideRelatedVideosFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "İzleme ekranından ilgili videoları gizle",
    ),
    "history": MessageLookupByLibrary.simpleMessage("Geçmiş"),
    "hlsPlayer": MessageLookupByLibrary.simpleMessage("Hls Oynatıcı"),
    "home": MessageLookupByLibrary.simpleMessage("Ana Sayfa"),
    "homeFeedMode": MessageLookupByLibrary.simpleMessage("Ana Akış"),
    "homeFeedModeAuto": MessageLookupByLibrary.simpleMessage("Otomatik"),
    "homeFeedModeAutoHint": MessageLookupByLibrary.simpleMessage(
      "Varsa abonelikleri, yoksa trendleri göster",
    ),
    "homeFeedModeFeedOnly": MessageLookupByLibrary.simpleMessage("Abonelikler"),
    "homeFeedModeFeedOnlyHint": MessageLookupByLibrary.simpleMessage(
      "Yalnızca abone olunan kanalların videolarını göster",
    ),
    "homeFeedModeTrendingOnly": MessageLookupByLibrary.simpleMessage(
      "Trendler",
    ),
    "homeFeedModeTrendingOnlyHint": MessageLookupByLibrary.simpleMessage(
      "Her zaman yalnızca trend videoları göster",
    ),
    "imageCacheLabel": MessageLookupByLibrary.simpleMessage("Görsel Önbelleği"),
    "importData": MessageLookupByLibrary.simpleMessage("Verileri İçe Aktar"),
    "importError": MessageLookupByLibrary.simpleMessage(
      "İçe aktarma başarısız",
    ),
    "importSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Abonelikleri İçe Aktar",
    ),
    "importSuccess": MessageLookupByLibrary.simpleMessage(
      "İçe aktarma başarılı",
    ),
    "includeTitle": MessageLookupByLibrary.simpleMessage("Başlığı dahil et"),
    "india": MessageLookupByLibrary.simpleMessage("Hindistan"),
    "instances": MessageLookupByLibrary.simpleMessage("Örnekler"),
    "interaction": MessageLookupByLibrary.simpleMessage("Etkileşim"),
    "intro": MessageLookupByLibrary.simpleMessage("Giriş"),
    "language": MessageLookupByLibrary.simpleMessage("Dil"),
    "library": MessageLookupByLibrary.simpleMessage("Kitaplık"),
    "like": MessageLookupByLibrary.simpleMessage("Beğen"),
    "localPlaylists": MessageLookupByLibrary.simpleMessage("Oynatma listeleri"),
    "logsLabel": MessageLookupByLibrary.simpleMessage("Günlükler"),
    "merging": MessageLookupByLibrary.simpleMessage("Birleştiriliyor"),
    "musicOfftopic": MessageLookupByLibrary.simpleMessage("Müzik: Müzik Dışı"),
    "netherlands": MessageLookupByLibrary.simpleMessage("Hollanda"),
    "newNameHint": MessageLookupByLibrary.simpleMessage("Yeni ad"),
    "newPlaylist": MessageLookupByLibrary.simpleMessage("Yeni Oynatma Listesi"),
    "newPlaylistShort": MessageLookupByLibrary.simpleMessage("+ Yeni"),
    "newProfileName": MessageLookupByLibrary.simpleMessage("Yeni Profil Adı"),
    "newVideoNotifications": MessageLookupByLibrary.simpleMessage(
      "Yeni yükleme bildirimleri",
    ),
    "newVideoNotificationsDescription": MessageLookupByLibrary.simpleMessage(
      "Abone olduğunuz kanallar video yüklediğinde bildirim alın",
    ),
    "noCommentsFound": MessageLookupByLibrary.simpleMessage(
      "No Comments Found",
    ),
    "noDownloads": MessageLookupByLibrary.simpleMessage("İndirme Yok"),
    "noDownloadsHint": MessageLookupByLibrary.simpleMessage(
      "İndirilen videolar burada görünecek",
    ),
    "noHistory": MessageLookupByLibrary.simpleMessage("İzleme geçmişi yok"),
    "noLogs": MessageLookupByLibrary.simpleMessage("Henüz günlük yok"),
    "noPlaylists": MessageLookupByLibrary.simpleMessage(
      "Oynatma listesi bulunamadı",
    ),
    "noPlaylistsYet": MessageLookupByLibrary.simpleMessage(
      "Henüz oynatma listesi yok.\nOluşturmak için + simgesine dokunun.",
    ),
    "noPlaylistsYetPicker": MessageLookupByLibrary.simpleMessage(
      "Henüz oynatma listesi yok.\nOluşturmak için + Yeni simgesine dokunun.",
    ),
    "noSavedVideos": MessageLookupByLibrary.simpleMessage("Kayıtlı video yok"),
    "noShorts": MessageLookupByLibrary.simpleMessage("Shorts bulunamadı"),
    "noShortsHint": MessageLookupByLibrary.simpleMessage(
      "Short videos will appear here",
    ),
    "noSubscriptions": MessageLookupByLibrary.simpleMessage("Abonelik Yok"),
    "noSubscriptionsHint": MessageLookupByLibrary.simpleMessage(
      "Videolarını burada görmek için kanallara abone olun",
    ),
    "noUploadDate": MessageLookupByLibrary.simpleMessage("Tarih yok"),
    "noUploaderName": MessageLookupByLibrary.simpleMessage("İsim yok"),
    "noVideoAvailableChangedToHls": MessageLookupByLibrary.simpleMessage(
      "Video kaynağı yok, otomatik olarak hls\'ye değiştirildi",
    ),
    "noVideoDescription": MessageLookupByLibrary.simpleMessage("Açıklama yok"),
    "noVideoTitle": MessageLookupByLibrary.simpleMessage("Başlık yok"),
    "noVideosFound": MessageLookupByLibrary.simpleMessage("Video bulunamadı"),
    "noVideosInPlaylist": MessageLookupByLibrary.simpleMessage(
      "Henüz video yok",
    ),
    "notificationsDenied": MessageLookupByLibrary.simpleMessage(
      "Bildirim izni reddedildi",
    ),
    "openInBrowser": MessageLookupByLibrary.simpleMessage("Tarayıcıda Aç"),
    "openLinksExternally": MessageLookupByLibrary.simpleMessage(
      "Bağlantıları harici tarayıcıda aç",
    ),
    "outro": MessageLookupByLibrary.simpleMessage("Kapanış"),
    "pause": MessageLookupByLibrary.simpleMessage("Duraklat"),
    "pauseOnCall": MessageLookupByLibrary.simpleMessage(
      "Telefon Aramasında Duraklat",
    ),
    "pauseOnHeadphones": MessageLookupByLibrary.simpleMessage(
      "Kulaklık Bağlantısı Kesildiğinde Duraklat",
    ),
    "paused": MessageLookupByLibrary.simpleMessage("Duraklatıldı"),
    "pending": MessageLookupByLibrary.simpleMessage("Bekliyor"),
    "pinned": MessageLookupByLibrary.simpleMessage("Sabitlenmiş"),
    "platformLabel": MessageLookupByLibrary.simpleMessage("Platform"),
    "playAll": MessageLookupByLibrary.simpleMessage("Tümünü oynat"),
    "playNext": MessageLookupByLibrary.simpleMessage("Sıradaki olarak oynat"),
    "playlist": MessageLookupByLibrary.simpleMessage("Oynatma listesi"),
    "playlistNameHint": MessageLookupByLibrary.simpleMessage(
      "Oynatma listesi adı",
    ),
    "playlistNotFound": MessageLookupByLibrary.simpleMessage(
      "Oynatma listesi bulunamadı",
    ),
    "playlists": MessageLookupByLibrary.simpleMessage("Oynatma listeleri"),
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
      "Eklenti izinleri",
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
    "profileInUse": MessageLookupByLibrary.simpleMessage("Etkin"),
    "profileName": MessageLookupByLibrary.simpleMessage("Profil Adı"),
    "profiles": MessageLookupByLibrary.simpleMessage("Profiller"),
    "profilesDescription": MessageLookupByLibrary.simpleMessage(
      "Farklı hesaplar veya tercihler için ayrı profiller oluşturun",
    ),
    "quality1080p": MessageLookupByLibrary.simpleMessage("1080p"),
    "quality1440p": MessageLookupByLibrary.simpleMessage("1440p"),
    "quality144p": MessageLookupByLibrary.simpleMessage("144p"),
    "quality240p": MessageLookupByLibrary.simpleMessage("240p"),
    "quality360p": MessageLookupByLibrary.simpleMessage("360p"),
    "quality480p": MessageLookupByLibrary.simpleMessage("480p"),
    "quality720p": MessageLookupByLibrary.simpleMessage("720p"),
    "queue": MessageLookupByLibrary.simpleMessage("Sıra"),
    "queueClear": MessageLookupByLibrary.simpleMessage("Temizle"),
    "queueEmpty": MessageLookupByLibrary.simpleMessage("Sıra boş"),
    "queueShuffle": MessageLookupByLibrary.simpleMessage("Karıştır"),
    "readMoreText": MessageLookupByLibrary.simpleMessage("Devamını oku"),
    "recentSearches": MessageLookupByLibrary.simpleMessage("Son aramalar"),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "refreshToLoad": MessageLookupByLibrary.simpleMessage(
      "Yenilemek için aşağı çekin",
    ),
    "region": MessageLookupByLibrary.simpleMessage("Bölge"),
    "relatedTitle": MessageLookupByLibrary.simpleMessage("İlgili"),
    "removeFromHistory": MessageLookupByLibrary.simpleMessage(
      "Geçmişten kaldır",
    ),
    "removeFromQueue": MessageLookupByLibrary.simpleMessage("Sıradan kaldır"),
    "removeFromSaved": MessageLookupByLibrary.simpleMessage(
      "Kayıtlılardan kaldır",
    ),
    "renameAction": MessageLookupByLibrary.simpleMessage("Yeniden adlandır"),
    "renamePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "Oynatma Listesini Yeniden Adlandır",
    ),
    "renameProfile": MessageLookupByLibrary.simpleMessage(
      "Profili Yeniden Adlandır",
    ),
    "repliesNotSupported": MessageLookupByLibrary.simpleMessage(
      "Yanıtlar henüz kullanılamıyor",
    ),
    "repliesPlural": m5,
    "resume": MessageLookupByLibrary.simpleMessage("Devam et"),
    "retrieveDislikeCounts": MessageLookupByLibrary.simpleMessage(
      "Beğenmeme sayısını geri getir",
    ),
    "retrieveDislikes": MessageLookupByLibrary.simpleMessage(
      "Beğenmeme sayılarını gör",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Tekrar Dene"),
    "saveToDevice": MessageLookupByLibrary.simpleMessage("Cihaza Kaydet"),
    "saveToDeviceFailed": MessageLookupByLibrary.simpleMessage(
      "Cihaza kaydedilemedi",
    ),
    "saveToPlaylist": MessageLookupByLibrary.simpleMessage(
      "Oynatma listesine kaydet",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Kaydedilenler"),
    "savedToDevice": MessageLookupByLibrary.simpleMessage("Cihaza kaydedildi"),
    "savedVideosTitle": MessageLookupByLibrary.simpleMessage(
      "Kaydedilen Videolar",
    ),
    "savingToDevice": MessageLookupByLibrary.simpleMessage(
      "Cihaza kaydediliyor...",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Ara"),
    "searchFilters": MessageLookupByLibrary.simpleMessage("Filtreler"),
    "searchForVideosChannels": MessageLookupByLibrary.simpleMessage(
      "Video, kanal ve oynatma listesi ara",
    ),
    "searchHistoryEnabled": MessageLookupByLibrary.simpleMessage(
      "Arama Geçmişini Kaydet",
    ),
    "searchHistoryEnabledDescription": MessageLookupByLibrary.simpleMessage(
      "Hızlı erişim için arama sorgularınızı kaydedin",
    ),
    "searchSavedVideos": MessageLookupByLibrary.simpleMessage(
      "Kayıtlı videolarda ara...",
    ),
    "searchSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Aboneliklerde ara...",
    ),
    "searchYouTube": MessageLookupByLibrary.simpleMessage("YouTube\'da ara..."),
    "seconds": MessageLookupByLibrary.simpleMessage("saniye"),
    "selectAll": MessageLookupByLibrary.simpleMessage("Tümünü seç"),
    "selectFile": MessageLookupByLibrary.simpleMessage("Dosya Seç"),
    "selectVideos": MessageLookupByLibrary.simpleMessage("Video seç"),
    "selected": MessageLookupByLibrary.simpleMessage("seçildi"),
    "selfPromotion": MessageLookupByLibrary.simpleMessage("Kendini Tanıtma"),
    "serviceExplode": MessageLookupByLibrary.simpleMessage("Explode"),
    "serviceInvidious": MessageLookupByLibrary.simpleMessage("Invidious"),
    "serviceNewPipe": MessageLookupByLibrary.simpleMessage("NewPipe Extractor"),
    "servicePiped": MessageLookupByLibrary.simpleMessage("Piped"),
    "settings": MessageLookupByLibrary.simpleMessage("Ayarlar"),
    "share": MessageLookupByLibrary.simpleMessage("Paylaş"),
    "shareLogs": MessageLookupByLibrary.simpleMessage("Günlükleri paylaş"),
    "shareVia": MessageLookupByLibrary.simpleMessage("Şununla paylaş"),
    "shorts": MessageLookupByLibrary.simpleMessage("Shorts"),
    "showLessText": MessageLookupByLibrary.simpleMessage("Daha az göster"),
    "showSearchHistory": MessageLookupByLibrary.simpleMessage(
      "Arama Geçmişini Göster",
    ),
    "showSearchHistoryDescription": MessageLookupByLibrary.simpleMessage(
      "Son aramalarınızı arama ekranında gösterin",
    ),
    "skipInterval": MessageLookupByLibrary.simpleMessage("Atla Aralığı"),
    "skipIntervalDescription": MessageLookupByLibrary.simpleMessage(
      "Çift dokunarak atlama süresi (saniye)",
    ),
    "sleepTimer": MessageLookupByLibrary.simpleMessage("Uyku zamanlayıcısı"),
    "sleepTimerCustom": MessageLookupByLibrary.simpleMessage("Özel"),
    "sleepTimerCustomTitle": MessageLookupByLibrary.simpleMessage(
      "Özel zamanlayıcı",
    ),
    "sleepTimerEndOfVideo": MessageLookupByLibrary.simpleMessage(
      "Video sonunda",
    ),
    "sleepTimerEnded": MessageLookupByLibrary.simpleMessage(
      "Uyku zamanlayıcısı sona erdi",
    ),
    "sleepTimerEnterMinutes": MessageLookupByLibrary.simpleMessage(
      "Dakika girin",
    ),
    "sleepTimerMinutes": m6,
    "sleepTimerMinutesShort": m7,
    "sleepTimerOff": MessageLookupByLibrary.simpleMessage("Kapalı"),
    "sleepTimerSet": MessageLookupByLibrary.simpleMessage("Ayarla"),
    "sort": MessageLookupByLibrary.simpleMessage("Sırala"),
    "sortBy": MessageLookupByLibrary.simpleMessage("Sıralama ölçütü"),
    "sponsor": MessageLookupByLibrary.simpleMessage("Sponsor"),
    "sponsorBlock": MessageLookupByLibrary.simpleMessage("SponsorBlock"),
    "sponsorBlockCategories": MessageLookupByLibrary.simpleMessage(
      "Atlanacak Kategoriler",
    ),
    "sponsorBlockDescription": MessageLookupByLibrary.simpleMessage(
      "Sponsorlu bölümleri otomatik atla",
    ),
    "startDownload": MessageLookupByLibrary.simpleMessage("İndirmeyi Başlat"),
    "startSavingVideos": MessageLookupByLibrary.simpleMessage(
      "Daha sonra izlemek için video kaydetmeye başlayın",
    ),
    "subscribe": MessageLookupByLibrary.simpleMessage("Abone Ol"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Abonelikler"),
    "subtitleSize": MessageLookupByLibrary.simpleMessage("Altyazı Boyutu"),
    "subtitleSizeDescription": MessageLookupByLibrary.simpleMessage(
      "Videodaki altyazıların boyutunu ayarlayın",
    ),
    "subtitleSizeExtraLarge": MessageLookupByLibrary.simpleMessage("Çok Büyük"),
    "subtitleSizeLarge": MessageLookupByLibrary.simpleMessage("Büyük"),
    "subtitleSizeMedium": MessageLookupByLibrary.simpleMessage("Orta"),
    "subtitleSizeSmall": MessageLookupByLibrary.simpleMessage("Küçük"),
    "swipeDownToDismissDisabled": MessageLookupByLibrary.simpleMessage(
      "\'Swipe down to dismiss\' disabled",
    ),
    "swipeUpToDismissEnabled": MessageLookupByLibrary.simpleMessage(
      "\'Swipe up to dismiss\' enabled",
    ),
    "switchProfile": MessageLookupByLibrary.simpleMessage("Profil Değiştir"),
    "switchRegion": MessageLookupByLibrary.simpleMessage(
      "Daha iyi sonuçlar için lütfen farklı bir bölgeye geçmeyi düşünün.",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("Tema"),
    "themeDark": MessageLookupByLibrary.simpleMessage("Koyu"),
    "themeDynamic": MessageLookupByLibrary.simpleMessage("Material You"),
    "themeLight": MessageLookupByLibrary.simpleMessage("Açık"),
    "themeOled": MessageLookupByLibrary.simpleMessage("OLED Siyah"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("Sistem"),
    "thereIsNoSavedOrHistoryVideos": MessageLookupByLibrary.simpleMessage(
      "Kaydedilen/geçmiş video yok",
    ),
    "thereIsNoSavedVideos": MessageLookupByLibrary.simpleMessage(
      "Kaydedilen video yok",
    ),
    "title": MessageLookupByLibrary.simpleMessage("Başlık"),
    "translators": MessageLookupByLibrary.simpleMessage("Çevirmenler"),
    "trending": MessageLookupByLibrary.simpleMessage("Trendler"),
    "unitedKingdom": MessageLookupByLibrary.simpleMessage("Birleşik Krallık"),
    "unitedStates": MessageLookupByLibrary.simpleMessage(
      "Amerika Birleşik Devletleri",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("bilinmiyor"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "Bilinmeyen bir hata oluştu",
    ),
    "unknownQuality": MessageLookupByLibrary.simpleMessage("Bilinmeyen Kalite"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Abonelikten çık"),
    "unsubscribeConfirm": MessageLookupByLibrary.simpleMessage(
      "Bu kanaldan abonelikten çıkılsın mı?",
    ),
    "version": MessageLookupByLibrary.simpleMessage("Sürüm"),
    "video": MessageLookupByLibrary.simpleMessage("Video"),
    "videoAudio": MessageLookupByLibrary.simpleMessage("Video+Ses"),
    "videoCountLabel": m8,
    "videoFit": MessageLookupByLibrary.simpleMessage("Video Sığdırma"),
    "videoFitContain": MessageLookupByLibrary.simpleMessage("Sığdır"),
    "videoFitCover": MessageLookupByLibrary.simpleMessage("Kapla"),
    "videoFitFill": MessageLookupByLibrary.simpleMessage("Doldur"),
    "videoFitFitHeight": MessageLookupByLibrary.simpleMessage(
      "Yüksekliğe Sığdır",
    ),
    "videoFitFitWidth": MessageLookupByLibrary.simpleMessage(
      "Genişliğe Sığdır",
    ),
    "videoOnly": MessageLookupByLibrary.simpleMessage("Yalnızca Video"),
    "videoQuality": MessageLookupByLibrary.simpleMessage("Video Kalitesi"),
    "videoViews": m9,
    "videoWithAudio": MessageLookupByLibrary.simpleMessage("Video + Ses"),
    "videos": MessageLookupByLibrary.simpleMessage("Videolar"),
    "views": MessageLookupByLibrary.simpleMessage("görüntüleme"),
    "watchSomeVideos": MessageLookupByLibrary.simpleMessage(
      "İzlediğiniz videolar burada görünecek",
    ),
    "youtubeService": MessageLookupByLibrary.simpleMessage("YouTube Servisi"),
  };
}
