// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
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
  String get localeName => 'ko';

  static String m0(name) => "${name}에 추가됨";

  static String m1(device) => "${device}에 전송 중";

  static String m2(count) =>
      "${Intl.plural(count, zero: '구독자 없음', one: '구독자', other: '구독자')}";

  static String m3(name) => "${name}을(를) 삭제하시겠습니까?";

  static String m4(title) => "다운로드 실패: ${title}";

  static String m5(count) => "${Intl.plural(count, one: '답장', other: '답장')}";

  static String m6(count) => "${count}분";

  static String m7(count) => "${count}분";

  static String m8(count) => "동영상 ${count}개";

  static String m9(count) =>
      "${Intl.plural(count, zero: '조회수 없음', one: '조회수', other: '조회수')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("정보"),
    "addProfile": MessageLookupByLibrary.simpleMessage("프로필 추가"),
    "addToQueue": MessageLookupByLibrary.simpleMessage("대기열에 추가"),
    "addVideosHint": MessageLookupByLibrary.simpleMessage(
      "동영상을 길게 눌러 재생목록에 저장하세요",
    ),
    "addedToPlayNext": MessageLookupByLibrary.simpleMessage("다음 재생에 추가됨"),
    "addedToPlaylist": m0,
    "addedToQueue": MessageLookupByLibrary.simpleMessage("대기열에 추가됨"),
    "all": MessageLookupByLibrary.simpleMessage("전체"),
    "audio": MessageLookupByLibrary.simpleMessage("오디오"),
    "audioFocus": MessageLookupByLibrary.simpleMessage("오디오 포커스"),
    "audioFocusDescription": MessageLookupByLibrary.simpleMessage(
      "방해 시 재생 일시중지",
    ),
    "audioOnly": MessageLookupByLibrary.simpleMessage("오디오만"),
    "audioQuality": MessageLookupByLibrary.simpleMessage("오디오 품질"),
    "autoPip": MessageLookupByLibrary.simpleMessage("자동 화면 속 화면"),
    "autoPipDescription": MessageLookupByLibrary.simpleMessage(
      "동영상 재생 중 홈 버튼을 누르면 자동으로 PiP 모드로 전환",
    ),
    "autoScrollOff": MessageLookupByLibrary.simpleMessage("자동 스크롤 꺼짐"),
    "autoScrollOn": MessageLookupByLibrary.simpleMessage("자동 스크롤 켜짐"),
    "backupRestore": MessageLookupByLibrary.simpleMessage("백업 및 복원"),
    "backupRestoreDescription": MessageLookupByLibrary.simpleMessage(
      "구독을 내보내거나 가져오기",
    ),
    "canada": MessageLookupByLibrary.simpleMessage("캐나다"),
    "cancel": MessageLookupByLibrary.simpleMessage("취소"),
    "cancelled": MessageLookupByLibrary.simpleMessage("취소됨"),
    "cannotDeleteDefault": MessageLookupByLibrary.simpleMessage(
      "기본 프로필은 삭제할 수 없습니다",
    ),
    "cannotRenameDefault": MessageLookupByLibrary.simpleMessage(
      "기본 프로필 이름은 변경할 수 없습니다",
    ),
    "castConnected": MessageLookupByLibrary.simpleMessage("연결됨"),
    "castConnectedTo": m1,
    "castFailed": MessageLookupByLibrary.simpleMessage("이 동영상은 전송할 수 없습니다"),
    "castStop": MessageLookupByLibrary.simpleMessage("전송 중지"),
    "castTitle": MessageLookupByLibrary.simpleMessage("전송"),
    "castUnavailable": MessageLookupByLibrary.simpleMessage(
      "이 기기에서는 전송을 사용할 수 없습니다",
    ),
    "channelSubscribers": m2,
    "channels": MessageLookupByLibrary.simpleMessage("채널"),
    "checkNow": MessageLookupByLibrary.simpleMessage("Check now"),
    "checkNowDone": MessageLookupByLibrary.simpleMessage(
      "Checked for new uploads.",
    ),
    "clearAll": MessageLookupByLibrary.simpleMessage("모두 지우기"),
    "clearAllHistory": MessageLookupByLibrary.simpleMessage("기록 모두 지우기"),
    "clearAllHistoryConfirm": MessageLookupByLibrary.simpleMessage(
      "시청 기록을 모두 지우시겠습니까?",
    ),
    "clearAllSaved": MessageLookupByLibrary.simpleMessage("저장한 항목 모두 지우기"),
    "clearAllSavedConfirm": MessageLookupByLibrary.simpleMessage(
      "저장한 동영상을 모두 삭제하시겠습니까?",
    ),
    "clearLogs": MessageLookupByLibrary.simpleMessage("로그 지우기"),
    "commentAuthorNotFound": MessageLookupByLibrary.simpleMessage("찾지 못함"),
    "commentsDisabled": MessageLookupByLibrary.simpleMessage("댓글이 사용 중지됨"),
    "commonSettingsTitle": MessageLookupByLibrary.simpleMessage("공통 사항"),
    "completed": MessageLookupByLibrary.simpleMessage("완료"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage("클립보드에 복사됨"),
    "copyLink": MessageLookupByLibrary.simpleMessage("링크 복사"),
    "createAction": MessageLookupByLibrary.simpleMessage("만들기"),
    "dateAdded": MessageLookupByLibrary.simpleMessage("추가한 날짜"),
    "debugConsole": MessageLookupByLibrary.simpleMessage("디버그 콘솔"),
    "defaultProfile": MessageLookupByLibrary.simpleMessage("기본"),
    "defaultQuality": MessageLookupByLibrary.simpleMessage("기본 화질"),
    "delete": MessageLookupByLibrary.simpleMessage("삭제"),
    "deleteDownload": MessageLookupByLibrary.simpleMessage("다운로드 삭제"),
    "deleteDownloadConfirm": MessageLookupByLibrary.simpleMessage(
      "이 다운로드를 삭제하시겠습니까?",
    ),
    "deletePlaylistAction": MessageLookupByLibrary.simpleMessage("재생목록 삭제"),
    "deletePlaylistConfirm": m3,
    "deletePlaylistTitle": MessageLookupByLibrary.simpleMessage("재생목록 삭제"),
    "deleteProfile": MessageLookupByLibrary.simpleMessage("프로필 삭제"),
    "deleteVideo": MessageLookupByLibrary.simpleMessage("동영상 삭제"),
    "deleteVideoConfirm": MessageLookupByLibrary.simpleMessage(
      "이 동영상을 삭제하시겠습니까?",
    ),
    "developer": MessageLookupByLibrary.simpleMessage("개발자"),
    "disablePipPlayer": MessageLookupByLibrary.simpleMessage(
      "Disable PIP player",
    ),
    "disableVideoHistory": MessageLookupByLibrary.simpleMessage("동영상 기록 사용 중지"),
    "dislike": MessageLookupByLibrary.simpleMessage("싫어요"),
    "distractionFree": MessageLookupByLibrary.simpleMessage("방해 요소 제거"),
    "download": MessageLookupByLibrary.simpleMessage("다운로드"),
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
    "downloadStarted": MessageLookupByLibrary.simpleMessage("다운로드 시작됨"),
    "downloadType": MessageLookupByLibrary.simpleMessage("다운로드 유형"),
    "downloading": MessageLookupByLibrary.simpleMessage("다운로드 중"),
    "downloadingAudio": MessageLookupByLibrary.simpleMessage("오디오 다운로드 중"),
    "downloadingVideo": MessageLookupByLibrary.simpleMessage("동영상 다운로드 중"),
    "downloads": MessageLookupByLibrary.simpleMessage("다운로드"),
    "duration": MessageLookupByLibrary.simpleMessage("재생시간"),
    "enableHlsPlayerDescription": MessageLookupByLibrary.simpleMessage(
      "HLS 재생기를 사용해 모든 화질 설정을 잠금 해제하세요. 오류가 발생한다면 사용 중지하세요.",
    ),
    "exitApp": MessageLookupByLibrary.simpleMessage("Exit"),
    "exitConfirmMessage": MessageLookupByLibrary.simpleMessage(
      "Playback will stop.",
    ),
    "exitConfirmTitle": MessageLookupByLibrary.simpleMessage("Exit VyPlay?"),
    "exportData": MessageLookupByLibrary.simpleMessage("데이터 내보내기"),
    "exportSubscriptions": MessageLookupByLibrary.simpleMessage("구독 내보내기"),
    "exportSuccess": MessageLookupByLibrary.simpleMessage("내보내기 완료"),
    "failed": MessageLookupByLibrary.simpleMessage("실패"),
    "failedToOpenFile": MessageLookupByLibrary.simpleMessage("파일을 열지 못했습니다"),
    "fileNotFound": MessageLookupByLibrary.simpleMessage("파일을 찾을 수 없음"),
    "filterAll": MessageLookupByLibrary.simpleMessage("전체"),
    "filterChannels": MessageLookupByLibrary.simpleMessage("채널"),
    "filterMusic": MessageLookupByLibrary.simpleMessage("음악"),
    "filterPlaylists": MessageLookupByLibrary.simpleMessage("재생목록"),
    "filterVideos": MessageLookupByLibrary.simpleMessage("동영상"),
    "france": MessageLookupByLibrary.simpleMessage("프랑스"),
    "hideComments": MessageLookupByLibrary.simpleMessage("댓글 숨기기"),
    "hideCommentsButtonFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "시청 화면에서 댓글 버튼을 숨겨요",
    ),
    "hideRelated": MessageLookupByLibrary.simpleMessage("연관 동영상 숨기기"),
    "hideRelatedVideosFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "시청 화면에서 연관 동영상을 숨겨요",
    ),
    "history": MessageLookupByLibrary.simpleMessage("기록"),
    "hlsPlayer": MessageLookupByLibrary.simpleMessage("Hls 재생기"),
    "home": MessageLookupByLibrary.simpleMessage("홈"),
    "homeFeedMode": MessageLookupByLibrary.simpleMessage("홈 피드"),
    "homeFeedModeAuto": MessageLookupByLibrary.simpleMessage("자동"),
    "homeFeedModeAutoHint": MessageLookupByLibrary.simpleMessage(
      "구독이 있으면 구독을, 없으면 인기 동영상 표시",
    ),
    "homeFeedModeFeedOnly": MessageLookupByLibrary.simpleMessage("구독"),
    "homeFeedModeFeedOnlyHint": MessageLookupByLibrary.simpleMessage(
      "구독한 채널의 동영상만 표시",
    ),
    "homeFeedModeTrendingOnly": MessageLookupByLibrary.simpleMessage("인기"),
    "homeFeedModeTrendingOnlyHint": MessageLookupByLibrary.simpleMessage(
      "항상 인기 동영상만 표시",
    ),
    "imageCacheLabel": MessageLookupByLibrary.simpleMessage("이미지 캐시"),
    "importData": MessageLookupByLibrary.simpleMessage("데이터 가져오기"),
    "importError": MessageLookupByLibrary.simpleMessage("가져오기 실패"),
    "importSubscriptions": MessageLookupByLibrary.simpleMessage("구독 가져오기"),
    "importSuccess": MessageLookupByLibrary.simpleMessage("가져오기 완료"),
    "includeTitle": MessageLookupByLibrary.simpleMessage("제목 포함"),
    "india": MessageLookupByLibrary.simpleMessage("인도"),
    "instances": MessageLookupByLibrary.simpleMessage("인스턴스"),
    "interaction": MessageLookupByLibrary.simpleMessage("상호작용"),
    "intro": MessageLookupByLibrary.simpleMessage("인트로"),
    "language": MessageLookupByLibrary.simpleMessage("언어"),
    "library": MessageLookupByLibrary.simpleMessage("보관함"),
    "like": MessageLookupByLibrary.simpleMessage("좋아요"),
    "localPlaylists": MessageLookupByLibrary.simpleMessage("재생목록"),
    "logsLabel": MessageLookupByLibrary.simpleMessage("로그"),
    "merging": MessageLookupByLibrary.simpleMessage("병합 중"),
    "musicOfftopic": MessageLookupByLibrary.simpleMessage("음악: 비음악"),
    "netherlands": MessageLookupByLibrary.simpleMessage("네덜란드"),
    "newNameHint": MessageLookupByLibrary.simpleMessage("새 이름"),
    "newPlaylist": MessageLookupByLibrary.simpleMessage("새 재생목록"),
    "newPlaylistShort": MessageLookupByLibrary.simpleMessage("+ 새로 만들기"),
    "newProfileName": MessageLookupByLibrary.simpleMessage("새 프로필 이름"),
    "newVideoNotifications": MessageLookupByLibrary.simpleMessage("새 동영상 알림"),
    "newVideoNotificationsDescription": MessageLookupByLibrary.simpleMessage(
      "구독한 채널이 업로드하면 알림 받기",
    ),
    "noCommentsFound": MessageLookupByLibrary.simpleMessage(
      "No Comments Found",
    ),
    "noDownloads": MessageLookupByLibrary.simpleMessage("다운로드 없음"),
    "noDownloadsHint": MessageLookupByLibrary.simpleMessage(
      "다운로드한 동영상이 여기에 표시됩니다",
    ),
    "noHistory": MessageLookupByLibrary.simpleMessage("시청 기록 없음"),
    "noLogs": MessageLookupByLibrary.simpleMessage("아직 로그가 없습니다"),
    "noPlaylists": MessageLookupByLibrary.simpleMessage("재생목록 없음"),
    "noPlaylistsYet": MessageLookupByLibrary.simpleMessage(
      "아직 재생목록이 없습니다.\n+를 눌러 만드세요.",
    ),
    "noPlaylistsYetPicker": MessageLookupByLibrary.simpleMessage(
      "아직 재생목록이 없습니다.\n+ 새로 만들기를 눌러 만드세요.",
    ),
    "noSavedVideos": MessageLookupByLibrary.simpleMessage("저장한 동영상 없음"),
    "noShorts": MessageLookupByLibrary.simpleMessage("Shorts 없음"),
    "noShortsHint": MessageLookupByLibrary.simpleMessage(
      "Short videos will appear here",
    ),
    "noSubscriptions": MessageLookupByLibrary.simpleMessage("구독 없음"),
    "noSubscriptionsHint": MessageLookupByLibrary.simpleMessage(
      "채널을 구독하면 여기에 동영상이 표시됩니다",
    ),
    "noUploadDate": MessageLookupByLibrary.simpleMessage("날짜 없음"),
    "noUploaderName": MessageLookupByLibrary.simpleMessage("이름 없음"),
    "noVideoAvailableChangedToHls": MessageLookupByLibrary.simpleMessage(
      "동영상 원본을 사용할 수 없어요. 자동으로 hls로 변경했어요",
    ),
    "noVideoDescription": MessageLookupByLibrary.simpleMessage("설명 없음"),
    "noVideoTitle": MessageLookupByLibrary.simpleMessage("제목 없음"),
    "noVideosFound": MessageLookupByLibrary.simpleMessage("동영상을 찾을 수 없음"),
    "noVideosInPlaylist": MessageLookupByLibrary.simpleMessage("아직 동영상이 없습니다"),
    "notificationsDenied": MessageLookupByLibrary.simpleMessage(
      "알림 권한이 거부되었습니다",
    ),
    "openDownloadedFile": MessageLookupByLibrary.simpleMessage("Open"),
    "openInBrowser": MessageLookupByLibrary.simpleMessage("브라우저에서 열기"),
    "openLinksExternally": MessageLookupByLibrary.simpleMessage(
      "링크를 외부 브라우저에서 열기",
    ),
    "outro": MessageLookupByLibrary.simpleMessage("아웃트로"),
    "pause": MessageLookupByLibrary.simpleMessage("일시중지"),
    "pauseOnCall": MessageLookupByLibrary.simpleMessage("전화 중 일시중지"),
    "pauseOnHeadphones": MessageLookupByLibrary.simpleMessage(
      "헤드폰 연결 해제 시 일시중지",
    ),
    "paused": MessageLookupByLibrary.simpleMessage("일시중지됨"),
    "pending": MessageLookupByLibrary.simpleMessage("대기 중"),
    "pinned": MessageLookupByLibrary.simpleMessage("고정됨"),
    "platformLabel": MessageLookupByLibrary.simpleMessage("플랫폼"),
    "playAll": MessageLookupByLibrary.simpleMessage("모두 재생"),
    "playNext": MessageLookupByLibrary.simpleMessage("다음에 재생"),
    "playlist": MessageLookupByLibrary.simpleMessage("재생목록"),
    "playlistNameHint": MessageLookupByLibrary.simpleMessage("재생목록 이름"),
    "playlistNotFound": MessageLookupByLibrary.simpleMessage("재생목록을 찾을 수 없음"),
    "playlistOrder": MessageLookupByLibrary.simpleMessage("Playlist order"),
    "playlists": MessageLookupByLibrary.simpleMessage("재생목록"),
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
    "pluginPermissions": MessageLookupByLibrary.simpleMessage("플러그인 권한"),
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
    "profileInUse": MessageLookupByLibrary.simpleMessage("사용 중"),
    "profileName": MessageLookupByLibrary.simpleMessage("프로필 이름"),
    "profiles": MessageLookupByLibrary.simpleMessage("프로필"),
    "profilesDescription": MessageLookupByLibrary.simpleMessage(
      "계정이나 설정별로 별도의 프로필 만들기",
    ),
    "quality1080p": MessageLookupByLibrary.simpleMessage("1080p"),
    "quality1440p": MessageLookupByLibrary.simpleMessage("1440p"),
    "quality144p": MessageLookupByLibrary.simpleMessage("144p"),
    "quality240p": MessageLookupByLibrary.simpleMessage("240p"),
    "quality360p": MessageLookupByLibrary.simpleMessage("360p"),
    "quality480p": MessageLookupByLibrary.simpleMessage("480p"),
    "quality720p": MessageLookupByLibrary.simpleMessage("720p"),
    "queue": MessageLookupByLibrary.simpleMessage("대기열"),
    "queueClear": MessageLookupByLibrary.simpleMessage("지우기"),
    "queueEmpty": MessageLookupByLibrary.simpleMessage("대기열이 비어 있습니다"),
    "queueShuffle": MessageLookupByLibrary.simpleMessage("셔플"),
    "readMoreText": MessageLookupByLibrary.simpleMessage("더 읽기"),
    "recentSearches": MessageLookupByLibrary.simpleMessage("최근 검색어"),
    "recheckFolder": MessageLookupByLibrary.simpleMessage("Re-check"),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "refreshToLoad": MessageLookupByLibrary.simpleMessage("아래로 당겨 새로고침"),
    "region": MessageLookupByLibrary.simpleMessage("지역"),
    "relatedTitle": MessageLookupByLibrary.simpleMessage("연관 동영상"),
    "removeFromHistory": MessageLookupByLibrary.simpleMessage("기록에서 제거"),
    "removeFromQueue": MessageLookupByLibrary.simpleMessage("대기열에서 제거"),
    "removeFromSaved": MessageLookupByLibrary.simpleMessage("저장한 항목에서 제거"),
    "renameAction": MessageLookupByLibrary.simpleMessage("이름 변경"),
    "renamePlaylistTitle": MessageLookupByLibrary.simpleMessage("재생목록 이름 변경"),
    "renameProfile": MessageLookupByLibrary.simpleMessage("프로필 이름 변경"),
    "repliesNotSupported": MessageLookupByLibrary.simpleMessage(
      "답글은 아직 사용할 수 없습니다",
    ),
    "repliesPlural": m5,
    "resume": MessageLookupByLibrary.simpleMessage("재개"),
    "retrieveDislikeCounts": MessageLookupByLibrary.simpleMessage(
      "싫어요 수를 가져와요",
    ),
    "retrieveDislikes": MessageLookupByLibrary.simpleMessage("싫어요 가져오기"),
    "retry": MessageLookupByLibrary.simpleMessage("재시도"),
    "retryDownload": MessageLookupByLibrary.simpleMessage("Retry"),
    "saveToDevice": MessageLookupByLibrary.simpleMessage("기기에 저장"),
    "saveToDeviceFailed": MessageLookupByLibrary.simpleMessage("기기에 저장 실패"),
    "saveToPlaylist": MessageLookupByLibrary.simpleMessage("재생목록에 저장"),
    "saved": MessageLookupByLibrary.simpleMessage("저장 사항"),
    "savedToDevice": MessageLookupByLibrary.simpleMessage("기기에 저장됨"),
    "savedVideosTitle": MessageLookupByLibrary.simpleMessage("저장한 동영상"),
    "savingToDevice": MessageLookupByLibrary.simpleMessage("기기에 저장 중..."),
    "search": MessageLookupByLibrary.simpleMessage("검색"),
    "searchFilters": MessageLookupByLibrary.simpleMessage("필터"),
    "searchForVideosChannels": MessageLookupByLibrary.simpleMessage(
      "동영상, 채널, 재생목록 검색",
    ),
    "searchHistoryEnabled": MessageLookupByLibrary.simpleMessage("검색 기록 저장"),
    "searchHistoryEnabledDescription": MessageLookupByLibrary.simpleMessage(
      "빠른 액세스를 위해 검색어 저장",
    ),
    "searchInPlaylist": MessageLookupByLibrary.simpleMessage(
      "Search in playlist",
    ),
    "searchSavedVideos": MessageLookupByLibrary.simpleMessage("저장한 동영상 검색..."),
    "searchSubscriptions": MessageLookupByLibrary.simpleMessage("구독 검색..."),
    "searchYouTube": MessageLookupByLibrary.simpleMessage("YouTube 검색..."),
    "seconds": MessageLookupByLibrary.simpleMessage("초"),
    "selectAll": MessageLookupByLibrary.simpleMessage("모두 선택"),
    "selectFile": MessageLookupByLibrary.simpleMessage("파일 선택"),
    "selectVideos": MessageLookupByLibrary.simpleMessage("동영상 선택"),
    "selected": MessageLookupByLibrary.simpleMessage("선택됨"),
    "selfPromotion": MessageLookupByLibrary.simpleMessage("자기 홍보"),
    "serviceExplode": MessageLookupByLibrary.simpleMessage("Explode"),
    "serviceInvidious": MessageLookupByLibrary.simpleMessage("Invidious"),
    "serviceNewPipe": MessageLookupByLibrary.simpleMessage("NewPipe Extractor"),
    "servicePiped": MessageLookupByLibrary.simpleMessage("Piped"),
    "settings": MessageLookupByLibrary.simpleMessage("설정"),
    "share": MessageLookupByLibrary.simpleMessage("공유"),
    "shareDownloadedFile": MessageLookupByLibrary.simpleMessage("Share"),
    "shareLogs": MessageLookupByLibrary.simpleMessage("로그 공유"),
    "shareVia": MessageLookupByLibrary.simpleMessage("공유"),
    "shorts": MessageLookupByLibrary.simpleMessage("Shorts"),
    "showLessText": MessageLookupByLibrary.simpleMessage("덜 보기"),
    "showSearchHistory": MessageLookupByLibrary.simpleMessage("검색 기록 표시"),
    "showSearchHistoryDescription": MessageLookupByLibrary.simpleMessage(
      "검색 화면에 최근 검색어 표시",
    ),
    "skipInterval": MessageLookupByLibrary.simpleMessage("건너뛰기 간격"),
    "skipIntervalDescription": MessageLookupByLibrary.simpleMessage(
      "두 번 탭하여 건너뛸 시간(초)",
    ),
    "sleepTimer": MessageLookupByLibrary.simpleMessage("취침 타이머"),
    "sleepTimerCustom": MessageLookupByLibrary.simpleMessage("사용자 지정"),
    "sleepTimerCustomTitle": MessageLookupByLibrary.simpleMessage("사용자 지정 타이머"),
    "sleepTimerEndOfVideo": MessageLookupByLibrary.simpleMessage("동영상 끝"),
    "sleepTimerEnded": MessageLookupByLibrary.simpleMessage("취침 타이머 종료됨"),
    "sleepTimerEnterMinutes": MessageLookupByLibrary.simpleMessage("분 입력"),
    "sleepTimerMinutes": m6,
    "sleepTimerMinutesShort": m7,
    "sleepTimerOff": MessageLookupByLibrary.simpleMessage("끔"),
    "sleepTimerSet": MessageLookupByLibrary.simpleMessage("설정"),
    "sort": MessageLookupByLibrary.simpleMessage("정렬"),
    "sortAToZ": MessageLookupByLibrary.simpleMessage("Title A–Z"),
    "sortBy": MessageLookupByLibrary.simpleMessage("정렬 기준"),
    "sortZToA": MessageLookupByLibrary.simpleMessage("Title Z–A"),
    "sponsor": MessageLookupByLibrary.simpleMessage("스폰서"),
    "sponsorBlock": MessageLookupByLibrary.simpleMessage("SponsorBlock"),
    "sponsorBlockCategories": MessageLookupByLibrary.simpleMessage("건너뛸 카테고리"),
    "sponsorBlockDescription": MessageLookupByLibrary.simpleMessage(
      "스폰서 구간 자동 건너뛰기",
    ),
    "startDownload": MessageLookupByLibrary.simpleMessage("다운로드 시작"),
    "startSavingVideos": MessageLookupByLibrary.simpleMessage(
      "나중에 볼 동영상을 저장하세요",
    ),
    "subscribe": MessageLookupByLibrary.simpleMessage("구독"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("구독"),
    "subtitleSize": MessageLookupByLibrary.simpleMessage("자막 크기"),
    "subtitleSizeDescription": MessageLookupByLibrary.simpleMessage(
      "동영상 자막 크기 조정",
    ),
    "subtitleSizeExtraLarge": MessageLookupByLibrary.simpleMessage("아주 크게"),
    "subtitleSizeLarge": MessageLookupByLibrary.simpleMessage("크게"),
    "subtitleSizeMedium": MessageLookupByLibrary.simpleMessage("보통"),
    "subtitleSizeSmall": MessageLookupByLibrary.simpleMessage("작게"),
    "swipeDownToDismissDisabled": MessageLookupByLibrary.simpleMessage(
      "\'Swipe down to dismiss\' disabled",
    ),
    "swipeUpToDismissEnabled": MessageLookupByLibrary.simpleMessage(
      "\'Swipe up to dismiss\' enabled",
    ),
    "switchProfile": MessageLookupByLibrary.simpleMessage("프로필 전환"),
    "switchRegion": MessageLookupByLibrary.simpleMessage(
      "더 나은 결과를 위해 다른 지역으로 전환하는 걸 고려해 주세요.",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("테마"),
    "themeDark": MessageLookupByLibrary.simpleMessage("다크"),
    "themeDynamic": MessageLookupByLibrary.simpleMessage("Material You"),
    "themeLight": MessageLookupByLibrary.simpleMessage("라이트"),
    "themeOled": MessageLookupByLibrary.simpleMessage("OLED 블랙"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("시스템"),
    "thereIsNoSavedOrHistoryVideos": MessageLookupByLibrary.simpleMessage(
      "저장한/기록된 동영상이 없어요",
    ),
    "thereIsNoSavedVideos": MessageLookupByLibrary.simpleMessage(
      "저장한 동영상이 없어요",
    ),
    "title": MessageLookupByLibrary.simpleMessage("제목"),
    "translators": MessageLookupByLibrary.simpleMessage("번역가"),
    "trending": MessageLookupByLibrary.simpleMessage("인기 급상승"),
    "unitedKingdom": MessageLookupByLibrary.simpleMessage("영국"),
    "unitedStates": MessageLookupByLibrary.simpleMessage("미국"),
    "unknown": MessageLookupByLibrary.simpleMessage("알 수 없음"),
    "unknownError": MessageLookupByLibrary.simpleMessage("알 수 없는 오류가 발생했습니다"),
    "unknownQuality": MessageLookupByLibrary.simpleMessage("알 수 없는 화질"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("구독 취소"),
    "unsubscribeConfirm": MessageLookupByLibrary.simpleMessage(
      "이 채널 구독을 취소하시겠습니까?",
    ),
    "version": MessageLookupByLibrary.simpleMessage("버전"),
    "video": MessageLookupByLibrary.simpleMessage("동영상"),
    "videoAudio": MessageLookupByLibrary.simpleMessage("동영상+오디오"),
    "videoCountLabel": m8,
    "videoFit": MessageLookupByLibrary.simpleMessage("동영상 맞춤"),
    "videoFitContain": MessageLookupByLibrary.simpleMessage("맞추기"),
    "videoFitCover": MessageLookupByLibrary.simpleMessage("채우기"),
    "videoFitFill": MessageLookupByLibrary.simpleMessage("늘이기"),
    "videoFitFitHeight": MessageLookupByLibrary.simpleMessage("높이에 맞춤"),
    "videoFitFitWidth": MessageLookupByLibrary.simpleMessage("너비에 맞춤"),
    "videoOnly": MessageLookupByLibrary.simpleMessage("동영상만"),
    "videoQuality": MessageLookupByLibrary.simpleMessage("동영상 화질"),
    "videoViews": m9,
    "videoWithAudio": MessageLookupByLibrary.simpleMessage("동영상 + 오디오"),
    "videos": MessageLookupByLibrary.simpleMessage("동영상"),
    "views": MessageLookupByLibrary.simpleMessage("회"),
    "watchSomeVideos": MessageLookupByLibrary.simpleMessage(
      "시청한 동영상이 여기에 표시됩니다",
    ),
    "youtubeService": MessageLookupByLibrary.simpleMessage("YouTube 서비스"),
  };
}
