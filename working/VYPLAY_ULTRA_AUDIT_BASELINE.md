# VyPlay — Ultra Audit Baseline (Phase 0)

Date: 2026-11-19
Repository: `bhaikamil109-ship-it/VyPlay`

## Repository state before any edit

| Item | Value |
|---|---|
| Local branch | `freebuff/74a6f198693946e38e4cea9b` |
| Local HEAD | `5dea4b8b53c9918971040417cc03248143021a50` — "Fix missing AppDatabase dependency registration" |
| Remote `main` (fetched, before work) | `5dea4b8b53c9918971040417cc03248143021a50` (identical — no unexpected advance) |
| Remote parent history | `1584fea` → `5c0b943` → `54d6143` |
| Application ID | `com.vyplay.app` (`android/app/build.gradle:75`) |
| Version | `0.9.3+14` (`pubspec.yaml:5`) |
| minSdk / targetSdk | `24` / `35` (`android/app/build.gradle:82`, `:84`) |
| Kotlin | `2.4.10` (`android/build.gradle:2`) |
| jvmTarget | `17` (`android/app/build.gradle:67`) |
| Flutter / Dart | `3.47.1` stable / `Dart 3.13.1` |
| Workflows | `.github/workflows/flutter-ci.yml` (push→main, PR→main, workflow_dispatch), `.github/workflows/android-draft-release.yml` (push→main, workflow_dispatch) |

## Working tree before work (preserved, untouched by this audit's commits)

Modified (pre-existing diagnostic / startup work, **not committed here**):

```
 M lib/application/settings/settings_bloc.dart
 M lib/core/player/global_player_controller.dart
 M lib/core/services/startup_diagnostics.dart
 M lib/main.dart
 M lib/presentation/watch/widgets/global_pip_overlay.dart
```

Untracked (pre-existing, left alone):

```
?? VyPlay-diagnostic-armeabi-v7a-debug.apk
?? flutter/                       (local Flutter SDK, not project source)
?? flutter_linux_3.47.1-stable.tar.xz
?? lib/presentation/diagnostics/
?? vyplay_*.md (5 earlier reports)
```

These uncommitted startup changes are the grey-screen work: they are preserved verbatim
and deliberately excluded from every commit made in this pass.

## Native / dependency inventory (relevant)

- `com.github.teamnewpipe:newpipeextractor:v0.26.5` (`android/app/build.gradle:167`)
- Media3 `1.4.1` — exoplayer, dash, hls, ui, cast (`:188-198`)
- Vendored NewPipe stream writers: `android/app/src/main/java/org/schabi/newpipe/streams/`
  (`Mp4DashReader`, `Mp4FromDashWriter`, `WebMReader`, `WebMWriter`, `OggFromWebMWriter`, `io/SharpStream`)
- `ffmpeg_kit_flutter_new` is **not** a dependency (removed; see `pubspec.yaml:66-68` comment)
- Playback stack: `media_kit 1.1.10` / `media_kit_video 1.2.4` (Dart) **and** a native Media3 path

## Backend inventory verified against live endpoints (2026-11-19)

| Backend | Default configured value | Live result |
|---|---|---|
| Piped | `https://api.piped.private.coffee/` (`lib/core/strings.dart:3`) | `200` for `/streams/<id>` and `/trending` |
| Invidious | `https://inv.nadeko.net` (`lib/core/strings.dart:4`) | **`403`** for `/api/v1/videos/<id>` |
| NewPipe (default service) | in-app extractor, `SettingsState.initialize()` sets `ytService: YouTubeServices.newpipe.name` (`lib/application/settings/settings_state.dart:138`) | not reachable from CI sandbox (Android-only extractor) |
| Explode | `youtube_explode_dart` | not exercised |

`pipedapi.kavin.rocks` (a commonly cited fallback) returned `522` — not configured in the app.

## Baseline conclusion

The repository was clean of unexpected remote movement. All work below is additive on
`5dea4b8`, on top of the preserved uncommitted startup work.
