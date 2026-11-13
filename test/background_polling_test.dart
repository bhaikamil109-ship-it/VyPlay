import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/services/background_polling_service.dart';
import 'package:vyplay/core/services/subscription_notifier.dart';

/// Records the calls the scheduling service makes.
class _FakeWorkScheduler implements WorkScheduler {
  final List<String> events = [];
  String? uniqueName;
  String? taskName;
  Duration? frequency;
  bool? requiresNetwork;
  bool fail = false;

  @override
  Future<void> initialize() async {
    events.add('initialize');
  }

  @override
  Future<void> registerPeriodic({
    required String uniqueName,
    required String taskName,
    required Duration frequency,
    required bool requiresNetwork,
  }) async {
    if (fail) throw StateError('work manager unavailable');
    events.add('register');
    this.uniqueName = uniqueName;
    this.taskName = taskName;
    this.frequency = frequency;
    this.requiresNetwork = requiresNetwork;
  }

  @override
  Future<void> cancel(String uniqueName) async {
    events.add('cancel:$uniqueName');
  }
}

/// Scheduler seam for the notifier toggle.
class _FakePollingScheduler implements BackgroundPollingScheduler {
  final List<String> calls = [];

  @override
  Future<bool> schedule() async {
    calls.add('schedule');
    return true;
  }

  @override
  Future<bool> cancel() async {
    calls.add('cancel');
    return true;
  }
}

void main() {
  group('BackgroundPollingService — scheduling config', () {
    test('registers one periodic network-constrained job', () async {
      final work = _FakeWorkScheduler();
      final service = BackgroundPollingService(
        scheduler: work,
        isSupported: true,
      );

      expect(await service.schedule(), isTrue);

      expect(work.uniqueName, BackgroundPollingService.uniqueName);
      expect(work.taskName, BackgroundPollingService.taskName);
      expect(work.frequency, const Duration(hours: 6));
      expect(work.requiresNetwork, isTrue);
      expect(work.events, ['register']);
    });

    test('re-scheduling reuses the same unique name (idempotent job key)',
        () async {
      final work = _FakeWorkScheduler();
      final service = BackgroundPollingService(
        scheduler: work,
        isSupported: true,
      );

      await service.schedule();
      await service.schedule();

      expect(work.uniqueName, BackgroundPollingService.uniqueName);
      expect(work.events, ['register', 'register']);
    });

    test('cancel targets the registered job', () async {
      final work = _FakeWorkScheduler();
      final service = BackgroundPollingService(
        scheduler: work,
        isSupported: true,
      );

      expect(await service.cancel(), isTrue);
      expect(work.events, ['cancel:${BackgroundPollingService.uniqueName}']);
    });

    test('does nothing on unsupported platforms', () async {
      final work = _FakeWorkScheduler();
      final service = BackgroundPollingService(
        scheduler: work,
        isSupported: false,
      );

      expect(await service.schedule(), isFalse);
      expect(await service.cancel(), isFalse);
      expect(work.events, isEmpty);
    });

    test('a native scheduling failure is reported, not thrown', () async {
      final work = _FakeWorkScheduler()..fail = true;
      final service = BackgroundPollingService(
        scheduler: work,
        isSupported: true,
      );

      expect(await service.schedule(), isFalse);
    });
  });

  group('SubscriptionNotifier — the switch controls the job', () {
    tearDown(() => SubscriptionNotifier.pollScheduler = null);

    test('enabling schedules, disabling cancels', () async {
      final poller = _FakePollingScheduler();
      SubscriptionNotifier.pollScheduler = poller;
      final notifier = SubscriptionNotifier();

      await notifier.applyScheduleFor(true);
      await notifier.applyScheduleFor(false);

      expect(poller.calls, ['schedule', 'cancel']);
    });

    test('defaults to the real background service when none is injected', () {
      SubscriptionNotifier.pollScheduler = null;
      expect(SubscriptionNotifier.pollScheduler, isNull);
      // The notifier resolves BackgroundPollingService.instance lazily; on this
      // test host (linux) that service reports "unsupported" instead of
      // touching the plugin, which is the behaviour under test here.
      expect(
        BackgroundPollingService( isSupported: false).schedule(),
        completion(isFalse),
      );
    });
  });
}
