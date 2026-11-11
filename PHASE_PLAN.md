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
- [ ] Plugin loader architecture
- [ ] Extension API + sandboxing
