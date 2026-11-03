// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(name) => "Добавлено в ${name}";

  static String m1(device) => "Трансляция на ${device}";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'Нет подписчиков', one: 'подписчик', few: 'подписчика', many: 'подписчиков', other: 'подписчика')}";

  static String m3(name) => "Удалить ${name}?";

  static String m4(title) => "Ошибка загрузки: ${title}";

  static String m5(count) =>
      "${Intl.plural(count, one: 'ответ', other: 'ответа')}";

  static String m6(count) => "${count} минут";

  static String m7(count) => "${count} мин";

  static String m8(count) => "${count} видео";

  static String m9(count) =>
      "${Intl.plural(count, zero: 'Нет просмотров', one: 'просмотр', few: 'просмотра', many: 'просмотров', other: 'просмотра')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("О приложении"),
    "addProfile": MessageLookupByLibrary.simpleMessage("Добавить профиль"),
    "addToQueue": MessageLookupByLibrary.simpleMessage("Добавить в очередь"),
    "addVideosHint": MessageLookupByLibrary.simpleMessage(
      "Удерживайте видео, чтобы сохранить его в плейлист",
    ),
    "addedToPlayNext": MessageLookupByLibrary.simpleMessage(
      "Добавлено следующим",
    ),
    "addedToPlaylist": m0,
    "addedToQueue": MessageLookupByLibrary.simpleMessage("Добавлено в очередь"),
    "all": MessageLookupByLibrary.simpleMessage("Все"),
    "audio": MessageLookupByLibrary.simpleMessage("Аудио"),
    "audioFocus": MessageLookupByLibrary.simpleMessage("Аудиофокус"),
    "audioFocusDescription": MessageLookupByLibrary.simpleMessage(
      "Приостанавливать воспроизведение при прерываниях",
    ),
    "audioOnly": MessageLookupByLibrary.simpleMessage("Только аудио"),
    "audioQuality": MessageLookupByLibrary.simpleMessage("Качество аудио"),
    "autoPip": MessageLookupByLibrary.simpleMessage("Авто картинка в картинке"),
    "autoPipDescription": MessageLookupByLibrary.simpleMessage(
      "Автоматически переходить в режим PiP при нажатии кнопки «Домой» во время воспроизведения",
    ),
    "autoScrollOff": MessageLookupByLibrary.simpleMessage(
      "Автопрокрутка выкл.",
    ),
    "autoScrollOn": MessageLookupByLibrary.simpleMessage("Автопрокрутка вкл."),
    "backupRestore": MessageLookupByLibrary.simpleMessage(
      "Резервное копирование",
    ),
    "backupRestoreDescription": MessageLookupByLibrary.simpleMessage(
      "Экспорт или импорт ваших подписок",
    ),
    "canada": MessageLookupByLibrary.simpleMessage("Канада"),
    "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
    "cancelled": MessageLookupByLibrary.simpleMessage("Отменено"),
    "cannotDeleteDefault": MessageLookupByLibrary.simpleMessage(
      "Нельзя удалить профиль по умолчанию",
    ),
    "cannotRenameDefault": MessageLookupByLibrary.simpleMessage(
      "Нельзя переименовать профиль по умолчанию",
    ),
    "castConnected": MessageLookupByLibrary.simpleMessage("Подключено"),
    "castConnectedTo": m1,
    "castFailed": MessageLookupByLibrary.simpleMessage(
      "Это видео нельзя транслировать",
    ),
    "castStop": MessageLookupByLibrary.simpleMessage("Остановить трансляцию"),
    "castTitle": MessageLookupByLibrary.simpleMessage("Трансляция"),
    "castUnavailable": MessageLookupByLibrary.simpleMessage(
      "Трансляция недоступна на этом устройстве",
    ),
    "channelSubscribers": m2,
    "channels": MessageLookupByLibrary.simpleMessage("Каналы"),
    "clearAll": MessageLookupByLibrary.simpleMessage("Очистить всё"),
    "clearAllHistory": MessageLookupByLibrary.simpleMessage("Очистить историю"),
    "clearAllHistoryConfirm": MessageLookupByLibrary.simpleMessage(
      "Очистить всю историю просмотров?",
    ),
    "clearAllSaved": MessageLookupByLibrary.simpleMessage(
      "Очистить сохранённые",
    ),
    "clearAllSavedConfirm": MessageLookupByLibrary.simpleMessage(
      "Удалить все сохранённые видео?",
    ),
    "clearLogs": MessageLookupByLibrary.simpleMessage("Очистить логи"),
    "commentAuthorNotFound": MessageLookupByLibrary.simpleMessage("Не найден"),
    "commentsDisabled": MessageLookupByLibrary.simpleMessage(
      "Комментарии отключены",
    ),
    "commonSettingsTitle": MessageLookupByLibrary.simpleMessage("Общие"),
    "completed": MessageLookupByLibrary.simpleMessage("Завершено"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Скопировано в буфер обмена",
    ),
    "copyLink": MessageLookupByLibrary.simpleMessage("Копировать ссылку"),
    "createAction": MessageLookupByLibrary.simpleMessage("Создать"),
    "dateAdded": MessageLookupByLibrary.simpleMessage("Дате добавления"),
    "debugConsole": MessageLookupByLibrary.simpleMessage("Консоль отладки"),
    "defaultProfile": MessageLookupByLibrary.simpleMessage("По умолчанию"),
    "defaultQuality": MessageLookupByLibrary.simpleMessage(
      "Качество по умолчанию",
    ),
    "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
    "deleteDownload": MessageLookupByLibrary.simpleMessage("Удалить загрузку"),
    "deleteDownloadConfirm": MessageLookupByLibrary.simpleMessage(
      "Удалить эту загрузку?",
    ),
    "deletePlaylistAction": MessageLookupByLibrary.simpleMessage(
      "Удалить плейлист",
    ),
    "deletePlaylistConfirm": m3,
    "deletePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "Удалить плейлист",
    ),
    "deleteProfile": MessageLookupByLibrary.simpleMessage("Удалить профиль"),
    "deleteVideo": MessageLookupByLibrary.simpleMessage("Удалить видео"),
    "deleteVideoConfirm": MessageLookupByLibrary.simpleMessage(
      "Удалить это видео?",
    ),
    "developer": MessageLookupByLibrary.simpleMessage("Разработчик"),
    "disablePipPlayer": MessageLookupByLibrary.simpleMessage(
      "Disable PIP player",
    ),
    "disableVideoHistory": MessageLookupByLibrary.simpleMessage(
      "Отключить историю просмотров",
    ),
    "dislike": MessageLookupByLibrary.simpleMessage("Не нравится"),
    "distractionFree": MessageLookupByLibrary.simpleMessage("Отсекая лишнее"),
    "download": MessageLookupByLibrary.simpleMessage("Скачать"),
    "downloadFailed": m4,
    "downloadStarted": MessageLookupByLibrary.simpleMessage("Загрузка начата"),
    "downloadType": MessageLookupByLibrary.simpleMessage("Тип загрузки"),
    "downloading": MessageLookupByLibrary.simpleMessage("Загрузка"),
    "downloadingAudio": MessageLookupByLibrary.simpleMessage("Загрузка аудио"),
    "downloadingVideo": MessageLookupByLibrary.simpleMessage("Загрузка видео"),
    "downloads": MessageLookupByLibrary.simpleMessage("Загрузки"),
    "duration": MessageLookupByLibrary.simpleMessage("Длительности"),
    "enableHlsPlayerDescription": MessageLookupByLibrary.simpleMessage(
      "Переключит на проигрыватель HLS, поддерживающий больше форматов. Отключите при ошибках.",
    ),
    "exportData": MessageLookupByLibrary.simpleMessage("Экспорт данных"),
    "exportSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Экспорт подписок",
    ),
    "exportSuccess": MessageLookupByLibrary.simpleMessage("Экспорт выполнен"),
    "failed": MessageLookupByLibrary.simpleMessage("Ошибка"),
    "failedToOpenFile": MessageLookupByLibrary.simpleMessage(
      "Не удалось открыть файл",
    ),
    "fileNotFound": MessageLookupByLibrary.simpleMessage("Файл не найден"),
    "filterAll": MessageLookupByLibrary.simpleMessage("Все"),
    "filterChannels": MessageLookupByLibrary.simpleMessage("Каналы"),
    "filterMusic": MessageLookupByLibrary.simpleMessage("Музыка"),
    "filterPlaylists": MessageLookupByLibrary.simpleMessage("Плейлисты"),
    "filterVideos": MessageLookupByLibrary.simpleMessage("Видео"),
    "france": MessageLookupByLibrary.simpleMessage("Франция"),
    "hideComments": MessageLookupByLibrary.simpleMessage("Скрыть коментарии"),
    "hideCommentsButtonFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "Убирает кнопку показа коментариев с экрана просмотра.",
    ),
    "hideRelated": MessageLookupByLibrary.simpleMessage("Скрыть похожие"),
    "hideRelatedVideosFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "Убирает ленту похожих видео с экрана просмотра.",
    ),
    "history": MessageLookupByLibrary.simpleMessage("История"),
    "hlsPlayer": MessageLookupByLibrary.simpleMessage("Проигрыватель HLS"),
    "home": MessageLookupByLibrary.simpleMessage("Главная"),
    "homeFeedMode": MessageLookupByLibrary.simpleMessage("Главная лента"),
    "homeFeedModeAuto": MessageLookupByLibrary.simpleMessage("Авто"),
    "homeFeedModeAutoHint": MessageLookupByLibrary.simpleMessage(
      "Показывать подписки, если есть, иначе тренды",
    ),
    "homeFeedModeFeedOnly": MessageLookupByLibrary.simpleMessage("Подписки"),
    "homeFeedModeFeedOnlyHint": MessageLookupByLibrary.simpleMessage(
      "Показывать только видео с каналов, на которые вы подписаны",
    ),
    "homeFeedModeTrendingOnly": MessageLookupByLibrary.simpleMessage(
      "В тренде",
    ),
    "homeFeedModeTrendingOnlyHint": MessageLookupByLibrary.simpleMessage(
      "Всегда показывать только трендовые видео",
    ),
    "imageCacheLabel": MessageLookupByLibrary.simpleMessage("Кэш изображений"),
    "importData": MessageLookupByLibrary.simpleMessage("Импорт данных"),
    "importError": MessageLookupByLibrary.simpleMessage("Ошибка импорта"),
    "importSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Импорт подписок",
    ),
    "importSuccess": MessageLookupByLibrary.simpleMessage("Импорт выполнен"),
    "includeTitle": MessageLookupByLibrary.simpleMessage("Включая название"),
    "india": MessageLookupByLibrary.simpleMessage("Индия"),
    "instances": MessageLookupByLibrary.simpleMessage("Зеркала"),
    "interaction": MessageLookupByLibrary.simpleMessage("Взаимодействие"),
    "intro": MessageLookupByLibrary.simpleMessage("Вступление"),
    "language": MessageLookupByLibrary.simpleMessage("Язык"),
    "library": MessageLookupByLibrary.simpleMessage("Библиотека"),
    "like": MessageLookupByLibrary.simpleMessage("Нравится"),
    "localPlaylists": MessageLookupByLibrary.simpleMessage("Плейлисты"),
    "logsLabel": MessageLookupByLibrary.simpleMessage("Логи"),
    "merging": MessageLookupByLibrary.simpleMessage("Объединение"),
    "musicOfftopic": MessageLookupByLibrary.simpleMessage("Музыка: не музыка"),
    "netherlands": MessageLookupByLibrary.simpleMessage("Нидерланды"),
    "newNameHint": MessageLookupByLibrary.simpleMessage("Новое название"),
    "newPlaylist": MessageLookupByLibrary.simpleMessage("Новый плейлист"),
    "newPlaylistShort": MessageLookupByLibrary.simpleMessage("+ Новый"),
    "newProfileName": MessageLookupByLibrary.simpleMessage("Новое имя профиля"),
    "newVideoNotifications": MessageLookupByLibrary.simpleMessage(
      "Уведомления о новых видео",
    ),
    "newVideoNotificationsDescription": MessageLookupByLibrary.simpleMessage(
      "Получать уведомления, когда каналы, на которые вы подписаны, загружают видео",
    ),
    "noCommentsFound": MessageLookupByLibrary.simpleMessage(
      "No Comments Found",
    ),
    "noDownloads": MessageLookupByLibrary.simpleMessage("Нет загрузок"),
    "noDownloadsHint": MessageLookupByLibrary.simpleMessage(
      "Скачанные видео появятся здесь",
    ),
    "noHistory": MessageLookupByLibrary.simpleMessage("История пуста"),
    "noLogs": MessageLookupByLibrary.simpleMessage("Логов пока нет"),
    "noPlaylists": MessageLookupByLibrary.simpleMessage("Нет плейлистов"),
    "noPlaylistsYet": MessageLookupByLibrary.simpleMessage(
      "Плейлистов пока нет.\nНажмите +, чтобы создать.",
    ),
    "noPlaylistsYetPicker": MessageLookupByLibrary.simpleMessage(
      "Плейлистов пока нет.\nНажмите + Новый, чтобы создать.",
    ),
    "noSavedVideos": MessageLookupByLibrary.simpleMessage(
      "Нет сохранённых видео",
    ),
    "noShorts": MessageLookupByLibrary.simpleMessage("Нет Shorts"),
    "noShortsHint": MessageLookupByLibrary.simpleMessage(
      "Short videos will appear here",
    ),
    "noSubscriptions": MessageLookupByLibrary.simpleMessage("Нет подписок"),
    "noSubscriptionsHint": MessageLookupByLibrary.simpleMessage(
      "Подпишитесь на каналы, чтобы видеть их видео здесь",
    ),
    "noUploadDate": MessageLookupByLibrary.simpleMessage("Без даты"),
    "noUploaderName": MessageLookupByLibrary.simpleMessage("Безымянный"),
    "noVideoAvailableChangedToHls": MessageLookupByLibrary.simpleMessage(
      "Нет доступных форматов, переход на HLS",
    ),
    "noVideoDescription": MessageLookupByLibrary.simpleMessage("Без описания"),
    "noVideoTitle": MessageLookupByLibrary.simpleMessage("Неназванное"),
    "noVideosFound": MessageLookupByLibrary.simpleMessage("Видео не найдены"),
    "noVideosInPlaylist": MessageLookupByLibrary.simpleMessage(
      "Видео пока нет",
    ),
    "notificationsDenied": MessageLookupByLibrary.simpleMessage(
      "Разрешение на уведомления отклонено",
    ),
    "openInBrowser": MessageLookupByLibrary.simpleMessage("Открыть в браузере"),
    "openLinksExternally": MessageLookupByLibrary.simpleMessage(
      "Открывать ссылки во внешнем браузере",
    ),
    "outro": MessageLookupByLibrary.simpleMessage("Концовка"),
    "pause": MessageLookupByLibrary.simpleMessage("Пауза"),
    "pauseOnCall": MessageLookupByLibrary.simpleMessage("Пауза при звонке"),
    "pauseOnHeadphones": MessageLookupByLibrary.simpleMessage(
      "Пауза при отключении наушников",
    ),
    "paused": MessageLookupByLibrary.simpleMessage("Приостановлено"),
    "pending": MessageLookupByLibrary.simpleMessage("В ожидании"),
    "pinned": MessageLookupByLibrary.simpleMessage("Закреплено"),
    "platformLabel": MessageLookupByLibrary.simpleMessage("Платформа"),
    "playAll": MessageLookupByLibrary.simpleMessage("Воспроизвести все"),
    "playNext": MessageLookupByLibrary.simpleMessage("Следующим"),
    "playlist": MessageLookupByLibrary.simpleMessage("Плейлист"),
    "playlistNameHint": MessageLookupByLibrary.simpleMessage(
      "Название плейлиста",
    ),
    "playlistNotFound": MessageLookupByLibrary.simpleMessage(
      "Плейлист не найден",
    ),
    "playlists": MessageLookupByLibrary.simpleMessage("Плейлисты"),
    "profileInUse": MessageLookupByLibrary.simpleMessage("Активен"),
    "profileName": MessageLookupByLibrary.simpleMessage("Имя профиля"),
    "profiles": MessageLookupByLibrary.simpleMessage("Профили"),
    "profilesDescription": MessageLookupByLibrary.simpleMessage(
      "Создавайте отдельные профили для разных аккаунтов или настроек",
    ),
    "quality1080p": MessageLookupByLibrary.simpleMessage("1080p"),
    "quality1440p": MessageLookupByLibrary.simpleMessage("1440p"),
    "quality144p": MessageLookupByLibrary.simpleMessage("144p"),
    "quality240p": MessageLookupByLibrary.simpleMessage("240p"),
    "quality360p": MessageLookupByLibrary.simpleMessage("360p"),
    "quality480p": MessageLookupByLibrary.simpleMessage("480p"),
    "quality720p": MessageLookupByLibrary.simpleMessage("720p"),
    "queue": MessageLookupByLibrary.simpleMessage("Очередь"),
    "queueClear": MessageLookupByLibrary.simpleMessage("Очистить"),
    "queueEmpty": MessageLookupByLibrary.simpleMessage("Очередь пуста"),
    "queueShuffle": MessageLookupByLibrary.simpleMessage("Перемешать"),
    "readMoreText": MessageLookupByLibrary.simpleMessage("Раскрыть"),
    "recentSearches": MessageLookupByLibrary.simpleMessage("Недавние запросы"),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "refreshToLoad": MessageLookupByLibrary.simpleMessage(
      "Потяните вниз для обновления",
    ),
    "region": MessageLookupByLibrary.simpleMessage("Регион"),
    "relatedTitle": MessageLookupByLibrary.simpleMessage("Похожие"),
    "removeFromHistory": MessageLookupByLibrary.simpleMessage(
      "Убрать из истории",
    ),
    "removeFromQueue": MessageLookupByLibrary.simpleMessage(
      "Убрать из очереди",
    ),
    "removeFromSaved": MessageLookupByLibrary.simpleMessage(
      "Убрать из сохранённых",
    ),
    "renameAction": MessageLookupByLibrary.simpleMessage("Переименовать"),
    "renamePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "Переименовать плейлист",
    ),
    "renameProfile": MessageLookupByLibrary.simpleMessage(
      "Переименовать профиль",
    ),
    "repliesNotSupported": MessageLookupByLibrary.simpleMessage(
      "Ответы пока недоступны",
    ),
    "repliesPlural": m5,
    "resume": MessageLookupByLibrary.simpleMessage("Продолжить"),
    "retrieveDislikeCounts": MessageLookupByLibrary.simpleMessage(
      "Запрашивать количество дизлайков",
    ),
    "retrieveDislikes": MessageLookupByLibrary.simpleMessage(
      "Вернуть дизлайки",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Повторить"),
    "saveToDevice": MessageLookupByLibrary.simpleMessage(
      "Сохранить на устройство",
    ),
    "saveToDeviceFailed": MessageLookupByLibrary.simpleMessage(
      "Не удалось сохранить на устройство",
    ),
    "saveToPlaylist": MessageLookupByLibrary.simpleMessage(
      "Сохранить в плейлист",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Сохранено"),
    "savedToDevice": MessageLookupByLibrary.simpleMessage(
      "Сохранено на устройство",
    ),
    "savedVideosTitle": MessageLookupByLibrary.simpleMessage(
      "Сохранённые видео",
    ),
    "savingToDevice": MessageLookupByLibrary.simpleMessage(
      "Сохранение на устройство...",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Поиск"),
    "searchFilters": MessageLookupByLibrary.simpleMessage("Фильтры"),
    "searchForVideosChannels": MessageLookupByLibrary.simpleMessage(
      "Поиск видео, каналов и плейлистов",
    ),
    "searchHistoryEnabled": MessageLookupByLibrary.simpleMessage(
      "Сохранять историю поиска",
    ),
    "searchHistoryEnabledDescription": MessageLookupByLibrary.simpleMessage(
      "Сохраняйте запросы для быстрого доступа",
    ),
    "searchSavedVideos": MessageLookupByLibrary.simpleMessage(
      "Поиск в сохранённых...",
    ),
    "searchSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Поиск в подписках...",
    ),
    "searchYouTube": MessageLookupByLibrary.simpleMessage(
      "Поиск на YouTube...",
    ),
    "seconds": MessageLookupByLibrary.simpleMessage("секунд"),
    "selectAll": MessageLookupByLibrary.simpleMessage("Выбрать все"),
    "selectFile": MessageLookupByLibrary.simpleMessage("Выбрать файл"),
    "selectVideos": MessageLookupByLibrary.simpleMessage("Выбрать видео"),
    "selected": MessageLookupByLibrary.simpleMessage("выбрано"),
    "selfPromotion": MessageLookupByLibrary.simpleMessage("Самореклама"),
    "serviceExplode": MessageLookupByLibrary.simpleMessage("Explode"),
    "serviceInvidious": MessageLookupByLibrary.simpleMessage("Invidious"),
    "serviceNewPipe": MessageLookupByLibrary.simpleMessage("NewPipe Extractor"),
    "servicePiped": MessageLookupByLibrary.simpleMessage("Piped"),
    "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
    "share": MessageLookupByLibrary.simpleMessage("Поделиться"),
    "shareLogs": MessageLookupByLibrary.simpleMessage("Поделиться логами"),
    "shareVia": MessageLookupByLibrary.simpleMessage("Поделиться через"),
    "shorts": MessageLookupByLibrary.simpleMessage("Shorts"),
    "showLessText": MessageLookupByLibrary.simpleMessage("Скрыть"),
    "showSearchHistory": MessageLookupByLibrary.simpleMessage(
      "Показывать историю поиска",
    ),
    "showSearchHistoryDescription": MessageLookupByLibrary.simpleMessage(
      "Показывать недавние запросы на экране поиска",
    ),
    "skipInterval": MessageLookupByLibrary.simpleMessage("Интервал перемотки"),
    "skipIntervalDescription": MessageLookupByLibrary.simpleMessage(
      "Длительность перемотки двойным нажатием в секундах",
    ),
    "sleepTimer": MessageLookupByLibrary.simpleMessage("Таймер сна"),
    "sleepTimerCustom": MessageLookupByLibrary.simpleMessage("Свой"),
    "sleepTimerCustomTitle": MessageLookupByLibrary.simpleMessage(
      "Свой таймер",
    ),
    "sleepTimerEndOfVideo": MessageLookupByLibrary.simpleMessage("Конец видео"),
    "sleepTimerEnded": MessageLookupByLibrary.simpleMessage(
      "Таймер сна завершён",
    ),
    "sleepTimerEnterMinutes": MessageLookupByLibrary.simpleMessage(
      "Введите минуты",
    ),
    "sleepTimerMinutes": m6,
    "sleepTimerMinutesShort": m7,
    "sleepTimerOff": MessageLookupByLibrary.simpleMessage("Выкл."),
    "sleepTimerSet": MessageLookupByLibrary.simpleMessage("Задать"),
    "sort": MessageLookupByLibrary.simpleMessage("Сортировка"),
    "sortBy": MessageLookupByLibrary.simpleMessage("Сортировать по"),
    "sponsor": MessageLookupByLibrary.simpleMessage("Спонсор"),
    "sponsorBlock": MessageLookupByLibrary.simpleMessage("SponsorBlock"),
    "sponsorBlockCategories": MessageLookupByLibrary.simpleMessage(
      "Пропускаемые категории",
    ),
    "sponsorBlockDescription": MessageLookupByLibrary.simpleMessage(
      "Автоматически пропускать спонсорские фрагменты",
    ),
    "startDownload": MessageLookupByLibrary.simpleMessage("Начать загрузку"),
    "startSavingVideos": MessageLookupByLibrary.simpleMessage(
      "Сохраняйте видео, чтобы посмотреть позже",
    ),
    "subscribe": MessageLookupByLibrary.simpleMessage("Подписаться"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Подписки"),
    "subtitleSize": MessageLookupByLibrary.simpleMessage("Размер субтитров"),
    "subtitleSizeDescription": MessageLookupByLibrary.simpleMessage(
      "Настройте размер субтитров на видео",
    ),
    "subtitleSizeExtraLarge": MessageLookupByLibrary.simpleMessage(
      "Очень крупный",
    ),
    "subtitleSizeLarge": MessageLookupByLibrary.simpleMessage("Крупный"),
    "subtitleSizeMedium": MessageLookupByLibrary.simpleMessage("Средний"),
    "subtitleSizeSmall": MessageLookupByLibrary.simpleMessage("Мелкий"),
    "swipeDownToDismissDisabled": MessageLookupByLibrary.simpleMessage(
      "\'Swipe down to dismiss\' disabled",
    ),
    "swipeUpToDismissEnabled": MessageLookupByLibrary.simpleMessage(
      "\'Swipe up to dismiss\' enabled",
    ),
    "switchProfile": MessageLookupByLibrary.simpleMessage("Сменить профиль"),
    "switchRegion": MessageLookupByLibrary.simpleMessage(
      "Возможно, стоит сменить регион, чтобы улучшить результат.",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("Оформление"),
    "themeDark": MessageLookupByLibrary.simpleMessage("Тёмная"),
    "themeDynamic": MessageLookupByLibrary.simpleMessage("Material You"),
    "themeLight": MessageLookupByLibrary.simpleMessage("Светлая"),
    "themeOled": MessageLookupByLibrary.simpleMessage("OLED чёрная"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("Системная"),
    "thereIsNoSavedOrHistoryVideos": MessageLookupByLibrary.simpleMessage(
      "Сохранённых/просмотренных видео нет",
    ),
    "thereIsNoSavedVideos": MessageLookupByLibrary.simpleMessage(
      "Сохранённых видео нет",
    ),
    "title": MessageLookupByLibrary.simpleMessage("Названию"),
    "translators": MessageLookupByLibrary.simpleMessage("Переводчики"),
    "trending": MessageLookupByLibrary.simpleMessage("Тренды"),
    "unitedKingdom": MessageLookupByLibrary.simpleMessage(
      "Соединённое королевство",
    ),
    "unitedStates": MessageLookupByLibrary.simpleMessage(
      "Соединённые штаты Америки",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("неизвестно"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "Произошла неизвестная ошибка",
    ),
    "unknownQuality": MessageLookupByLibrary.simpleMessage(
      "Качество не опознано",
    ),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Отписаться"),
    "unsubscribeConfirm": MessageLookupByLibrary.simpleMessage(
      "Отписаться от этого канала?",
    ),
    "version": MessageLookupByLibrary.simpleMessage("Версия"),
    "video": MessageLookupByLibrary.simpleMessage("Видео"),
    "videoAudio": MessageLookupByLibrary.simpleMessage("Видео+аудио"),
    "videoCountLabel": m8,
    "videoFit": MessageLookupByLibrary.simpleMessage("Масштаб видео"),
    "videoFitContain": MessageLookupByLibrary.simpleMessage("Вписать"),
    "videoFitCover": MessageLookupByLibrary.simpleMessage("Заполнить"),
    "videoFitFill": MessageLookupByLibrary.simpleMessage("Растянуть"),
    "videoFitFitHeight": MessageLookupByLibrary.simpleMessage("По высоте"),
    "videoFitFitWidth": MessageLookupByLibrary.simpleMessage("По ширине"),
    "videoOnly": MessageLookupByLibrary.simpleMessage("Только видео"),
    "videoQuality": MessageLookupByLibrary.simpleMessage("Качество видео"),
    "videoViews": m9,
    "videoWithAudio": MessageLookupByLibrary.simpleMessage("Видео + аудио"),
    "videos": MessageLookupByLibrary.simpleMessage("Видео"),
    "views": MessageLookupByLibrary.simpleMessage("просмотров"),
    "watchSomeVideos": MessageLookupByLibrary.simpleMessage(
      "Просмотренные видео появятся здесь",
    ),
    "youtubeService": MessageLookupByLibrary.simpleMessage("Сервис YouTube"),
  };
}
