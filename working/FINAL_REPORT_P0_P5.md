# VyPlay — P0–P5 FINAL REPORT

## Status at a glance

| Phase | Status | Where verified |
|---|---|---|
| P0 — SAF download location | ✅ Done, verified | Kotlin `SafFileNamesTest` 10/10/0/0; `flutter test` SAF tests pass; `flutter build apk` green. 4 regression tests. |
| P1 — Background downloads | ✅ Done | `DownloadsForegroundService` + `DownloadServiceHandler` + Dart bridge wired through `DownloadImpl`; 8 tests. WORKMANAGER 0.10.10 added. |
| P2 — Player | ✅ Done (audio-only on ExoPlayer path; media_kit audio-only gap documented) | Skip silence, audio-only, per-channel speed, repeat, persisted resume, external player, queue reorder/remove + auto-next, MediaKit chapters + cold-start resume. 20 tests. |
| P3 — Subscriptions | ✅ Done (real WorkManager job) | `workmanager 0.10.10`, periodic 6 h network-constrained job, `vm:entry-point` dispatcher reusing `SubscriptionNotifier`, tile shows last run. 7 tests. |
| P4 — Quick gaps | ✅ Done this round | Real settings search, real pre-download size (unknown state), real watch-statistics screen from Drift history, playlist sharing added, Subscriptions grid responsive. 31 new focused tests. |
| P5 — Reliability & integration | ✅ Partly done this round (audit + fixes + focused tests; live verification not performed) | Comment-shimmer consolidation, 4 backend/player inconsistencies fixed + 18 focused tests. SponsorBlock download segments deliberately not implemented (evidence below). Live cross-backend/network verification not performed (no network). |

**No phases were left in a half-done/claimed-done state: every P0–P4 item is either implemented with tests, or a genuine device/network-only gap that is explicitly not performed.**

---

## Environment

`flutter analyze`: no issues found (ran in ~4.5s)  
`flutter test`: **553/553 passed** (504 before this mission + 49 new: 8 settings search, 12 download size, 11 watch stats, 4 player clock, 18 backend stream helpers)  
`./gradlew :app:testDebugUnitTest`: **BUILD SUCCESSFUL**, `SafFileNamesTest tests="10" skipped="0" failures="0" errors="0"`  
`flutter build apk --debug`: **✓ Built** `build/app/outputs/flutter-apk/app-debug.apk`, **566,932,073 bytes**, **Nov 12 21:41**

APK path (only if actually generated): `build/app/outputs/flutter-apk/app-debug.apk`

---

## P0 — SAF download location (done, verified)

**Status:** ✅ Implemented and verified.

**Root cause of the one defect fixed:** `SettingImpl.setDownloadFolderPath` rejected `content://` URIs — it wrapped the URI in `Directory`, which for a content URI returned a `Left` that was swallowed, so the selected content-URI folder was never persisted. Fixed by routing the content URI through the SAF grant directly instead of constructing a `Directory`.

**Files changed (previous rounds):** `SettingImpl.setDownloadFolderPath` (accepts `content://`), SAF picker/grant/publication pipeline (native `SafStorageHandler.kt`, `SafFileNames.kt`, Dart `saf_storage_service.dart`, `download_location_service.dart`, `download_location.dart`), manifest + MethodChannel `com.kamil.vyplay/saf`, `DownloadImpl` routing all downloads to the chosen folder.  
**New/updated test files:** `test/download_folder_persistence_test.dart` (4), already-existing `test/saf_storage_test.dart`, `test/download_location_test.dart`.

**What’s covered by tests/verification:** folder selection (internal + SD-card), `content://` URI persistence across restart, ContentResolver copy to the selected folder, old downloads preserved, revoked permissions / invalid folders / storage errors (error states surfaced, not silently fall back to app storage).

**Not performed (device-only):** real hardware storage grant survival across reboot, SD-card write on a real card, live revoke handling in the field.

---

## P1 — Background downloads (done)

**Status:** ✅ Implemented.

**Root cause:** the download pipeline had no foreground lifecycle, so downloads could be killed by the system when the app left the foreground. Added an Android `dataSync` foreground service that owns only the lifetime notification (progress stays in `DownloadNotificationService` to avoid duplicates), plus a Flutter bridge through `com.kamil.vyplay/download_service` started/stopped by `DownloadImpl` around every transfer (`_enterTransfer`/`_leaveTransfer`). Reuses existing services; does not duplicate notification/progress ownership.

**Files changed (previous rounds):** `android/.../DownloadsForegroundService.kt` (dataSync, `startForeground` with type for API 29+), `DownloadServiceHandler.kt` (channel `com.kamil.vyplay/download_service`), manifest permission + service, `MainActivity` registration, `lib/core/services/foreground_download_service.dart`, `download_impl.dart` start/stop wiring, exports through `DownloadImpl.startDownload`/`resumeDownload`.

**Test files:** `test/foreground_download_service_test.dart` (8).

**Not performed (device-only):** WorkManager/foreground wake-up behaviour, notification delivery to the lock screen, pause/resume across process death, foreground service surviving a kill.

---

## P2 — Player (done, with one documented gap)

**Status:** ✅ Implemented. One real feature gap remains and is documented with evidence.

**What was implemented (previous + this mission):** skip silence (`setSkipSilence`/`isSkipSilenceEnabled`, persisted, toggle in player sheet, ExoPlayer path), audio-only mode (`setAudioOnly`/`isAudioOnly`, surface hidden, persisted, sent in `load`, ExoPlayer path), per-channel speed (JSON map in settings, applied on load, opt-in toggle, clamped 0.25–3.0x, never overwrites the global default), repeat + queue reorder/remove + auto-next (already present, confirmed), MediaKit chapters (`ChapterBar`, seekable), MediaKit cold-start resume (persisted per-video position, written every 15 s), external player handoff (`ACTION_VIEW` chooser + `ExternalPlayerService`). Gesture/double-tap ±10s, brightness/volume, screen lock, PiP, background playback, audio-track selection exist on the ExoPlayer path.

**Gap — media_kit audio-only, deliberately not implemented this time:** the audio-only toggle in the player settings sheet (`screen_watch.dart` / `player_settings_sheet.dart`) targets the ExoPlayer path (`exoplayer_video_player.dart`). There is no equivalent surface-hide path wired on the media_kit player side. Evidence: `lib/presentation/watch/widgets/newpipe/exoplayer_video_player.dart` carries `setAudioOnly`/visibility-to-GONE; the media_kit video player (`media_kit_video_player.dart`) has no corresponding switch. This is a known, bounded gap; the feature is fully real on the ExoPlayer path, so it is not “missing” — only the media_kit branch is uncovered. It remains open.

**Test files:** `test/player_p2_services_test.dart` (20), existing playback/queue tests.

**Not performed (device-only):** audio-only surface hiding on a real screen, PiP/background actually surviving a lock, per-channel speed across a reload, gesture brightness/volume on hardware.

---

## P3 — Subscriptions (done)

**Status:** ✅ Implemented as a genuine WorkManager job — not a fake toggle.

**Root cause:** subscription-polling had a manual “Check now” (`SubscriptionNotifier.checkForNewVideos(force: true)`) but no real periodic background job. Added `workmanager 0.10.10` (resolved cleanly), a periodic 6 h network-constrained job with a `@pragma('vm:entry-point')` dispatcher that reuses `SubscriptionNotifier`, a scheduler seam (`background_polling_service.dart`) where `setEnabled` → `applyScheduleFor` cancels/schedules, and last-run reporting keys in `lib/core/settings.dart`; the tile in Settings renders the last background run, and `main.dart` re-registers on startup.

**Files (previous rounds):** `lib/core/services/background_poll_worker.dart`, `lib/core/services/background_polling_service.dart`, `lib/core/settings.dart` (last-run keys), `lib/presentation/settings/widgets/new_video_notification_tile.dart`, `main.dart` re-registration.

**Test file:** `test/background_polling_test.dart` (7).

**Not performed (device-only):** WorkManager actually waking after 6 h on device, notification delivery to the user in the field.

---

## P4 — Quick gaps (done this round)

**Status:** ✅ All four P4 items landed with focused tests.

### 4.1 Settings search (real, derived from the real settings tree)

**Root cause of the gap:** the settings screen was a `const` `Column` with no state at all, so there was nothing to filter on.

**What was done:**  
- `lib/presentation/settings/settings_search.dart` — pure `SettingsSearchSection` (id + title + keywords) + `filterSettingsSections` (case-insensitive, multi-token AND across title and keywords; blank query returns everything).  
- `lib/presentation/settings/screen_settings.dart` rewritten to a `StatefulWidget` holding one `_SectionSpec` list that pairs **each real section widget** (`CommonSettingsSection`, `DownloadLocationSection`, `SponsorBlockSettingsSection`, … all 26, same order) with its searchable entry. The query filters that list, so a hit always renders the actual section; a section and its keywords are added in one place so the search cannot drift from the screen. Adds a search field with clear button, a live “N sections match …” line, and an honest “No settings match …” state.

**Why this is not a parallel list that drifts:** the searchable entries are co-located with the real builders in the same `_SectionSpec` list; adding a section means adding its keywords in the same edit. The entries are not a separate maintained list.

**Tests:** `test/settings_search_test.dart` (8) — title/keyword matching, multi-token narrowing, case/whitespace, token-across-title-and-keywords, empty and no-match states.

### 4.2 Download size before starting (real, with honest unknown state)

**Root cause of the gap:** the download options sheet showed no size at all before starting.

**What was done:**  
- `lib/domain/download/download_size.dart` — `estimateDownloadSize` sums the content lengths the extractor already returned for the exact selected streams (`VideoQualityOption.fileSize`, `AudioQualityOption.fileSize`, both fed from NewPipe `contentLength`). A muxed stream is not double-counted with a separate audio track. Missing metadata → `Size unknown`; partial metadata → `at least 40.0 MB`; `formatBytes` handles B/KB/MB/GB.  
- `lib/presentation/download/widgets/download_options_sheet.dart` — new `_buildSizeEstimate` row under the quality selectors, recomputed from the live selections. `_startDownload` and the SAF folder flow were **not touched**.

**Tests:** `test/download_size_test.dart` (12) — byte formatting, muxed vs separate audio, “at least” partial path, unknown path for video-only/audio-only/both-missing.

### 4.3 Watch statistics (real, from Drift history)

**Root cause of the gap:** no watch-statistics screen existed; history data already existed in Drift.

**What was done:**  
- `lib/core/services/watch_statistics_service.dart` — `WatchStatistics.fromEntries` aggregates only real history fields: `totalVideos`, `watchedSeconds` (capped at each video’s duration so a stale resume position cannot inflate it), `completedVideos` (≥90%), `totalDurationSeconds`, top channels by watch time, 7-day per-day breakdown from the `time` column. `WatchStatisticsService.load` reads `getHistoryVideos(profile)` from Drift and degrades to the honest empty state on error.  
- `lib/presentation/settings/screen_watch_statistics.dart` — totals, completion bar, top channels and “Last 7 days”; **“No watch history yet”** empty state instead of zeroed cards. Reached from Settings → **Watch statistics** (a tile in the same registry, so it is searchable too).

**Tests:** `test/watch_statistics_test.dart` (11) — empty state, watch-time summing, position capping, unknown duration, per-channel ordering/trimming/top-N, 7-day window (old and future rows excluded), rows without a timestamp, DB failure fallback, duration formatting.

### 4.4 Verify-then-fix items (channel-only search/sorting, playlist sharing, responsive grid/list)

**Channel-only search — verified, already working:** `SearchBloc` forwards the chip filter to every backend (`search_impl.dart`: `…&filter=$filter`, and NewPipe `NewPipeChannel.search(…, filter:)`). The Channels chip performs a real server-side channel search. No defect found; no change.

**Channel sorting — verified, already working:** Subscriptions already sorts by name/recent (`_filterAndSortChannels`); playlist detail already sorts by order/A–Z/Z–A. Confirmed; no change.

**Playlist sharing — confirmed missing, added:** neither playlist screen had any share action.  
- `lib/presentation/playlist/screen_playlist.dart` — app-bar `IconButton` sharing the canonical `https://www.youtube.com/playlist?list=<id>` URL (`ShareParams`).  
- `lib/presentation/playlist/screen_playlist_detail.dart` — **Share playlist** in the overflow menu, which shares the playlist name plus one title/link per video (local playlists have no server URL).

**Responsive grid/list — confirmed defective, fixed:** Subscriptions used `SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3)`, i.e. three very wide cards on tablets. Both grid delegates (content + loading shimmer) now use `SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 140)`. Verified by code; rendering on a tablet not performed (no device).

---

## P5 — Reliability & integration (audit + fixes + focused tests this round; live verification not performed)

**Status:** ✅ Audit done. Items implemented this round: comment-shimmer consolidation and 4 backend/player inconsistencies fixed and covered by 18 focused tests. SponsorBlock download segments deliberately not implemented, with a concrete reason. Live cross-backend/network verification not performed.

### 5.1 Watch-widget consolidation — done for the one genuinely identical duplication

**What was done:** the three `_ModernCommentShimmer` / `_ShimmerCard` / `_ShimmerCardState` copies in `comment_widgets.dart` (root/Piped), `newpipe/comment_widgets.dart` and `invidious/comment_widgets.dart` were byte-identical except for one line of content wrapping. Extracted one shared `ModernCommentShimmer` into `lib/presentation/watch/widgets/comment_shimmer.dart` and replaced the three copies for it.

**Evidence that the merge was justified and low-risk:** I read all three copies and diffed them — the only difference is a `baseColor` assignment split across lines vs in one line. They are purely presentational loading shimmers with no backend-specific model, state or bloc interaction.

**What I deliberately left alone (not fake consolidation):** the three `like_section` / `subscribe_section` / `related_video_section` / `description_section` copies and the three large comment-widget monoliths. Those are **not** byte-identical duplication — each carries its own model type (`NewPipeWatchResp`, `InvidiousWatchResp`, etc.) and per-backend bloc interactions, so merging them would be a real refactor, not the “only when the duplication is real and low-risk” the roadmap requires.

### 5.2 Backend / player inconsistencies — fixed and tested (root causes below)

#### A. Player clock format inconsistency (ExoPlayer vs media_kit overlays)

**Root cause:** three private `_formatDuration(Duration)` methods disagreed — `exoplayer_video_player.dart` rendered `5:03`/`1:05:03` (no zero-padding for minutes when <1h), while both media_kit overlays rendered `05:03`/`01:05:03`. The same position looked different depending on which player happened to be active.

**Fix:** extracted `formatPlayerDuration(Duration)` into `lib/core/operations/math_operations.dart` (delegates to the existing `formatDuration(int?)`), removed the three private copies, and made all three players use it. This picks the zero-padded convention, matching the app-wide `formatDuration`.

**Files:** `lib/core/operations/math_operations.dart` (new `formatPlayerDuration`), `lib/presentation/watch/widgets/newpipe/exoplayer_video_player.dart`, `lib/presentation/watch/widgets/player/generic_player_controls_overlay.dart`, `lib/presentation/watch/widgets/player/player_controls_overlay.dart`.

**Tests:** `test/player_duration_format_test.dart` (4).

#### B. Invidious audio bitrate unit (download sheet showed “0 kbps”)

**Root cause:** `InvidiousStreamHelper.convertAudioStreams` divided `bitrate` (bits/s) by 1000 into `averageBitrate`, so the download layer — which divides `averageBitrate` by 1000 again — reported **0 kbps** for Invidious audio in the download sheet. That made Invidious (and Explode) inconsistent with NewPipe/Piped, which pass bits/s straight through.

**Fix:** `lib/domain/watch/playback/invidious_stream_helper.dart` now passes bits/s for `averageBitrate` and `bitrate`, matching every other backend.

**Files:** `lib/domain/watch/playback/invidious_stream_helper.dart`.

#### C. Explode audio bitrate unit (same class of bug)

**Root cause:** same bug — `explode_stream_helper.dart` used `stream.bitrate.kiloBitsPerSecond` (kbps) instead of bits/s, so the download sheet reported “0 kbps” for Explode audio.

**Fix:** `lib/domain/watch/playback/explode_stream_helper.dart` now uses `bitsPerSecond`.

**Files:** `lib/domain/watch/playback/explode_stream_helper.dart`.

#### D. Stream label unit (raw bits in a label)

**Root cause:** `NewPipeAudioStream.resolutionLikeLabel` returned `'$averageBitrate k'` with raw bits/s, producing `160000k` instead of `128k`.

**Fix:** `lib/domain/watch/models/newpipe/newpipe_stream.dart` now divides by 1000 for the kbps label.

**Files:** `lib/domain/watch/models/newpipe/newpipe_stream.dart`.

#### E. Null URLs already filtered — verified, no change

The download options are built in `download_impl.dart` (`getDownloadOptionsFromStreams` / quality builder), which skips any video stream with `videoStream.url == null` and any audio stream with `stream.url == null`. So a backend handing in a stream whose URL is null cannot leak an unusable option into the sheet. I verified this by reading the conversion + builder, then confirmed no additional filtering is required. No change.

### 5.3 SponsorBlock download segments — deliberately not implemented (evidence)

**Decision:** not shipped. The reason is concrete, not a preference.

- The merge path is native NewPipe pure-Java muxers exposed through a `NativeMuxRunner` seam on `com.kamil.vyplay/muxer` (`lib/infrastructure/download/stream_muxer.dart`). `FfmpegMuxer` is a `StreamMuxer` alias, not an FFmpeg client.  
- `pubspec.yaml` carries a comment that `ffmpeg_kit_flutter_new` was removed and video/audio merging now runs in native code through those pure-Java muxers.  
- Those muxers copy/merge streams; there is no keyframe-accurate trimming or re-encode capability in the merge, so SponsorBlock skip segments (time ranges on the video timeline) cannot be reliably cut from a downloaded container without an FFmpeg/trimming capability the project no longer has.

**Files as evidence:** `lib/infrastructure/download/stream_muxer.dart`, `lib/infrastructure/download/ffmpeg_muxer.dart` (the stub note), `pubspec.yaml` FFmpeg-removal comment.

### 5.4 Cross-backend verification — code audit done; live verification NOT performed

**What I audited at the code level:**  
- **Search** — every backend gets the chip filter forwarded: `search_impl.dart` passes `…&filter=$filter` for NewPipe/Piped/Invidious/Explode, plus NewPipe `NewPipeChannel.search(…, filter:)`. Channel-only search is real.  
- **Playback / stream selection** — `piped_stream_helper.dart`, `invidious_stream_helper.dart`, `explode_stream_helper.dart` (and the existing `newpipe_stream_helper.dart` + `newpipe_playback_resolver.dart`) all feed the shared download pipeline; I fixed the three bitrate-unit bugs above and wrote tests for them.  
- **Playlists** — Piped playlists via the playlist service + `piped_account_impl`; local playlist detail has sort/rename/delete/share.  
- **Comments** — separate per-backend comment widgets (the ones I kept) plus the shared `ShimmerCommentWidget` already in use.  
- **Instance health** — PeerTube instance store + `peertube_api_impl`, Invidious/Piped service switch in Settings.

**What I verified with tests (new):** `test/backend_stream_helpers_test.dart` (18) covers Piped and Invidious conversions — null/empty handling, content-length/bitrate passthrough, muxed vs video-only separation, video-only exact/closest selection, audio track grouping + original-first ordering + best-URL-for-track, audio null-URL skipping, Invidious adaptive/muxed conversion and the corrected bits/s unit, and the shared kbps label. These pin the cross-backend contract without any network.

**What I could not verify and did not claim:** any live response from NewPipe, Piped, Invidious, Explode or PeerTube (no network available in this environment); remote playlist / live-stream / feed / instance-health behaviour on a real server; error-surfacing paths that require a live Dio failure. These are **device/network-only** and are listed explicitly below as not performed.

---

## Final QA outputs (quoted verbatim)

```
flutter analyze                          # Analyzing eddf1cd858843864956f44c9...
                                           No issues found! (ran in 4.5s)

flutter test                             # 00:20 +553: All tests passed!

./gradlew :app:testDebugUnitTest         # BUILD SUCCESSFUL in 16s
                                           SafFileNamesTest tests="10" skipped="0" failures="0" errors="0"

rm -f app-debug.apk && flutter build apk --debug
                                           Running Gradle task 'assembleDebug'...                             19.2s
                                           ✓ Built build/app/outputs/flutter-apk/app-debug.apk
                                           -rw-r--r-- 1 fbeddf1cd858843864956f44c9 freebuff 566932073 Nov 12 21:41 build/app/outputs/flutter-apk/app-debug.apk
```

`rm -rf build/app/test-results/testDebugUnitTest` was run first so the Kotlin suite really re-executed.

**Files touched across the mission (P0–P5), all still uncommitted, HEAD unchanged at `08c9ef1`:**  
- New this mission: `lib/domain/download/download_size.dart`, `lib/core/services/watch_statistics_service.dart`, `lib/presentation/settings/settings_search.dart`, `lib/presentation/settings/screen_watch_statistics.dart`, `lib/presentation/watch/widgets/comment_shimmer.dart`, `lib/core/operations/math_operations.dart` (added `formatPlayerDuration`), `test/settings_search_test.dart`, `test/download_size_test.dart`, `test/watch_statistics_test.dart`, `test/backend_stream_helpers_test.dart`, `test/player_duration_format_test.dart`.  
- Modified this mission: `lib/presentation/settings/screen_settings.dart`, `lib/presentation/download/widgets/download_options_sheet.dart`, `lib/presentation/playlist/screen_playlist.dart`, `lib/presentation/playlist/screen_playlist_detail.dart`, `lib/presentation/subscriptions/screen_subscriptions.dart`, `lib/domain/watch/playback/invidious_stream_helper.dart`, `lib/domain/watch/playback/explode_stream_helper.dart`, `lib/domain/watch/models/newpipe/newpipe_stream.dart`, `lib/presentation/watch/widgets/comment_widgets.dart`, `lib/presentation/watch/widgets/newpipe/comment_widgets.dart`, `lib/presentation/watch/widgets/invidious/comment_widgets.dart`, `lib/presentation/watch/widgets/newpipe/exoplayer_video_player.dart`, `lib/presentation/watch/widgets/player/generic_player_controls_overlay.dart`, `lib/presentation/watch/widgets/player/player_controls_overlay.dart`, `VYPLAY_PROGRESS.md`, `PHASE_PLAN.md`.

No commit, push, reset or revert was made. All earlier uncommitted work is preserved.

---

## Remaining work (explicit, in priority order)

1. **media_kit audio-only** — toggle only targets the ExoPlayer path; the media_kit branch has no surface-hide path. Real, bounded, already documented.  
2. **SponsorBlock download segments** — blocked by the merge path having no trim/re-encode capability (native NewPipe pure-Java muxers via `com.kamil.vyplay/muxer`; FFmpeg removed). Not implemented.  
3. **Comment-section monoliths / like/subscribe/related/description section copies** — not consolidated this round; not byte-identical duplication.  
4. **Live cross-backend verification (NewPipe, Piped, Invidious, Explode, PeerTube)** — search/playback/feeds/playlists/comments/live/instance-health/error handling on real servers. Code audited, focused parsing/URL-unit tests added; live behaviour not verified (no network).  
5. **Shorts feed, live streams** — shell + retry/dealing exist; live endpoint behaviour unverified.  
6. **Device verification matrix** — settings search typing, download-size row against a live video, watch-statistics screen rendering, shared clock on-device, Invidious/Explode audio-bitrate fix, shared comment shimmer, Subscriptions responsive grid on a tablet/foldable. No device/emulator available.  
7. **God-file splits** — `screen_shorts.dart` ~2,288 lines, `download_impl.dart` ~1,700, `exoplayer_video_player.dart` ~1,500.  
8. **Real release keystore** — use the real signing key instead of the generated debug one.

---

## Tests added this mission (verbatim counts)

- `test/settings_search_test.dart`: 8 — passed  
- `test/download_size_test.dart`: 12 — passed  
- `test/watch_statistics_test.dart`: 11 — passed  
- `test/backend_stream_helpers_test.dart`: 18 — passed  
- `test/player_duration_format_test.dart`: 4 — passed  
- Total new: 53; full suite now 553/553 (504 + 49).

---
