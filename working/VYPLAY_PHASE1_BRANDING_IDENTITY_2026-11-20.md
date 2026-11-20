# VyPlay Phase 1 — App Branding & Identity

Date: 2026-11-20  
Repository: `bhaikamil109-ship-it/VyPlay`  
Branch: `main`  
Status: **Implementation committed; validation pending**

## Approved design direction

A metallic silver V/play mark on a near-black background. No wordmark or tagline below the mark. No purple is used in the launcher identity. The design is a provisional approved direction and can be revised in a later branding change.

## Changes in this implementation

- Replaced Android `applicationId` `com.fazilvk.fluxtube` with the user-approved `com.kamil.vyplay`.
- Updated `assets/icon/icon.png` to the approved black-and-silver mark.
- Added a transparent silver foreground bitmap for Android adaptive launcher and splash resources.
- Changed adaptive launcher background to `#050608` and replaced the prior play-only foreground with the V/play mark.
- Added an Android 13+ monochrome icon silhouette.
- Added a legacy `mipmap-anydpi` launcher definition for API 24–25 using the same mark.
- Replaced the white/template splash with a black canvas and centred silver mark; added Android 12+ system splash styling.
- Added a dedicated white monochrome notification glyph and applied it to Flutter download notifications, subscription notifications and the native foreground-download service.
- Updated the launcher-generator comment so future asset regeneration does not knowingly overwrite the hand-maintained adaptive icon configuration.
- Kept `AppInfo` identity and existing FluxTube/NewPipe Extractor GPL attribution unchanged because they were already correct.

## Package identity migration notice

Android application ID changes from `com.fazilvk.fluxtube` to `com.kamil.vyplay`. Android treats these as separate packages. The new package will not be installed as an in-place update of the old one, and its private database/files/preferences will not be migrated automatically. The old install can remain alongside it. This change follows the user's earlier explicit approval of `com.kamil.vyplay`.

Gradle namespace, Kotlin source package path and existing MethodChannel names remain `com.kamil.vyplay`; these were already aligned and were not renamed.

## Validation gate

The source/resource edits were assembled from the current `main` branch. This environment has no usable Flutter/Dart/Gradle build toolchain and no attached Android device, so the following checks have **not** been run:

- `flutter analyze`
- `flutter test`
- `./gradlew :app:processDebugResources` / debug APK build
- Installation and launcher/splash/notification inspection on Android 8–15

Phase 1 must remain IN PROGRESS until repository CI or a build environment confirms resource linking and Flutter tests, and device inspection confirms icon/splash/notification behavior. No test or build pass is claimed.
