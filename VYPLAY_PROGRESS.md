# VYPLAY_PROGRESS.md

> **Honesty contract.** This file records what was *actually* changed and
> *actually* verified. Anything that could not be executed is marked
> **UNVERIFIED** rather than claimed as done.

**Last updated:** 2026-11-04 (Round 7)
**Environment:** GitHub Actions (ubuntu-26.04), Flutter 3.47.1, Dart 3.13.1, JDK 17
**Verification available in CI:** `flutter analyze`, `flutter test`, `flutter build apk`
**Verification NOT available:** physical Android device, real YouTube network calls, iOS/macOS/Windows builds, Play Store submission.

---

## Round 7 — APK build green, APKs published (2026-11-04)

**Scope:** make `flutter build apk` actually produce an APK in CI.

### What was broken

| # | Finding | Fix |
|---|---|---|
| 1 | **`Gradle build failed to produce an .apk file`.** `android/app/build.gradle` had a Gradle `splits { abi { … universalApk false } }` block. With it, AGP emits only `app-arm64-v8a-<type>.apk` and `app-armeabi-v7a-<type>.apk` — there is no `app-<type>.apk`. The flutter tool looks for that default name in `build/app/outputs/flutter-apk/` and fails the whole build when it is absent, even though Gradle itself succeeded (it ran 595 s). | Removed the `splits` block. Per-ABI output is now requested with Flutter's own `flutter build apk --split-per-abi`, which writes the exact names and locations the tool then looks for. |
| 2 | `disable-abi-filtering=true` in `android/gradle.properties` only existed to stop the Flutter plugin writing `ndk.abiFilters` next to the now-removed `splits` block. | Removed it, so the plugin's default ABI filters apply again. |
| 3 | Gradle heap was `4096m` plus `2048m` for the Kotlin daemon — 6 GB of a 7 GB runner before Jetifier or the Dart toolchain took anything. | Lowered to `3072m` + `1536m`. |

### Verified from the Actions API

| Workflow | Run | Result |
|---|---|---|
| Flutter CI | [41840704486](https://github.com/bhaikamil109-ship-it/VyPlay./actions/runs/41840704486) | **success** — analyze clean, 195/195 tests pass, `Build debug APK` success, APK uploaded |
| Android APK Build & Release | [41840704491](https://github.com/bhaikamil109-ship-it/VyPlay./actions/runs/41840704491) | **success** — release build success, release published |

Release: **`v0.9.3-14-run-18`**, three assets attached:

| APK | Size |
|---|---|
| `app-arm64-v8a-release.apk` | 84.2 MB |
| `app-armeabi-v7a-release.apk` | 103.7 MB |
| `app-x86_64-release.apk` | 86.4 MB |

Signing: **debug keystore** (no `ANDROID_*` secrets configured) — installable for testing, not eligible for Google Play.

---

## Round 6 — disk-space fix (2026-11-04)

| # | Finding | Fix |
|---|---|---|
| 1 | The runner ran out of disk. The NDK (~2.5 GB) plus merged native libraries for FFmpeg, mpv and Flutter filled the volume. | Added a **Free disk space** step to both workflows that removes the pre-installed emulator, system images, .NET, GHC, CodeQL and Boost toolchains (~20 GB). 15 GB → 22 GB free. |

---

## Round 5 — manifest merger conflict (2026-11-04)

| # | Finding | Fix |
|---|---|---|
| 1 | **`flutter-ci.yml` failed at `:app:processDebugMainManifest`.** The main manifest declares `READ_EXTERNAL_STORAGE` with `maxSdkVersion="28"`; the `open_filex` plugin declares the same permission with `maxSdkVersion="32"`. The merger refuses two values for one attribute. | Added `xmlns:tools` and `tools:replace="android:maxSdkVersion"` to both storage permission elements. |
| 2 | **`android-draft-release.yml` aborted** with `Missing Android signing secrets.` before building anything. | Rewritten: real keystore when the secrets exist, generated throwaway debug keystore when they do not. |
| 3 | Release title said **FluxTube**. | Changed to **VyPlay**. |
| 4 | `actions/checkout@v4`, `actions/setup-java@v4` emitted Node 20 deprecation warnings. | Bumped to `@v5`. |
| 5 | `flutter.version` said **3.24.4** while README and both workflows pin **3.47.1**. | Set to **3.47.1**. |

---

## `minSdk` — deliberately unchanged

`minSdkVersion` is **24** (Android 7.0), stated in `android/app/build.gradle`. It is the floor
`ffmpeg_kit_flutter_new` requires — its native libraries are built against API 24, so anything
lower fails at link time. It has not been changed in any round and must not be lowered.

---

## Phase-by-phase status (verified against the code, 2026-11-04)

| Phase | Status | Notes |
|---|---|---|
| 1 — Branding & identity | ✅ 100% | `android:label="VyPlay"`, adaptive icon (`mipmap-anydpi-v26` + foreground/background), splash, `app_info.dart` URL fixed, README rebranded. |
| 2 — UI/UX redesign | ✅ 100% | Dark/OLED themes, brand colour, key-based tab resolution, Home/Shorts/Trending/Subscriptions/Library/Downloads/Settings. |
| 3 — Backends | ✅ 100% | NewPipe, Piped, Invidious, Explode with switching, instance checks and fallback. |
| 4 — Shorts | 🟡 90% | Dedicated tab, feed screen, `/shorts` channel-tab source, retry/backoff (unit-tested). Live endpoint behaviour still UNVERIFIED — CI has no network access to YouTube. |
| 5 — Download quality & FFmpeg merge | ✅ 100% (code) | `ffmpeg_kit_flutter_new`, `ffmpeg_muxer.dart`, MP4/MKV container selection, `MediaMuxerHandler.kt` removed. Command building and failure paths unit-tested. Runtime merge UNVERIFIED. |
| 6 — Download manager & storage | ✅ 100% (code) | Queue cap 2, storage pre-check, custom folder, SD card, MediaStore. Device behaviour UNVERIFIED. |
| 7 — Player | ✅ 100% (code) | media_kit + native ExoPlayer, speed, 5 fit modes, PiP, background play, live. Queue/seek/bounds logic unit-tested. Device behaviour UNVERIFIED. |
| 8 — Library, profiles, backup | ✅ 100% (code) | Subscriptions, Watch Later, history, multi-profile separation, NewPipe-compatible ZIP import/export. Envelope and corrupt-input paths unit-tested. |
| 9 — Integrations & localisation | ✅ 100% | SponsorBlock, like/dislike, comments, deep links (watch/youtu.be/shorts/channel/@handle + share intent), region, **12 locales** with a complete key set. |
| 10 — Testing & release | 🟢 97% | `flutter analyze` clean, 195/195 tests pass, **CI green**, **release workflow green**, three APKs published. Remaining: device matrix, god-file splits, real release keystore. |

---

## Remaining work, in priority order

| # | Item | Phase | Why it matters |
|---|---|---|---|
| 1 | Verify Shorts feed against live backends | 4 | Feed shell and retry logic exist; endpoint behaviour unverified |
| 2 | Split god files | 10 | `screen_shorts.dart` 2,288 lines, `download_impl.dart` ~1,700, `exoplayer_video_player.dart` ~1,500 |
| 3 | De-duplicate comment widgets | 10 | Three near-identical copies, ~4,000 lines |
| 4 | Device verification matrix | 10 | All backends, qualities, PiP, SponsorBlock, deep links, live, low-storage, network interruption |
| 5 | Real release keystore | 10 | Add `ANDROID_KEYSTORE_BASE64` + friends as repository secrets to sign with the real key instead of the generated debug one |

### Closed (were listed as open, are actually done)

- ~~"234 missing l10n keys × 10 locales"~~ — **stale.** All 12 locales carry a complete key set.
- ~~"12th language"~~ — **done.** `intl_hi.arb` exists; 12 locales total.
- ~~"Delete dead `shorts_grid_section.dart`"~~ — **done.** File removed, nothing references it.
- ~~"`targetSdk` 34 → 35+"~~ — **done.** `targetSdkVersion 35`.
- ~~"Reconcile Flutter version"~~ — **done.** `flutter.version` = 3.47.1.
- ~~"APK build never completes"~~ — **done.** Green in both workflows; three APKs published.

---

## Commands that were actually run

```
flutter pub get              # resolved
flutter analyze              # No issues found!
flutter test                 # 195 tests, all passed
flutter build apk --debug    # green in GitHub Actions (Flutter CI)
flutter build apk --release --split-per-abi   # green in GitHub Actions (release workflow)
```

## Commands that were NOT run (and why)

| Command | Reason |
|---|---|
| `flutter run` on device | No Android device or emulator available |
| iOS / macOS / Windows builds | Not available on Linux |
| Real download + mux test | Requires a device and live YouTube streams |
