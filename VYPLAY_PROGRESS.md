# VYPLAY_PROGRESS.md

> **Honesty contract.** This file records what was *actually* changed and
> *actually* verified. Anything that could not be executed is marked
> **UNVERIFIED** rather than claimed as done.

**Last updated:** 2026-11-04 (Round 5)
**Environment:** GitHub Actions (ubuntu-latest), Flutter 3.47.1, Dart 3.13.1, JDK 17
**Verification available in CI:** `flutter analyze`, `flutter test`, `flutter build apk`
**Verification NOT available:** physical Android device, real YouTube network calls, iOS/macOS/Windows builds, Play Store submission.

---

## Round 5 — CI build fix + release pipeline (2026-11-04)

**Scope:** make the GitHub Actions APK build actually go green and publish APKs.

### What was broken

| # | Finding | Fix |
|---|---|---|
| 1 | **`flutter-ci.yml` failed at `:app:processDebugMainManifest`.** `android/app/src/main/AndroidManifest.xml` declares `READ_EXTERNAL_STORAGE` with `android:maxSdkVersion="28"`, but the `open_filex` plugin declares the same permission with `maxSdkVersion="32"`. The manifest merger refuses two different values for one attribute. | Added `xmlns:tools` and `tools:replace="android:maxSdkVersion"` to the `READ_EXTERNAL_STORAGE` and `WRITE_EXTERNAL_STORAGE` elements in the main manifest. |
| 2 | **`android-draft-release.yml` failed at "Restore Android signing files"** with `Missing Android signing secrets.` The repository has **zero** secrets configured, so the release job aborted before it ever built anything. | Rewrote the workflow: when the `ANDROID_*` secrets are present it signs with the real release keystore; when they are absent it generates a throwaway debug keystore so the build still runs and produces installable APKs. |
| 3 | Release title still said **"FluxTube"**. | Changed to **"VyPlay"**. |
| 4 | `actions/checkout@v4` and `actions/setup-java@v4` emit Node 20 deprecation warnings. | Bumped to `@v5`. |
| 5 | `flutter.version` said **3.24.4** while the README and both workflows pin **3.47.1**. | Set `flutter.version` to **3.47.1**. |

### `minSdk`

`minSdkVersion` stays at **24** (Android 7.0). It is the floor `ffmpeg_kit_flutter_new` requires and was deliberately not changed.

### Result

Both workflows now run to completion on `main`, and the release workflow attaches the per-ABI APKs to a GitHub Release.

---

## Phase-by-phase status (verified against the code, 2026-11-04)

| Phase | Status | Notes |
|---|---|---|
| 1 — Branding & identity | ✅ 100% | `android:label="VyPlay"`, adaptive icon, splash, `app_info.dart` URL fixed, README rebranded. |
| 2 — UI/UX redesign | ✅ 100% | Dark/OLED themes, brand colour, key-based tab resolution, Home/Shorts/Trending/Subscriptions/Library/Downloads/Settings. |
| 3 — Backends | ✅ 100% | NewPipe, Piped, Invidious, Explode with switching, instance checks and fallback. |
| 4 — Shorts | 🟡 90% | Dedicated tab, feed screen, `/shorts` channel-tab source, retry/backoff. Live endpoint behaviour still UNVERIFIED (no network in CI). |
| 5 — Download quality & FFmpeg merge | ✅ 100% (code) | `ffmpeg_kit_flutter_new`, `ffmpeg_muxer.dart`, MP4/MKV container selection, `MediaMuxerHandler.kt` removed. Runtime merge UNVERIFIED. |
| 6 — Download manager & storage | ✅ 100% (code) | Queue cap 2, storage pre-check, custom folder, SD card, MediaStore. Device behaviour UNVERIFIED. |
| 7 — Player | ✅ 100% (code) | media_kit + native ExoPlayer, speed, 5 fit modes, PiP, background play, live. Device behaviour UNVERIFIED. |
| 8 — Library, profiles, backup | ✅ 100% (code) | Subscriptions, Watch Later, history, multi-profile separation, NewPipe-compatible ZIP import/export. |
| 9 — Integrations & localisation | ✅ 100% | SponsorBlock, like/dislike, comments, deep links, region, **12 locales × 295 keys**. |
| 10 — Testing & release | 🟡 95% | `flutter analyze` clean, 195 tests pass, CI + release workflows green. Device matrix UNVERIFIED. |

---

## Remaining work, in priority order

| # | Item | Phase | Why it matters |
|---|---|---|---|
| 1 | Verify Shorts feed against live backends | 4 | Feed shell exists; endpoint behaviour unverified |
| 2 | Split god files | 10 | `screen_shorts.dart` 2,288 lines, `download_impl.dart` ~1,500, `exoplayer_video_player.dart` ~1,500 |
| 3 | De-duplicate comment widgets | 10 | Three near-identical copies, ~4,000 lines |
| 4 | Device verification matrix | 10 | All backends, qualities, PiP, SponsorBlock, deep links, live, low-storage, network interruption |
| 5 | Real release keystore | 10 | Add `ANDROID_KEYSTORE_BASE64` + friends as repository secrets to sign with the real key |

### Closed since the last audit (were listed as open, are actually done)

- ~~"234 missing l10n keys × 10 locales"~~ — **stale.** All 12 locales carry the full 295-key set.
- ~~"12th language"~~ — **done.** `intl_hi.arb` exists; 12 locales total.
- ~~"Delete dead `shorts_grid_section.dart`"~~ — **done.** File removed, nothing references it.
- ~~"`targetSdk` 34 → 35+"~~ — **done.** `targetSdkVersion 35`.
- ~~"Reconcile Flutter version"~~ — **done.** `flutter.version` now 3.47.1.

---

## Commands that were actually run

```
flutter pub get             # resolved
flutter analyze             # No issues found!
flutter test                # 195 tests, all passed
flutter build apk --debug   # green in GitHub Actions (Flutter CI)
flutter build apk --release # green in GitHub Actions (Android APK Build & Release)
```

## Commands that were NOT run (and why)

| Command | Reason |
|---|---|
| `flutter run` on device | No Android device or emulator available |
| iOS / macOS / Windows builds | Not available on Linux |
| Real download + mux test | Requires a device and live YouTube streams |
