# Latest mission checkpoint — 2026-11-21 (Phase 5–6 continuation)

**Continuation rule:** The user confirmed Phases 3–4 were already completed. They were not restarted or re-implemented in this continuation.

**Scope completed in this continuation:** profile-aware Saved/Subscriptions state isolation, serialized library/subscription mutations, Shorts player lifecycle cleanup and retry-state recovery, plus focused race regression coverage.

## Source changes

- `a6a0bea1` — release inactive Shorts players and restore failed retry state.
- `fc3e1aff` — serialize saved and subscription batch mutations; add profile async-state regressions.
- `400f81f8` — format only the four Dart files touched by this mission (no behaviour change).
- `55701970` — add a deterministic regression for two concurrent subscription adds, asserting persistence and BLoC state remain in event order.

**Current source checkpoint:** `main` at `55701970aeafe8791b1bd2f75c3089e5b6679d80`.

## Automated verification — PASSED

**Deep QA run #54:** [GitHub Actions run 44838541680](https://github.com/bhaikamil109-ship-it/VyPlay/actions/runs/44838541680) — completed successfully on `55701970`.

- Mission-scope Dart formatting: passed; four relevant files checked, zero changes required.
- `flutter analyze --no-fatal-infos`: passed, “No issues found”.
- Flutter unit/widget tests: **602/602 passed**.
- Android native unit tests: `BUILD SUCCESSFUL`.
- Android arm64 debug APK: built successfully.
- APK identity/version verification: passed — `com.kamil.vyplay`, version name `0.1.0`, version code `1`.

**Flutter CI:** [run 44838541816](https://github.com/bhaikamil109-ship-it/VyPlay/actions/runs/44838541816) — completed successfully, including the 602-test suite.

**Separate release-test APK pipeline:** [run 44838541729](https://github.com/bhaikamil109-ship-it/VyPlay/actions/runs/44838541729) — universal release APK build and save succeeded; ABI-split packaging was still running when this checkpoint was written. This workflow uses a temporary test keystore and is not a permanent production signing setup.

## Scope and acceptance limits

- A whole-repository formatter audit found 234 legacy Dart files needing formatting. Those unrelated files were deliberately not mass-reformatted; the corrected CI gate validates the mission-touched files rather than generating a broad unrelated diff.
- No physical Android device/emulator was connected. Installation and real-device interaction (Shorts swipe/player handoff, profile switching UI, notifications, background playback/downloads and live backend/network behaviour) remain **UNVERIFIED**.
- Permanent release signing remains deferred. A temporary-key test APK is not an official production release and must not be presented as a trusted update package.
- The automated code/CI/Android debug-build gates for this interrupted Phase 5–6 continuation are green. Do not claim physical-device or permanent-release acceptance until those separate checks are completed.

**Checkpoint verdict:** automated continuation gates PASSED; physical-device acceptance and permanent release signing remain separate external gates. Preserve this checkpoint and proceed to the next mission phase only after deciding the remaining device/signing acceptance path with the user.


# Phase 2 — Core UI & Navigation (VyPlay mission)

**Implementation:** COMPLETE for the agreed Phase 2 navigation scope.
**Automated verification:** Flutter CI passed on commit `20dc7408e37d96be39c2b692cf5d4a6a41e51917` (Flutter analyze + all 571 tests). The nine new navigation/localization tests passed.
**Final QA:** rerun pending on commit `42ad410aab17fb21c8aa7ee862ca7290fea03d26` after correcting the QA workflow's Gradle invocation. Previous QA attempt passed formatting, analyze and all 571 Flutter tests, then failed because the repository has no checked-in `android/gradlew` wrapper script. The workflow now provisions Gradle 8.14.5 and invokes Gradle directly; native test and arm64 APK checks are pending rerun.
**Android APK:** release build for the earlier commit remains in progress; latest commit's build is queued/running. No APK artifact has been confirmed yet.
**Physical-device acceptance:** NOT VERIFIED. No Android device/emulator session is connected to this workflow.

### Implemented
- Replaced the previous navigation bar with five compact primary destinations: Home, Shorts, Subscriptions, Library and More.
- Kept Trending (where supported), Downloads and Settings accessible from the More hub; Trending is hidden for the NewPipe backend.
- Introduced stable page keys and backend-aware page/index mapping so conditional Trending visibility does not shift a user's selected destination.
- Added a separate navigation request notifier so repeated navigation requests to the already-selected Home index still trigger routing.
- Wired notification/deep-link navigation to Downloads and its optional inner tab.
- Added Back behavior: secondary page opened from More returns to More; other secondary tabs return to Home; Home retains the existing PiP/exit handling.
- Localized the More label for all 12 shipped locales, with a safe fallback.
- Added nine unit tests covering compact destinations, all page keys, NewPipe Trending visibility, selected destination mapping, index stability and localization.

### Remaining acceptance checks
- [ ] Latest Deep QA passes (format, analyze, 571+ Flutter tests, Kotlin native tests, arm64 debug APK and package/version verification).
- [ ] Latest Android APK workflow completes and uploads its temporary-key test artifact (no public Release; permanent signing key intentionally deferred until project completion).
- [ ] Physical-device visual/interaction check: five-tab bar, More destinations, backend switch with Trending, notification-to-Downloads navigation, Back behavior, rotation and small-screen layout.

**Verdict:** Phase 2 implementation is complete; do not label the overall phase 100% accepted until the latest Android QA/build gates and the physical-device acceptance checks above pass.

---

# Current VyPlay mission status — 2026-11-20

## Phase 1 — App Branding & Identity

**Implementation state:** first implementation committed; validation is pending. Phase 1 is not passed until Flutter/Android CI and required device checks have been reviewed.

- App display name: already consistently `VyPlay` in Android manifest and `AppInfo`.
- Approved mark: silver V/play symbol on black; no wordmark under the icon and no purple in the launcher identity.
- Launcher: adaptive foreground, black adaptive background, Android 13 monochrome layer, and legacy API 24–25 launcher resource use the same mark.
- Splash: black background with the silver mark on pre-Android 12 and Android 12+ splash resources.
- Notifications: dedicated white monochrome glyph is used by Dart download notifications, subscription notifications and native foreground-download service.
- Android install identity: Gradle `applicationId` is `com.kamil.vyplay`; namespace and Kotlin package remain `com.kamil.vyplay`.
- Legal provenance: existing FluxTube and NewPipe Extractor GPL attribution in `lib/core/app_info.dart` is intentionally retained.
- **Migration warning:** changing from `com.fazilvk.fluxtube` to `com.kamil.vyplay` creates a separate Android app identity. Android will not automatically transfer the old app's private data into the new package; the old install can remain alongside it. The user previously approved the new ID.
- **UNVERIFIED:** `flutter analyze`, `flutter test`, Gradle resource linking, APK build, launcher rendering on Android 8–15, notification appearance and splash rendering on physical devices. This execution environment exposes no Flutter/Android build toolchain or attached device.

Phase 1 remains **IN PROGRESS** pending CI/build/device evidence.

---

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
