import 'dart:developer' as dev;

import 'package:flutter/widgets.dart';
import 'package:vyplay/core/services/subscription_notifier.dart';
import 'package:workmanager/workmanager.dart';

/// Entry point WorkManager calls when the periodic subscription task fires.
///
/// This runs in its own Flutter engine, with no Activity and no UI, which is
/// what makes the check a real background check rather than a foreground one.
/// It deliberately reuses [SubscriptionNotifier] so notifications are produced
/// by exactly the same code path as the in-app check: same seen-video
/// bookkeeping, same per-channel cap, same notification channel.
///
/// The `vm:entry-point` pragma is required — without it the tree shaker removes
/// this function from release builds and the task silently fails.
@pragma('vm:entry-point')
void subscriptionPollDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // The background isolate has no bindings yet; plugins (Drift, method
    // channels) need them before SubscriptionNotifier can touch the database.
    WidgetsFlutterBinding.ensureInitialized();

    try {
      final notifier = SubscriptionNotifier();
      final enabled = await notifier.loadEnabled();
      if (!enabled) {
        // The user turned the feature off; stop doing work until re-enabled.
        return true;
      }

      final notified = await notifier.checkForNewVideos(force: true);
      await notifier.recordBackgroundRun(notified: notified);

      dev.log(
        '[BackgroundPoll] task "$task" finished: $notified new notification(s)',
        name: 'BackgroundPoll',
      );
      return true;
    } catch (e, stack) {
      // Record the failure so the Settings tile can report it, then return
      // true: a periodic task that reports failure is retried with backoff and
      // can spiral. The next scheduled run is the retry.
      dev.log('[BackgroundPoll] failed: $e\n$stack', name: 'BackgroundPoll');
      try {
        await SubscriptionNotifier().recordBackgroundRun(
          notified: 0,
          error: e.toString(),
        );
      } catch (_) {
        // Nothing else can be done from a background isolate.
      }
      return true;
    }
  });
}
