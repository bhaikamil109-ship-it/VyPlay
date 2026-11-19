# VyPlay — Playback 404 Root Cause (Phase 1)

Date: 2026-11-19 · Baseline commit `5dea4b8`

## 1. The actual playback route (verified in source, not from old reports)

1. Router: `watch/:videoId/:channelId` → `ScreenWatch` (`lib/presentation/routes/app_routes.dart:38-41`).
2. Service selection: `settingsState.ytService`; default `newpipe`
   (`lib/application/settings/settings_state.dart:138`, `lib/core/strings.dart`).
3. Watch screen: `NewPipeScreenWatch` (`lib/presentation/watch/screen_watch.dart:25-29`).
4. **Player selection on Android is fixed, not configurable:**
   `final useNativePlayer = !kIsWeb && defaultTargetPlatform == TargetPlatform.android;`
   (`lib/presentation/watch/newpipe_screen_watch.dart:331-333`), then
   `? useNativePlayer ? NewPipeExoPlayer(...) : NewPipeMediaKitPlayer(...)` (`:366+`).
   → On Android the **native Media3/ExoPlayer view** always plays; the media_kit
   NewPipe player is unreachable there.
5. Native view: `newpipe_exoplayer_$viewId` channel (`NewPipeExoPlayerView.kt:118-121`), created by
   `NewPipeExoPlayerViewFactory` and registered in `MainActivity.kt:88`.
6. Source build: `_resolveConfig` → `NewPipePlaybackResolver.resolve`
   (`lib/presentation/watch/widgets/newpipe/exoplayer_video_player.dart:270-290`).
   Because the widget defaults `preferAdaptivePlayback = true` (`:47`), `_currentQuality`
   starts as `Auto` (`:176-178`) → `preferAdaptive: true` → the resolver returns the
   **DASH manifest** first (`newpipe_playback_resolver.dart:27-32`, `:114-119`).
7. URLs come from NewPipeExtractor via `getStreamInfoFast` (`WatchBloc.GetNewPipeWatchInfoFast`,
   `lib/application/watch/watch_bloc.dart:571-617`) → `NewPipeChannel.getStreamInfoFast`
   (`lib/infrastructure/newpipe/newpipe_channel.dart:76-105`) → native
   `getCachedOrExtractStreamInfo` (`NewPipeMethodHandler.kt:781-786`).

## 2. Candidate classification (mission 1B)

| Case | Verdict | Evidence |
|---|---|---|
| A. Extractor metadata request 404 | **Possible, unproven** — no device log. Error surfaces as `MainFailure.unknown(e.toString())` (`watch_impl.dart:322-334`) → `newPipeErrorMessage` (`watch_bloc.dart:601-606`) → 404 lottie + `errorMessage` (`newpipe_screen_watch.dart:282-296`) | Needs on-device log |
| B. Googlevideo stream 404 | **Possible, unproven** | Same |
| C. DASH manifest/segment 404 | **Most likely** — default path opens `dashMpdUrl` through `DashMediaSource` (`NewPipeExoPlayerView.kt:328-334`); manifest URLs carry their own expiry and NewPipeExtractor's manifest is client-specific | See defect #2 |
| D. Piped/Invidious 404 | **Proven for Invidious reliability, not for playback** — `inv.nadeko.net` returns HTTP 403 (measured), Piped default returns 200 | Live probe |
| E. Player error shown as "404" | Possible: `onError` passes `error.message` verbatim to the UI (`NewPipeExoPlayerView.kt:186-196`, `exoplayer_video_player.dart:500-515`) | Code |
| F. Stale/expired/cached URL | **Proven defect** — see #2 below | Code |
| G. Missing headers/cookies/poToken | Possible: extractor UA is a desktop Chrome string (`VyPlayDownloader.kt:23`), player UA is a mobile Chrome string (`NewPipeExoPlayerView.kt:427-429`); no poToken on the stream open | Code |
| H. Dead instance | Proven only for Invidious (`403`) | Live probe |
| I. URL construction/encoding | Not found | Review |

## 3. Proven defects in the playback chain

### Defect P1-A (High, FIXED) — cache invalidation did not exist

- Native cache TTL: `streamInfoCacheTtlMs = 5 * 60 * 1000L` (`NewPipeMethodHandler.kt:45`),
  enforced in `getCachedOrExtractStreamInfo` (`:781-786`).
- Dart cache TTL: `_cacheTtl = Duration(minutes: 5)` (`newpipe_channel.dart:18`).
- The cached object is a `StreamInfo`, i.e. it **contains the resolved Googlevideo URLs**.
- Before this fix the only way to clear the native cache was `setCookie` (`:69-73`).
- Consequence: any "refresh" (including the existing live-stream refresh
  `_handleLiveUrlExpired`, `exoplayer_video_player.dart:348`) re-requested the same
  `StreamInfo` and therefore returned the **same expired URL** for up to 5 minutes.
  A refresh that cannot refresh is a direct production cause of repeated 403/404 on the
  second and later attempt.

Fix: `clearStreamCache` native method (`NewPipeMethodHandler.kt:74-90`) +
`NewPipeChannel.invalidateStreamInfo` (`newpipe_channel.dart:141-166`), called before
re-extraction in both the live refresh and the new recovery path.

### Defect P1-B (High, FIXED) — no recovery outside live HLS

`onError` only ever attempted recovery when `isPlaylistStuck && isLive`
(`exoplayer_video_player.dart:519-528` before the change). A stale progressive / merging /
DASH URL left the user on a dead player with no retry, and the error string was the only
output — which is exactly how an "HTTP 404" reaches the screen and stays there.

Fix: `_recoverFromStreamFailure` (`exoplayer_video_player.dart:292-346`) — one bounded
recovery (`_maxSourceRecoveryAttempts = 1`, reset when a source actually renders), triggered
only for URL-class failures (`404`, `403`, `410`, `ERROR_CODE_IO_BAD_HTTP_STATUS`,
`ERROR_CODE_IO_FILE_NOT_FOUND`, `expired`, `Source error`), which invalidates both caches,
re-extracts, rebuilds the source and reloads at the current position. Permanent errors are
not retried forever; the original error text is kept and shown.

### Defect P1-C (Medium, FIXED) — no playback diagnostics

Added `lib/core/services/playback_diagnostics.dart`: records backend, player, video id,
quality, source type, **`scheme://host/path` only** (query strings, signed params, cookies
and headers are never stored), player error code, redacted message, cache/recovery state.
Exported through the existing Debug screen share action
(`lib/presentation/settings/sub_screens/screen_debug.dart:_shareLogs`, appends
`=== PLAYBACK DIAGNOSTICS ===`), so a device user can export it without a terminal.

## 4. What is still NOT proven

The precise origin of the 404 the user saw cannot be named from source alone: the chain now
records it (backend, resolved host/path, Media3 error code, HTTP-class code, whether the URL
came from cache, and whether recovery succeeded). The two fixes above remove the two
provable dead ends (unrefreshable stale URL, zero recovery), but **no claim is made that the
404 is fixed until the exported log or a device test shows it**.

## 5. Recommended next device step

1. Install the ARMv7 build from the newest release (`VyPlay-armeabi-v7a.apk`).
2. Reproduce the 404.
3. Settings → Debug → Share logs, and send the file. The playback section will contain
   `backend=newpipe player=android-media3 ... source=dash url=https://*.googlevideo.com/...`
   plus `code=` and `recovery=` lines, which distinguishes case B/C/F from case A.
