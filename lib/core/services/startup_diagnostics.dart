import 'dart:async';
import 'dart:developer' as dev;

import '../perf/app_perf.dart';
import 'log_collector.dart';

/// Diagnostic logger for startup tracing.
///
/// Logs every stage of the app startup sequence with millisecond timestamps
/// and full stack traces on exceptions. Output goes to:
///  - dart:developer.log (visible in Android logcat as Flutter/Dart messages)
///  - LogCollector (in-app debug console for bug reports)
///
/// This is a temporary diagnostic aid, not a permanent feature. Remove after
/// the root cause is identified.
class StartupDiagnostics {
  static final StartupDiagnostics _instance = StartupDiagnostics._();
  factory StartupDiagnostics() => _instance;
  StartupDiagnostics._();

  final int _startMs = DateTime.now().millisecondsSinceEpoch;
  bool _firstFrameLogged = false;
  bool _screenHomeLogged = false;

  int _elapsedMs() => DateTime.now().millisecondsSinceEpoch - _startMs;

  /// Log a startup event with elapsed time and optional stack trace.
  void log(String stage, {String? error, StackTrace? stack}) {
    final elapsed = _elapsedMs();
    final prefix =
        '[${elapsed.toString().padLeft(5)}ms] [STARTUP] $stage';
    if (error != null) {
      dev.log(prefix, name: 'VyPlay.Startup');
      dev.log('  ERROR: $error', name: 'VyPlay.Startup');
      if (stack != null) {
        for (final frame in stack.toString().split('\n')) {
          dev.log('  $frame', name: 'VyPlay.Startup');
        }
      } else {
        dev.log('  (no stack trace available)', name: 'VyPlay.Startup');
      }
    } else {
      dev.log(prefix, name: 'VyPlay.Startup');
    }
    // Also funnel into the in-app LogCollector so the Debug Console can
    // surface it in bug reports captured on-device.
    try {
      LogCollector().log(prefix, tag: 'STARTUP');
      if (error != null) {
        LogCollector().log('  ERROR: $error', tag: 'STARTUP');
        if (stack != null) {
          for (final frame in stack.toString().split('\n')) {
            LogCollector().log('  $frame', tag: 'STARTUP');
          }
        }
      }
    } catch (_) {
      // LogCollector itself must not throw and break the startup path.
    }
  }

  /// Called from main() right at the top, before any async work.
  void recordDartStartup() {
    log('Dart main() entered — Flutter binding not yet ensured');
  }

  /// Called after WidgetsFlutterBinding.ensureInitialized().
  void recordBindingInitialized() {
    log('WidgetsFlutterBinding.ensureInitialized() complete');
  }

  /// Called after DeviceProfile.load().
  void recordDeviceProfileLoaded() {
    log('DeviceProfile.load() complete');
  }

  /// Called after MediaKit.ensureInitialized().
  void recordMediaKitInitialized() {
    log('MediaKit.ensureInitialized() complete');
  }

  /// Called after image cache budget is set.
  void recordImageCacheConfigured() {
    log('Image cache maxSizeBytes configured: ${AppPerf.imageCacheBytes}');
  }

  /// Called after SettingImpl.initializeDB().
  void recordSettingsDbInitialized() {
    log('SettingImpl.initializeDB() complete');
  }

  /// Called after configureInjection() returns.
  void recordInjectionConfigured() {
    log('configureInjection() (GetIt) complete — all lazy singletons registered');
  }

  /// Called after plugin subsystem (PluginManager / PluginSandbox) is wired.
  void recordPluginSubsystemWired() {
    log('Plugin subsystem (PluginManager + PluginSandbox) registered in GetIt');
  }

  /// Called after interrupted downloads resume is kicked off.
  void recordDownloadResumeKickedOff() {
    log('Interrupted download resume kicked off (fire-and-forget via unawaited)');
  }

  /// Called after DeArrow sync is kicked off.
  void recordDeArrowSyncKickedOff() {
    log('DeArrow sync from settings kicked off (fire-and-forget via unawaited)');
  }

  /// Called right before runApp(MyApp).
  void recordRunAppScheduled() {
    log('runApp(MyApp) about to be called — Flutter tree will attach');
  }

  /// Called from MyApp/_MyAppState.initState after the first frame callback
  /// is scheduled.
  void recordFirstFrameCallbackScheduled() {
    log('Post-frame callback scheduled (DownloadNotificationService, audio, '
        'sleep timer, background polling)');
  }

  /// Called from the post-frame callback after services initialize.
  void recordPostFrameServicesInitialized() {
    log('Post-frame services initialized: notifications, audio handler, '
        'sleep timer listener');
  }

  /// Called when the first frame is actually rendered.
  void recordFirstFrameRendered() {
    if (_firstFrameLogged) return;
    _firstFrameLogged = true;
    log('FIRST FRAME RENDERED — Flutter UI is now on screen');
  }

  /// Called when GoRouter builds the initial route (SplashScreen).
  void recordInitialRouteBuilt() {
    log('GoRouter initial route built: SplashScreen at "/"');
  }

  /// Called when SplashScreen._initializeSettings runs.
  void recordSplashInitializedSettings() {
    log('SplashScreen._initializeSettings() — SettingsEvent.initialize() added to SettingsBloc');
  }

  /// Called when SplashScreen navigates to /main (MainNavigation).
  void recordNavigatedToMain() {
    log('SplashScreen navigated to /main (MainNavigation) via Router.neglect + context.goNamed');
  }

  /// Called when MainNavigation initState runs.
  void recordMainNavigationInitState() {
    log('MainNavigation.initState — DeepLinkHandler init scheduled post-frame');
  }

  /// Called when MainNavigation builds its first scaffold with ScreenHome.
  void recordMainNavigationBuilt() {
    log('MainNavigation built — Scaffold with SafeArea + IndexedStack (tab 0 = home)');
  }

  /// Called when ScreenHome.build is invoked.
  void recordScreenHomeBuilt() {
    if (_screenHomeLogged) return;
    _screenHomeLogged = true;
    log('ScreenHome.build invoked — SafeArea + NestedScrollView assembled');
  }

  /// Called when ScreenHome triggers the first data load (trending / feed).
  void recordScreenHomeFirstLoadRequested() {
    log('ScreenHome first data load requested (TrendingEvent / personalized feed)');
  }

  /// Called when Flutter framework emits an error (e.g. widget build error,
  /// layout failure). Captures the full Flutter framework error report.
  void recordFrameworkError(String description, StackTrace? stack) {
    log('FLUTTER FRAMEWORK ERROR — $description',
        error: description, stack: stack);
  }

  /// Called when a single startup step failed or timed out but startup kept
  /// going with its defaults (e.g. the database could not be opened). Records
  /// the step, the error and the stack so the next device run names it.
  void recordStartupStepFailed(String step, Object error, StackTrace stack) {
    log('STARTUP STEP FAILED — $step (startup continued with defaults)',
        error: '$error', stack: stack);
  }

  /// Called when an uncaught Dart exception reaches the zone (e.g. in main()).
  void recordUncaughtException(Object error, StackTrace stack) {
    log('UNCAUGHT DART EXCEPTION in main() — ${error.runtimeType}: $error',
        error: '$error', stack: stack);
  }

  /// Called when the native Android side reports an exception via a method
  /// channel or logcat bridge. Preserves the full native stack if available.
  void recordNativeException(String source, String message,
      [String? nativeStack]) {
    log('NATIVE ANDROID EXCEPTION from $source — $message',
        error: message,
        stack: nativeStack != null ? StackTrace.fromString(nativeStack) : null);
  }

  /// Dump the full startup timeline to logcat for offline analysis.
  /// Call this from a debug action or after a crash recovery.
  void dumpTimeline() {
    log('=== STARTUP TIMELINE DUMP ===');
    try {
      final entries = LogCollector().entries
          .where((e) => e.tag == 'STARTUP')
          .toList();
      for (final entry in entries) {
        dev.log(entry.formatted, name: 'VyPlay.Startup.Dump');
      }
    } catch (_) {
      dev.log('  (could not read LogCollector entries)',
          name: 'VyPlay.Startup.Dump');
    }
    log('=== END TIMELINE DUMP ===');
  }
}

/// Minimal zone wrapper that installs an error handler and records the first
/// frame. Kept intentionally small so it cannot itself be the cause of a
/// grey screen.
class StartupRunZone {
  static void run(void Function() body) {
    runZonedGuarded(
      body,
      (Object error, StackTrace stack) {
        StartupDiagnostics().recordUncaughtException(error, stack);
      },
    );
  }
}
