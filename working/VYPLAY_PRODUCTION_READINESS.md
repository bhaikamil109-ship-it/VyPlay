# VyPlay — Production Readiness (Phases 7–9)

Date: 2026-11-19 · Base `5dea4b8`

## Release signing — VERIFIED DEFECT, NOT CHANGED

`android-draft-release.yml` lines 100–145: when any of
`ANDROID_KEYSTORE_BASE64` / `ANDROID_KEYSTORE_PASSWORD` / `ANDROID_KEY_PASSWORD` /
`ANDROID_KEY_ALIAS` is missing, the workflow **generates a temporary debug keystore**
(`CN=Android Debug,O=Android,C=US`) and continues to publish a normal GitHub release
(`gh release create`, line 279). The release notes even state
`Signing: Temporary debug keystore` (line 257).

Impact: two consecutive CI runs produce APKs with **different signing certificates**, so a
user cannot upgrade over the previous install (`INSTALL_FAILED_UPDATE_INCOMPATIBLE`) and the
published artifact looks like a production release while not being signed with a stable key.

Recommended fix (deliberately **not** applied here — it changes release-channel semantics and
needs the maintainer's decision):

1. Keep building when secrets are absent, but publish with `--prerelease` and a title suffix
   such as `(UNSIGNED TEST BUILD)`; or
2. fail the publish step (`exit 1`) when `secrets.ANDROID_KEYSTORE_BASE64` is empty and upload
   the APKs as workflow artifacts instead.

Both preserve the ability to receive test APKs, and neither can silently present a debug-key
build as production. Requirement 1 of Phase 8 ("fail closed") is therefore currently **not
met**.

## Android platform review

| Area | Finding |
|---|---|
| `applicationId` / signing identity | unchanged (`com.vyplay.app`, `android/app/build.gradle:75`) |
| minSdk / targetSdk | `24` / `35` — API 27 (Vivo Y90) supported |
| Media3 | `1.4.1`, DASH + HLS + progressive + merging (`NewPipeExoPlayerView.kt:325-370`) |
| Cached HTTP source | `SimpleCache` 256 MiB + `FLAG_IGNORE_CACHE_ON_ERROR` (`:130-137`) — a failed range is not served from cache |
| Cache sharing | one `ExoPlayer` singleton reused across views (`NewPipeSharedExoPlayer`), `sourceKey` guards reloads (`:315-322`) |
| File access | SAF handlers present (`SafStorageHandler.kt`, `StorageMethodHandler.kt`, `MediaStoreHandler.kt`) |
| ProGuard | keeps both muxer handlers (`proguard-rules.pro:78-86`) |
| Secrets in logs | none added; the new diagnostics store `scheme://host/path` only |

Not verified in this pass (needs a device or deeper review): exported-component flags,
foreground-service declarations, `network_security_config`, deep-link intent filters, R8
release crashes.

## Documentation consistency (re-verified, partially fixed)

Fixed in this pass (`README.md`):

- Broken GitHub URLs containing `VyPlay.` (release links, CI badge, issues link) →
  `VyPlay`. These links 404ed.
- FFmpeg claims (4 places) contradicted the actual implementation and `CHANGELOG.md`:
  downloads now merge in native Android code with the vendored NewPipe writers. With
  `NewPipeMuxerHandler` restored, the README now matches the code.

Still inconsistent (reported, not edited — changelog history/versioning is the maintainer's
call):

- `CHANGELOG.md` has a `### v0.9.4` section at line 3 while `pubspec.yaml` is `0.9.3+14`,
  so the changelog is ahead of the shipped version.
- `PHASE_PLAN.md:52` marks SponsorBlock-for-downloads blocked on "FFmpeg removed"; the reason
  is still valid but the wording should point at the native muxer.

## Database / DI

- `AppDatabase` registration from `5dea4b8` intact (`lib/core/di/injectable.dart`).
- `SettingImpl` keeps its `AppDatabase.instance` fallback (`setting_impl.dart:30`).
- No migration or schema change in this pass; no destructive operation performed.

## Security

- No secrets, keys or tokens were read, printed, committed or logged.
- The playback diagnostics file deliberately excludes query strings and headers, which is where
  Googlevideo signatures live.
