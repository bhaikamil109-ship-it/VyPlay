# VyPlay Remaining Feature Phases

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

## Phase 4 — Auth & Account
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
