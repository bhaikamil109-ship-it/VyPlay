import 'dart:async';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vyplay/application/download/download_bloc.dart';
import 'package:vyplay/generated/l10n.dart';
import 'package:vyplay/application/saved/saved_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/application/subscribe/subscribe_bloc.dart';
import 'package:vyplay/application/trending/trending_bloc.dart';
import 'package:vyplay/application/watch/watch_bloc.dart';
import 'package:vyplay/core/app_info.dart';
import 'package:vyplay/core/app_theme.dart';
import 'package:vyplay/core/locals.dart';
import 'package:vyplay/core/perf/app_perf.dart';
import 'package:vyplay/core/perf/device_profile.dart';
import 'package:vyplay/core/player/global_player_controller.dart';
import 'package:vyplay/core/player/playback_queue.dart';
import 'package:vyplay/core/settings.dart';
import 'package:vyplay/infrastructure/database/database.dart';
import 'package:vyplay/infrastructure/download/download_notification_service.dart';
import 'package:vyplay/infrastructure/settings/setting_impl.dart';
import 'package:vyplay/presentation/routes/app_routes.dart';
import 'package:vyplay/presentation/routes/bloc_observer.dart';
import 'package:vyplay/presentation/watch/widgets/global_pip_overlay.dart';
import 'package:vyplay/core/services/audio_handler_service.dart';
import 'package:vyplay/core/services/dearrow_service.dart';
import 'package:vyplay/core/services/log_collector.dart';
import 'package:vyplay/core/services/background_polling_service.dart';
import 'package:vyplay/core/services/subscription_notifier.dart';
import 'package:media_kit/media_kit.dart';

import 'core/di/injectable.dart';

import 'core/services/startup_diagnostics.dart';

import 'domain/download/download_service.dart';
import 'domain/plugin/plugin_manager.dart';
import 'domain/plugin/plugin_sandbox.dart';
import 'domain/plugin/plugin_extension_registry.dart';
import 'domain/plugin/plugin_loader.dart';
import 'infrastructure/plugin/plugin_manager_impl.dart';
import 'infrastructure/plugin/plugin_sandbox_impl.dart';

/// Upper bound for a single platform-backed startup step.
///
/// Startup continues with its safe defaults when a step exceeds this, because a
/// stalled native call must never be able to leave the app with a window that
/// paints nothing (the grey screen).
const _startupStepTimeout = Duration(seconds: 2);

void main() {
  StartupDiagnostics().recordDartStartup();

  StartupRunZone.run(() async {
    WidgetsFlutterBinding.ensureInitialized();
    StartupDiagnostics().recordBindingInitialized();

    // Mirror framework debug output into the in-app log collector so the Debug
    // Console can surface it for bug reports. LogCollector re-emits through
    // dart:developer, so console output is preserved.
    debugPrint = (String? message, {int? wrapWidth}) {
      if (message != null) {
        LogCollector().log(message, tag: 'FLUTTER');
      }
    };

    // Resolve the hardware profile before anything allocates a cache, so the
    // image cache and list windows below are already sized for this device.
    // Reading it first also keeps the measurement off the first frame.
    //
    // Bounded: this is a platform round-trip. A reply that never arrives used
    // to keep the app from calling runApp(), which is exactly what the grey
    // screen looked like, so time out and keep the safe defaults.
    await DeviceProfile.load().timeout(
      _startupStepTimeout,
      onTimeout: () => DeviceProfile.current,
    );
    StartupDiagnostics().recordDeviceProfileLoaded();

    // Initialize media_kit. This loads the native player library, which can
    // fail on old ARM devices; losing playback is bad, but losing the whole UI
    // is worse, so record the failure and keep starting up.
    try {
      MediaKit.ensureInitialized();
      StartupDiagnostics().recordMediaKitInitialized();
    } catch (error, stack) {
      StartupDiagnostics().recordStartupStepFailed(
          'MediaKit.ensureInitialized()', error, stack);
    }

    // Decoded-image cache budget, scaled to the device (32 MB on a 2 GB phone,
    // 200 MB on a flagship). Holding 200 MB of bitmaps on a low-RAM device is
    // what triggers the low-memory killer mid-scroll.
    PaintingBinding.instance.imageCache.maximumSizeBytes =
        AppPerf.imageCacheBytes;
    StartupDiagnostics().recordImageCacheConfigured();

    Bloc.observer = AppBlocObserver();

    // Initialize GetIt and register dependencies. Registration is synchronous
    // and constructs nothing, so it is safe to require it before runApp():
    // MyApp.build resolves its blocs from GetIt on the very first build.
    configureInjection();
    StartupDiagnostics().recordInjectionConfigured();

    // Wire up the plugin subsystem for the Settings plugin-permissions UI.
    // PluginPermissionService is already registered by injectable (Phase 6.6).
    // PluginManager is not auto-generated by injectable (it is constructed by
    // the host from its dependencies), so register it manually here so that
    // getIt<PluginManager>() used by the permissions section/screen resolves in
    // production. PluginSandbox is likewise constructed by the host.
    getIt.registerLazySingleton<PluginSandbox>(
      () => PluginSandboxImpl(),
    );
    getIt.registerLazySingleton<PluginManager>(
      () => PluginManagerImpl(
        loader: getIt<PluginLoader>(),
        registry: getIt<PluginExtensionRegistry>(),
        sandbox: getIt<PluginSandbox>(),
      ),
    );
    StartupDiagnostics().recordPluginSubsystemWired();

    // Everything that needs vyplay.db is started after the first frame
    // instead of gating it; see _restorePersistedStartupState().
    unawaited(_restorePersistedStartupState());

    StartupDiagnostics().recordRunAppScheduled();
    runApp(const MyApp());
  });
}

/// Startup work that needs the local database: the first open (and migration)
/// of `vyplay.db`, the saved repeat mode, resuming downloads a previous process
/// left behind, and the DeArrow preference.
///
/// This deliberately runs *after* `runApp()`. Opening SQLite is the slowest and
/// most failure-prone step of startup — drift first dlopens `libsqlite3.so` and,
/// if that fails, retries through a platform channel that loads the library in
/// Java — and while it ran before the first frame, a throw or a stall there left
/// the process with no UI at all: the window stayed grey and so did its Recent
/// Apps thumbnail. None of it is needed to draw, so it can never again decide
/// whether the app opens.
Future<void> _restorePersistedStartupState() async {
  try {
    await SettingImpl.initializeDB().timeout(_startupStepTimeout);
    StartupDiagnostics().recordSettingsDbInitialized();

    // Restore the saved repeat mode and keep it persisted from here on. The
    // queue takes a hook rather than touching the database itself.
    final queue = PlaybackQueue();
    final savedQueueRepeatMode = await AppDatabase.instance
        .getSetting(repeatModeKey)
        .timeout(const Duration(seconds: 5));
    queue.restoreQueueRepeatMode(QueueRepeatMode.values.firstWhere(
      (mode) => mode.name == savedQueueRepeatMode,
      orElse: () => QueueRepeatMode.off,
    ));
    queue.onQueueRepeatModeChanged = (mode) =>
        AppDatabase.instance.setSetting(repeatModeKey, mode.name);
  } catch (error, stack) {
    // Keep the defaults above (repeat mode stays off). Settings and saved data
    // still load through their own error states on the splash screen.
    StartupDiagnostics().recordStartupStepFailed(
        'database startup (vyplay.db)', error, stack);
  }

  // Downloads owned by a previous process are dead rows: nothing will finish
  // them, so resume the newest few now. Bounded to keep launch traffic sane.
  try {
    unawaited(getIt<DownloadService>().resumeInterruptedDownloads(
      onProgress: (_) {},
      onComplete: (_) {},
      onError: (_, __) {},
    ));
    StartupDiagnostics().recordDownloadResumeKickedOff();
  } catch (error, stack) {
    StartupDiagnostics().recordStartupStepFailed(
        'DownloadService.resumeInterruptedDownloads()', error, stack);
  }

  // Pick up the persisted DeArrow preference so cards can replace clickbait
  // titles/thumbnails as soon as they are built.
  try {
    unawaited(DeArrowService().syncFromSettings());
    StartupDiagnostics().recordDeArrowSyncKickedOff();
  } catch (error, stack) {
    StartupDiagnostics().recordStartupStepFailed(
        'DeArrowService.syncFromSettings()', error, stack);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Initialize services after the first frame
    // This ensures the Activity is fully attached and can show permission dialogs
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StartupDiagnostics().recordFirstFrameRendered();
      StartupDiagnostics().recordPostFrameServicesInitialized();
      DownloadNotificationService().initialize();
      // Initialize audio service for background playback notification controls
      initAudioService();
      // Pause playback when the sleep timer finishes. This listener used to be
      // defined but never registered, so the timer counted down silently.
      VyPlayAudioHandler.initializeSleepTimerListener();

      // Background work below is not needed for the first frame, and on a
      // low-RAM device starting it immediately competes with the initial
      // layout and image decoding for CPU. Give the UI a moment to settle
      // first; the check is throttled internally anyway.
      const settle = Duration(milliseconds: 900);
      Timer(settle, () {
        // Look for new uploads from subscribed channels. Self-throttling and a
        // no-op unless the user turned notifications on.
        SubscriptionNotifier().checkForNewVideos();

        // Make sure the periodic background job exists. WorkManager keeps it
        // across reboots, but a fresh install or an app update needs it
        // registered again; `keep` makes this call idempotent.
        SubscriptionNotifier().loadEnabled().then((enabled) async {
          if (enabled) await BackgroundPollingService.instance.schedule();
        });
      });
    });
    StartupDiagnostics().recordFirstFrameCallbackScheduled();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // Dispose the global player when app is closing
    GlobalPlayerController().disposePlayer();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // When app is detached (being destroyed), stop the player to prevent crash
    if (state == AppLifecycleState.detached) {
      GlobalPlayerController().disposePlayer();
    }
    // Returning to the foreground is the only chance to poll for new uploads,
    // since there is no background job. The check throttles itself.
    if (state == AppLifecycleState.resumed) {
      SubscriptionNotifier().checkForNewVideos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<TrendingBloc>()),
        BlocProvider(create: (context) => getIt<WatchBloc>()),
        BlocProvider(create: (context) => getIt<SettingsBloc>()),
        BlocProvider(create: (context) => getIt<SavedBloc>()),
        BlocProvider(create: (context) => getIt<SubscribeBloc>()),
        BlocProvider(create: (context) => getIt<DownloadBloc>()),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (previous, current) =>
            previous.themeMode != current.themeMode ||
            previous.defaultLanguage != current.defaultLanguage,
        builder: (context, state) {
          final mode = state.themeMode;

          if (mode == 'dynamic') {
            return DynamicColorBuilder(
              builder: (lightDynamic, darkDynamic) {
                return MaterialApp.router(
                  title: AppInfo.myApp.name,
                  theme: AppTheme.dynamicTheme(lightDynamic ?? ColorScheme.fromSeed(seedColor: Colors.blue)),
                  darkTheme: AppTheme.dynamicTheme(darkDynamic ?? const ColorScheme.dark()),
                  themeMode: ThemeMode.system,
                  debugShowCheckedModeBanner: false,
                  routerConfig: router,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    S.delegate,
                  ],
                  supportedLocales: supportedLocales,
                  locale: Locale(state.defaultLanguage),
                  builder: (context, child) {
                    return GlobalPipOverlay(
                      child: child ?? const SizedBox.shrink(),
                    );
                  },
                );
              },
            );
          }

          final isOled = mode == 'oled';
          return MaterialApp.router(
            title: AppInfo.myApp.name,
            theme: AppTheme.lightTheme,
            darkTheme: isOled ? AppTheme.oledTheme : AppTheme.darkTheme,
            themeMode: _getThemeMode(mode),
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              S.delegate,
            ],
            supportedLocales: supportedLocales,
            locale: Locale(state.defaultLanguage),
            builder: (context, child) {
              return GlobalPipOverlay(
                child: child ?? const SizedBox.shrink(),
              );
            },
          );
        },
      ),
    );
  }

  ThemeMode _getThemeMode(String themeMode) {
    switch (themeMode) {
      case 'dark':
      case 'oled':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}
