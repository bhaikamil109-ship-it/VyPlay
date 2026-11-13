// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
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
  String get localeName => 'ja';

  static String m0(name) => "${name}に追加しました";

  static String m1(device) => "${device}にキャスト中";

  static String m2(count) =>
      "${Intl.plural(count, zero: '登録者なし', one: '人の登録者', other: '人の登録者')}";

  static String m3(name) => "${name}を削除しますか？";

  static String m4(title) => "ダウンロード失敗：${title}";

  static String m5(count) => "${Intl.plural(count, one: '返信', other: '返信')}";

  static String m6(count) => "${count}分";

  static String m7(count) => "${count}分";

  static String m8(count) => "${count}本の動画";

  static String m9(count) =>
      "${Intl.plural(count, zero: '視聴なし', one: '回視聴', other: '回視聴')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("情報"),
    "addProfile": MessageLookupByLibrary.simpleMessage("プロフィールを追加"),
    "addToQueue": MessageLookupByLibrary.simpleMessage("キューに追加"),
    "addVideosHint": MessageLookupByLibrary.simpleMessage("動画を長押しして再生リストに保存"),
    "addedToPlayNext": MessageLookupByLibrary.simpleMessage("次に再生に追加しました"),
    "addedToPlaylist": m0,
    "addedToQueue": MessageLookupByLibrary.simpleMessage("キューに追加しました"),
    "all": MessageLookupByLibrary.simpleMessage("すべて"),
    "audio": MessageLookupByLibrary.simpleMessage("音声"),
    "audioFocus": MessageLookupByLibrary.simpleMessage("オーディオフォーカス"),
    "audioFocusDescription": MessageLookupByLibrary.simpleMessage(
      "割り込み時に再生を一時停止",
    ),
    "audioOnly": MessageLookupByLibrary.simpleMessage("音声のみ"),
    "audioQuality": MessageLookupByLibrary.simpleMessage("音声品質"),
    "autoPip": MessageLookupByLibrary.simpleMessage("自動ピクチャーインピクチャー"),
    "autoPipDescription": MessageLookupByLibrary.simpleMessage(
      "再生中にホームボタンを押すと自動でPiPモードに入る",
    ),
    "autoScrollOff": MessageLookupByLibrary.simpleMessage("自動スクロール オフ"),
    "autoScrollOn": MessageLookupByLibrary.simpleMessage("自動スクロール オン"),
    "backupRestore": MessageLookupByLibrary.simpleMessage("バックアップと復元"),
    "backupRestoreDescription": MessageLookupByLibrary.simpleMessage(
      "登録チャンネルをエクスポートまたはインポート",
    ),
    "canada": MessageLookupByLibrary.simpleMessage("カナダ"),
    "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
    "cancelled": MessageLookupByLibrary.simpleMessage("キャンセル済み"),
    "cannotDeleteDefault": MessageLookupByLibrary.simpleMessage(
      "デフォルトのプロフィールは削除できません",
    ),
    "cannotRenameDefault": MessageLookupByLibrary.simpleMessage(
      "デフォルトのプロフィール名は変更できません",
    ),
    "castConnected": MessageLookupByLibrary.simpleMessage("接続済み"),
    "castConnectedTo": m1,
    "castFailed": MessageLookupByLibrary.simpleMessage("この動画はキャストできません"),
    "castStop": MessageLookupByLibrary.simpleMessage("キャストを停止"),
    "castTitle": MessageLookupByLibrary.simpleMessage("キャスト"),
    "castUnavailable": MessageLookupByLibrary.simpleMessage(
      "この端末ではキャストを利用できません",
    ),
    "channelSubscribers": m2,
    "channels": MessageLookupByLibrary.simpleMessage("チャンネル"),
    "checkNow": MessageLookupByLibrary.simpleMessage("Check now"),
    "checkNowDone": MessageLookupByLibrary.simpleMessage(
      "Checked for new uploads.",
    ),
    "clearAll": MessageLookupByLibrary.simpleMessage("すべて消去"),
    "clearAllHistory": MessageLookupByLibrary.simpleMessage("履歴をすべて消去"),
    "clearAllHistoryConfirm": MessageLookupByLibrary.simpleMessage(
      "視聴履歴をすべて消去しますか？",
    ),
    "clearAllSaved": MessageLookupByLibrary.simpleMessage("保存済みをすべて消去"),
    "clearAllSavedConfirm": MessageLookupByLibrary.simpleMessage(
      "保存した動画をすべて削除しますか？",
    ),
    "clearLogs": MessageLookupByLibrary.simpleMessage("ログを消去"),
    "commentAuthorNotFound": MessageLookupByLibrary.simpleMessage("見つかりません"),
    "commentsDisabled": MessageLookupByLibrary.simpleMessage("コメントは無効です"),
    "commonSettingsTitle": MessageLookupByLibrary.simpleMessage("一般"),
    "completed": MessageLookupByLibrary.simpleMessage("完了"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "クリップボードにコピーしました",
    ),
    "copyLink": MessageLookupByLibrary.simpleMessage("リンクをコピー"),
    "createAction": MessageLookupByLibrary.simpleMessage("作成"),
    "dateAdded": MessageLookupByLibrary.simpleMessage("追加日"),
    "debugConsole": MessageLookupByLibrary.simpleMessage("デバッグコンソール"),
    "defaultProfile": MessageLookupByLibrary.simpleMessage("デフォルト"),
    "defaultQuality": MessageLookupByLibrary.simpleMessage("初期選択の品質"),
    "delete": MessageLookupByLibrary.simpleMessage("削除"),
    "deleteDownload": MessageLookupByLibrary.simpleMessage("ダウンロードを削除"),
    "deleteDownloadConfirm": MessageLookupByLibrary.simpleMessage(
      "このダウンロードを削除しますか？",
    ),
    "deletePlaylistAction": MessageLookupByLibrary.simpleMessage("再生リストを削除"),
    "deletePlaylistConfirm": m3,
    "deletePlaylistTitle": MessageLookupByLibrary.simpleMessage("再生リストを削除"),
    "deleteProfile": MessageLookupByLibrary.simpleMessage("プロフィールを削除"),
    "deleteVideo": MessageLookupByLibrary.simpleMessage("動画を削除"),
    "deleteVideoConfirm": MessageLookupByLibrary.simpleMessage("この動画を削除しますか？"),
    "developer": MessageLookupByLibrary.simpleMessage("開発"),
    "disablePipPlayer": MessageLookupByLibrary.simpleMessage("PIP プレイヤーを無効化"),
    "disableVideoHistory": MessageLookupByLibrary.simpleMessage("動画の履歴をとらない"),
    "dislike": MessageLookupByLibrary.simpleMessage("低評価"),
    "distractionFree": MessageLookupByLibrary.simpleMessage("集中モード"),
    "download": MessageLookupByLibrary.simpleMessage("ダウンロード"),
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
    "downloadStarted": MessageLookupByLibrary.simpleMessage("ダウンロードを開始しました"),
    "downloadType": MessageLookupByLibrary.simpleMessage("ダウンロードの種類"),
    "downloading": MessageLookupByLibrary.simpleMessage("ダウンロード中"),
    "downloadingAudio": MessageLookupByLibrary.simpleMessage("音声をダウンロード中"),
    "downloadingVideo": MessageLookupByLibrary.simpleMessage("動画をダウンロード中"),
    "downloads": MessageLookupByLibrary.simpleMessage("ダウンロード"),
    "duration": MessageLookupByLibrary.simpleMessage("長さ"),
    "enableHlsPlayerDescription": MessageLookupByLibrary.simpleMessage(
      "すべての品質オプションを選ぶためHLSプレイヤーを有効にします。エラー発生時に無効にしてください。",
    ),
    "exitApp": MessageLookupByLibrary.simpleMessage("Exit"),
    "exitConfirmMessage": MessageLookupByLibrary.simpleMessage(
      "Playback will stop.",
    ),
    "exitConfirmTitle": MessageLookupByLibrary.simpleMessage("Exit VyPlay?"),
    "exportData": MessageLookupByLibrary.simpleMessage("データをエクスポート"),
    "exportSubscriptions": MessageLookupByLibrary.simpleMessage(
      "登録チャンネルをエクスポート",
    ),
    "exportSuccess": MessageLookupByLibrary.simpleMessage("エクスポートしました"),
    "failed": MessageLookupByLibrary.simpleMessage("失敗"),
    "failedToOpenFile": MessageLookupByLibrary.simpleMessage("ファイルを開けませんでした"),
    "fileNotFound": MessageLookupByLibrary.simpleMessage("ファイルが見つかりません"),
    "filterAll": MessageLookupByLibrary.simpleMessage("すべて"),
    "filterChannels": MessageLookupByLibrary.simpleMessage("チャンネル"),
    "filterMusic": MessageLookupByLibrary.simpleMessage("音楽"),
    "filterPlaylists": MessageLookupByLibrary.simpleMessage("再生リスト"),
    "filterVideos": MessageLookupByLibrary.simpleMessage("動画"),
    "france": MessageLookupByLibrary.simpleMessage("フランス"),
    "hideComments": MessageLookupByLibrary.simpleMessage("コメントを非表示"),
    "hideCommentsButtonFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "視聴画面のコメントボタンを非表示",
    ),
    "hideRelated": MessageLookupByLibrary.simpleMessage("関連を非表示"),
    "hideRelatedVideosFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "視聴画面の関連動画を非表示",
    ),
    "history": MessageLookupByLibrary.simpleMessage("履歴"),
    "hlsPlayer": MessageLookupByLibrary.simpleMessage("HLSプレイヤー"),
    "home": MessageLookupByLibrary.simpleMessage("ホーム"),
    "homeFeedMode": MessageLookupByLibrary.simpleMessage("ホームフィード"),
    "homeFeedModeAuto": MessageLookupByLibrary.simpleMessage("自動"),
    "homeFeedModeAutoHint": MessageLookupByLibrary.simpleMessage(
      "登録があれば登録チャンネル、なければ急上昇を表示",
    ),
    "homeFeedModeFeedOnly": MessageLookupByLibrary.simpleMessage("登録チャンネル"),
    "homeFeedModeFeedOnlyHint": MessageLookupByLibrary.simpleMessage(
      "登録チャンネルの動画のみ表示",
    ),
    "homeFeedModeTrendingOnly": MessageLookupByLibrary.simpleMessage("急上昇"),
    "homeFeedModeTrendingOnlyHint": MessageLookupByLibrary.simpleMessage(
      "常に急上昇の動画のみ表示",
    ),
    "imageCacheLabel": MessageLookupByLibrary.simpleMessage("画像キャッシュ"),
    "importData": MessageLookupByLibrary.simpleMessage("データをインポート"),
    "importError": MessageLookupByLibrary.simpleMessage("インポートに失敗しました"),
    "importSubscriptions": MessageLookupByLibrary.simpleMessage(
      "登録チャンネルをインポート",
    ),
    "importSuccess": MessageLookupByLibrary.simpleMessage("インポートしました"),
    "includeTitle": MessageLookupByLibrary.simpleMessage("題名とURLを含める"),
    "india": MessageLookupByLibrary.simpleMessage("インド"),
    "instances": MessageLookupByLibrary.simpleMessage("インスタンス"),
    "interaction": MessageLookupByLibrary.simpleMessage("インタラクション"),
    "intro": MessageLookupByLibrary.simpleMessage("イントロ"),
    "language": MessageLookupByLibrary.simpleMessage("言語"),
    "library": MessageLookupByLibrary.simpleMessage("ライブラリ"),
    "like": MessageLookupByLibrary.simpleMessage("高評価"),
    "localPlaylists": MessageLookupByLibrary.simpleMessage("再生リスト"),
    "logsLabel": MessageLookupByLibrary.simpleMessage("ログ"),
    "merging": MessageLookupByLibrary.simpleMessage("結合中"),
    "musicOfftopic": MessageLookupByLibrary.simpleMessage("音楽：音楽以外"),
    "netherlands": MessageLookupByLibrary.simpleMessage("オランダ"),
    "newNameHint": MessageLookupByLibrary.simpleMessage("新しい名前"),
    "newPlaylist": MessageLookupByLibrary.simpleMessage("新しい再生リスト"),
    "newPlaylistShort": MessageLookupByLibrary.simpleMessage("＋新規"),
    "newProfileName": MessageLookupByLibrary.simpleMessage("新しいプロフィール名"),
    "newVideoNotifications": MessageLookupByLibrary.simpleMessage("新着動画の通知"),
    "newVideoNotificationsDescription": MessageLookupByLibrary.simpleMessage(
      "登録チャンネルがアップロードしたときに通知を受け取る",
    ),
    "noCommentsFound": MessageLookupByLibrary.simpleMessage("コメントなし"),
    "noDownloads": MessageLookupByLibrary.simpleMessage("ダウンロードなし"),
    "noDownloadsHint": MessageLookupByLibrary.simpleMessage(
      "ダウンロードした動画がここに表示されます",
    ),
    "noHistory": MessageLookupByLibrary.simpleMessage("視聴履歴はありません"),
    "noLogs": MessageLookupByLibrary.simpleMessage("ログはまだありません"),
    "noPlaylists": MessageLookupByLibrary.simpleMessage("再生リストがありません"),
    "noPlaylistsYet": MessageLookupByLibrary.simpleMessage(
      "再生リストがまだありません。\n＋をタップして作成してください。",
    ),
    "noPlaylistsYetPicker": MessageLookupByLibrary.simpleMessage(
      "再生リストがまだありません。\n＋新規をタップして作成してください。",
    ),
    "noSavedVideos": MessageLookupByLibrary.simpleMessage("保存した動画はありません"),
    "noShorts": MessageLookupByLibrary.simpleMessage("ショートがありません"),
    "noShortsHint": MessageLookupByLibrary.simpleMessage(
      "Short videos will appear here",
    ),
    "noSubscriptions": MessageLookupByLibrary.simpleMessage("登録チャンネルなし"),
    "noSubscriptionsHint": MessageLookupByLibrary.simpleMessage(
      "チャンネルを登録するとここに動画が表示されます",
    ),
    "noUploadDate": MessageLookupByLibrary.simpleMessage("日付なし"),
    "noUploaderName": MessageLookupByLibrary.simpleMessage("名無し"),
    "noVideoAvailableChangedToHls": MessageLookupByLibrary.simpleMessage(
      "利用可能な動画形式がないので自動でHLSに変更",
    ),
    "noVideoDescription": MessageLookupByLibrary.simpleMessage("説明なし"),
    "noVideoTitle": MessageLookupByLibrary.simpleMessage("題名なし"),
    "noVideosFound": MessageLookupByLibrary.simpleMessage("動画が見つかりません"),
    "noVideosInPlaylist": MessageLookupByLibrary.simpleMessage("動画がまだありません"),
    "notificationsDenied": MessageLookupByLibrary.simpleMessage(
      "通知の許可が拒否されました",
    ),
    "openDownloadedFile": MessageLookupByLibrary.simpleMessage("Open"),
    "openInBrowser": MessageLookupByLibrary.simpleMessage("ブラウザで開く"),
    "openLinksExternally": MessageLookupByLibrary.simpleMessage(
      "リンクを外部ブラウザで開く",
    ),
    "outro": MessageLookupByLibrary.simpleMessage("アウトロ"),
    "pause": MessageLookupByLibrary.simpleMessage("一時停止"),
    "pauseOnCall": MessageLookupByLibrary.simpleMessage("電話中は一時停止"),
    "pauseOnHeadphones": MessageLookupByLibrary.simpleMessage("ヘッドホン切断時に一時停止"),
    "paused": MessageLookupByLibrary.simpleMessage("一時停止中"),
    "pending": MessageLookupByLibrary.simpleMessage("待機中"),
    "pinned": MessageLookupByLibrary.simpleMessage("固定"),
    "platformLabel": MessageLookupByLibrary.simpleMessage("プラットフォーム"),
    "playAll": MessageLookupByLibrary.simpleMessage("すべて再生"),
    "playNext": MessageLookupByLibrary.simpleMessage("次に再生"),
    "playlist": MessageLookupByLibrary.simpleMessage("再生リスト"),
    "playlistNameHint": MessageLookupByLibrary.simpleMessage("再生リスト名"),
    "playlistNotFound": MessageLookupByLibrary.simpleMessage("再生リストが見つかりません"),
    "playlistOrder": MessageLookupByLibrary.simpleMessage("Playlist order"),
    "playlists": MessageLookupByLibrary.simpleMessage("再生リスト"),
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
    "pluginPermissions": MessageLookupByLibrary.simpleMessage("プラグインの権限"),
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
    "profileInUse": MessageLookupByLibrary.simpleMessage("使用中"),
    "profileName": MessageLookupByLibrary.simpleMessage("プロフィール名"),
    "profiles": MessageLookupByLibrary.simpleMessage("プロフィール"),
    "profilesDescription": MessageLookupByLibrary.simpleMessage(
      "アカウントや設定ごとに別のプロフィールを作成",
    ),
    "quality1080p": MessageLookupByLibrary.simpleMessage("1080p"),
    "quality1440p": MessageLookupByLibrary.simpleMessage("1440p"),
    "quality144p": MessageLookupByLibrary.simpleMessage("144p"),
    "quality240p": MessageLookupByLibrary.simpleMessage("240p"),
    "quality360p": MessageLookupByLibrary.simpleMessage("360p"),
    "quality480p": MessageLookupByLibrary.simpleMessage("480p"),
    "quality720p": MessageLookupByLibrary.simpleMessage("720p"),
    "queue": MessageLookupByLibrary.simpleMessage("キュー"),
    "queueClear": MessageLookupByLibrary.simpleMessage("クリア"),
    "queueEmpty": MessageLookupByLibrary.simpleMessage("キューは空です"),
    "queueShuffle": MessageLookupByLibrary.simpleMessage("シャッフル"),
    "readMoreText": MessageLookupByLibrary.simpleMessage("もっと読む"),
    "recentSearches": MessageLookupByLibrary.simpleMessage("最近の検索"),
    "recheckFolder": MessageLookupByLibrary.simpleMessage("Re-check"),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "refreshToLoad": MessageLookupByLibrary.simpleMessage("下に引いて更新"),
    "region": MessageLookupByLibrary.simpleMessage("地域"),
    "relatedTitle": MessageLookupByLibrary.simpleMessage("関連"),
    "removeFromHistory": MessageLookupByLibrary.simpleMessage("履歴から削除"),
    "removeFromQueue": MessageLookupByLibrary.simpleMessage("キューから削除"),
    "removeFromSaved": MessageLookupByLibrary.simpleMessage("保存済みから削除"),
    "renameAction": MessageLookupByLibrary.simpleMessage("名前を変更"),
    "renamePlaylistTitle": MessageLookupByLibrary.simpleMessage("再生リスト名を変更"),
    "renameProfile": MessageLookupByLibrary.simpleMessage("プロフィール名を変更"),
    "repliesNotSupported": MessageLookupByLibrary.simpleMessage("返信はまだ利用できません"),
    "repliesPlural": m5,
    "resume": MessageLookupByLibrary.simpleMessage("再開"),
    "retrieveDislikeCounts": MessageLookupByLibrary.simpleMessage("低評価数を取得"),
    "retrieveDislikes": MessageLookupByLibrary.simpleMessage("低評価を取得"),
    "retry": MessageLookupByLibrary.simpleMessage("再試行"),
    "retryDownload": MessageLookupByLibrary.simpleMessage("Retry"),
    "saveToDevice": MessageLookupByLibrary.simpleMessage("端末に保存"),
    "saveToDeviceFailed": MessageLookupByLibrary.simpleMessage("端末への保存に失敗しました"),
    "saveToPlaylist": MessageLookupByLibrary.simpleMessage("再生リストに保存"),
    "saved": MessageLookupByLibrary.simpleMessage("保存済み"),
    "savedToDevice": MessageLookupByLibrary.simpleMessage("端末に保存しました"),
    "savedVideosTitle": MessageLookupByLibrary.simpleMessage("保存済み動画"),
    "savingToDevice": MessageLookupByLibrary.simpleMessage("端末に保存中..."),
    "search": MessageLookupByLibrary.simpleMessage("検索"),
    "searchFilters": MessageLookupByLibrary.simpleMessage("フィルター"),
    "searchForVideosChannels": MessageLookupByLibrary.simpleMessage(
      "動画、チャンネル、再生リストを検索",
    ),
    "searchHistoryEnabled": MessageLookupByLibrary.simpleMessage("検索履歴を保存"),
    "searchHistoryEnabledDescription": MessageLookupByLibrary.simpleMessage(
      "検索クエリを保存してすぐにアクセス",
    ),
    "searchInPlaylist": MessageLookupByLibrary.simpleMessage(
      "Search in playlist",
    ),
    "searchSavedVideos": MessageLookupByLibrary.simpleMessage("保存した動画を検索..."),
    "searchSubscriptions": MessageLookupByLibrary.simpleMessage(
      "登録チャンネルを検索...",
    ),
    "searchYouTube": MessageLookupByLibrary.simpleMessage("YouTubeを検索..."),
    "seconds": MessageLookupByLibrary.simpleMessage("秒"),
    "selectAll": MessageLookupByLibrary.simpleMessage("すべて選択"),
    "selectFile": MessageLookupByLibrary.simpleMessage("ファイルを選択"),
    "selectVideos": MessageLookupByLibrary.simpleMessage("動画を選択"),
    "selected": MessageLookupByLibrary.simpleMessage("選択中"),
    "selfPromotion": MessageLookupByLibrary.simpleMessage("自己宣伝"),
    "serviceExplode": MessageLookupByLibrary.simpleMessage("Explode"),
    "serviceInvidious": MessageLookupByLibrary.simpleMessage("Invidious"),
    "serviceNewPipe": MessageLookupByLibrary.simpleMessage("NewPipe Extractor"),
    "servicePiped": MessageLookupByLibrary.simpleMessage("Piped"),
    "settings": MessageLookupByLibrary.simpleMessage("設定"),
    "share": MessageLookupByLibrary.simpleMessage("共有"),
    "shareDownloadedFile": MessageLookupByLibrary.simpleMessage("Share"),
    "shareLogs": MessageLookupByLibrary.simpleMessage("ログを共有"),
    "shareVia": MessageLookupByLibrary.simpleMessage("共有"),
    "shorts": MessageLookupByLibrary.simpleMessage("ショート"),
    "showLessText": MessageLookupByLibrary.simpleMessage("少なく表示"),
    "showSearchHistory": MessageLookupByLibrary.simpleMessage("検索履歴を表示"),
    "showSearchHistoryDescription": MessageLookupByLibrary.simpleMessage(
      "検索画面に最近の検索を表示",
    ),
    "skipInterval": MessageLookupByLibrary.simpleMessage("スキップ間隔"),
    "skipIntervalDescription": MessageLookupByLibrary.simpleMessage(
      "ダブルタップでスキップする秒数",
    ),
    "sleepTimer": MessageLookupByLibrary.simpleMessage("スリープタイマー"),
    "sleepTimerCustom": MessageLookupByLibrary.simpleMessage("カスタム"),
    "sleepTimerCustomTitle": MessageLookupByLibrary.simpleMessage("カスタムタイマー"),
    "sleepTimerEndOfVideo": MessageLookupByLibrary.simpleMessage("動画の終わり"),
    "sleepTimerEnded": MessageLookupByLibrary.simpleMessage("スリープタイマーが終了しました"),
    "sleepTimerEnterMinutes": MessageLookupByLibrary.simpleMessage("分を入力"),
    "sleepTimerMinutes": m6,
    "sleepTimerMinutesShort": m7,
    "sleepTimerOff": MessageLookupByLibrary.simpleMessage("オフ"),
    "sleepTimerSet": MessageLookupByLibrary.simpleMessage("設定"),
    "sort": MessageLookupByLibrary.simpleMessage("並び替え"),
    "sortAToZ": MessageLookupByLibrary.simpleMessage("Title A–Z"),
    "sortBy": MessageLookupByLibrary.simpleMessage("並び替え"),
    "sortZToA": MessageLookupByLibrary.simpleMessage("Title Z–A"),
    "sponsor": MessageLookupByLibrary.simpleMessage("スポンサー"),
    "sponsorBlock": MessageLookupByLibrary.simpleMessage("SponsorBlock"),
    "sponsorBlockCategories": MessageLookupByLibrary.simpleMessage(
      "スキップするカテゴリ",
    ),
    "sponsorBlockDescription": MessageLookupByLibrary.simpleMessage(
      "スポンサーセグメントを自動でスキップ",
    ),
    "startDownload": MessageLookupByLibrary.simpleMessage("ダウンロード開始"),
    "startSavingVideos": MessageLookupByLibrary.simpleMessage("動画を保存して後で見ましょう"),
    "subscribe": MessageLookupByLibrary.simpleMessage("チャンネル登録"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("登録チャンネル"),
    "subtitleSize": MessageLookupByLibrary.simpleMessage("字幕サイズ"),
    "subtitleSizeDescription": MessageLookupByLibrary.simpleMessage(
      "動画の字幕サイズを調整",
    ),
    "subtitleSizeExtraLarge": MessageLookupByLibrary.simpleMessage("特大"),
    "subtitleSizeLarge": MessageLookupByLibrary.simpleMessage("大"),
    "subtitleSizeMedium": MessageLookupByLibrary.simpleMessage("中"),
    "subtitleSizeSmall": MessageLookupByLibrary.simpleMessage("小"),
    "swipeDownToDismissDisabled": MessageLookupByLibrary.simpleMessage(
      "\'Swipe down to dismiss\' disabled",
    ),
    "swipeUpToDismissEnabled": MessageLookupByLibrary.simpleMessage(
      "\'Swipe up to dismiss\' enabled",
    ),
    "switchProfile": MessageLookupByLibrary.simpleMessage("プロフィールを切り替え"),
    "switchRegion": MessageLookupByLibrary.simpleMessage(
      "より良い結果にするため、地域へ変更もできます。",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("テーマ"),
    "themeDark": MessageLookupByLibrary.simpleMessage("ダーク"),
    "themeDynamic": MessageLookupByLibrary.simpleMessage("Material You"),
    "themeLight": MessageLookupByLibrary.simpleMessage("ライト"),
    "themeOled": MessageLookupByLibrary.simpleMessage("OLEDブラック"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("システム"),
    "thereIsNoSavedOrHistoryVideos": MessageLookupByLibrary.simpleMessage(
      "保存済み動画・履歴なし",
    ),
    "thereIsNoSavedVideos": MessageLookupByLibrary.simpleMessage("保存済み動画なし"),
    "title": MessageLookupByLibrary.simpleMessage("タイトル"),
    "translators": MessageLookupByLibrary.simpleMessage("翻訳"),
    "trending": MessageLookupByLibrary.simpleMessage("急上昇"),
    "unitedKingdom": MessageLookupByLibrary.simpleMessage("イギリス"),
    "unitedStates": MessageLookupByLibrary.simpleMessage("アメリカ"),
    "unknown": MessageLookupByLibrary.simpleMessage("不明"),
    "unknownError": MessageLookupByLibrary.simpleMessage("不明なエラーが発生しました"),
    "unknownQuality": MessageLookupByLibrary.simpleMessage("不明の品質"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("登録解除"),
    "unsubscribeConfirm": MessageLookupByLibrary.simpleMessage(
      "このチャンネルの登録を解除しますか？",
    ),
    "version": MessageLookupByLibrary.simpleMessage("バージョン"),
    "video": MessageLookupByLibrary.simpleMessage("動画"),
    "videoAudio": MessageLookupByLibrary.simpleMessage("動画＋音声"),
    "videoCountLabel": m8,
    "videoFit": MessageLookupByLibrary.simpleMessage("動画のフィット"),
    "videoFitContain": MessageLookupByLibrary.simpleMessage("全体を表示"),
    "videoFitCover": MessageLookupByLibrary.simpleMessage("画面を埋める"),
    "videoFitFill": MessageLookupByLibrary.simpleMessage("引き伸ばす"),
    "videoFitFitHeight": MessageLookupByLibrary.simpleMessage("高さに合わせる"),
    "videoFitFitWidth": MessageLookupByLibrary.simpleMessage("幅に合わせる"),
    "videoOnly": MessageLookupByLibrary.simpleMessage("動画のみ"),
    "videoQuality": MessageLookupByLibrary.simpleMessage("動画品質"),
    "videoViews": m9,
    "videoWithAudio": MessageLookupByLibrary.simpleMessage("動画＋音声"),
    "videos": MessageLookupByLibrary.simpleMessage("動画"),
    "views": MessageLookupByLibrary.simpleMessage("回視聴"),
    "watchSomeVideos": MessageLookupByLibrary.simpleMessage("視聴した動画がここに表示されます"),
    "youtubeService": MessageLookupByLibrary.simpleMessage("YouTubeサービス"),
  };
}
