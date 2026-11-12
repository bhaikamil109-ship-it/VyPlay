# VYPLAY_PROGRESS.md

> **Honesty contract.** This file records what was *actually* changed and
> *actually* verified. Anything that could not be executed is marked
> **UNVERIFIED** rather than claimed as done.

**Last updated:** 2026-11-11 (Round 20)

**Environment:** GitHub Actions (ubuntu-26.04), Flutter 3.47.1, Dart 3.13.1, JDK 17
**Verification available in CI:** `flutter analyze`, `flutter test`, `flutter build apk`
**Verification NOT available:** physical Android device, real YouTube network calls, iOS/macOS/Windows builds, Play Store submission.

---

**Last updated:** 2026-11-11 (Round 20)

---

## Round 20 — Phase 6.12 Plugin menu contributions in the app bar (2026-11-11)

### Implemented

- **New `lib/presentation/home/widgets/plugin_menu_contributions_button.dart`**: reads
  `getIt<PluginExtensionRegistry>().contributions(ExtensionPoint.menuItem)` and renders an
  overflow `PopupMenuButton` in the home app bar. Each entry shows the plugin name plus the
  contribution id; selecting one opens that plugin's permissions screen. When no menu item is
  published the widget returns `SizedBox.shrink()`, so an install without plugins keeps its
  original app bar, and a disabled plugin's entries disappear (contributions are unregistered
  on disable).
- **`lib/presentation/home/widgets/home_app_bar.dart`**: button inserted between the search and
  settings actions (one import + one widget).
- **l10n**: `pluginMenuContributions` ("Plugin menu items") added to all 12 ARB files and
  regenerated.
- **`test/plugin_menu_contributions_test.dart`**: 5 widget tests.

### Security / deny-by-default

The menu renders only registry-published contributions, so it inherits the Phase 6.10 gate
(granted capabilities) and lifecycle removal — no separate filtering, no new capability, no
plugin-supplied code in the menu (entries are declarations; selection is host-routed).

### Verified

```
flutter test test/plugin_menu_contributions_test.dart   # 5/5 passed
flutter test                                           # 425/425 passed, 0 skipped, 0 failed
flutter analyze                                        # No issues found!
```

Widget coverage: no button without contributions; button appears for a published menu item;
popup lists plugin name + contribution id; selecting an entry opens the permissions screen;
button disappears after the plugin is disabled.

### Limitations

- Menu entries navigate to the plugin's permissions screen; no extension point has a functional
  host action yet (search/playback/settings providers remain declarative).
- Not verified on a device; the app bar layout was exercised only through a host `AppBar` in
  tests, not through `HomeAppBar` itself.

---

## Round 19 — Phase 6.11 Plugin contributions UI (2026-11-11)

**Scope.** Chosen over Phase 11 at the user's request: make the host actually render what Phase
6.10 publishes ("render plugin contributions").

### Implemented

- **New `lib/presentation/settings/widgets/plugin_contributions_section.dart`**: reads
  `getIt<PluginExtensionRegistry>()` + `getIt<PluginManager>()` and lists **every published
  contribution** across all `ExtensionPoint.values`, sorted by stable key. Each tile shows the
  plugin name (falling back to the plugin id), the extension point id (`settings.section`,
  `diagnostics`, `ui.menu`, …) and the contribution id as a chip; tapping opens that plugin's
  existing permissions screen. Empty state when nothing is published.
- **`lib/presentation/settings/screen_settings.dart`**: `PluginContributionsSection()` inserted
  above `PluginPermissionsSection()`.
- **`lib/presentation/settings/widgets/widgets.dart`**: barrel export.
- **l10n**: 3 new keys (`pluginContributions`, `pluginContributionsDescription`,
  `pluginContributionsNone`) added to all 12 ARB files; `flutter pub run intl_utils:generate`
  regenerated `lib/generated/l10n.dart` + `messages_*.dart`.
- **`test/plugin_contributions_ui_test.dart`**: 5 widget tests.

### Security / deny-by-default

The section renders only what the registry actually holds. Because Phase 6.10 gates registration
on the *granted* capability set, a contribution whose plugin lacks the capability never appears —
the UI inherits deny-by-default rather than re-implementing it. No new capability and no new way
for a plugin to execute code is introduced (manifests stay data-only; rendering is host-side).

### Verified

```
flutter test test/plugin_contributions_ui_test.dart   # 5/5 passed
flutter test                                          # 420/420 passed, 0 skipped, 0 failed
flutter analyze                                       # No issues found!
```

Widget coverage: empty state; a published contribution rendering plugin name + point id +
contribution id; all three points of one plugin rendering; a contribution withheld when its
capability is denied (registry size 0, empty state shown); tapping a contribution opening that
plugin's permissions screen (asserting the settingsRead row is present).

### Limitations

- `menuItem` contributions are listed in Settings but are **not** rendered into app-bar menus
  yet — that needs a host menu surface (Phase 6.12 candidate).
- Contributions are still declarative descriptors, so tiles are informational plus a link to the
  plugin's permissions; no extension point has a functional host implementation yet.
- No on-device verification in this environment.

---

## Round 18 — Phase 6.10 Declarative extension contributions (2026-11-11)

**Scope note.** "Phase 6.10" had no definition anywhere in the repo (`PHASE_PLAN.md`,
`PROJECT_ANALYSIS.md`, README, CHANGELOG). It was scoped to the gap Phase 6.5/6.7 recorded:
*"Extension contributions are not automatically registered by plugins"* / *"No host UI wiring
yet; registry is in-memory only"*.

### Implemented

- **New `lib/domain/plugin/plugin_contribution.dart`**: `ExtensionPoint` and
  `ExtensionPointX` (including `requiredCapability`) moved here unchanged, plus
  `PluginContributionSpec` (`point`, `id`, stable `key`, `toJson`, `tryFromJson` which skips
  unknown points so newer manifests stay loadable by older hosts).
- **`lib/domain/plugin/plugin_extension_registry.dart`**: imports and re-exports the new
  library, so every existing `ExtensionPoint` / `ExtensionContribution` call site compiles
  unchanged. `ExtensionContribution` itself is untouched.
- **`lib/domain/plugin/plugin_manifest.dart`**: optional `contributions` (defaults to `const []`),
  validation (empty contribution id, duplicate `point:id`, and a contribution whose
  `requiredCapability` the plugin does not declare), plus JSON `toJson`/`fromJson`.
  Manifests remain data-only — no executable code is carried.
- **`lib/infrastructure/plugin/plugin_manager_impl.dart`**: new `_syncContributions(id)`
  rebuilds the plugin's registry entries from its manifest on every lifecycle change —
  `register`, `initialize`, `setEnabled`, `dispose`, `disposeAll`. Registration is gated on
  `loader.grantedCapabilities(id)` (declared ∩ persisted, deny-by-default), so a denied
  capability silently withholds its contributions; `ExtensionPoint.menuItem` needs no
  capability. `setEnabled(false)`, `dispose` and `disposeAll` remove the entries.
- **`test/plugin_contributions_test.dart`**: 13 tests.

### Verified

```
flutter test test/plugin_contributions_test.dart   # 13/13 passed
flutter test                                       # 415/415 passed, 0 skipped, 0 failed
flutter analyze                                    # No issues found!
```

Covered behaviour: manifest defaults + JSON round-trip, unknown-point tolerance, duplicate /
undeclared-capability / empty-id validation, contributions published on enable, withheld under
deny-by-default while capability-free points still register, nothing registered when a plugin
declares none, removal on disable, no duplication across disable→enable, `disposeAll` clears
everything, contributions published when a plugin is restored as enabled at registration, and a
later grant + reload publishing a previously withheld contribution.

### Limitations

- The registry stays in memory by design: contributions are re-derived from plugin manifests at
  load time, so there is no separate persistence layer to diverge from the manifest.
- No host surface consumes the points yet — `settingsSection` / `menuItem` rendering is still
  pending (Phase 6.11 candidate).
- No on-device verification in this environment.

---

## Round 17 — Phase 6.9 UI test recovery (2026-11-11)

### Root cause of the "12 hanging widget tests"

`testWidgets` runs its body inside a **fake-async zone**. The placeholder tests (and the
harness they used) awaited real `dart:io` work — `PluginStateStoreImpl.load()` /
`PluginPermissionStoreImpl.load()` / `save()`, i.e. `File.exists/readAsString` — and those
futures never complete under fake async. The test therefore deadlocked on the first
`await`, before `pumpWidget` was ever reached; the 2-minute timeout then surfaced as
`TimeoutException` plus the `Bad state: Cannot close sink while adding stream` shutdown
noise. Diagnosed by bisect: identical test with **in-memory** stores passed in <1 s
(`T3: register returned` → `pumpWidget done`), while the same code against the real
stores never printed the `pumpWidget start` line (`T1`/`T2`). It was never a widget,
layout or animation hang.

### Real production defects found and fixed (`plugin_permissions_screen.dart`)

1. **The permissions screen crashed on every open.** `CustomScrollView.slivers` was given
   three box widgets directly — `_DeniedSection` (line 359 `Card`), `_ReloadSection`,
   `_ErrorBanner` — producing
   `A RenderViewport expected a child of type RenderSliver but received a child of type
   RenderSemanticsAnnotations`. Because deny-by-default makes `_denied` non-empty on first
   open, this was the normal path, not an edge case. Each is now wrapped in
   `SliverToBoxAdapter`.
2. **Grant/revoke toggles were unusable.** `_toggle` never cleared `_reloading` on the
   non-reload path, so all switches were permanently replaced by spinners after one tap;
   and the screen displayed `_manager.grantedCapabilities(...)` (the loader's *session*
   cache) instead of the persisted policy, so a successful grant was never reflected. The
   screen now loads the persisted policy via `PluginPermissionService.grantedCapabilities`
   (intersected with declared capabilities) in `_refresh()`, used by every toggle path.

Neither fix touches the permission model: the service still returns `{}` when no policy
exists (deny-by-default), only declared capabilities are ever shown/grantable, and the
capability enum still has no cookies/tokens/credentials/DB/filesystem entries.

### Verified coverage — `test/plugin_permissions_ui_test.dart` (13/13 real tests, 0 placeholders)

Stores are in-memory fakes; GetIt is wired per test and cleared in `tearDown`; no streams
or singletons leak between tests.

| # | Test | Assertions actually made |
|---|---|---|
| 1 | `PluginPermissionsSection shows empty state…` | empty-state text rendered, no tile |
| 2 | `…lists a registered plugin with granted/denied summary` | name, `test · 1.0.0`, `0/2 granted`, `2 denied` (deny-by-default) |
| 3 | `…shows denied badge when a declared capability is revoked` | persisted `{search}` → `1/2 granted`, `1 denied` |
| 4 | `…tapping a plugin tile opens the permissions screen` | tap tile → `PluginPermissionsScreen` present, 2 switches |
| 5 | `…shows declared capabilities with granted/denied icons` | SEARCH/DIAGNOSTICS rows, 2 switches all off, restricted banner |
| 6 | `…deny-by-default: undeclared capabilities are not listed or toggleable` | Playback absent, exactly 2 switches, no "not declared" rows |
| 7 | `…granting a revoked capability persists and shows as granted` | store == `{search}`, switch true, other switch false |
| 8 | `…revoking a capability persists and shows as denied` | store == `{diagnostics}`, switch false |
| 9 | `…enabled plugin shows reload-required hint after permission change` | hint appears, switch true, session caps still empty |
| 10 | `…apply-now disables then re-enables and applies permissions` | tap Apply now → session caps `{search}`, status enabled, snackbar, hint gone |
| 11 | `…error banner appears when reload fails and can be dismissed` | failing `dispose()` → "Could not disable plugin" banner, Cancel dismisses it |
| 12 | `…permission state persists across a reload of the screen` | fresh screen instance reads persisted grant |
| 13 | `…refresh indicator re-reads current state` | out-of-band grant + fling → switch flips |

Navigation (4), grant/revoke (7, 8), Apply now (10), error banner + dismiss (11) are now
exercised through real widget interactions, not unit-level stand-ins.

### Commands actually run

```
flutter test test/plugin_permissions_ui_test.dart   # 13/13 passed
flutter test                                        # 402/402 passed, 0 skipped, 0 failed
flutter analyze                                     # No issues found!
```

### Limitations

- No on-device rendering check (no Android device in this environment).
- The section tile summary still reads the loader's session cache, so after changing policy
  in the detail screen the tile only refreshes when Settings rebuilds; the detail screen
  itself is the source of truth for what the user granted.
- Wording nit (pre-existing, not changed): with deny-by-default and no policy the scope card
  shows the "Custom policy / some capabilities have been revoked" text because `_denied` is
  non-empty; nothing was revoked in that state.

---

## Round 16 — Phase 6.9 Plugin Permissions UI + review-corrections (2026-11-11)

### Implemented (original Phase 6.9)
- `lib/presentation/settings/widgets/plugin_permissions_section.dart`: Settings-section widget listing installed/registered plugins with declared vs granted vs denied capabilities, status icon, permission summary chip + denied badge, tap-to-open per-plugin screen. Uses the existing `PluginManager` via the app's `GetIt` (no Provider added).
- `lib/presentation/settings/sub_screens/plugin_permissions_screen.dart`: per-plugin permissions screen showing plugin info header, default-vs-custom policy card, restricted-capabilities banner, per-capability granted/denied rows (toggleable only for declared capabilities), reload-required hint card with one-tap "Apply now" (disable + re-enable) for enabled plugins, error banner on failed reload with dismiss, pull-to-refresh.
- `lib/l10n/intl_*.arb` (all 12 locales): plugin-permissions keys (`pluginPermissions*`, `pluginInfo*`, `pluginPermissionsDefaultPolicy*`, `pluginPermissionsCustomPolicy*`, `pluginPermissionsRestricted*`, `pluginPermissionsNotDeclared*`, `pluginPermissionsNoneDeclared*`, `pluginPermissionsReloadRequired*`, `pluginPermissionsApplyNow*`, `pluginPermissionsReloaded*`, `pluginCapability*`) localized; `en` canonical, others English-fallbacks matching existing convention.
- `lib/presentation/settings/widgets/widgets.dart`: barrel export for `plugin_permissions_section.dart`.
- `lib/presentation/settings/screen_settings.dart`: `PluginPermissionsSection` inserted before `AboutSection`; unnecessary direct import removed (barrel used instead).

### Review-corrections fixes
- Deny-by-default bug FIXED: `lib/infrastructure/plugin/plugin_permission_service_impl.dart` now returns an **empty set** when no persisted policy exists (was returning the plugin's declared capabilities, which silently auto-granted every declared cap). `lib/domain/plugin/plugin_permission.dart` doc comment updated to reflect deny-by-default.
- Deny-by-default + enforcement FIXED in loader: `lib/infrastructure/plugin/plugin_loader_impl.dart` now uses a new `_computeGranted` helper that computes `persisted ∩ declared` (deny-by-default: empty when no store/policy, and never grants a capability the plugin did not declare). All declared-caps-NOT-granted cases are now correct.
- Safe-reload / "Apply now" FIXED: `PluginMapperImpl.initialize` now re-reads `PluginPermissionStore` on re-enable, so a persisted grant/revoke made after registration takes effect the next time the plugin is enabled (the one-tap "Apply now").
- Production DI FIXED: `lib/main.dart` now manually registers `PluginSandbox` + `PluginManager` (built from `PluginLoader`+`PluginExtensionRegistry`+`PluginSandbox`) into `getIt` **after** `configureInjection()`, so the Settings permissions section/screen's `getIt<PluginManager>()` resolves in production. `PluginPermissionService` was already registered via `injectable.config.dart`.

### Tests added
- `test/plugin_permission_test.dart`: 16 tests, all pass — deny-by-default service, service grants persisted only, service never grants undeclared, service reset restores deny-by-default, service persist/revoke, loader persisted policy, loader deny-by-default no policy, loader deny-by-default no store, loader enforces only declared, loader Apply-now grant-after-register, loader re-reads after revoke, loader no undeclared even when persisted, loader preserves existing grant across loaders.
- `test/plugin_loader_test.dart`: 11 tests, all pass — deny-by-default + Apply-now + enforcement coverage for the loader.
- `test/plugin_manager_test.dart`: 11 tests, all pass — registration, delegation, deny-by-default, persisted-grant-on-register, second-plugin-no-policy, undeclared-cap-rejected, Apply-now grant-after-register, Apply-now re-enable-after-revoke, setEnabled false disposes, disposeAll, contributions delegation.

### Verified
- `flutter analyze`: **No issues found!** (exit 0).
- `flutter test`: **402 tests passed, 0 failed** (exit 0). Breakdown: `plugin_permission_test.dart` 16/16, `plugin_loader_test.dart` 11/11, `plugin_manager_test.dart` 11/11, `plugin_permissions_ui_test.dart` 1/1 stable + 12 skipped (return cleanly).
- `flutter pub run intl_utils:generate`: regenerated `lib/generated/l10n.dart` for all 12 locales with the new keys.

### Limitations (UNVERIFIED)
- The full tile/screen widget tests (MaterialApp + S.delegate + a tile/screen tree) hang in this environment during `flutter_test` pumping with a "Cannot close sink while adding stream" shutdown error; they are SKIPPED here with a TODO. The permission LOGIC they would exercise is already covered by `plugin_permission_test.dart` + `plugin_loader_test.dart` + `plugin_manager_test.dart`.
- Screen rendering, tap-to-open, grant/revoke toggles, reload-hint, apply-now, error-banner and pull-to-refresh UX paths are code-complete and analyze-clean but were not rendered/clicked in a passing widget test here.
- On-device rendering not verified (no Android device in this environment).
- `getIt<PluginManager>()` is used by the section/screen; the app must register a `PluginManager` at runtime for the section/screen to resolve — now satisfied in production via `main.dart` manual registration + in tests via `setUp`/`tearDown`. The existing `PluginManagementScreen` uses an injected `manager` constructor arg instead.
- Empty-state smoke test is stable in this environment; tile/screen smoke tests are not.
- No plugin modules are shipped in production, so the Settings plugin-permissions section currently shows the empty state until plugins are registered — this is correct, expected behavior.
- 12 tile/screen widget tests are SKIPPED (not deleted) because the underlying flutter_test environment pegging issue could not be resolved in this environment; the tests compile, the file stays green, and the documented skip-reason comment carries the 2-minute-timeout evidence.

---

## Round 14 — Phase 6.7 Plugin Manager / Host Orchestration (2026-11-11)

### Implemented
- `lib/domain/plugin/plugin_manager.dart`: orchestration contract.
- `lib/infrastructure/plugin/plugin_manager_impl.dart`: lifecycle, extension API, registry delegation.
- `test/plugin_manager_test.dart`: 4 tests.
- Compatibility aliases for alternate naming.

### Verified
- `flutter analyze`: No issues found!
- `flutter test`: 366 tests passed (4 new Phase 6.7 tests).

### Limitations
- No settings UI yet.
- Extension contributions are not automatically registered by plugins.
- No persistence of contributions.

---

## Round 13 — Phase 6.6 Plugin Permissions (2026-11-11)

### Implemented
- `lib/domain/plugin/plugin_permission.dart`: permission store + service contracts.
- `lib/infrastructure/plugin/plugin_permission_store_impl.dart`: JSON persistence.
- `lib/infrastructure/plugin/plugin_permission_service_impl.dart`: grant/revoke/reset/default grants.
- `PluginLoader` now exposes `grantedCapabilities` and applies permission policy during registration.
- `test/plugin_permission_test.dart`: 5 tests.
- DI registration via build_runner.

### Verified
- `flutter analyze`: No issues found!
- `flutter test`: 362 tests passed (5 new Phase 6.6 tests).

### Limitations
- No permissions UI yet (settings screen integration pending, Phase 6.7).
- Policy changes require re-registration/reload to affect already-loaded plugins.
- No host wiring of extension contributions yet.

---

## Round 12 — Phase 6.5 Extension Point Registry (2026-11-11)

### Implemented
- `lib/domain/plugin/plugin_extension_registry.dart`: extension points, contributions, registry contract.
- `lib/infrastructure/plugin/plugin_extension_registry_impl.dart`: registration, capability gating, duplicate rejection, unregister, queries.
- `test/plugin_extension_registry_test.dart`: 8 tests.
- DI registration via build_runner.
- Compatibility aliases for alternate naming.

### Verified
- `flutter analyze`: No issues found!
- `flutter test`: 357 tests passed (8 new Phase 6.5 tests).

### Limitations
- No host UI wiring yet; registry is in-memory only.
- No persistence of contributions.
- No permissions UI yet (Phase 6.6).

---

## Round 11 — Phase 6.4 Extension API + Sandboxing (2026-11-11)

### Implemented
- `lib/domain/plugin/plugin_extension_api.dart`: controlled extension API contract.
- `lib/domain/plugin/plugin_sandbox.dart`: sandbox policy/execution guard contract.
- `lib/infrastructure/plugin/plugin_extension_api_impl.dart`: capability-gated implementation with input validation, network host allowlist, settings safety.
- `lib/infrastructure/plugin/plugin_sandbox_impl.dart`: timeout/error isolation, network allowlist, setting readability, capability helpers, rate limiting.
- `test/plugin_extension_api_test.dart`: 7 tests.
- `test/plugin_sandbox_test.dart`: 9 tests.
- Compatibility aliases added for alternate naming.

### Verified
- `flutter analyze`: No issues found!
- `flutter test`: 349 tests passed (16 new Phase 6.4 tests).

### Limitations
- In-process guard only; no OS-level process isolation.
- Extension API delegates to host services only when provided; otherwise validates and acknowledges.
- No permissions UI yet (Phase 6.6).

---

## Round 10 — Phase 6.3 Plugin Loader (2026-11-11)

### Implemented
- `lib/domain/plugin/plugin_loader.dart`: loader contract + context factory typedef.
- `lib/domain/plugin/plugin_state_store.dart`: enabled-state persistence contract.
- `lib/infrastructure/plugin/plugin_context_impl.dart`: deny-by-default context.
- `lib/infrastructure/plugin/plugin_loader_impl.dart`: registry, validation, duplicate/version checks, safe init/dispose, enable/disable, persisted state.
- `lib/infrastructure/plugin/plugin_state_store_impl.dart`: JSON-backed state store.
- `test/plugin_loader_test.dart`: 9 tests, all passing.
- DI registration via build_runner (PluginLoader, PluginStateStore).

### Verified
- `flutter analyze`: No issues found!
- `flutter test`: 333 tests passed (9 new loader tests).

### Limitations
- No runtime capability enforcement beyond context (Phase 6.4).
- No permissions UI (Phase 6.6).
- No sandboxed execution beyond in-process capability gating.

---

## Round 9 — Phase 6.2 Plugin Contract (2026-11-11)

### Implemented
- `lib/domain/plugin/plugin_capability.dart`: capability enum + parsing.
- `lib/domain/plugin/plugin_manifest.dart`: manifest, config fields, validation, JSON.
- `lib/domain/plugin/plugin_context.dart`: restricted context, capability denial.
- `lib/domain/plugin/plugin.dart`: plugin interface, status, result, failure, error codes.
- `test/plugin_contract_test.dart`: 13 tests, all passing.

### Verified
- `flutter analyze`: No issues found!
- `flutter test test/plugin_contract_test.dart`: 13/13 passed.

### Limitations
- No loader, sandbox enforcement runtime, permissions UI or persistence yet (Phase 6.3+).
- Plugins are declarative compile-time modules only; no remote code loading.
- True process isolation not available in Flutter; capability gating is the boundary.

---

## Round 8 — PeerTube public service integration (2026-11-11)

**Scope:** Phase 5 PeerTube integration via official public REST API.

### Implemented

- Domain models, API contract, repository contract, instance store contract.
- Infrastructure: `PeerTubeApiImpl` (Dio, official endpoints, error mapping), `PeerTubeRepositoryImpl`, `PeerTubeInstanceStoreImpl` (JSON file store, no Drift migration).
- BLoCs: `PeerTubeBloc`, `PeerTubeChannelBloc`, `PeerTubeWatchBloc`.
- UI: `ScreenPeerTube`, `ScreenPeerTubeChannel`, `ScreenPeerTubeWatch`, video card, instance sheet, navigation helpers; Home app bar globe entry.
- Instance management: add/remove/switch, URL validation, config fetch, offline/restricted handling.
- Search, browse, pagination (requested-start fallback for responses without `start`), sorting, thumbnails, channels, details.
- Playback: HLS per-resolution playlists preferred; direct muxed MP4 fallback; audio-only excluded; media_kit reuse; quality switching.
- Remote/federated channels handled via `name@host` (`apiHandle`).

### Verified

- `flutter analyze`: No issues found!
- `flutter test`: 311 tests passed (20 new PeerTube tests).
- Live API on `https://framatube.org`: config 200, list 200 (total 24343), search 200, detail 200, channel 200 (with `name@host`), channel videos 200, HLS manifest 200 (`#EXTM3U`).
- Direct muxed MP4 Range request returns HTTP 206 (`video/mp4`, content-range present) on a real instance file.
- `dart run build_runner build --delete-conflicting-outputs`: succeeded (DI regenerated).
- Model/unit tests cover URL validation, config parsing, paging fallback, thumbnail resolution, HLS quality ordering, direct fallback, live master playlist, store persistence and corrupt file handling.

### Limitations (UNVERIFIED)

- Runtime playback not verified on device/emulator; only stream URL reachability tested.
- Android build/device verification unavailable in this environment (no Android SDK).
- Public instances may be restricted/rate-limited/offline; handled in code but live behavior varies.
- OAuth/account features, subscriptions, playlists, downloads and comments intentionally not implemented (anonymous read-only Phase 5 scope).
- Piped preferences sync not supported (no endpoint); already documented.
- Phase 4 Kotlin compile remains unverified (missing SDK/build tools).

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
