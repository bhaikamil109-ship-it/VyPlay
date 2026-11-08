// Player controller + playback queue tests.
//
// Two layers are covered here:
//
//  * `PlaybackQueue` — pure Dart, exercised directly.
//  * `GlobalPlayerController` — the singleton eagerly builds a media_kit
//    `Player`, which needs the native library and therefore cannot run on a
//    host machine. `GlobalPlayerController.forTesting()` builds the same
//    object without touching media_kit or the PiP channel, so the state
//    machine, the clamping helpers and dispose-safety are all testable.
//
// The platform channels the controller talks to (`com.kamil.vyplay/pip`
// and the audio-service channels) are stubbed in `setUpAll` so nothing tries
// to reach a real device.

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/player/global_player_controller.dart';
import 'package:vyplay/core/player/playback_queue.dart';
import 'package:vyplay/domain/watch/models/basic_info.dart';

VideoBasicInfo _video(String id, {String? title}) =>
    VideoBasicInfo(id: id, title: title ?? 'Video $id');

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    for (final channel in const [
      'com.kamil.vyplay/pip',
      'com.kamil.vyplay/exoplayer',
      'com.kamil.vyplay/newpipe_exoplayer_control',
      'com.ryanheise.audio_service.client.methods',
      'com.ryanheise.audio_service.client.updates',
      'com.ryanheise.audio_service.client.state',
    ]) {
      messenger.setMockMethodCallHandler(MethodChannel(channel), (_) async => null);
    }
  });

  // ==========================================================================
  // PlaybackQueue
  // ==========================================================================
  group('PlaybackQueue — next / previous', () {
    late PlaybackQueue queue;

    setUp(() {
      queue = PlaybackQueue();
      queue.clear();
    });

    test('an empty queue has no next and no previous', () {
      expect(queue.isEmpty, isTrue);
      expect(queue.hasNext, isFalse);
      expect(queue.hasPrevious, isFalse);
      expect(queue.current, isNull);
      expect(queue.next, isNull);
    });

    test('playNext advances the cursor', () {
      queue.setQueue([_video('a'), _video('b'), _video('c')]);
      expect(queue.current!.id, 'a');

      queue.playNext();
      expect(queue.current!.id, 'b');

      queue.playNext();
      expect(queue.current!.id, 'c');
    });

    test('playNext at the end of a user queue does not move', () {
      queue.setQueue([_video('a'), _video('b')]);
      queue.playNext();
      expect(queue.current!.id, 'b');

      queue.playNext(); // already last
      expect(queue.current!.id, 'b');
      expect(queue.hasNext, isFalse);
    });

    test('hasPrevious is false on the first entry', () {
      queue.setQueue([_video('a'), _video('b')]);
      expect(queue.hasPrevious, isFalse);
      queue.playNext();
      expect(queue.hasPrevious, isTrue);
    });

    test('moveTo jumps to an index and clamps out-of-range input', () {
      queue.setQueue([_video('a'), _video('b'), _video('c')]);

      queue.moveTo(2);
      expect(queue.current!.id, 'c');

      queue.moveTo(99); // ignored
      expect(queue.current!.id, 'c');

      queue.moveTo(-5); // ignored
      expect(queue.current!.id, 'c');
    });

    test('setQueue clamps a start index past the end', () {
      queue.setQueue([_video('a'), _video('b')], startIndex: 10);
      expect(queue.currentIndex, 1);
      expect(queue.current!.id, 'b');
    });

    test('setQueue with a negative start index lands on the first entry', () {
      queue.setQueue([_video('a'), _video('b')], startIndex: -3);
      expect(queue.currentIndex, 0);
    });

    test('setQueue with an empty list resets the cursor', () {
      queue.setQueue([_video('a')]);
      queue.setQueue([]);
      expect(queue.isEmpty, isTrue);
      expect(queue.currentIndex, -1);
      expect(queue.current, isNull);
    });
  });

  group('PlaybackQueue — end of queue behaviour', () {
    late PlaybackQueue queue;

    setUp(() {
      queue = PlaybackQueue();
      queue.clear();
    });

    test('a user queue stops at its last entry', () {
      queue.setQueue([_video('a'), _video('b')]);
      expect(queue.isUserManaged, isTrue);
      expect(queue.nextAfter('b'), isNull);
    });

    test('an autoplay queue wraps around at the end', () {
      queue.seedFromRelated(
        current: _video('a'),
        related: [_video('b'), _video('c')],
      );
      expect(queue.isUserManaged, isFalse);
      expect(queue.nextAfter('c')!.id, 'a');
    });

    test('nextAfter returns the following entry in the middle', () {
      queue.setQueue([_video('a'), _video('b'), _video('c')]);
      expect(queue.nextAfter('a')!.id, 'b');
      expect(queue.nextAfter('b')!.id, 'c');
    });

    test('nextAfter with a null id returns the head', () {
      queue.setQueue([_video('a'), _video('b')]);
      expect(queue.nextAfter(null)!.id, 'a');
    });

    test('nextAfter for a video outside the queue restarts autoplay', () {
      queue.seedFromRelated(current: _video('a'), related: [_video('b')]);
      expect(queue.nextAfter('not-in-queue')!.id, 'a');
    });

    test('seeding does not overwrite a user-built queue', () {
      queue.setQueue([_video('a'), _video('b')]);
      queue.seedFromRelated(
        current: _video('a'),
        related: [_video('x'), _video('y')],
      );
      expect(queue.queue.map((v) => v.id), ['a', 'b']);
    });

    test('seeding deduplicates the current video out of related', () {
      queue.seedFromRelated(
        current: _video('a'),
        related: [_video('a'), _video('b'), _video('b')],
      );
      expect(queue.queue.map((v) => v.id), ['a', 'b']);
    });

    test('seeding ignores an empty current id', () {
      queue.seedFromRelated(current: _video(''), related: [_video('b')]);
      expect(queue.isEmpty, isTrue);
    });
  });

  group('PlaybackQueue — mutation', () {
    late PlaybackQueue queue;

    setUp(() {
      queue = PlaybackQueue();
      queue.clear();
    });

    test('addNext inserts right after the cursor', () {
      queue.setQueue([_video('a'), _video('b')]);
      queue.addNext(_video('x'));
      expect(queue.queue.map((v) => v.id), ['a', 'x', 'b']);
    });

    test('addNext on an empty queue behaves like add', () {
      queue.addNext(_video('x'));
      expect(queue.queue.map((v) => v.id), ['x']);
      expect(queue.currentIndex, 0);
    });

    test('removing an entry before the cursor shifts it back', () {
      queue.setQueue([_video('a'), _video('b'), _video('c')]);
      queue.moveTo(2);
      queue.removeAt(0);
      expect(queue.current!.id, 'c');
      expect(queue.currentIndex, 1);
    });

    test('removing the current entry keeps the cursor on the slot', () {
      queue.setQueue([_video('a'), _video('b'), _video('c')]);
      queue.moveTo(1);
      queue.removeAt(1);
      expect(queue.current!.id, 'c');
      expect(queue.currentIndex, 1);
    });

    test('removing the last remaining entry resets the queue', () {
      queue.setQueue([_video('a')]);
      queue.removeAt(0);
      expect(queue.isEmpty, isTrue);
      expect(queue.currentIndex, -1);
      expect(queue.isUserManaged, isFalse);
    });

    test('removing an out-of-range index is a no-op', () {
      queue.setQueue([_video('a')]);
      queue.removeAt(5);
      queue.removeAt(-1);
      expect(queue.queue.length, 1);
    });

    test('clear resets everything', () {
      queue.setQueue([_video('a'), _video('b')]);
      queue.clear();
      expect(queue.isEmpty, isTrue);
      expect(queue.currentIndex, -1);
      expect(queue.isUserManaged, isFalse);
    });

    test('syncCurrent moves the cursor onto a queued video', () {
      queue.setQueue([_video('a'), _video('b'), _video('c')]);
      queue.syncCurrent('c');
      expect(queue.currentIndex, 2);
    });

    test('syncCurrent ignores a video that is not queued', () {
      queue.setQueue([_video('a'), _video('b')]);
      queue.syncCurrent('zzz');
      expect(queue.currentIndex, 0);
    });

    test('shuffle keeps the current video in place', () {
      queue.setQueue([
        _video('a'),
        _video('b'),
        _video('c'),
        _video('d'),
        _video('e'),
      ]);
      queue.moveTo(1);
      queue.shuffle();
      expect(queue.current!.id, 'b');
      expect(queue.queue.first.id, 'a');
      expect(queue.queue.length, 5);
    });

    test('shuffle is a no-op on a queue of two or fewer', () {
      queue.setQueue([_video('a'), _video('b')]);
      queue.shuffle();
      expect(queue.queue.map((v) => v.id), ['a', 'b']);
    });

    test('the exposed queue list is unmodifiable', () {
      queue.setQueue([_video('a')]);
      expect(() => queue.queue.add(_video('b')), throwsUnsupportedError);
    });
  });

  // ==========================================================================
  // GlobalPlayerController — pure helpers
  // ==========================================================================
  group('GlobalPlayerController — seek clamping', () {
    test('a target inside the media is returned unchanged', () {
      expect(
        GlobalPlayerController.clampSeek(
          const Duration(seconds: 30),
          const Duration(minutes: 2),
        ),
        const Duration(seconds: 30),
      );
    });

    test('a target past the duration is clamped to the duration', () {
      expect(
        GlobalPlayerController.clampSeek(
          const Duration(minutes: 10),
          const Duration(minutes: 2),
        ),
        const Duration(minutes: 2),
      );
    });

    test('a negative target is clamped to zero', () {
      expect(
        GlobalPlayerController.clampSeek(
          const Duration(seconds: -5),
          const Duration(minutes: 2),
        ),
        Duration.zero,
      );
    });

    test('an unknown duration only floors the target at zero', () {
      expect(
        GlobalPlayerController.clampSeek(
          const Duration(seconds: 45),
          Duration.zero,
        ),
        const Duration(seconds: 45),
      );
    });

    test('a target exactly at the duration is allowed', () {
      const d = Duration(minutes: 2);
      expect(GlobalPlayerController.clampSeek(d, d), d);
    });
  });

  group('GlobalPlayerController — volume / brightness bounds', () {
    test('values inside 0..1 pass through', () {
      expect(GlobalPlayerController.clampUnit(0.0), 0.0);
      expect(GlobalPlayerController.clampUnit(0.5), 0.5);
      expect(GlobalPlayerController.clampUnit(1.0), 1.0);
    });

    test('values above 1 are clamped to 1', () {
      expect(GlobalPlayerController.clampUnit(1.5), 1.0);
      expect(GlobalPlayerController.clampUnit(99), 1.0);
    });

    test('negative values are clamped to 0', () {
      expect(GlobalPlayerController.clampUnit(-0.2), 0.0);
      expect(GlobalPlayerController.clampUnit(-99), 0.0);
    });

    test('NaN falls back to 0 rather than propagating', () {
      expect(GlobalPlayerController.clampUnit(double.nan), 0.0);
    });
  });

  group('GlobalPlayerController — playback speed', () {
    test('the allowed set is the one the UI offers', () {
      expect(GlobalPlayerController.allowedPlaybackSpeeds,
          [0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0]);
    });

    test('an allowed speed is returned unchanged', () {
      for (final speed in GlobalPlayerController.allowedPlaybackSpeeds) {
        expect(GlobalPlayerController.clampSpeed(speed), speed);
      }
    });

    test('an out-of-range speed snaps to the nearest allowed value', () {
      expect(GlobalPlayerController.clampSpeed(0.1), 0.25);
      expect(GlobalPlayerController.clampSpeed(5.0), 2.0);
      expect(GlobalPlayerController.clampSpeed(-1.0), 0.25);
    });

    test('a speed between two allowed values snaps to the closer one', () {
      expect(GlobalPlayerController.clampSpeed(0.6), 0.5);
      expect(GlobalPlayerController.clampSpeed(0.7), 0.75);
      expect(GlobalPlayerController.clampSpeed(1.1), 1.0);
      expect(GlobalPlayerController.clampSpeed(1.4), 1.5);
    });

    test('NaN falls back to normal speed', () {
      expect(GlobalPlayerController.clampSpeed(double.nan), 1.0);
    });
  });

  // ==========================================================================
  // GlobalPlayerController — state machine
  // ==========================================================================
  group('GlobalPlayerController — state transitions', () {
    late GlobalPlayerController controller;

    setUp(() {
      controller = GlobalPlayerController.forTesting();
    });

    tearDown(() {
      controller.disposePlayer();
    });

    test('a fresh controller has no active player', () {
      expect(controller.hasActivePlayer, isFalse);
      expect(controller.hasActiveMediaKitPlayer, isFalse);
      expect(controller.hasNativeExoPlayer, isFalse);
      expect(controller.currentVideoId, isNull);
      expect(controller.isPlaying, isFalse);
      expect(controller.isBuffering, isFalse);
      expect(controller.isPipMode, isFalse);
    });

    test('a fresh controller reports zero position and duration', () {
      expect(controller.currentPosition, Duration.zero);
      expect(controller.totalDuration, Duration.zero);
      expect(controller.effectiveCurrentPosition, Duration.zero);
      expect(controller.effectiveTotalDuration, Duration.zero);
    });

    test('registering a native session makes it the active player', () {
      controller.registerNativeExoPlayerSession(
        videoId: 'abc',
        quality: '720p',
        fitMode: 'contain',
      );

      expect(controller.hasNativeExoPlayer, isTrue);
      expect(controller.hasActivePlayer, isTrue);
      expect(controller.currentVideoId, 'abc');
      expect(controller.nativeQuality, '720p');
      expect(controller.nativeFitMode, 'contain');
      expect(controller.isNativeVideoLoaded('abc'), isTrue);
      expect(controller.isNativeVideoLoaded('other'), isFalse);
    });

    test('play/pause state follows the native state update', () {
      controller.registerNativeExoPlayerSession(
        videoId: 'abc',
        quality: '720p',
        fitMode: 'contain',
      );

      controller.updateNativeExoPlayerState(
        playing: true,
        buffering: false,
        position: const Duration(seconds: 5),
        duration: const Duration(minutes: 3),
      );
      expect(controller.isPlaying, isTrue);
      expect(controller.isBuffering, isFalse);
      expect(controller.nativePosition, const Duration(seconds: 5));
      expect(controller.effectiveTotalDuration, const Duration(minutes: 3));

      controller.updateNativeExoPlayerState(
        playing: false,
        buffering: false,
        position: const Duration(seconds: 5),
        duration: const Duration(minutes: 3),
      );
      expect(controller.isPlaying, isFalse);
    });

    test('buffering is reported separately from playing', () {
      controller.registerNativeExoPlayerSession(
        videoId: 'abc',
        quality: '720p',
        fitMode: 'contain',
      );
      controller.updateNativeExoPlayerState(
        playing: false,
        buffering: true,
        position: Duration.zero,
        duration: Duration.zero,
      );
      expect(controller.isBuffering, isTrue);
      expect(controller.isPlaying, isFalse);
    });

    test('clearing the native session resets every native field', () {
      controller.registerNativeExoPlayerSession(
        videoId: 'abc',
        quality: '1080p',
        fitMode: 'cover',
        audioTrackId: 'a1',
        subtitleCode: 'en',
        speed: 1.5,
      );
      controller.updateNativeExoPlayerState(
        playing: true,
        buffering: false,
        position: const Duration(seconds: 9),
        duration: const Duration(minutes: 1),
      );

      controller.clearNativeExoPlayerSession();

      expect(controller.hasNativeExoPlayer, isFalse);
      expect(controller.currentVideoId, isNull);
      expect(controller.nativeQuality, isNull);
      expect(controller.nativeAudioTrackId, isNull);
      expect(controller.nativeSubtitleCode, isNull);
      expect(controller.nativeFitMode, isNull);
      expect(controller.nativeSpeed, 1.0);
      expect(controller.nativePosition, Duration.zero);
      expect(controller.nativeWasPlaying, isFalse);
    });

    test('switching to a different video clears the previous position', () {
      controller.registerNativeExoPlayerSession(
        videoId: 'abc',
        quality: '720p',
        fitMode: 'contain',
      );
      controller.updateNativeExoPlayerState(
        playing: true,
        buffering: false,
        position: const Duration(seconds: 40),
        duration: const Duration(minutes: 2),
      );

      controller.registerNativeExoPlayerSession(
        videoId: 'xyz',
        quality: '720p',
        fitMode: 'contain',
      );

      expect(controller.currentVideoId, 'xyz');
      expect(controller.nativePosition, Duration.zero);
    });

    test('re-registering the same video keeps its position', () {
      controller.registerNativeExoPlayerSession(
        videoId: 'abc',
        quality: '720p',
        fitMode: 'contain',
      );
      controller.updateNativeExoPlayerState(
        playing: true,
        buffering: false,
        position: const Duration(seconds: 40),
        duration: const Duration(minutes: 2),
      );

      controller.registerNativeExoPlayerSession(
        videoId: 'abc',
        quality: '1080p',
        fitMode: 'contain',
      );

      expect(controller.nativePosition, const Duration(seconds: 40));
      expect(controller.nativeQuality, '1080p');
    });

    test('selection updates only touch the fields they are given', () {
      controller.registerNativeExoPlayerSession(
        videoId: 'abc',
        quality: '720p',
        fitMode: 'contain',
        audioTrackId: 'a1',
        subtitleCode: 'en',
        speed: 1.0,
      );

      controller.updateNativeExoPlayerSelections(quality: '1080p');

      expect(controller.nativeQuality, '1080p');
      expect(controller.nativeAudioTrackId, 'a1');
      expect(controller.nativeSubtitleCode, 'en');
      expect(controller.nativeFitMode, 'contain');
    });

    test('setNativeSubtitleCode can clear the subtitle', () {
      controller.registerNativeExoPlayerSession(
        videoId: 'abc',
        quality: '720p',
        fitMode: 'contain',
        subtitleCode: 'en',
      );
      controller.setNativeSubtitleCode(null);
      expect(controller.nativeSubtitleCode, isNull);
    });

    test('PiP mode toggles and is idempotent', () {
      controller.enterPipMode();
      expect(controller.isPipMode, isTrue);
      controller.enterPipMode(); // second call is a no-op
      expect(controller.isPipMode, isTrue);
    });

    test('exiting PiP mode clears the flag', () async {
      controller.enterPipMode();
      await controller.exitPipMode();
      expect(controller.isPipMode, isFalse);
    });

    test('exiting PiP when not in PiP is a no-op', () async {
      await controller.exitPipMode();
      expect(controller.isPipMode, isFalse);
    });

    test('system PiP cannot be entered without a video', () async {
      expect(await controller.enterSystemPipMode(), isFalse);
    });
  });

  group('GlobalPlayerController — volume / speed setters', () {
    late GlobalPlayerController controller;

    setUp(() {
      controller = GlobalPlayerController.forTesting();
    });

    tearDown(() {
      controller.disposePlayer();
    });

    test('volume starts at full and clamps on assignment', () {
      expect(controller.volume, 1.0);

      controller.setVolume(0.4);
      expect(controller.volume, 0.4);

      controller.setVolume(2.0);
      expect(controller.volume, 1.0);

      controller.setVolume(-1.0);
      expect(controller.volume, 0.0);
    });

    test('brightness starts at full and clamps on assignment', () {
      expect(controller.brightness, 1.0);

      controller.setBrightness(0.25);
      expect(controller.brightness, 0.25);

      controller.setBrightness(5.0);
      expect(controller.brightness, 1.0);

      controller.setBrightness(-0.5);
      expect(controller.brightness, 0.0);
    });

    test('playback speed snaps to an allowed value', () {
      controller.setPlaybackSpeed(1.5);
      expect(controller.nativeSpeed, 1.5);

      controller.setPlaybackSpeed(3.0);
      expect(controller.nativeSpeed, 2.0);

      controller.setPlaybackSpeed(0.6);
      expect(controller.nativeSpeed, 0.5);
    });

    test('setters notify listeners', () {
      var notifications = 0;
      controller.addListener(() => notifications++);

      controller.setVolume(0.5);
      controller.setBrightness(0.5);
      controller.setPlaybackSpeed(1.25);

      expect(notifications, greaterThanOrEqualTo(3));
    });
  });

  group('GlobalPlayerController — dispose safety', () {
    test('dispose leaves every getter safe to read', () {
      final controller = GlobalPlayerController.forTesting();
      controller.registerNativeExoPlayerSession(
        videoId: 'abc',
        quality: '720p',
        fitMode: 'contain',
      );

      controller.disposePlayer();

      expect(controller.hasActivePlayer, isFalse);
      expect(controller.hasNativeExoPlayer, isFalse);
      expect(controller.currentVideoId, isNull);
      expect(controller.currentPosition, Duration.zero);
      expect(controller.totalDuration, Duration.zero);
      expect(controller.isPlaying, isFalse);
      expect(controller.isBuffering, isFalse);
      expect(controller.isPipMode, isFalse);
      expect(controller.lastPosition, Duration.zero);
    });

    test('dispose twice does not throw', () {
      final controller = GlobalPlayerController.forTesting();
      controller.disposePlayer();
      expect(controller.disposePlayer, returnsNormally);
    });

    test('seekTo after dispose is a no-op instead of a crash', () async {
      final controller = GlobalPlayerController.forTesting();
      controller.disposePlayer();
      await expectLater(
        controller.seekTo(const Duration(seconds: 10)),
        completes,
      );
    });

    test('setters after dispose still clamp without throwing', () {
      final controller = GlobalPlayerController.forTesting();
      controller.disposePlayer();

      expect(() => controller.setVolume(0.3), returnsNormally);
      expect(() => controller.setBrightness(0.3), returnsNormally);
      expect(() => controller.setPlaybackSpeed(1.5), returnsNormally);
      expect(controller.volume, 0.3);
      expect(controller.brightness, 0.3);
      expect(controller.nativeSpeed, 1.5);
    });

    test('stopAndClear on an idle controller completes', () async {
      final controller = GlobalPlayerController.forTesting();
      await expectLater(controller.stopAndClear(), completes);
      expect(controller.currentVideoId, isNull);
      expect(controller.hasActivePlayer, isFalse);
    });

    test('savePlaybackState on an idle controller does not throw', () {
      final controller = GlobalPlayerController.forTesting();
      expect(controller.savePlaybackState, returnsNormally);
      expect(controller.lastPosition, Duration.zero);
    });
  });
}
