# VyPlay — Phase 0 Project Audit & Baseline

**Audit date:** 2026-11-20  
**Repository:** bhaikamil109-ship-it/VyPlay  
**Audited ref:** main  
**Audited HEAD:** b4aeaebbf4051bb59b981a15897ac17ce30dcf17  
**Latest commit title:** Harden playback diagnostics and release safety (2026-11-19 18:32:50 UTC)  
**Audit type:** read-only source/repository audit; this file is the only change made by the Phase 0 audit.

## 1. Phase 0 verdict

**PHASE 0 — PROJECT AUDIT & BASELINE: COMPLETE (100%).**

The current default branch, repository access, architecture, major dependencies, application identity, backend configuration, feature inventory, known defects, CI workflow configuration, and latest available build/test evidence have been inspected and recorded. Unknowns are explicitly labelled; this completion does not claim that the current HEAD has been freshly built, tested, or installed on a device.

Phase 0 is an audit/documentation phase. No app source, native implementation, dependency, application data, signing secret, or release configuration was changed.

## 2. Repository and branch baseline

| Item | Observed value |
|---|---|
| Repository | bhaikamil109-ship-it/VyPlay |
| Visibility / archived | Public / not archived |
| Default branch | main |
| Main HEAD | b4aeaebbf4051bb59b981a15897ac17ce30dcf17 |
| Repository size reported by GitHub | 12,532 KB |
| Linked GitHub permission | Admin, maintain, push and pull available |
| Other mission branch | mission/phase-0-10 exists |
| Branch comparison | GitHub compare reported a 52-commit difference/behind count; the two refs must not be treated as interchangeable |

**Baseline decision:** main is used for this audit because it is the repository default branch and its latest commit is newer than the earlier mission branch snapshot. No merge, branch switch, rebase, or source edit was performed. The mission/phase-0-10 branch was not modified.

The repository contains older audit/phase documents based on earlier snapshots, including baseline commit 5dea4b8. They are historical evidence, not a substitute for checking the current source. For example, the old report records applicationId com.vyplay.app, while current main's Gradle file now declares com.fazilvk.fluxtube.

## 3. Application identity and Android baseline

| Item | Current source evidence | Result |
|---|---|---|
| Product name | VyPlay in pubspec, AppInfo and Android manifest label | Consistent |
| Android namespace | com.kamil.vyplay | Matches the native Kotlin package namespace |
| Android applicationId | com.fazilvk.fluxtube | **Mismatch with the user's confirmed target com.kamil.vyplay** |
| Version | 0.9.3+14 in pubspec.yaml | Current source value |
| minSdk / targetSdk | 24 / 35 | Source configured |
| Java target | 17 | Source configured |
| Android Gradle Plugin | 8.13.2 | Source configured |
| Gradle wrapper | 8.14.5 | Source configured |
| Kotlin plugin | 2.4.10 | Source configured |
| Android app label | VyPlay | Verified in AndroidManifest.xml |

**Important identity risk:** changing applicationId changes Android's package/install identity. Before applying the requested com.kamil.vyplay value in a later phase, the upgrade/data-continuity path from installations using com.fazilvk.fluxtube must be planned. Namespace and applicationId are not the same field.

The central AppInfo declares VyPlay, the VyPlay repository URL and description. It also retains FluxTube and NewPipe Extractor upstream credits. Those attribution entries must remain; the repository describes VyPlay as a GPLv3 derivative of FluxTube.

## 4. Architecture and dependency map

The repository is an existing Flutter/Dart application, not a Kotlin-only project and not a blank rebuild.

| Layer / area | Evidence found | Role |
|---|---|---|
| Presentation | lib/presentation/; route, home, search, watch and navigation screens | UI and navigation |
| Application | lib/application/; SearchBloc, WatchBloc, SettingsBloc, SavedBloc, SubscribeBloc and other BLoCs | State and use-case orchestration |
| Domain | lib/domain/ | Service/repository contracts and domain models |
| Infrastructure | lib/infrastructure/ | Backend implementations, persistence and download implementations |
| Core | lib/core/ | DI, settings, player controllers and shared services |
| Dependency injection | GetIt + injectable; AppDatabase registered before generated initialization | Service graph |
| Local persistence | Drift/SQLite packages and AppDatabase singleton | Local settings/history/library persistence |
| Routing | go_router | Application route handling |

The root app entry wires multiple BLoCs and starts persisted startup restoration after the first frame. The existing Clean Architecture / BLoC / GetIt-injectable design is therefore present and must be preserved. No rewrite or architecture migration is justified by this audit.

### Key dependencies in current pubspec.yaml

- flutter_bloc 9.1.1
- get_it 9.2.0
- injectable 2.4.2
- go_router 17.0.1
- drift 2.22.1, drift_flutter 0.2.4, sqlite3_flutter_libs 0.5.28
- dio 5.4.3+1
- youtube_explode_dart 3.0.5
- media_kit 1.1.10, media_kit_video 1.2.4, media_kit_libs_video 1.0.4
- audio_service 0.18.15
- flutter_local_notifications 18.0.1
- workmanager 0.10.10
- Freezed / JSON serialization / build_runner generation toolchain

Note: sqflite is also listed in pubspec.yaml. Any future persistence change must inspect actual call sites and migrations rather than assume all persistence uses one package.

## 5. Backend, player and download architecture

### Backends

The documented and source-visible service set includes NewPipe Extractor, Piped, Invidious and Explode. PeerTube service/repository code is also present but its feature matrix status is partial.

Current default instance values in lib/core/strings.dart:
- Piped: https://api.piped.private.coffee/
- Invidious: https://inv.nadeko.net

The existing 2026-11-19 audit reports a successful response from the configured Piped instance and HTTP 403 from the configured Invidious instance. Those are dated observations from the existing report, not fresh probes performed on 2026-11-20.

### Player

- Android NewPipe playback selects the native Media3/ExoPlayer view.
- media_kit player code and dependencies remain in the project for other playback paths/platforms.
- The feature matrix says the NewPipe media_kit player is unreachable on Android due to the Android native-player selection condition. Do not assume fixes in that path affect Android playback.
- PiP, background playback, queue, resume, quality, comments, subtitles and other player paths exist in source, but many remain device-unverified.

### Downloads

Current main does **not** include ffmpeg_kit_flutter_new as a Dart dependency. The documented implementation uses vendored NewPipe pure-Java stream writers via Android's NewPipeMuxerHandler and the existing MethodChannel. The legacy FFmpeg-named Dart/native compatibility classes do not mean that FFmpeg is the active merge engine.

The existing fix report records that the native merge handler was restored and registered after a method-channel contract mismatch caused merged downloads above 360p to fail. Current source search confirms NewPipeMuxerHandler registration and the Dart mergeStreams call. The fix is source-documented, but an actual high-quality download and playback test on the user's Android device remains outstanding.

## 6. Feature inventory — source status, not assumed device success

Existing working/VYPLAY_FEATURE_COMPLETENESS_MATRIX.md records the feature-level evidence. The audit confirms the following high-level picture:

| Feature group | Source-level status from existing evidence | Remaining verification |
|---|---|---|
| Search and home feed | Implemented | Device/backend behaviour |
| NewPipe Android playback | Partially implemented; recovery/diagnostics were added | Reproduce the user's 404 on device |
| Subscriptions, channel pages, Shorts, playlists | Implemented | Device flows and persistence |
| Watch Later, history, profiles, backup/restore | Implemented | Restart/import/export checks on device |
| Download ≤360p | Implemented | Device download/open |
| Download >360p merge | Previously broken, native handler restored/fixed | Real high-quality download and playable output |
| SAF / SD-card download storage | Implemented in UI, Dart and native paths | Physical SD-card permissions and writes |
| Background downloads and playback | Implemented in code | OS lifecycle, notification and lock-screen checks |
| PiP and Cast | Present/partial | Real receiver/device verification |
| SponsorBlock playback skipping | Implemented in source | Device behaviour |
| SponsorBlock removal from downloaded files | **Not implemented / blocked** | Requires a real trim/cut pipeline |
| Comments and dislike counts | Implemented in source | Live backend check |
| Invidious default instance | Previously measured HTTP 403 | Select or verify a working instance |
| Piped default instance | Previously measured HTTP 200 | Device playback |
| PeerTube | Partial | Live instance verification |
| Plugin/extension system | Implemented in source | Install/enable/permission flows on device |
| Supabase/cloud sync | Not implemented in the repository per prior audit search | No cloud-sync behaviour should be promised |

A feature appearing in source, a mock/unit test, or a README is not equivalent to successful device/network behaviour.

## 7. Confirmed issues and project risks

| Priority | Finding | Evidence / consequence | Phase 0 disposition |
|---|---|---|---|
| Critical | applicationId does not match target | Current Gradle applicationId is com.fazilvk.fluxtube; user-confirmed target is com.kamil.vyplay | Recorded; no identity change made |
| High | Playback 404 is not conclusively resolved | Cache invalidation, bounded recovery and stage-named diagnostics exist; exact device-side failure origin is still unknown | Recorded; device log needed |
| High | Invidious default instance unavailable in prior probe | inv.nadeko.net returned HTTP 403 on 2026-11-19 | Recorded; do not silently replace endpoint |
| High | High-quality merged downloads lack device proof | Native merge contract was restored in source; >360p path remains device-unverified | Recorded |
| Medium | SponsorBlock download cutting is absent | Current mux path copies/muxes streams; it does not trim/re-encode arbitrary segments | Recorded as blocked, not falsely complete |
| Medium | Android media_kit NewPipe player is not selected | Android uses native Media3 player path | Recorded; fixes must target the live Android path |
| Medium | Android debug-key test APK identity is unstable | Active .github/workflows/android-draft-release.yml explicitly marks builds signed with a fresh temporary debug key as prerelease/test builds; they are not stable upgrade builds | Documented; production signing requires persistent secrets |
| Medium | Existing documents describe different package IDs and older baselines | Historical audit docs mention com.vyplay.app, while current Gradle declares com.fazilvk.fluxtube | Current source takes precedence |
| Low | Changelog/version mismatch | CHANGELOG.md begins with v0.9.4; pubspec.yaml remains 0.9.3+14 | Recorded; not edited |
| Unknown | Current HEAD's build/test state | No fresh execution environment or current CI result available in this audit | Explicitly unverified |

## 8. CI, build and test evidence

### CI configuration verified

- .github/workflows/flutter-ci.yml runs on push to main, pull requests targeting main and manual dispatch. It sets up Java 17, Flutter stable 3.47.1, Android SDK packages, runs flutter pub get, flutter analyze and flutter test. It does not build an APK in this workflow.
- .github/workflows/android-draft-release.yml builds universal and split APKs on main pushes/manual dispatch. If release secrets are absent it creates a temporary debug keystore and labels/publishes the result as a prerelease/test build. Such builds are not stable-signature upgrade packages.
- The separate root-level android-draft-release.yml is not under .github/workflows and is not the active workflow path.

### Historical test/build records (not a fresh run on current HEAD)

Existing reports record:
- flutter analyze: no issues found.
- flutter test: 553 tests passed.
- Kotlin Gradle unit tests: 10 passed, 0 skipped/failures/errors in the 2026-11-13 progress record.
- Debug APK: 566,935,452 bytes (about 540 MiB) in the 2026-11-13 progress record.
- A release build attempt on 2026-11-13 failed because the local signing keystore was absent.

The 2026-11-19 fixes report also records flutter analyze clean and 553 Flutter tests passed, but says Kotlin compile was not run locally and was deferred to GitHub Actions. These records are earlier than the current main HEAD audited here.

### Current verification limitation

For commit b4aeaeb, the GitHub commit-status query returned no status entries. The available workflow-run lookup returned no run records (that lookup is limited to PR-triggered runs), so it cannot establish that no workflow ran or that the current commit passed CI.

The execution container has no Flutter or Dart executable, and direct GitHub network access from that container is unavailable. Therefore no fresh flutter analyze, flutter test, Gradle test, APK build, APK inspection, install, or physical-device test was run on current main during this Phase 0 audit.

## 9. Audit files and source paths inspected

Repository metadata and branch comparison; README.md; pubspec.yaml; analysis_options.yaml; lib/main.dart; lib/core/app_info.dart; lib/core/strings.dart; lib/core/di/injectable.dart; android/app/build.gradle; android/app/src/main/AndroidManifest.xml; android/settings.gradle; android/gradle/wrapper/gradle-wrapper.properties; .github/workflows/flutter-ci.yml; .github/workflows/android-draft-release.yml; CHANGELOG.md; VYPLAY_PROGRESS.md; PHASE_PLAN.md; working/VYPLAY_ULTRA_AUDIT_BASELINE.md; working/VYPLAY_ULTRA_AUDIT_REPORT.md; working/VYPLAY_FIXES_AND_VERIFICATION.md; working/VYPLAY_PLAYBACK_404_ROOT_CAUSE.md; working/VYPLAY_FEATURE_COMPLETENESS_MATRIX.md; working/VYPLAY_PRODUCTION_READINESS.md; working/FINAL_REPORT_P0_P5.md; and targeted code search results for SearchBloc, WatchBloc, NewPipeMuxerHandler, stream merging, startup diagnostics and playback failure classification.

## 10. Phase 0 completion gate

- [x] Current repository and default branch identified.
- [x] GitHub access level checked.
- [x] Mission branch compared with current default branch.
- [x] Application identity and Android build configuration recorded.
- [x] Existing architecture and dependency stack mapped.
- [x] Backends, player paths, download/mux architecture recorded.
- [x] Existing feature inventory reviewed and source/device distinction preserved.
- [x] Critical known bugs, blockers and release risks recorded.
- [x] CI workflow configuration inspected.
- [x] Historical build/test evidence and current verification limitations recorded.
- [x] Audit report committed without changing app logic.

**Final Phase 0 status: 100% — audit and baseline recording complete.**  
**Phase 1 and all later phases: NOT STARTED by this report.**
