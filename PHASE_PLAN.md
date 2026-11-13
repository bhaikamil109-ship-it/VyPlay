# VyPlay Remaining Feature Phases

## Final production-readiness pass (this mission)

This pass verified the FINAL PRODUCTION READINESS MISSION against the current
codebase and APK. Nothing new was added as app logic; the notes below record what
is verified, what is not, and what is genuinely blocked.

- [x] **A. MediaKit audio-only** — implemented and toolchain-verified in Round 26
  (all four media_kit video-player widgets, shared `isAudioOnlyEnabled` seam +
  `audio-only-mode` preference, Freezed `SettingsState` regenerated; analyze/
  test/debug-APK green). Device-only surface-hide/background/PiP behavior is
  still UNVERIFIED.
- [x] **B. SponsorBlock download cutting** — BLOCKED, honestly: the download mux
  path does not trim/re-encode, playback skip does not remove segments from the
  file, and no new A/V library was added.
- [x] **C. APK size** — INVESTIGATED. Debug APK is ~540 MiB. Verified by unzipping
  the APK: the cause is bundled native libraries for every ABI (`libflutter.so`
  arm64/x86_64/armeabi-v7a, plus `libVkLayer_khronos_validation.so` on arm64, plus
  `libmpv.so`/`libsqlite3.so`/`libmediakitandroidhelper.so` per ABI) plus Flutter
  engine dev artifacts (`kernel_blob.bin`, `isolate_snapshot_data`) and
  `keepDebugSymbols += ["**/*.so"]`. Nothing removed this turn; realistic size
  reduction is an ABI-split/release path. Release build cannot be produced here
  without a signing keystore.
- [x] **D. Production reliability** — each item was checked against the code:
  SAF download location (picker → native grant → settings persistence → download
  path resolution → publish), foreground download service, WorkManager scheduling,
  download pause/resume/retry + restart recovery, player resume/repeat/queue/
  per-channel speed, PiP/background audio/lifecycle, backend error handling, and
  settings/search/playlists/watch-statistics all exist in the codebase. Only
  device/network behavior is UNVERIFIED.

### Signed release build / AAB — blocker

`android/app/build.gradle` already has the release signing config and a
`hasReleaseKeystore` guard. There is **no** signing keystore file on disk in this
workspace (`android/app/key.jks` / `android/key.properties` absent), so
`flutter build apk --release` fails to sign. No signing secret was created,
written, or requested. A signed release APK/AAB is therefore not produced in this
pass.

## Phase 1 — Player UX Polish
- [x] Pinch-to-zoom (gated by isPinchToZoomEnabled)
- [x] Screen lock (gated by isScreenLockEnabled)
- [x] Seekbar preview thumbnails (frame preview after seek, gated by isSeekbarThumbnailsEnabled)
- [x] Popup player (auto-PiP already gated by isPipDisabled)

## Phase 2 — Content & Comments
- [x] Original titles (DeArrowText respects isOriginalTitlesEnabled)
- [x] Comment filtering (NewPipe comments filtered by keywords)
- [ ] SponsorBlock manual start/end times UI — blocked (needs segment editor + native cut support)
- [ ] SponsorBlock applied to downloads (isSbForDownloadsEnabled) — blocked (FFmpeg removed; native cut needed)
- [ ] Live chat / danmaku overlay (isLiveChatDanmakuEnabled) — blocked (needs live-chat client + overlay renderer)

## Phase 3 — Audio & Downloads
- [x] Multi-select batch delete (saved screen)
- [x] Preferred audio quality preselects download audio track
- [x] Bluetooth seek handling (fast-forward/rewind gated by isBluetoothSeekEnabled)
- [x] SB exclusive marker (adds exclusive_access category when enabled)
- [x] Download location hardening (write probe before saving and before every download, no silent fallback to app storage, ready/not-writable/unavailable status with the reason shown in Settings, rejected folders are not persisted, hardcoded `/storage/emulated/0` replaced with platform media directories)
- [x] Download robustness (manual Retry for failed/cancelled transfers, duplicate-request refusal by video+quality+type+profile, playlist "Download all" from a local playlist, Open and Share for finished downloads, failure reason kept on the card)
- [x] Roadmap C (Dart part) Resume downloads interrupted by process death at startup (`DownloadService.resumeInterruptedDownloads`, bounded to 3) — true background execution still needs a `dataSync` foreground service
- [x] Roadmap D (partial) Clickable description timestamps (chips that seek the active player) and 3.0x speed on the native ExoPlayer path (was clamped at 2.0x)
- [x] Roadmap E Playlist search + sort (playlist order / title A–Z / Z–A); history sort (date, title, duration) already existed
- [x] Roadmap F (partial) Manual "Check now" for new-upload notifications (`SubscriptionNotifier.checkForNewVideos(force: true)`) — background polling still needs WorkManager
- [x] Roadmap G (partial) Exit confirmation dialog before quitting the app from the root screen (AMOLED already existed as theme mode `oled`)
- [x] Roadmap H Cleanup: deleted unregistered `NewPipeMuxerHandler.kt`; the three trending widgets now use the shared `isHiddenByContentFilter` instead of three divergent private copies
- [x] Round 23 P0 SAF download location verified end to end (picker, persisted grant, restart persistence, ContentResolver copy); fixed `SettingImpl.setDownloadFolderPath` rejecting `content://` URIs, with 4 regression tests
- [x] Round 23 P1 Background downloads: `dataSync` foreground service + `com.kamil.vyplay/download_service` bridge, started/stopped by `DownloadImpl` around every transfer (8 tests)
- [x] Round 23 P2 Skip silence (ExoPlayer, persisted via `PlayerPreferencesService`, toggle in the player sheet) and external-player handoff (`ACTION_VIEW` chooser + `ExternalPlayerService`); queue repeat/reorder/remove and chapters on the ExoPlayer path confirmed already complete
- [x] Round 24 P2 Audio-only mode (ExoPlayer surface hidden, persisted, applied on every load)
- [x] Round 24 P2 Per-channel playback speed (JSON map in settings, applied on load, opt-in toggle, clamps 0.25–3.0x, never overwrites the global default)
- [x] Round 24 P2 media_kit chapters (`ChapterBar` rendered and seekable on the media_kit path)
- [x] Round 24 P2 media_kit cold-start resume (persisted per-video position, written every 15 s)
- [x] Round 24 P3 Real WorkManager background polling: `workmanager 0.10.10`, periodic 6 h network-constrained job, `vm:entry-point` dispatcher reusing `SubscriptionNotifier`, switch now schedules/cancels the job, last-run result shown in Settings (7 tests)
- [ ] Round 24 Device verification: WorkManager wake-up after 6 h, notification delivery, audio-only surface hiding, media_kit chapter layout, per-channel speed across reload — no device/emulator available
- [x] Round 24 audio-only mode — ExoPlayer path done earlier; media_kit path completed in Round 26 (all four media_kit video-player widgets read the existing `SettingsBloc.state.isAudioOnlyEnabled` seam, hide the video surface via `SizedBox.shrink()` when enabled, keep playback/lifecycle/PiP/background audio intact; persisted via `PlayerPreferencesService` `audio-only-mode`; Freezed `SettingsState` regenerated). Automated verification green: `flutter analyze` clean, `flutter test` 553/553, Kotlin 10/10/0/0, debug APK 566,935,452 bytes. Device-only surface-hide / background audio / PiP behavior not verified here.
- [ ] Round 24 Device verification: WorkManager wake-up after 6 h, notification delivery, audio-only surface hiding, media_kit chapter layout, per-channel speed across reload — no device/emulator available
- [x] Round 25 P4 Settings search over the real settings sections (`settings_search.dart` + registry in `screen_settings.dart`, live match count, honest no-match state, 8 tests)
- [x] Round 25 P4 Download size before starting from real extractor content lengths (`download_size.dart`, "Size unknown" / "at least …" states, 12 tests) — SAF selection/start flow untouched
- [x] Round 25 P4 Watch statistics screen from real Drift history (`watch_statistics_service.dart`, `screen_watch_statistics.dart`, Settings → Watch statistics, 11 tests)
- [x] Round 25 P4 Channel-only search and channel sorting verified as already working (server-side `filter=` on every backend; Subscriptions name/recent sort) — no change needed
- [x] Round 25 P4 Playlist sharing added where it was genuinely missing: remote playlist URL share in `screen_playlist.dart`, local playlist text share in `screen_playlist_detail.dart`
- [x] Round 25 P4 Responsive grid fix: Subscriptions grids moved from fixed `crossAxisCount: 3` to `SliverGridDelegateWithMaxCrossAxisExtent(140)`
- [ ] Round 25 Device verification: settings search typing, size row against a live video, statistics screen rendering, share sheet hand-off, tablet/foldable grid — no device/emulator available
- [x] Round 23 P5 Watch-widget consolidation and code audit + 18 focused unit tests for Piped/Invidious/Explode stream helpers; live cross-backend verification not performed (no network)

## Phase 4 — Auth & Account — Auth & Account
- [x] Cookie-based login (stored locally, injected into native NewPipe downloader)
- [x] PoToken provider (WebView BotGuard port, registered with YoutubeStreamExtractor)
  - [ ] Real-device verification (no Android SDK/device in this environment)
- [x] Piped account register/login/logout + session persistence
- [x] Piped subscription pull/push sync (verified backend routes)
- [x] Piped playlists fetch (verified backend route)
- [ ] Piped user preferences sync — not supported by Piped-Backend (no endpoint)

## Phase 5 — Multi-Service Backend
- [x] PeerTube service integration (official public REST API; instance management, search/discovery, channels, details, HLS + direct MP4 playback; 20 new unit tests; live API verified on framatube.org)
- [ ] SoundCloud integration
- [ ] Bandcamp integration
- [ ] media.ccc.de integration

## Phase 6 — Plugin / Extension System
- [x] Phase 6.2 Plugin contract (manifest, capabilities, context, plugin interface, failures)
- [x] Phase 6.3 Plugin loader (registry, validation, duplicates, version compat, init/dispose, enable/disable, persistence, tests)
- [x] Phase 6.4 Extension API + sandboxing (capability-gated API, timeouts, network host allowlist, settings safety, rate limiting, tests)
- [x] Phase 6.5 Extension point registry & host integration (contributions, capability gating, duplicate rejection, unregister, tests)
- [x] Phase 6.6 Plugin permissions (grant/revoke persistence, capability filtering in loader, tests)
- [x] Phase 6.7 Plugin manager/host orchestration (lifecycle, extension API, registry delegation, tests)
- [x] Phase 6.8 Plugin management UI (overlay, info list, capabilities view)
- [x] Phase 6.9 Plugin permissions UI (settings section, per-plugin permissions screen, grant/revoke, persistence, safe reload, deny-by-default, tests) — Round 16 review-corrections: deny-by-default bug fixed in PluginPermissionServiceImpl + PluginLoaderImpl (_computeGranted enforces declared∩persisted, empty when no policy), production DI fixed in main.dart (manual PluginManager/PluginSandbox registration after configureInjection()), 38 new deny-by-default/enforcement/Apply-now/reload unit tests added across test/plugin_permission_test.dart (16), test/plugin_loader_test.dart (11 → 11) and test/plugin_manager_test.dart (4 → 11), widget smoke test stable, 12 tile/screen widget tests skipped (test-infrastructure hang, documented); flutter analyze clean, flutter test 402/402 green.
- [x] Phase 6.10 Declarative extension contributions (manifest `contributions` specs, host auto-registers on enable and removes on disable/dispose, capability-gated by the *granted* set, manifest validation + JSON round-trip, `ExtensionPoint` extracted to `plugin_contribution.dart` and re-exported, 13 tests)
- [x] Phase 6.11 Plugin contributions UI (Settings section lists every published contribution with plugin name, extension point and id; withheld contributions stay hidden by deny-by-default; tap opens that plugin's permissions screen; 3 new l10n keys in 12 locales; 5 widget tests)
- [x] Phase 6.12 Plugin menu contributions in the app bar (HomeAppBar overflow button lists published `menuItem` contributions, hidden when none/disabled, entry opens the plugin permissions screen; 1 new l10n key in 12 locales; 5 widget tests)

**Files changed this pass:** `VYPLAY_PROGRESS.md` and `PHASE_PLAN.md` (final docs only; no app logic changed).
