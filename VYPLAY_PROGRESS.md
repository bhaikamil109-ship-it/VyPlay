# VYPLAY_PROGRESS.md

> **Honesty contract.** This file records what was *actually* changed and *actually*
> verified. Anything that could not be executed is marked **UNVERIFIED** rather than
> claimed as done.

> **Final production-readiness pass (this mission):** the download-location feature
> was verified by reading the real UI → native → storage → download paths; only
> device/network behaviors are left UNVERIFIED. This pass changed no app logic and
> wrote updated final docs (this file and PHASE_PLAN.md); the working-tree diff
> reflects the pre-existing reports updates plus the new docs.

**Last updated:** 2026-11-13 (Final production-readiness pass)

**Environment:** Cloud Linux workspace, Flutter 3.47.1, Dart 3.13.1, JDK 17,
Android SDK present, Gradle 8.14.5 / AGP 8.13.2.

**What was verified here (automated + code):** `flutter analyze`, `flutter test`,
`./gradlew :app:testDebugUnitTest`, `flutter build apk --debug`, plus an unzip-based
APK contents inspection.

**What is UNVERIFIED here by nature:** physical Android device behavior —
SAF picker UX, real write into a chosen SAF tree / removable SD card,
restart persistence observed on a phone, real download landing in the chosen
folder, background downloads / notifications / PiP on device.

---

## Mission scope, verdict by item

### A. MediaKit audio-only — IMPLEMENTED (carried from Round 26)

- All four media_kit video-player widgets now read the existing
  `SettingsBloc.state.isAudioOnlyEnabled` seam and hide the video surface
  (via `SizedBox.shrink()` in the widget tree) when enabled, while keeping the
  media_kit player alive. When disabled, the normal video surface is shown again.
- Persistence is shared with the ExoPlayer path through
  `PlayerPreferencesService` (`audio-only-mode`) and the regenerated Freezed
  `SettingsState` (`bool? isAudioOnlyEnabled`).
- **Native gap, documented not faked:** ExoPlayer hides the surface in native
  code and sends `setAudioOnly`; the media_kit path here hides the surface on the
  Dart side. Whether it behaves identically on device is UNVERIFIED.

### B. SponsorBlock download cutting — BLOCKED (honestly)

- The mux path does **not** trim/re-encode. Skipping playback segments does **not**
  remove them from a downloaded file. No new A/V library was added and no fake
  “it is removed on playback” behavior exists.

### C. APK size — INVESTIGATED; cause identified; release build blocked on secrets

- Debug APK is ~540 MiB. Unzip inspection shows the cause is not a pub dependency
  and not app assets: it is the **native libraries bundled for every supported ABI**.
- Largest single files inside the APK:
  - `lib/arm64-v8a/libflutter.so` ~395 MiB
  - `lib/x86_64/libflutter.so` ~390 MiB
  - `lib/armeabi-v7a/libflutter.so` ~349 MiB
  - `assets/flutter_assets/kernel_blob.bin` ~94 MiB
  - `lib/arm64-v8a/libVkLayer_khronos_validation.so` ~249 MiB (Flutter engine
    layer, arm64 only)
  - `libmpv.so` per ABI (media_kit), `libsqlite3.so` per ABI, plus smaller
    `libmediakitandroidhelper.so` per ABI.
- APK contains `lib/{arm64-v8a,armeabi-v7a,x86_64}` native sets. Total `.so`
  bytes inside the APK are far larger than the APK itself because the APK is a
  compressed bundle; the practical point is that it carries **every ABI’s native
  stack at once**, which is exactly what makes the default `app-debug.apk` big.
- This is the expected shape of a Flutter debug APK that bundles the Flutter
  engine for multiple ABIs plus engine dev artifacts (`kernel_blob.bin`,
  `isolate_snapshot_data`) and an unstripped native-library packaging choice
  (`keepDebugSymbols += ["**/*.so"]`).
- **Nothing was removed from the APK this turn.** Removing one ABI from the
  debug artifact is an ABI-split/release concern, not an arbitrary deletion from
  the default debug bundle; size reduction is therefore the release/ABI-split job.

### D. Production reliability — verified where code permits

Verified on the code side (not claimed as device-verified):

- **SAF download location:** present and wired.
  - UI: `ScreenSettings` → `DownloadLocationSection` (searchable section with
    keywords “download folder”, “storage”, “sd card”, “save location”).
    (`lib/presentation/settings/screen_settings.dart`)
  - Section: `DownloadLocationSection` opens the picker via
    `SafStorageService().pickDirectory()`, persists via
    `SettingsEvent.downloadFolderChanged(path:)`, shows current folder + status
    + Re-check + Reset to default. (`lib/presentation/settings/widgets/download_location_section.dart`)
  - Native: `SafStorageHandler.kt` on channel `com.kamil.vyplay/saf` handles
    `pickDirectory` → `ACTION_OPEN_DOCUMENT_TREE`, `takePersistableUriPermission`,
    `checkDirectory` (real probe), `copyIntoTree`, `releaseDirectory`.
    (`android/app/src/main/kotlin/com/kamil/vyplay/SafStorageHandler.kt`)
  - Settings persistence: `SettingsBloc` → `settingsService.setDownloadFolderPath`
    under key `download_folder_path` (`lib/infrastructure/settings/setting_impl.dart`),
    read at init and in `DownloadImpl._customDownloadPath` from DB
    (`lib/infrastructure/download/download_impl.dart`).
  - Download path usage: `DownloadImpl._getDownloadDirectory()` → `DownloadLocationService.resolve()`
    which rejects unusable folders instead of silent fallback; finished files are
    published into a SAF tree via `_publishToSelectedTree` and deleted from staging.
    (`lib/infrastructure/download/download_impl.dart`,
    `lib/core/services/download_location_service.dart`)
  - This was verified by reading the actual paths, not assumed from backend code.
- **Foreground background-download service + notification lifecycle:** present.
  `DownloadsForegroundService.kt` (dataSync foreground service) and
  `DownloadServiceHandler.kt` on `com.kamil.vyplay/download_service`; download
  impl starts/stops around transfers.
- **WorkManager subscription scheduling + recovery:** present; `workmanager
  0.10.10`, periodic job, switch schedules/cancels it.
- **Download pause/resume/retry + restart recovery:** present in
  `DownloadImpl` (pause/resume/retry, resumeInterruptedDownloads at startup).
- **Player resume/repeat/queue/per-channel speed:** present in the codebase
  (settings + playback paths exist; per-backend behavior is network/device-verified).
- **PiP/background audio/player lifecycle:** present in code paths; device/behavior
  UNVERIFIED here.
- **Backend error handling/stream selection:** present in download impl
  (friendly error mapping, retries, storage headroom check).
- **Settings/search/playlists/watch statistics:** present; Settings search and
  watch statistics screens exist and are searchable; playlist sharing exists.

---

## Exact files changed / referenced this mission

This mission did **not** introduce new app logic files. It verified and recorded
the existing implementation. The working-tree diff this turn is dominated by the
pre-existing reports doc updates from earlier rounds plus the new docs written here.

**Verification-source files read and traced this turn (evidence):**
- `lib/presentation/settings/screen_settings.dart`
- `lib/presentation/settings/widgets/download_location_section.dart`
- `lib/core/services/saf_storage_service.dart`
- `lib/core/services/download_location_service.dart`
- `lib/domain/download/download_location.dart`
- `lib/domain/download/saf_directory.dart`
- `lib/infrastructure/settings/setting_impl.dart`
- `lib/infrastructure/download/download_impl.dart`
- `lib/application/settings/settings_bloc.dart`
- `lib/application/settings/settings_event.dart`
- `lib/application/settings/settings_state.dart`
- `android/app/src/main/kotlin/com/kamil/vyplay/SafStorageHandler.kt`
- `android/app/src/main/kotlin/com/kamil/vyplay/MainActivity.kt`
- `android/app/src/main/AndroidManifest.xml`
- `android/app/build.gradle`

**Generated / freezed / l10n files already in tree and re-read for consistency:**
- `lib/application/settings/settings_bloc.freezed.dart`
- `lib/generated/l10n.dart`
- `lib/l10n/intl_*.arb`

**Docs written/updated this turn:**
- `VYPLAY_PROGRESS.md`
- `PHASE_PLAN.md`

---

## Remaining incomplete / blockers

- **SponsorBlock download cutting:** BLOCKED. No trim/re-mux in the download mux
  path; playback skip is not file removal; no new A/V library added.
- **Release build / signed APK or AAB:** BLOCKED unless a signing keystore is
  present. There is **no** `android/app/key.jks` / `android/key.properties` (or
  other signing secret) in this workspace now. `android/app/build.gradle` already
  has the release signing config and a `hasReleaseKeystore` guard, and it refuses
  to sign a release build when the keystore is absent. I did not create, fetch, or
  write any signing secret.
- **APK size reduction (default debug APK):** not done by removing content from the
  default debug bundle this turn. The realistic lever is an ABI-split/release artifact
  path, which depends on the release signing setup above.
- **Device verification matrix:** UNVERIFIED by nature — no device/emulator here.

---

## Test / build results — real evidence

```bash
export PATH="/workspace/homes/eddf1cd858843864956f44c9/flutter/bin:$PATH"
export JAVA_HOME=$HOME/toolchain/jdk-17.0.21+9
export ANDROID_HOME=$HOME/android-sdk
export ANDROID_SDK_ROOT=$HOME/android-sdk

# Clean analysis
flutter analyze
# → No issues found! (ran in 4.8s)

# Full test suite
flutter test
# → 00:19 +552 ... 00:19 +553: All tests passed!

# Kotlin unit tests (deleted stale results dir first so it really ran)
rm -rf build/app/test-results/testDebugUnitTest
cd android && ./gradlew :app:testDebugUnitTest
# → BUILD SUCCESSFUL (exit 0); earlier runs in this repo: 10/10/0/0

# Debug APK
rm -f build/app/outputs/flutter-apk/app-debug.apk
flutter build apk --debug
# → ✓ Built build/app/outputs/flutter-apk/app-debug.apk
# → 566,935,452 bytes (540 MiB)

# APK contents inspection (unzip + find)
unzip -q -o build/app/outputs/flutter-apk/app-debug.apk -d /tmp/vyplay_apk_inspect
# Largest entries inside the APK:
#   lib/arm64-v8a/libflutter.so             ~395,309,392 bytes
#   lib/x86_64/libflutter.so                ~389,995,680 bytes
#   lib/armeabi-v7a/libflutter.so           ~348,880,820 bytes
#   lib/arm64-v8a/libVkLayer_khronos_validation.so ~248,644,248 bytes
#   assets/flutter_assets/kernel_blob.bin         ~98,675,040 bytes
#   libmpv.so per ABI; libsqlite3.so per ABI;
#   libmediakitandroidhelper.so per ABI (small)
# assets present: kernel_blob.bin, isolate_snapshot_data, fonts, media_kit hls js,
#   cupertino_icons, Montserrat, NOTICES.Z, a few small zips, po_token.html

# Attempted release APK (non-destructive check)
flutter build apk --release
# → BUILD FAILED (assembleRelease) — signing keystore absent
# → No keystore file on disk; build.gradle refuses to sign release without it
```

---

## Artifact paths and actual sizes

- Debug APK: `build/app/outputs/flutter-apk/app-debug.apk`
  - **566,935,452 bytes (540 MiB)**
- Release APK: **not produced** this turn.
  - Attempted `flutter build apk --release`; build failed because no signing
    keystore is present. No signing secret was created or requested.
- AAB: **not produced** this turn (same signing-blocker reason).

---

## Decision on the release build (no secrets)

`android/app/build.gradle` already defines:

- `signingConfigs { release { ... } }` reading `keystoreProperties['storeFile']`,
  `keyAlias`, `keyPassword`, `storePassword`;
- a `hasReleaseKeystore` guard that throws a clear message when the keystore is
  missing (`Release keystore is missing. Check android/key.properties storeFile ...`);
- `buildTypes { release { ... signingConfig signingConfigs.release ... } }`.

So the release path is wired, but it **cannot sign** without the keystore. I did
not create `android/app/key.jks` or `android/key.properties`, and I did not fetch
or write any signing secret. That is the honest blocker for a signed release APK/AAB.

---

## Device-testing checklist

**Verified here (code/automated):**
- [x] Download-location UI exists in Settings and is reachable/searchable
- [x] UI persists the choice through SettingsBloc + settings store (`download_folder_path`)
- [x] Native picker is `ACTION_OPEN_DOCUMENT_TREE` with persisted grant
- [x] Native probe uses a real write, not just `canWrite()`
- [x] Download impl reads the setting and resolves it through `DownloadLocationService.resolve()`
- [x] Unusable folder rejects the download instead of silent fallback
- [x] Finished files publish into a chosen SAF tree and staging copy is removed
- [x] SAF-aware delete in `_deleteAllFiles`
- [x] `flutter analyze` clean
- [x] `flutter test` 553/553 passed
- [x] `./gradlew :app:testDebugUnitTest` BUILD SUCCESSFUL
- [x] Debug APK builds and size recorded
- [x] APK contents inspected; size cause identified

**UNVERIFIED here (device/emulator or network required):**
- [ ] Physical SAF picker UX and which folders it shows (internal vs external/SD)
- [ ] Real write into a chosen SAF tree on device
- [ ] Removable SD-card folder behavior on device
- [ ] Restart persistence observed on a real device
- [ ] A real download actually landing inside the chosen folder on device
- [ ] Background download foreground service / notification on device
- [ ] WorkManager wake-up and notification delivery on device
- [ ] PiP, background audio, per-channel speed, audio-only surface hide behavior on device
- [ ] Live backend playback / stream selection on real network
- [ ] Shorts feed, live streams, deep links, low-storage, network-interruption behavior on device

---

## Final status

**PARTIAL.**

- **Done and verified on the automated/code side this pass:**
  - Download-location feature existence + flow traced end to end and confirmed present
    (UI → native SAF → settings persistence → download path resolution → publish).
  - APK size cause identified from the actual APK contents.
  - Clean analyze, full test suite green, Kotlin unit tests green, debug APK builds.
- **Done and verified on the automated/code side from prior rounds (carried forward):**
  - MediaKit audio-only implemented across all four media_kit video-player widgets and
    verified green on the toolchain (analyze, tests, debug APK).
- **Still open/blocked:**
  - SponsorBlock download cutting — blocked (no trim/re-mux path).
  - Signed release APK/AAB — blocked unless a signing keystore is provided; none present.
  - Default debug APK size — not reduced here; cause is multi-ABI + engine artifacts,
    not app assets; realistic next step is an ABI-split/release path gated on the signing secret.
  - Device verification matrix — blocked by no device/emulator.

---

## How to finish the remaining items

- For a signed release APK/AAB: add the real signing keystore to the project
  (location picked up from `android/key.properties` storeFile as the build.gradle
  guard describes), then run `flutter build apk --release` and/or
  `flutter build appbundle --release`. Do **not** paste keystore secrets into chat
  or into the repository; keep them out of version control.
- For smaller default install artifacts: use an ABI-split or app-bundle path once
  signing is in place; do not delete ABIs or engine artifacts from the default debug
  bundle as a workaround.
- For SponsorBlock download cutting: only revisit if a real trim/re-mux step is added
  to the download pipeline; playback skip does not satisfy this item.
- For the device matrix: run on a real Android device/emulator and a live network;
  mark each behavior verified only after observing it on the device.

**Files changed this pass:** `VYPLAY_PROGRESS.md` and `PHASE_PLAN.md` (final docs only;
no app logic changed).
