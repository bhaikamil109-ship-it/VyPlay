import 'dart:developer';
import 'dart:io';

import 'package:vyplay/core/services/background_poll_worker.dart';
import 'package:workmanager/workmanager.dart';

/// What the app needs from a periodic-work backend.
///
/// Kept as an interface so the scheduling rules can be tested without the
/// WorkManager plugin (which needs a real Android/iOS runtime).
abstract class BackgroundPollingScheduler {
  /// Registers the periodic job. Safe to call repeatedly.
  Future<bool> schedule();

  /// Removes the periodic job.
  Future<bool> cancel();
}

/// Thin seam over the WorkManager plugin, also injected in tests.
abstract class WorkScheduler {
  Future<void> initialize();

  Future<void> registerPeriodic({
    required String uniqueName,
    required String taskName,
    required Duration frequency,
    required bool requiresNetwork,
  });

  Future<void> cancel(String uniqueName);
}

/// Real WorkManager implementation.
class WorkmanagerScheduler implements WorkScheduler {
  WorkmanagerScheduler({bool? isSupported})
      : _isSupported = isSupported ?? (Platform.isAndroid || Platform.isIOS);

  final bool _isSupported;
  bool _initialized = false;

  @override
  Future<void> initialize() async {
    if (!_isSupported || _initialized) return;
    await Workmanager().initialize(subscriptionPollDispatcher);
    _initialized = true;
  }

  @override
  Future<void> registerPeriodic({
    required String uniqueName,
    required String taskName,
    required Duration frequency,
    required bool requiresNetwork,
  }) async {
    if (!_isSupported) return;
    await initialize();
    await Workmanager().registerPeriodicTask(
      uniqueName,
      taskName,
      frequency: frequency,
      // `keep` rather than `update`: re-registering on every app start must not
      // restart the period, otherwise a user who opens the app often would
      // never reach the next scheduled run.
      existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
      constraints: Constraints(
        networkType:
            requiresNetwork ? NetworkType.connected : NetworkType.notRequired,
      ),
    );
  }

  @override
  Future<void> cancel(String uniqueName) async {
    if (!_isSupported) return;
    await initialize();
    await Workmanager().cancelByUniqueName(uniqueName);
  }
}

/// Schedules the periodic "check subscriptions for new uploads" job.
///
/// The job calls [SubscriptionNotifier.checkForNewVideos] from a background
/// isolate (see `background_poll_worker.dart`), so uploads are detected while
/// the app is closed, not only while it is on screen.
class BackgroundPollingService implements BackgroundPollingScheduler {
  BackgroundPollingService({WorkScheduler? scheduler, bool? isSupported})
      : _scheduler = scheduler ?? WorkmanagerScheduler(isSupported: isSupported),
        _isSupported = isSupported ?? (Platform.isAndroid || Platform.isIOS);

  static final BackgroundPollingService instance = BackgroundPollingService();

  /// WorkManager key; stable so enabling twice cannot create two jobs.
  static const String uniqueName = 'vyplay-subscription-poll';

  /// Task name handed to the dispatcher.
  static const String taskName = 'subscriptionPollTask';

  /// Android's floor for periodic work is 15 minutes; six hours keeps the
  /// extractor traffic modest while still catching a day's uploads promptly.
  static const Duration frequency = Duration(hours: 6);

  final WorkScheduler _scheduler;
  final bool _isSupported;

  @override
  Future<bool> schedule() async {
    if (!_isSupported) return false;
    try {
      await _scheduler.registerPeriodic(
        uniqueName: uniqueName,
        taskName: taskName,
        frequency: frequency,
        requiresNetwork: true,
      );
      log('[BackgroundPoll] scheduled every ${frequency.inHours}h');
      return true;
    } catch (e) {
      // Missing manifest entries or an OS restriction; the foreground checks
      // keep working, so this must not surface as a crash.
      log('[BackgroundPoll] schedule failed: $e');
      return false;
    }
  }

  @override
  Future<bool> cancel() async {
    if (!_isSupported) return false;
    try {
      await _scheduler.cancel(uniqueName);
      log('[BackgroundPoll] cancelled');
      return true;
    } catch (e) {
      log('[BackgroundPoll] cancel failed: $e');
      return false;
    }
  }
}
