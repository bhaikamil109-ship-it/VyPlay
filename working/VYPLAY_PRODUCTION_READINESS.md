# VyPlay — Production Readiness (Phases 7–9)

**Updated:** 2026-11-21  
**Current review baseline:** Deep QA run #64 on `ba240b20`; subsequent release-policy commit `be4a1880` and privacy-log commit `2d720329` are undergoing their own CI checks.

This file replaces the stale 2026-11-19 snapshot. It distinguishes source/CI verification from real-device acceptance; nothing is called device-verified without an actual Android device or emulator.

## Phase 7 — Android security and lifecycle review

### Deep links and shared content

**Implemented in source; tests passed on `ba240b20`:**

- `lib/core/deep_link_handler.dart` no longer prints raw incoming links or shared text.
- Supported URLs are restricted to exact YouTube hosts (`youtube.com`, `www.youtube.com`, `m.youtube.com`) and `youtu.be`.
- Video IDs are validated as 11-character YouTube IDs; channel/handle/playlist identifiers are validated before routing.
- Unsupported schemes, lookalike hosts, user-info URLs and non-standard ports are rejected.
- Shared text can contain ordinary prose around a supported YouTube URL.
- `test/deep_link_handler_test.dart` covers normal watch/shorts/embed/channel/playlist links and malicious lookalike hosts.
- Commit `2d720329` additionally redacts plugin exception text from initial-link/share lookup failures; its fresh CI result is pending in this checkpoint.

### Android foreground download service

**Implemented and automated-build verified:**

- `DownloadsForegroundService.kt` uses the `dataSync` foreground-service type and owns only the lifetime notification; per-download progress remains in Dart.
- `DownloadServiceHandler.kt` reports whether Android accepted the start request. Dart degrades safely if the OS rejects the start; the download itself is not failed.
- Android 15 `Service.onTimeout(startId, fgsType)` is implemented: the service clears its running state, removes the foreground notification and stops itself. Interrupted download rows are recovered on the next app start by the existing download-resume path.
- The Android native unit-test job and arm64 debug APK build passed in Deep QA run #64.

Android 15 imposes a combined six-hour-per-24-hour background time budget for an app's `dataSync` foreground services and calls `Service.onTimeout(int, int)` when that budget is exhausted. The app handles the callback, but actual timeout/recovery behavior still needs a device test. [Android 15 behavior changes](https://developer.android.com/about/versions/15/behavior-changes-15) · [Foreground-service timeout guidance](https://developer.android.com/develop/background-work/services/fgs/timeout).

### Android app identity and platform configuration

| Item | Current source |
|---|---|
| Application ID / namespace | `com.kamil.vyplay` |
| Version name | `0.1.0` |
| Version code | `1` |
| minSdk | `24` |
| targetSdk | `35` |
| Main activity | exported, launcher + YouTube deep-link/share filters |
| Downloads foreground service | not exported; `dataSync` type |
| AudioService / media-button receiver | exported for media-session integration; device interoperability still to verify |
| Android release shrinking | R8 minification and resource shrinking enabled in release build |

The current identity/version values were verified from the APK in Deep QA run #64. The static manifest/build configuration was inspected; no physical-device behavior is inferred from that inspection.

## Phase 8 — Release-channel safety

### Current release policy

**Source change committed in `be4a1880`; fresh workflow verification pending:**

- Main-branch pushes build APKs and upload them as workflow artifacts; they do not create public GitHub Releases.
- Public Release publication is permitted only when all four permanent Android signing secrets are configured **and** the workflow is running from a version tag matching the app's `pubspec.yaml` version (for example, `v0.1.0`).
- If signing secrets are absent, the workflow generates a temporary test key only for the workflow artifact. It does not publish that artifact as a public GitHub Release.
- A signed build from the main branch is still an artifact, not a public release.
- Version-tag mismatch fails before publication.
- Permanent release signing remains intentionally deferred until the maintainer supplies the real keystore/secrets. No signing secret has been generated, printed, committed or requested in this review.

The workflow file is `.github/workflows/android-draft-release.yml`. Do not treat a temporary-key workflow artifact as an official update APK: a new temporary key cannot sign an in-place update over a prior build signed with another certificate.

## Phase 9 — Remaining production-readiness issues

| Finding | Current disposition |
|---|---|
| Invidious default instance `https://inv.nadeko.net` returned HTTP 403 for a video endpoint in the 2026-11-19 audit | **OPEN** — changing the default backend/instance needs a maintainer decision; no silent URL swap |
| Player error text can be cleared by a later native state event | **OPEN** — UX correction needs a focused regression test |
| Android `media_kit` player is not the active Android NewPipe player path | **Documented design/maintenance question** — do not delete without a platform decision |
| SponsorBlock removal from downloaded media | **BLOCKED** — current muxer copies streams; it does not trim/re-encode the requested segments |
| Live cross-backend behavior | **UNVERIFIED** — no current real-server matrix for NewPipe, Piped, Invidious, Explode and PeerTube |
| R8/minified release runtime | Release APK compiles in CI; **real-device runtime behavior remains UNVERIFIED** |
| Physical-device matrix | **UNVERIFIED** — install/upgrade, deep links, SAF/SD-card writes, notifications, WorkManager, background downloads, PiP and playback require a device/emulator |

### Documentation/version notes

- The Android identity is `com.kamil.vyplay`, not the older `com.vyplay.app` value in the historical 2026-11-19 report.
- `pubspec.yaml` currently declares `0.1.0`; `CHANGELOG.md` still carries historical `v0.9.4` notes from the original codebase. This was not rewritten because release-history semantics should not be fabricated.
- The former claim that missing signing secrets could still publish a normal public Release is stale after commit `be4a1880`; tag-only publication is now the workflow policy, subject to CI verification.

## Latest automated evidence

**Deep QA run #64:** [44883537943](https://github.com/bhaikamil109-ship-it/VyPlay/actions/runs/44883537943), commit `ba240b20` — SUCCESS.

- Dart format: passed.
- `flutter analyze --no-fatal-infos`: no issues.
- Flutter unit/widget tests: **610/610 passed**.
- Android native unit tests: `BUILD SUCCESSFUL`.
- Android arm64 debug APK: built.
- APK metadata: `com.kamil.vyplay`, version `0.1.0`, version code `1`.

The release-policy change `be4a1880` and subsequent generic exception-log redaction `2d720329` must have their own successful CI runs before they are considered fully verified. No device test is claimed.

**Current verdict:** Phase 7 source hardening is implemented and partially CI-verified; the latest release-policy and final log-redaction commits are pending fresh checks. Phase 8 release gating is implemented but awaits its workflow rerun. Phase 9 remains partially open due to device/network/maintainer-decision items above.
