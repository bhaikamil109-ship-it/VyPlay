# VyPlay Phase 0–10 Mission Ledger

**Mission status:** Active  
**Last updated:** 2026-11-20  
**Working branch:** `mission/phase-0-10`  
**Base:** `fix/ffmpeg-remux-phase1` at `4cb1a8e7166df51b495c309fda611e17da571ac0`  
**Production branch:** `main` (left unchanged)

This is the active execution plan for the current Phase 0–10 mission. The older `PHASE_PLAN.md` remains historical feature/round tracking; its differently numbered feature phases are not used as the sequence for this mission.

## Non-negotiable project constraints

- Continue the existing Flutter/Dart Clean Architecture, BLoC, GetIt/injectable, services, and Drift database. Do not recreate the app.
- Preserve real backend behavior. No mock streams, fake data, placeholder success states, or inert buttons.
- Keep VyPlay ad-free and usable without mandatory login.
- Preserve Android application ID `com.fazilvk.fluxtube`, Android namespace `com.kamil.vyplay`, existing MethodChannel names/contracts, and stored user data unless a verified requirement demands a narrowly scoped change.
- Keep edits targeted. Do not reset, clean, or overwrite user work; do not delete diagnostics, databases, build evidence, or source files as a shortcut.
- Keep `main` stable. Work on this mission branch and use PR/CI evidence; no force-push or automatic merge.
- A phase is not complete merely because code exists. Record implementation evidence, CI/test evidence, Android build evidence, and remaining unknowns separately.
- Physical-device tests are intentionally deferred until after all Phase 0–10 implementation gates are complete.

## Phase status

| Phase | Scope | Status |
|---|---|---|
| 0 | Repository baseline, branch/PR reconciliation, architecture and CI audit | **COMPLETE — audit only** |
| 1 | Isolated FFmpeg large-file remux | **IN PROGRESS — PR #4 implementation and CI are green; final packaging/license checks remain** |
| 2 | Bilibili service integration | PENDING |
| 3 | Drawer and navigation redesign | PENDING |
| 4 | Core reliability: search, feeds, channels, playback errors and backend recovery | PENDING |
| 5 | Player behavior and UX | PENDING |
| 6 | Download reliability: quality selection, pause/resume/retry, storage/SAF/SD card and background lifecycle | PENDING |
| 7 | Service and platform integrations (including existing PeerTube/Cast/extension seams where applicable) | PENDING |
| 8 | Architecture cleanup, privacy, security and regression hardening | PENDING |
| 9 | Release engineering, dependency/license notices, signing and APK/AAB strategy | PENDING |
| 10 | Final automated acceptance, regression matrix and pre-device release gate | PENDING |

## Phase 0 — baseline audit (complete)

### Repository identity and baseline

- Repository: `bhaikamil109-ship-it/VyPlay`; default branch: `main`.
- Main HEAD at audit: `b4aeaebbf4051bb59b981a15897ac17ce30dcf17` (2026-11-19, “Harden playback diagnostics and release safety”).
- Main commit restores application ID `com.fazilvk.fluxtube`; Android namespace remains `com.kamil.vyplay`.
- Main `pubspec.yaml`: app version `0.9.3+14`; Flutter BLoC, GetIt, injectable, GoRouter and Drift dependencies are present.
- Source tree contains the expected `lib/application/`, `lib/domain/`, `lib/infrastructure/` and `lib/core/di/` structure.
- Android minimum SDK is 24. The project’s real native channel identifiers are retained (including the legacy `com.kamil.vyplay/muxer` muxer channel).
- Main is not branch-protected according to the GitHub branch metadata. This mission therefore avoids direct changes to `main`.

### Baseline CI / PR reconciliation

- Main’s latest reported CI checks at audit were green: Flutter Analyze/Tests and the Android APK/release workflow.
- PR #3 (`feat/pipepipe-bilibili-ffmpeg-mux`) combines FFmpeg remux and partial Bilibili routing. Its Flutter CI passed, but Android split-ABI build failed on run `44729782444`. PR description itself records incomplete Bilibili routing (Trending/Shorts and playlist extraction gaps) and no device verification.
- PR #4 (`fix/ffmpeg-remux-phase1`) isolates the FFmpeg remux work and is based directly on the audited main commit. Its Flutter Analyze/Tests run `44731157257` passed; Android split-ABI debug APK build and library-packaging step run `44731157295` passed. Artifact `vyplay-pr-debug-apks` was uploaded.
- PR #4 remains open and unmerged. It is the chosen Phase 1 implementation base; PR #3 is not to be merged wholesale because it mixes two workstreams and its Android build failed.
- Flutter CI is defined in `.github/workflows/flutter-ci.yml`; Android PR validation is in `.github/workflows/android-pr-build.yml`.

### Baseline caveats

- Historical `VYPLAY_PROGRESS.md` reports 553/553 Flutter tests, Kotlin unit tests green, and a debug APK build on 2026-11-13. Those are historical results, not a fresh measurement of the current main commit.
- Main’s Nov 19 checks and PR #4’s Nov 20 Flutter/Android checks are current CI evidence; test count and detailed runtime media output are not established by the summaries retrieved for this audit.
- CI does not equal a physical-device test. Playback, FFmpeg output correctness, notifications, PiP, SAF/SD-card behavior, and real backend/network behavior remain device/network-dependent.
- Main branch protection is disabled; no direct main write or merge is part of this mission.

### Phase 0 exit gate

- [x] Current repository and main commit identified.
- [x] Project architecture and key dependencies confirmed from the source tree and pubspec.
- [x] Application ID / namespace and MethodChannel compatibility boundary identified.
- [x] Competing PRs and their CI outcomes reconciled.
- [x] A separate mission branch created without changing main or merging either PR.
- [x] A single authoritative Phase 0–10 sequence established for this mission.

## Phase 1 — isolated FFmpeg large-file remux (in progress)

### Implementation observed on the selected base

- Android Gradle pins PipePipe’s FFmpegKit AAR to upstream commit `b91f008fb4d25b470c4383dcf42e31ee7696d272` and verifies the Git blob SHA-1 before packaging.
- Android remux uses FFmpeg stream-copy (`-c copy`), without re-encoding. NewPipe MP4/WebM writers are retained as a compatibility fallback for matching input families.
- The existing muxer MethodChannel name and request/response seam remain unchanged.
- Dart records the actual returned output path/container. Source video/audio files are removed only after a non-empty merged output is confirmed; merge failure is surfaced as a download failure and source streams remain available for retry.
- Mixed/unknown input containers target Matroska. If FFmpeg fails for a mixed/unknown pair, the NewPipe fallback cannot handle that pair and the operation fails explicitly rather than reporting a silent success.

### CI evidence

- [x] Flutter Analyze and Tests passed on PR #4 head `4cb1a8e` (run `44731157257`).
- [x] Android split-ABI debug APK build completed (run `44731157295`).
- [x] The workflow’s APK verification step passed and an APK artifact was uploaded.

### Remaining Phase 1 checks

- [ ] Inspect the exact AAR native-library inventory and verify the FFmpeg native libraries expected by each produced ABI. The current workflow only asserts that each APK contains at least one native `.so`; that generic check does not by itself prove FFmpegKit’s libraries are present for every ABI.
- [ ] Confirm the AAR’s exact component licenses, bundled third-party notices, and corresponding-source availability before distributing a release. The upstream PipePipeClient repository declares GPL-3.0; the exact AAR contents/notice manifest still require review. VyPlay’s repository also declares GPL-3.0.
- [ ] Re-run CI after the mission-branch documentation corrections.
- [ ] Physical-device large-file MP4/WebM/mixed-container tests are deferred to the post-Phase-10 device stage by design.

## Phase 2 — Bilibili integration

- Audit PR #3 changes file by file; reuse only compatible Bilibili work.
- Verify service-ID routing through search, suggestions, watch/stream info, channel/channel tabs, comments, request headers, quality selection and downloads.
- Fix the known incomplete routes: Trending, Shorts, playlists, full URL/BVID parsing and all watch/download entry points.
- Keep the NewPipe Extractor API compatibility required by the existing Kotlin handlers. Do not upgrade the extractor as an unrelated dependency change.

## Phase 3 — drawer and navigation redesign

- Implement the requested navigation/drawer structure within current routing and presentation layers.
- Preserve existing routes, state restoration and deep links.
- Keep every visible action wired to a real destination or service.

## Phase 4 — core reliability

- Trace search, home/feed, subscriptions, channels, watch pages and backend switching end to end.
- Reproduce and address the reported playback HTTP 404 using redacted diagnostics; never log signed media URL query tokens.
- Verify loading, empty, retry and failure states are truthful and recoverable.

## Phase 5 — player behavior and UX

- Validate playback lifecycle, resume, queue/repeat, seek, speed, audio-only, background audio, PiP, live playback and backend-specific player paths.
- Preserve native/Dart player contracts and avoid regressions between ExoPlayer and media_kit paths.

## Phase 6 — download reliability

- Validate quality/codec selection and Phase 1 remux integration.
- Verify pause/resume/retry, process-death recovery, duplicate prevention, bounded concurrency, progress persistence and cleanup.
- Verify SAF folder persistence, removable SD-card destination behavior, low-storage errors, background foreground-service lifecycle and notifications.
- Do not mark SD/SAF or background behavior device-confirmed from code inspection alone.

## Phase 7 — integrations

- Reconcile existing PeerTube, Cast, profiles, backups and extension/plugin seams with user-facing navigation.
- Verify real service behavior and graceful unsupported-service handling. No fake integration placeholders.

## Phase 8 — cleanup and security

- Run source-level audit for dead code, generated-file consistency, secrets, signed URL redaction, backup/privacy flags, permission minimization and error disclosure.
- Preserve Drift schema/user data and regenerate only the generated files required by actual source changes.

## Phase 9 — release engineering

- Validate versioning, application ID, ABI strategy, APK/AAB contents and size.
- Complete FFmpegKit/PipePipe and third-party license, notice and corresponding-source review.
- Use only the user's stable signing identity for production updates. A temporary debug key is test-only and must never be presented as a production update key.
- Produce checksums and verify distributable artifacts.

## Phase 10 — final automated acceptance

- Run Flutter analyze, complete Flutter tests, Kotlin/Gradle tests, Android build(s), ABI/library inspection and a regression matrix covering all changed paths.
- Verify CI is green on the final mission head.
- Do not call physical-device behavior verified at this gate.

## After Phase 10 — combined APK and physical-device verification

Only after Phases 0–10 pass their implementation/automated gates:
1. Build the combined/device-compatible APK artifact and record SHA-256 and application ID.
2. User installs it on the physical Android device and returns the test results.
3. Test search, feeds, subscriptions, backends, playback, Shorts, quality changes, audio/video merge, MP4/WebM/mixed containers, SD/SAF destination, background downloads/notifications, PiP/audio and restart recovery.
4. Fix device-found issues on the mission branch, rerun affected automated tests and CI, rebuild the APK, and repeat the failed device cases.
5. Issue the final readiness verdict with confirmed, unverified and blocked items clearly separated.

**Current honest verdict:** Phase 0 audit is complete. Phase 1 has a CI-green implementation base but is not yet closed. Phases 2–10 have not been started or verified in this ledger. No device test is claimed.
