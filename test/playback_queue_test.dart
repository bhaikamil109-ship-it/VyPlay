import 'package:flutter_test/flutter_test.dart';
import 'package:fluxtube/core/player/playback_queue.dart';
import 'package:fluxtube/domain/watch/models/basic_info.dart';

VideoBasicInfo video(String id) => VideoBasicInfo(id: id, title: 'Video $id');

void main() {
  // PlaybackQueue is an app-wide singleton, so each test starts from a known
  // state rather than inheriting the previous test's queue.
  late PlaybackQueue queue;

  setUp(() {
    queue = PlaybackQueue();
    queue
      ..clear()
      ..restoreQueueRepeatMode(QueueRepeatMode.off)
      ..onQueueRepeatModeChanged = null;
  });

  group('repeat mode', () {
    test('defaults to off', () {
      expect(queue.repeatMode, QueueRepeatMode.off);
    });

    test('cycles off → all → one → off', () {
      expect(queue.cycleQueueRepeatMode(), QueueRepeatMode.all);
      expect(queue.cycleQueueRepeatMode(), QueueRepeatMode.one);
      expect(queue.cycleQueueRepeatMode(), QueueRepeatMode.off);
    });

    test('notifies listeners and persists a change', () async {
      var notifications = 0;
      queue.addListener(() => notifications++);

      final persisted = <QueueRepeatMode>[];
      queue.onQueueRepeatModeChanged = (mode) async => persisted.add(mode);

      queue.setQueueRepeatMode(QueueRepeatMode.all);

      expect(notifications, 1);
      await Future<void>.delayed(Duration.zero);
      expect(persisted, [QueueRepeatMode.all]);
    });

    test('setting the current mode again is a no-op', () async {
      var notifications = 0;
      queue.addListener(() => notifications++);

      final persisted = <QueueRepeatMode>[];
      queue.onQueueRepeatModeChanged = (mode) async => persisted.add(mode);

      queue.setQueueRepeatMode(QueueRepeatMode.all);
      await Future<void>.delayed(Duration.zero);
      queue.setQueueRepeatMode(QueueRepeatMode.all);
      await Future<void>.delayed(Duration.zero);

      expect(notifications, 1);
      expect(persisted, [QueueRepeatMode.all]);
    });

    test('restoring the saved mode does not write it back', () async {
      final persisted = <QueueRepeatMode>[];
      queue.onQueueRepeatModeChanged = (mode) async => persisted.add(mode);

      queue.restoreQueueRepeatMode(QueueRepeatMode.one);

      await Future<void>.delayed(Duration.zero);
      expect(queue.repeatMode, QueueRepeatMode.one);
      expect(persisted, isEmpty);
    });
  });

  group('nextAfter honours the repeat mode', () {
    test('a user queue stops at its last entry when repeat is off', () {
      queue.setQueue([video('a'), video('b')]);
      expect(queue.nextAfter('b'), isNull);
    });

    test('repeat all wraps a user queue back to its first entry', () {
      queue.setQueue([video('a'), video('b')]);
      queue.setQueueRepeatMode(QueueRepeatMode.all);
      expect(queue.nextAfter('b')?.id, 'a');
    });

    test('advances normally in the middle of the queue', () {
      queue.setQueue([video('a'), video('b'), video('c')]);
      expect(queue.nextAfter('a')?.id, 'b');
      expect(queue.nextAfter('b')?.id, 'c');
    });

    test('repeat one leaves queue order alone', () {
      queue.setQueue([video('a'), video('b')]);
      queue.setQueueRepeatMode(QueueRepeatMode.one);
      // Repeat-one is applied by the player itself; the queue still reports the
      // following video so an explicit "next" tap advances.
      expect(queue.nextAfter('a')?.id, 'b');
    });

    test('an autoplay queue keeps wrapping regardless of repeat', () {
      queue.seedFromRelated(current: video('a'), related: [video('b')]);
      expect(queue.nextAfter('b')?.id, 'a');
    });
  });
}
