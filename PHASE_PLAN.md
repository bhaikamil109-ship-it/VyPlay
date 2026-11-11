# VyPlay Remaining Feature Phases

## Phase 1 — Player UX Polish
- [x] Pinch-to-zoom (gated by isPinchToZoomEnabled)
- [x] Screen lock (gated by isScreenLockEnabled)
- [ ] Seekbar preview thumbnails (media_kit screenshot on drag) — deferred (no arbitrary frame API)
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
- [ ] SB exclusive marker (isSbExclusiveMarkerEnabled) — blocked (needs SB segment filtering rules)

## Phase 4 — Auth & Account
- [ ] Cookie-based login
- [ ] PoToken / local streams extraction
- [ ] Piped account login + cross-device sync

## Phase 5 — Multi-Service Backend
- [ ] PeerTube service integration
- [ ] SoundCloud integration
- [ ] Bandcamp integration
- [ ] media.ccc.de integration

## Phase 6 — Plugin / Extension System
- [ ] Plugin loader architecture
- [ ] Extension API + sandboxing
