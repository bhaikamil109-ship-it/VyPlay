# VyPlay — Full Project Analysis & Comparison

Date: 2026-11-11
Repo: `bhaikamil109-ship-it/VyPlay`
Stack: Flutter 3.47 / Dart 3.13, Clean Architecture + BLoC + Freezed + Drift.

## Current Health

| Check | Result |
|---|---|
| `flutter analyze` | No issues found |
| `flutter test` | 298/298 passed |
| `build_runner` | 220 outputs, no errors |
| Android build | Not run locally (no Android SDK); CI builds on push |
| Working tree | Clean, pushed to `main` |

## Implemented Feature Areas

- YouTube via NewPipe, Piped, Invidious, Explode extractors.
- Search, home feed, subscriptions, groups, channel, playlist, history, saved videos.
- Watch screen, comments, related, captions, playback speed, queue, PiP, mini player.
- Downloads (video/audio/subtitle), download queue, Wi-Fi-only, auto-delete.
- SponsorBlock categories, Return YouTube Dislike, DeArrow titles/thumbnails.
- Sleep timer, swipe gestures, content filtering, restricted mode, profiles.
- Phase 18 settings UI (14 toggles) + runtime wiring for:
  original titles, comment keyword filtering, long-press speed-up,
  screen lock, pinch-to-zoom.
- Settings backup/restore (zip/json), local profiles, theme modes.

## Reference Comparison

### NewPipe (Java/Kotlin)
Strengths we do not fully match:
- Multi-service backend: YouTube, PeerTube, SoundCloud, Bandcamp, media.ccc.de.
- Popup player with remembered size/position.
- Seekbar preview thumbnails (low/high quality).
- Playback resume, playback state lists, stream notifications.
- Dedicated download manager with retry/queue limits, SAF storage.
- External player integration, Kodi, playback pitch/skip silence.
- Granular feed/channel tab controls, tablet mode, list/grid modes.

### PipePipe (NewPipe fork)
Adds over NewPipe:
- SponsorBlock for YouTube and BiliBili.
- Return YouTube Dislike.
- Original (non-localized) titles.
- Cookie login for restricted/premium content.
- Live chat rendered as danmaku overlay.
- AV1/VP9 codec support.
- Music player / background playback.
- Advanced search filters, keyword/channel filters, shorts/paid blocking.
- Plugin system (community service plugins).
- Playlist batch download and local playlist sorting/search.

### LibreTube (Kotlin, Piped backend)
Adds:
- Piped account login, subscriptions sync, watch history sync.
- DeArrow, SponsorBlock, RYD.
- Audio-only mode, background playback, Android Auto style controls.
- Rich caption rendering, caption styles.
- Sync server (LibreTube sync / custom).
- Feed filters, channel groups, playback resume.
- Double-tap seek customization, fullscreen gestures, player resize modes.

## Gap Matrix

| Capability | VyPlay | NewPipe | PipePipe | LibreTube |
|---|---|---|---|---|
| YouTube playback | Yes | Yes | Yes | Yes |
| Piped / Invidious / Explode | Yes | No | No | Piped |
| PeerTube / SoundCloud / Bandcamp / CCC | UI only | Yes | Partial | No |
| SponsorBlock | Yes | Yes | Yes (YT+Bili) | Yes |
| DeArrow | Yes | No | Partial | Yes |
| RYD | Yes | No | Yes | Yes |
| Cookie login / PoToken | Cookie paste | Partial | Yes | No |
| Piped account + sync | No | No | No | Yes |
| Live chat / danmaku | No | No | Yes | No |
| Plugin system | No | No | Yes | No |
| Seekbar thumbnails | No | Yes | Yes | No |
| Popup player | PiP only | Yes | Yes | Yes |
| Bluetooth seek | Toggle only | Yes | Yes | Yes |
| Multi-select lists | Yes (saved) | Partial | Yes | Yes |
| Preferred audio quality | Toggle only | Yes | Yes | Yes |
| SB manual times / downloads | No | Partial | Yes | Partial |
| Background playback | Yes | Yes | Yes | Yes |
| Downloads | Yes | Yes | Yes | Yes |
| Profiles | Yes | No | No | No |

## Phase Status

### Phase 1 — Player UX
- Done: pinch-to-zoom, screen lock, PiP/popup via existing `isPipDisabled`.
- Missing: seekbar preview thumbnails (needs frame extraction pipeline).

### Phase 2 — Content & Comments
- Done: original titles, comment keyword filtering.
- Missing: SB manual start/end UI, SB applied to downloads, live chat/danmaku.

### Phase 3 — Audio & Downloads
- Done: multi-select batch delete in saved screen.
- Missing: preferred audio quality in track selection, Bluetooth seek gating,
  SB exclusive marker.

### Phase 4 — Auth & Account
- Missing: cookie login, PoToken/local streams, Piped account sync.

### Phase 5 — Multi-Service Backend
- Missing: PeerTube, SoundCloud, Bandcamp, media.ccc.de runtime backends.
  Current service switch is UI-only.

### Phase 6 — Plugin System
- Missing entirely: plugin loader, extension API, sandboxing.

## Architectural Blockers

1. **Multi-service backends** need extractor adapters and domain models per service;
   current extractor layer is YouTube/Piped/Invidious/Explode specific.
2. **Cookie login + PoToken** need native WebView/cookie bridge and signature
   deciphering; not possible purely in Flutter/Dart.
3. **SB applied to downloads** needs media remux/cut; the project intentionally
   removed FFmpeg, so this needs the native NewPipe muxer to support cuts or a
   new native module.
4. **Live chat/danmaku** needs a live-chat polling/streaming client plus an
   overlay renderer and conflict handling with player controls.
5. **Plugin system** needs a stable extension contract, isolated execution, and
   security review; cannot be bolted on safely in one pass.
6. **Seekbar thumbnails** need per-position frame extraction; `media_kit`
   only exposes the current frame screenshot, so a thumbnail cache/tile pipeline
   is required.

## Recommendation

Ship Phase 1–3 remaining items in small PRs (seekbar thumbnails, preferred audio
quality, Bluetooth seek gating, SB manual times). Treat Phase 4–6 as separate
projects with native support and their own test plans. Attempting all at once
would destabilize the 298-test baseline and the download/player pipeline.
