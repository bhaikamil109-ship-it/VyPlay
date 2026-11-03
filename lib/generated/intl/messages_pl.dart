// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
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
  String get localeName => 'pl';

  static String m0(name) => "Dodano do ${name}";

  static String m1(device) => "Przesyłanie do ${device}";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'Brak subskrybentów', one: 'subskrybent', other: 'subskrybentów')}";

  static String m3(name) => "Usunąć ${name}?";

  static String m4(title) => "Pobieranie nie powiodło się: ${title}";

  static String m5(count) =>
      "${Intl.plural(count, one: 'odpowiedź', other: 'odpowiedzi')}";

  static String m6(count) => "${count} minut";

  static String m7(count) => "${count} min";

  static String m8(count) => "${count} filmów";

  static String m9(count) =>
      "${Intl.plural(count, zero: 'Brak widzów', one: 'widz', other: 'widzów')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Informacje"),
    "addProfile": MessageLookupByLibrary.simpleMessage("Dodaj profil"),
    "addToQueue": MessageLookupByLibrary.simpleMessage("Dodaj do kolejki"),
    "addVideosHint": MessageLookupByLibrary.simpleMessage(
      "Przytrzymaj film, aby zapisać go w playliście",
    ),
    "addedToPlayNext": MessageLookupByLibrary.simpleMessage(
      "Dodano jako następny",
    ),
    "addedToPlaylist": m0,
    "addedToQueue": MessageLookupByLibrary.simpleMessage("Dodano do kolejki"),
    "all": MessageLookupByLibrary.simpleMessage("Wszystko"),
    "audio": MessageLookupByLibrary.simpleMessage("Dźwięk"),
    "audioFocus": MessageLookupByLibrary.simpleMessage("Fokus audio"),
    "audioFocusDescription": MessageLookupByLibrary.simpleMessage(
      "Wstrzymaj odtwarzanie przy przerwaniach",
    ),
    "audioOnly": MessageLookupByLibrary.simpleMessage("Tylko dźwięk"),
    "audioQuality": MessageLookupByLibrary.simpleMessage("Jakość dźwięku"),
    "autoPip": MessageLookupByLibrary.simpleMessage(
      "Automatyczny obraz w obrazie",
    ),
    "autoPipDescription": MessageLookupByLibrary.simpleMessage(
      "Automatycznie włącz tryb PiP po naciśnięciu przycisku głównego podczas odtwarzania",
    ),
    "autoScrollOff": MessageLookupByLibrary.simpleMessage(
      "Autoprzewijanie wył.",
    ),
    "autoScrollOn": MessageLookupByLibrary.simpleMessage("Autoprzewijanie wł."),
    "backupRestore": MessageLookupByLibrary.simpleMessage(
      "Kopia zapasowa i przywracanie",
    ),
    "backupRestoreDescription": MessageLookupByLibrary.simpleMessage(
      "Eksportuj lub importuj swoje subskrypcje",
    ),
    "canada": MessageLookupByLibrary.simpleMessage("Kanada"),
    "cancel": MessageLookupByLibrary.simpleMessage("Anuluj"),
    "cancelled": MessageLookupByLibrary.simpleMessage("Anulowano"),
    "cannotDeleteDefault": MessageLookupByLibrary.simpleMessage(
      "Nie można usunąć profilu domyślnego",
    ),
    "cannotRenameDefault": MessageLookupByLibrary.simpleMessage(
      "Nie można zmienić nazwy profilu domyślnego",
    ),
    "castConnected": MessageLookupByLibrary.simpleMessage("Połączono"),
    "castConnectedTo": m1,
    "castFailed": MessageLookupByLibrary.simpleMessage(
      "Nie można przesłać tego filmu",
    ),
    "castStop": MessageLookupByLibrary.simpleMessage("Zatrzymaj przesyłanie"),
    "castTitle": MessageLookupByLibrary.simpleMessage("Przesyłanie"),
    "castUnavailable": MessageLookupByLibrary.simpleMessage(
      "Przesyłanie nie jest dostępne na tym urządzeniu",
    ),
    "channelSubscribers": m2,
    "channels": MessageLookupByLibrary.simpleMessage("Kanały"),
    "clearAll": MessageLookupByLibrary.simpleMessage("Wyczyść wszystko"),
    "clearAllHistory": MessageLookupByLibrary.simpleMessage(
      "Wyczyść całą historię",
    ),
    "clearAllHistoryConfirm": MessageLookupByLibrary.simpleMessage(
      "Czy na pewno chcesz wyczyścić całą historię oglądania?",
    ),
    "clearAllSaved": MessageLookupByLibrary.simpleMessage(
      "Wyczyść wszystkie zapisane",
    ),
    "clearAllSavedConfirm": MessageLookupByLibrary.simpleMessage(
      "Czy na pewno chcesz usunąć wszystkie zapisane filmy?",
    ),
    "clearLogs": MessageLookupByLibrary.simpleMessage("Wyczyść logi"),
    "commentAuthorNotFound": MessageLookupByLibrary.simpleMessage(
      "Nie znaleziono",
    ),
    "commentsDisabled": MessageLookupByLibrary.simpleMessage(
      "Komentarze są wyłączone",
    ),
    "commonSettingsTitle": MessageLookupByLibrary.simpleMessage("Zwykłe"),
    "completed": MessageLookupByLibrary.simpleMessage("Ukończono"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Skopiowano do schowka",
    ),
    "copyLink": MessageLookupByLibrary.simpleMessage("Kopiuj link"),
    "createAction": MessageLookupByLibrary.simpleMessage("Utwórz"),
    "dateAdded": MessageLookupByLibrary.simpleMessage("Data dodania"),
    "debugConsole": MessageLookupByLibrary.simpleMessage("Konsola debugowania"),
    "defaultProfile": MessageLookupByLibrary.simpleMessage("Domyślny"),
    "defaultQuality": MessageLookupByLibrary.simpleMessage("Domyślna jakość"),
    "delete": MessageLookupByLibrary.simpleMessage("Usuń"),
    "deleteDownload": MessageLookupByLibrary.simpleMessage("Usuń pobrane"),
    "deleteDownloadConfirm": MessageLookupByLibrary.simpleMessage(
      "Czy na pewno chcesz usunąć to pobranie?",
    ),
    "deletePlaylistAction": MessageLookupByLibrary.simpleMessage(
      "Usuń playlistę",
    ),
    "deletePlaylistConfirm": m3,
    "deletePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "Usuń playlistę",
    ),
    "deleteProfile": MessageLookupByLibrary.simpleMessage("Usuń profil"),
    "deleteVideo": MessageLookupByLibrary.simpleMessage("Usuń film"),
    "deleteVideoConfirm": MessageLookupByLibrary.simpleMessage(
      "Czy na pewno chcesz usunąć ten film?",
    ),
    "developer": MessageLookupByLibrary.simpleMessage("Programista"),
    "disablePipPlayer": MessageLookupByLibrary.simpleMessage(
      "Wyłącz obraz w obrazie",
    ),
    "disableVideoHistory": MessageLookupByLibrary.simpleMessage(
      "Wyłącz historię filmów",
    ),
    "dislike": MessageLookupByLibrary.simpleMessage("Nie lubię"),
    "distractionFree": MessageLookupByLibrary.simpleMessage("Tryb skupienia"),
    "download": MessageLookupByLibrary.simpleMessage("Pobierz"),
    "downloadFailed": m4,
    "downloadStarted": MessageLookupByLibrary.simpleMessage(
      "Pobieranie rozpoczęte",
    ),
    "downloadType": MessageLookupByLibrary.simpleMessage("Typ pobierania"),
    "downloading": MessageLookupByLibrary.simpleMessage("Pobieranie"),
    "downloadingAudio": MessageLookupByLibrary.simpleMessage(
      "Pobieranie dźwięku",
    ),
    "downloadingVideo": MessageLookupByLibrary.simpleMessage(
      "Pobieranie wideo",
    ),
    "downloads": MessageLookupByLibrary.simpleMessage("Pobrane"),
    "duration": MessageLookupByLibrary.simpleMessage("Czas trwania"),
    "enableHlsPlayerDescription": MessageLookupByLibrary.simpleMessage(
      "Włącz odtwarzacz HLS, aby odblokować wszystkie opcje jakości. Wyłącz, jeśli wystąpią błędy.",
    ),
    "exportData": MessageLookupByLibrary.simpleMessage("Eksportuj dane"),
    "exportSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Eksportuj subskrypcje",
    ),
    "exportSuccess": MessageLookupByLibrary.simpleMessage("Eksport zakończony"),
    "failed": MessageLookupByLibrary.simpleMessage("Niepowodzenie"),
    "failedToOpenFile": MessageLookupByLibrary.simpleMessage(
      "Nie udało się otworzyć pliku",
    ),
    "fileNotFound": MessageLookupByLibrary.simpleMessage(
      "Nie znaleziono pliku",
    ),
    "filterAll": MessageLookupByLibrary.simpleMessage("Wszystko"),
    "filterChannels": MessageLookupByLibrary.simpleMessage("Kanały"),
    "filterMusic": MessageLookupByLibrary.simpleMessage("Muzyka"),
    "filterPlaylists": MessageLookupByLibrary.simpleMessage("Playlisty"),
    "filterVideos": MessageLookupByLibrary.simpleMessage("Filmy"),
    "france": MessageLookupByLibrary.simpleMessage("Francja"),
    "hideComments": MessageLookupByLibrary.simpleMessage("Ukryj komentarze"),
    "hideCommentsButtonFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "Ukryj przycisk komentarzy z ekranu oglądania",
    ),
    "hideRelated": MessageLookupByLibrary.simpleMessage("Ukryj powiązane"),
    "hideRelatedVideosFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "Ukryj powiązane filmy z ekranu oglądania",
    ),
    "history": MessageLookupByLibrary.simpleMessage("Historia"),
    "hlsPlayer": MessageLookupByLibrary.simpleMessage("Odtwarzacz Hls"),
    "home": MessageLookupByLibrary.simpleMessage("Strona główna"),
    "homeFeedMode": MessageLookupByLibrary.simpleMessage("Kanał główny"),
    "homeFeedModeAuto": MessageLookupByLibrary.simpleMessage("Automatycznie"),
    "homeFeedModeAutoHint": MessageLookupByLibrary.simpleMessage(
      "Pokaż subskrypcje, jeśli są, w przeciwnym razie popularne",
    ),
    "homeFeedModeFeedOnly": MessageLookupByLibrary.simpleMessage("Subskrypcje"),
    "homeFeedModeFeedOnlyHint": MessageLookupByLibrary.simpleMessage(
      "Pokazuj tylko filmy z subskrybowanych kanałów",
    ),
    "homeFeedModeTrendingOnly": MessageLookupByLibrary.simpleMessage(
      "Na czasie",
    ),
    "homeFeedModeTrendingOnlyHint": MessageLookupByLibrary.simpleMessage(
      "Zawsze pokazuj tylko popularne filmy",
    ),
    "imageCacheLabel": MessageLookupByLibrary.simpleMessage(
      "Pamięć podręczna obrazów",
    ),
    "importData": MessageLookupByLibrary.simpleMessage("Importuj dane"),
    "importError": MessageLookupByLibrary.simpleMessage(
      "Import nie powiódł się",
    ),
    "importSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Importuj subskrypcje",
    ),
    "importSuccess": MessageLookupByLibrary.simpleMessage("Import zakończony"),
    "includeTitle": MessageLookupByLibrary.simpleMessage("Zawiera tytuł"),
    "india": MessageLookupByLibrary.simpleMessage("Indie"),
    "instances": MessageLookupByLibrary.simpleMessage("Wystąpienia"),
    "interaction": MessageLookupByLibrary.simpleMessage("Interakcja"),
    "intro": MessageLookupByLibrary.simpleMessage("Intro"),
    "language": MessageLookupByLibrary.simpleMessage("Język"),
    "library": MessageLookupByLibrary.simpleMessage("Biblioteka"),
    "like": MessageLookupByLibrary.simpleMessage("Lubię to"),
    "localPlaylists": MessageLookupByLibrary.simpleMessage("Playlisty"),
    "logsLabel": MessageLookupByLibrary.simpleMessage("Logi"),
    "merging": MessageLookupByLibrary.simpleMessage("Scalanie"),
    "musicOfftopic": MessageLookupByLibrary.simpleMessage("Muzyka: nie-muzyka"),
    "netherlands": MessageLookupByLibrary.simpleMessage("Holandia"),
    "newNameHint": MessageLookupByLibrary.simpleMessage("Nowa nazwa"),
    "newPlaylist": MessageLookupByLibrary.simpleMessage("Nowa playlista"),
    "newPlaylistShort": MessageLookupByLibrary.simpleMessage("+ Nowa"),
    "newProfileName": MessageLookupByLibrary.simpleMessage(
      "Nowa nazwa profilu",
    ),
    "newVideoNotifications": MessageLookupByLibrary.simpleMessage(
      "Powiadomienia o nowych filmach",
    ),
    "newVideoNotificationsDescription": MessageLookupByLibrary.simpleMessage(
      "Otrzymuj powiadomienia, gdy subskrybowane kanały dodają filmy",
    ),
    "noCommentsFound": MessageLookupByLibrary.simpleMessage(
      "Nie znaleziono komentarzy",
    ),
    "noDownloads": MessageLookupByLibrary.simpleMessage("Brak pobranych"),
    "noDownloadsHint": MessageLookupByLibrary.simpleMessage(
      "Pobrane filmy pojawią się tutaj",
    ),
    "noHistory": MessageLookupByLibrary.simpleMessage(
      "Brak historii oglądania",
    ),
    "noLogs": MessageLookupByLibrary.simpleMessage("Brak logów"),
    "noPlaylists": MessageLookupByLibrary.simpleMessage("Brak playlist"),
    "noPlaylistsYet": MessageLookupByLibrary.simpleMessage(
      "Brak playlist.\nDotknij +, aby utworzyć.",
    ),
    "noPlaylistsYetPicker": MessageLookupByLibrary.simpleMessage(
      "Brak playlist.\nDotknij + Nowa, aby utworzyć.",
    ),
    "noSavedVideos": MessageLookupByLibrary.simpleMessage(
      "Brak zapisanych filmów",
    ),
    "noShorts": MessageLookupByLibrary.simpleMessage("Brak Shorts"),
    "noShortsHint": MessageLookupByLibrary.simpleMessage(
      "Short videos will appear here",
    ),
    "noSubscriptions": MessageLookupByLibrary.simpleMessage("Brak subskrypcji"),
    "noSubscriptionsHint": MessageLookupByLibrary.simpleMessage(
      "Subskrybuj kanały, aby zobaczyć ich filmy tutaj",
    ),
    "noUploadDate": MessageLookupByLibrary.simpleMessage("Brak daty"),
    "noUploaderName": MessageLookupByLibrary.simpleMessage("Brak nazwy"),
    "noVideoAvailableChangedToHls": MessageLookupByLibrary.simpleMessage(
      "Brak dostępnego źródła, automatycznie zmienianie na hls",
    ),
    "noVideoDescription": MessageLookupByLibrary.simpleMessage("Brak opisu"),
    "noVideoTitle": MessageLookupByLibrary.simpleMessage("Brak tytułu"),
    "noVideosFound": MessageLookupByLibrary.simpleMessage(
      "Nie znaleziono filmów",
    ),
    "noVideosInPlaylist": MessageLookupByLibrary.simpleMessage("Brak filmów"),
    "notificationsDenied": MessageLookupByLibrary.simpleMessage(
      "Odmówiono uprawnienia do powiadomień",
    ),
    "openInBrowser": MessageLookupByLibrary.simpleMessage(
      "Otwórz w przeglądarce",
    ),
    "openLinksExternally": MessageLookupByLibrary.simpleMessage(
      "Otwieraj linki w zewnętrznej przeglądarce",
    ),
    "outro": MessageLookupByLibrary.simpleMessage("Outro"),
    "pause": MessageLookupByLibrary.simpleMessage("Wstrzymaj"),
    "pauseOnCall": MessageLookupByLibrary.simpleMessage(
      "Wstrzymaj podczas połączenia",
    ),
    "pauseOnHeadphones": MessageLookupByLibrary.simpleMessage(
      "Wstrzymaj po odłączeniu słuchawek",
    ),
    "paused": MessageLookupByLibrary.simpleMessage("Wstrzymano"),
    "pending": MessageLookupByLibrary.simpleMessage("Oczekuje"),
    "pinned": MessageLookupByLibrary.simpleMessage("Przypięte"),
    "platformLabel": MessageLookupByLibrary.simpleMessage("Platforma"),
    "playAll": MessageLookupByLibrary.simpleMessage("Odtwórz wszystko"),
    "playNext": MessageLookupByLibrary.simpleMessage("Odtwórz następny"),
    "playlist": MessageLookupByLibrary.simpleMessage("Playlista"),
    "playlistNameHint": MessageLookupByLibrary.simpleMessage("Nazwa playlisty"),
    "playlistNotFound": MessageLookupByLibrary.simpleMessage(
      "Nie znaleziono playlisty",
    ),
    "playlists": MessageLookupByLibrary.simpleMessage("Playlisty"),
    "profileInUse": MessageLookupByLibrary.simpleMessage("Aktywny"),
    "profileName": MessageLookupByLibrary.simpleMessage("Nazwa profilu"),
    "profiles": MessageLookupByLibrary.simpleMessage("Profile"),
    "profilesDescription": MessageLookupByLibrary.simpleMessage(
      "Twórz osobne profile dla różnych kont lub preferencji",
    ),
    "quality1080p": MessageLookupByLibrary.simpleMessage("1080p"),
    "quality1440p": MessageLookupByLibrary.simpleMessage("1440p"),
    "quality144p": MessageLookupByLibrary.simpleMessage("144p"),
    "quality240p": MessageLookupByLibrary.simpleMessage("240p"),
    "quality360p": MessageLookupByLibrary.simpleMessage("360p"),
    "quality480p": MessageLookupByLibrary.simpleMessage("480p"),
    "quality720p": MessageLookupByLibrary.simpleMessage("720p"),
    "queue": MessageLookupByLibrary.simpleMessage("Kolejka"),
    "queueClear": MessageLookupByLibrary.simpleMessage("Wyczyść"),
    "queueEmpty": MessageLookupByLibrary.simpleMessage("Kolejka jest pusta"),
    "queueShuffle": MessageLookupByLibrary.simpleMessage("Losowo"),
    "readMoreText": MessageLookupByLibrary.simpleMessage("Więcej"),
    "recentSearches": MessageLookupByLibrary.simpleMessage(
      "Ostatnie wyszukiwania",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "refreshToLoad": MessageLookupByLibrary.simpleMessage(
      "Przeciągnij w dół, aby odświeżyć",
    ),
    "region": MessageLookupByLibrary.simpleMessage("Region"),
    "relatedTitle": MessageLookupByLibrary.simpleMessage("Powiązane"),
    "removeFromHistory": MessageLookupByLibrary.simpleMessage(
      "Usuń z historii",
    ),
    "removeFromQueue": MessageLookupByLibrary.simpleMessage("Usuń z kolejki"),
    "removeFromSaved": MessageLookupByLibrary.simpleMessage(
      "Usuń z zapisanych",
    ),
    "renameAction": MessageLookupByLibrary.simpleMessage("Zmień nazwę"),
    "renamePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "Zmień nazwę playlisty",
    ),
    "renameProfile": MessageLookupByLibrary.simpleMessage(
      "Zmień nazwę profilu",
    ),
    "repliesNotSupported": MessageLookupByLibrary.simpleMessage(
      "Odpowiedzi nie są jeszcze dostępne",
    ),
    "repliesPlural": m5,
    "resume": MessageLookupByLibrary.simpleMessage("Wznów"),
    "retrieveDislikeCounts": MessageLookupByLibrary.simpleMessage(
      "Liczba przywróconych łapek w dół",
    ),
    "retrieveDislikes": MessageLookupByLibrary.simpleMessage(
      "Przywróć łapki w dół",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Ponów"),
    "saveToDevice": MessageLookupByLibrary.simpleMessage(
      "Zapisz na urządzeniu",
    ),
    "saveToDeviceFailed": MessageLookupByLibrary.simpleMessage(
      "Nie udało się zapisać na urządzeniu",
    ),
    "saveToPlaylist": MessageLookupByLibrary.simpleMessage(
      "Zapisz w playliście",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Zapisane"),
    "savedToDevice": MessageLookupByLibrary.simpleMessage(
      "Zapisano na urządzeniu",
    ),
    "savedVideosTitle": MessageLookupByLibrary.simpleMessage("Zapisane filmy"),
    "savingToDevice": MessageLookupByLibrary.simpleMessage(
      "Zapisywanie na urządzeniu...",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Szukaj"),
    "searchFilters": MessageLookupByLibrary.simpleMessage("Filtry"),
    "searchForVideosChannels": MessageLookupByLibrary.simpleMessage(
      "Szukaj filmów, kanałów i playlist",
    ),
    "searchHistoryEnabled": MessageLookupByLibrary.simpleMessage(
      "Zapisuj historię wyszukiwania",
    ),
    "searchHistoryEnabledDescription": MessageLookupByLibrary.simpleMessage(
      "Zapisuj zapytania, aby mieć do nich szybki dostęp",
    ),
    "searchSavedVideos": MessageLookupByLibrary.simpleMessage(
      "Szukaj w zapisanych filmach...",
    ),
    "searchSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Szukaj w subskrypcjach...",
    ),
    "searchYouTube": MessageLookupByLibrary.simpleMessage(
      "Szukaj w YouTube...",
    ),
    "seconds": MessageLookupByLibrary.simpleMessage("sekund"),
    "selectAll": MessageLookupByLibrary.simpleMessage("Zaznacz wszystko"),
    "selectFile": MessageLookupByLibrary.simpleMessage("Wybierz plik"),
    "selectVideos": MessageLookupByLibrary.simpleMessage("Wybierz filmy"),
    "selected": MessageLookupByLibrary.simpleMessage("wybrano"),
    "selfPromotion": MessageLookupByLibrary.simpleMessage("Autopromocja"),
    "serviceExplode": MessageLookupByLibrary.simpleMessage("Explode"),
    "serviceInvidious": MessageLookupByLibrary.simpleMessage("Invidious"),
    "serviceNewPipe": MessageLookupByLibrary.simpleMessage("NewPipe Extractor"),
    "servicePiped": MessageLookupByLibrary.simpleMessage("Piped"),
    "settings": MessageLookupByLibrary.simpleMessage("Ustawienia"),
    "share": MessageLookupByLibrary.simpleMessage("Udostępnij"),
    "shareLogs": MessageLookupByLibrary.simpleMessage("Udostępnij logi"),
    "shareVia": MessageLookupByLibrary.simpleMessage("Udostępnij przez"),
    "shorts": MessageLookupByLibrary.simpleMessage("Shorts"),
    "showLessText": MessageLookupByLibrary.simpleMessage("Pokaż mniej"),
    "showSearchHistory": MessageLookupByLibrary.simpleMessage(
      "Pokaż historię wyszukiwania",
    ),
    "showSearchHistoryDescription": MessageLookupByLibrary.simpleMessage(
      "Pokazuj ostatnie wyszukiwania na ekranie wyszukiwania",
    ),
    "skipInterval": MessageLookupByLibrary.simpleMessage(
      "Interwał przewijania",
    ),
    "skipIntervalDescription": MessageLookupByLibrary.simpleMessage(
      "Czas przewijania po dwukrotnym dotknięciu w sekundach",
    ),
    "sleepTimer": MessageLookupByLibrary.simpleMessage("Wyłącznik czasowy"),
    "sleepTimerCustom": MessageLookupByLibrary.simpleMessage("Niestandardowy"),
    "sleepTimerCustomTitle": MessageLookupByLibrary.simpleMessage(
      "Niestandardowy wyłącznik",
    ),
    "sleepTimerEndOfVideo": MessageLookupByLibrary.simpleMessage(
      "Koniec filmu",
    ),
    "sleepTimerEnded": MessageLookupByLibrary.simpleMessage(
      "Wyłącznik czasowy zakończony",
    ),
    "sleepTimerEnterMinutes": MessageLookupByLibrary.simpleMessage(
      "Wpisz minuty",
    ),
    "sleepTimerMinutes": m6,
    "sleepTimerMinutesShort": m7,
    "sleepTimerOff": MessageLookupByLibrary.simpleMessage("Wył."),
    "sleepTimerSet": MessageLookupByLibrary.simpleMessage("Ustaw"),
    "sort": MessageLookupByLibrary.simpleMessage("Sortuj"),
    "sortBy": MessageLookupByLibrary.simpleMessage("Sortuj według"),
    "sponsor": MessageLookupByLibrary.simpleMessage("Sponsor"),
    "sponsorBlock": MessageLookupByLibrary.simpleMessage("SponsorBlock"),
    "sponsorBlockCategories": MessageLookupByLibrary.simpleMessage(
      "Pomijane kategorie",
    ),
    "sponsorBlockDescription": MessageLookupByLibrary.simpleMessage(
      "Automatycznie pomijaj segmenty sponsorskie",
    ),
    "startDownload": MessageLookupByLibrary.simpleMessage(
      "Rozpocznij pobieranie",
    ),
    "startSavingVideos": MessageLookupByLibrary.simpleMessage(
      "Zacznij zapisywać filmy do obejrzenia później",
    ),
    "subscribe": MessageLookupByLibrary.simpleMessage("Subskrybuj"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Subskrypcje"),
    "subtitleSize": MessageLookupByLibrary.simpleMessage("Rozmiar napisów"),
    "subtitleSizeDescription": MessageLookupByLibrary.simpleMessage(
      "Dostosuj rozmiar napisów w filmie",
    ),
    "subtitleSizeExtraLarge": MessageLookupByLibrary.simpleMessage(
      "Bardzo duży",
    ),
    "subtitleSizeLarge": MessageLookupByLibrary.simpleMessage("Duży"),
    "subtitleSizeMedium": MessageLookupByLibrary.simpleMessage("Średni"),
    "subtitleSizeSmall": MessageLookupByLibrary.simpleMessage("Mały"),
    "swipeDownToDismissDisabled": MessageLookupByLibrary.simpleMessage(
      "Funkcja „Przesuń w dół, aby odrzucić” wyłączona",
    ),
    "swipeUpToDismissEnabled": MessageLookupByLibrary.simpleMessage(
      "Funkcja „Przesuń w dół, aby odrzucić” włączona",
    ),
    "switchProfile": MessageLookupByLibrary.simpleMessage("Przełącz profil"),
    "switchRegion": MessageLookupByLibrary.simpleMessage(
      "Rozważ zmianę regionu, aby uzyskać lepsze wyniki.",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("Motyw"),
    "themeDark": MessageLookupByLibrary.simpleMessage("Ciemny"),
    "themeDynamic": MessageLookupByLibrary.simpleMessage("Material You"),
    "themeLight": MessageLookupByLibrary.simpleMessage("Jasny"),
    "themeOled": MessageLookupByLibrary.simpleMessage("Czerń OLED"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("Systemowy"),
    "thereIsNoSavedOrHistoryVideos": MessageLookupByLibrary.simpleMessage(
      "Nie masz zapisanych filmów i historii",
    ),
    "thereIsNoSavedVideos": MessageLookupByLibrary.simpleMessage(
      "Nie masz zapisanych filmów",
    ),
    "title": MessageLookupByLibrary.simpleMessage("Tytuł"),
    "translators": MessageLookupByLibrary.simpleMessage("Tłumacze"),
    "trending": MessageLookupByLibrary.simpleMessage("Na czasie"),
    "unitedKingdom": MessageLookupByLibrary.simpleMessage("Wielka Brytania"),
    "unitedStates": MessageLookupByLibrary.simpleMessage("Stany Zjednoczone"),
    "unknown": MessageLookupByLibrary.simpleMessage("nieznana"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "Wystąpił nieznany błąd",
    ),
    "unknownQuality": MessageLookupByLibrary.simpleMessage("Nieznana jakość"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Anuluj subskrypcję"),
    "unsubscribeConfirm": MessageLookupByLibrary.simpleMessage(
      "Anulować subskrypcję tego kanału?",
    ),
    "version": MessageLookupByLibrary.simpleMessage("Wersja"),
    "video": MessageLookupByLibrary.simpleMessage("Film"),
    "videoAudio": MessageLookupByLibrary.simpleMessage("Wideo+dźwięk"),
    "videoCountLabel": m8,
    "videoFit": MessageLookupByLibrary.simpleMessage("Dopasowanie wideo"),
    "videoFitContain": MessageLookupByLibrary.simpleMessage("Dopasuj"),
    "videoFitCover": MessageLookupByLibrary.simpleMessage("Wypełnij"),
    "videoFitFill": MessageLookupByLibrary.simpleMessage("Rozciągnij"),
    "videoFitFitHeight": MessageLookupByLibrary.simpleMessage(
      "Dopasuj do wysokości",
    ),
    "videoFitFitWidth": MessageLookupByLibrary.simpleMessage(
      "Dopasuj do szerokości",
    ),
    "videoOnly": MessageLookupByLibrary.simpleMessage("Tylko wideo"),
    "videoQuality": MessageLookupByLibrary.simpleMessage("Jakość wideo"),
    "videoViews": m9,
    "videoWithAudio": MessageLookupByLibrary.simpleMessage("Wideo + dźwięk"),
    "videos": MessageLookupByLibrary.simpleMessage("Filmy"),
    "views": MessageLookupByLibrary.simpleMessage("wyświetleń"),
    "watchSomeVideos": MessageLookupByLibrary.simpleMessage(
      "Obejrzane filmy pojawią się tutaj",
    ),
    "youtubeService": MessageLookupByLibrary.simpleMessage("Usługa YouTube"),
  };
}
