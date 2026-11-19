# VyPlay — Fixes and Verification

Date: 2026-11-19 · Base commit `5dea4b8`

## Fix 1 — Native muxer registration restored (Critical, download path)

**Root cause.** `StreamMuxer` invokes `mergeStreams` on `com.kamil.vyplay/muxer`
(`lib/infrastructure/download/stream_muxer.dart:62-72`). `MainActivity` registered
`FFmpegMuxerHandler`, which only answers `resolveMuxPlan` (`FFmpegMuxerHandler.kt:48`) and
`muxVideoAudio` (`:78`) — `mergeStreams` fell through to `result.notImplemented()`
(`:97`). Dart then caught `MissingPluginException` and reported the muxer as unavailable
(`stream_muxer.dart:143-149`), so **every download above 360p failed at the merge step**
(`download_impl.dart:768-790` throws `MuxException` when the merge returns null).

The claimed "native NewPipe muxers" were dead: `NewPipeMuxerHandler.kt` had been deleted in
`c3c4119` while the vendored writers (`org/schabi/newpipe/streams/*.java`) stayed in the tree.

**Fix.**
- Restored `android/app/src/main/kotlin/com/kamil/vyplay/NewPipeMuxerHandler.kt` (400 lines)
  from `c3c4119^`. It implements `mergeStreams` (`:53`, real merge at `:119`) and `demuxAudio`,
  picks MP4/WebM from the real stream headers, and delegates unknown methods to
  `FFmpegMuxerHandler` so the legacy contracts keep resolving.
- Registered it instead of the plan-only handler (`MainActivity.kt:93-97`).
- `proguard-rules.pro:85-86` already keeps the class, so release builds retain it.

**Why not FFmpeg:** `ffmpeg_kit_flutter_new` is not a dependency; the vendored NewPipe
writers are the intended, already-vendored implementation.

## Fix 2 — Stream cache can be invalidated (High, playback)

`clearStreamCache` added to `NewPipeMethodHandler.kt:74-90`; `NewPipeChannel.invalidateStreamInfo`
(`newpipe_channel.dart:141-166`) clears both the Dart and native caches for a video id.

## Fix 3 — Bounded playback recovery (High, playback)

`_recoverFromStreamFailure` (`exoplayer_video_player.dart:292-346`) + trigger in `onError`
(`:519-528`) + cache invalidation in the live refresh (`:348-360`). One attempt per loaded
source, reset once a source renders (`:486-490`), URL-class failures only.

## Fix 4 — Redacted playback diagnostics (Medium)

New `lib/core/services/playback_diagnostics.dart`; recorded from `onError`
(`exoplayer_video_player.dart:505`); exported with the existing Debug → Share logs action
(`screen_debug.dart:_shareLogs`).

## Explicitly NOT changed

- Application ID, version, signing config, `AndroidManifest.xml`, Gradle files.
- Startup initialization (`main.dart`, splash, `settings_bloc.dart` uncommitted work left as-is).
- Backend URLs (the dead Invidious default is reported, not silently swapped).
- No new dependencies.

## Verification performed

| Check | Command | Result |
|---|---|---|
| Static analysis | `flutter analyze lib/` | `No issues found! (ran in 4.9s)`, exit 0 |
| Dart test suite | `flutter test` | `553` tests, `All tests passed!`, exit 0 |
| Kotlin compile | not run locally (5-minute command cap; Gradle cold) | **deferred to GitHub Actions** — reported as a limitation |
| Diff scope | `git show --stat` per commit | only the intended files |
| CI | `.github/workflows/flutter-ci.yml` | see final summary |
| APK | `android-draft-release.yml` | see final summary |

## Limitations

- No physical Android device is reachable from this workspace: the muxer restore and the
  playback recovery are **compiled and analysed, not device-verified**.
- The 404 itself is not claimed fixed; the diagnostic export is what will pin it.

---

## Fix 5 — Stage-named watch failures (proven structural defect)

Pre-fix, all three NewPipe fetch paths returned `MainFailure.unknown(message: e.toString())`
(`git show a1e93d1:lib/infrastructure/watch/watch_impl.dart` lines 321 and 334), so the watch
screen could only render an opaque exception — the origin of a bare "HTTP 404".

- New `lib/application/watch/watch_failure.dart`: `WatchStage`, `WatchFailureReport` with
  `httpStatus`, `retryable`, `describe()` and `fromException()`.
- `lib/infrastructure/watch/watch_impl.dart`: both NewPipe watch fetches now classify and
  surface `NewPipe metadata extraction failed (HTTP 404)` instead of `Exception: ...`.
- `test/watch_failure_test.dart`: 7 cases covering status parsing, stage precedence,
  retryability and exception type.

Note on the "fails before the fix" requirement: the classifier is new behaviour, so the test
exercises new code; the *pre-fix output* is demonstrated by the `e.toString()` lines above
rather than by a test that could not reference a non-existent API. This is stated instead of
being dressed up as a regression test.

Also corrected in this pass: the earlier "default path is DASH" conclusion was wrong —
`dashMpdUrl` is empty and the default path is HLS (see the reproduction section in
`VYPLAY_PLAYBACK_404_ROOT_CAUSE.md`).
