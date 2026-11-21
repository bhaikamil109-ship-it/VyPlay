# VyPlay — Ultra Repository Audit

Original audit: 2026-11-19 · Status reconciled: 2026-11-21 · Current app `com.kamil.vyplay` `0.1.0`

Scope of this pass: the playback path end-to-end, the native muxer/download contract, backend
reachability, DI/database integrity, the Supabase connection, release engineering and
documentation. Findings are separated into **fixed in this pass** and **open**, and every
finding carries file/line evidence.

## A. MethodChannel contract inventory (audited pairs)

| Channel | Dart side | Native side | Contract |
|---|---|---|---|
| `com.kamil.vyplay/newpipe` | `lib/infrastructure/newpipe/newpipe_channel.dart` | `NewPipeMethodHandler.kt` (`MainActivity.kt:80-81`) | **mismatch found & fixed**: `clearStreamCache` was missing (`NewPipeMethodHandler.kt:74-90` now added) |
| `com.kamil.vyplay/muxer` | `lib/infrastructure/download/stream_muxer.dart:57-72` (`mergeStreams`) | `FFmpegMuxerHandler.kt` (`resolveMuxPlan`:48, `muxVideoAudio`:78) — **no `mergeStreams`** | **broken & fixed**: `NewPipeMuxerHandler` restored + registered (`MainActivity.kt:93-97`) |
| `com.kamil.vyplay/newpipe_exoplayer_<id>` | `exoplayer_video_player.dart:_onPlatformViewCreated` | `NewPipeExoPlayerView.kt:117-121` | consistent (`play/pause/stop/seekTo/load/setSpeed/setSkipSilence/setAudioOnly/setResizeMode/reattach` + `onState/onError/onLiveUrlExpired`) |
| Cast / storage / SAF / download service / device / media store / PiP | `lib/core/services/*` | `MainActivity.kt:103-137` | names and single-argument shapes consistent on inspection; not exercised on a device |

## B. Findings

### C1 — Critical — merged downloads always failed (FIXED)
`StreamMuxer` calls `mergeStreams`; the registered handler did not implement it, so the call
returned `notImplemented` → `MissingPluginException` → `MuxFailure` → `MuxException` for every
download above 360p (`download_impl.dart:768-790`). The vendored writers were present but the
orchestrator class had been deleted in `c3c4119`. Restored from history and registered.
Evidence: `stream_muxer.dart:62-72`, `FFmpegMuxerHandler.kt:48/78`, `NewPipeMuxerHandler.kt:53/119`,
`MainActivity.kt:93-97`.

### C2 — High — stream refresh could not refresh (FIXED)
Native `StreamInfo` cache 5 min (`NewPipeMethodHandler.kt:45`, `:781-786`) and Dart cache 5 min
(`newpipe_channel.dart:18`) both cache resolved Googlevideo URLs, and the only invalidation was
`setCookie`. The live-refresh path (`exoplayer_video_player.dart:348`) therefore re-read the
same dead URL. Added `clearStreamCache` + `NewPipeChannel.invalidateStreamInfo` and call it
before every re-extraction.

### H1 — High — no recovery for non-live playback failures (FIXED)
`onError` only retried for `PlaylistStuck && isLive`. Added a bounded single recovery for
URL-class errors (`exoplayer_video_player.dart:292-346`, trigger `:519-528`).

### H2 — High — default Invidious instance is unusable (OPEN)
`https://inv.nadeko.net` (`lib/core/strings.dart:4`) returns **HTTP 403** for
`/api/v1/videos/<id>` (measured 2026-11-19). Every Invidious request therefore fails until the
user picks another instance. Piped's default (`api.piped.private.coffee`) returns 200.
Not changed: silently swapping backend URLs is explicitly out of bounds; this needs a
maintainer decision.

### M1 — Medium — no playback diagnostics (FIXED)
Added `lib/core/services/playback_diagnostics.dart`, wired into the player error path and into
the existing Debug → Share logs export. Redacted: `scheme://host/path` only.

### H3 — High — CI release channel could publish a temporary-key APK as a normal release (FIXED)
The previous workflow allowed a main-branch build to create a public Release even when the
temporary debug keystore was used. Commit `be4a1880` now restricts public Release publication
to a matching `v*` version tag **and** a fully configured permanent signing keystore. Main
branch/manual non-tag builds and unsigned tag builds upload workflow artifacts only. The
`pubspec.yaml` version must match the tag version before publication. Fresh workflow
verification is tracked in `VYPLAY_PRODUCTION_READINESS.md`.

### M2 — Medium — dead player on Android (OPEN, by design?)
`NewPipeMediaKitPlayer` is unreachable on Android because
`useNativePlayer = !kIsWeb && defaultTargetPlatform == TargetPlatform.android`
(`newpipe_screen_watch.dart:331-333`) is always true there. Two full players are maintained;
the Dart one only runs on non-Android platforms. Not a bug per se, but the media_kit hardening
done for it has no effect on the device the bug was reported on.

### M3 — Medium — README pointed at non-existent URLs and claimed FFmpeg (FIXED)
`VyPlay.` paths in release/CI/issues links (404s) and four FFmpeg claims contradicted the
native muxing implementation. Corrected in `README.md`.

### L1 — Low — changelog ahead of version (OPEN)
`CHANGELOG.md:3` documents `v0.9.4` while `pubspec.yaml:5` ships `0.9.3+14`.
Left alone: rewriting released notes is the maintainer's call.

### L2 — Low — playback error text cleared by ordinary state ticks (FIXED)
`exoplayer_video_player.dart` now preserves the error through idle/buffering state callbacks
and clears it only when the native player reports that playback has resumed. The error message
therefore remains available for the user to read after a transient failure.

## C. Database / DI

- `AppDatabase` is registered before `getIt.init()` (`lib/core/di/injectable.dart`), and the
  generated graph resolves `SettingImpl(db: gh<AppDatabase>())`
  (`injectable.config.dart`, `SettingsService` registration). Intact.
- `SettingImpl` keeps a singleton fallback (`setting_impl.dart:26-30`); no second database
  instance is created because `AppDatabase.instance` is the same singleton the registration
  returns (`database.dart:209-211`).
- No migration, schema or data change was made in this pass.

## D. Backend reliability

| Backend | Capability implemented | Live check | Device test |
|---|---|---|---|
| NewPipe | search, trending, shorts, channel/tabs, playlist, watch, comments, related, external player | Android-only extractor, not reachable from CI | pending |
| Piped | feed, trending, search, watch, comments, channel, playlist | default instance 200 | pending |
| Invidious | trending, search, watch, comments, channel, playlist | **default 403** | pending |
| Explode | video data, muxed streams, related, live URL | not exercised | pending |
| PeerTube | instance store, repository, API | not exercised | pending |

## E. Open items requiring a decision or a device

1. H2 Invidious default instance.
2. Whether the Android media_kit player should be deleted or kept for other platforms.
3. Physical-device verification of: merged downloads, playback recovery, DASH/HLS, PiP,
   background playback, SAF downloads and Android 15 dataSync timeout/recovery.
4. SponsorBlock-on-downloads (`PHASE_PLAN.md:52`) still blocked without a native cut step.
5. Live cross-backend verification for NewPipe, Piped, Invidious, Explode and PeerTube.
