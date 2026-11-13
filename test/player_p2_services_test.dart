import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/services/external_player_service.dart';
import 'package:vyplay/core/services/player_preferences_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('PlayerPreferencesService — skip silence', () {
    test('defaults to off when nothing was saved', () async {
      final prefs = PlayerPreferencesService(read: (key) async => null);

      expect(await prefs.isSkipSilenceEnabled(), isFalse);
    });

    test('reads a saved true', () async {
      final prefs = PlayerPreferencesService(
        read: (key) async {
          expect(key, PlayerPreferencesService.skipSilenceKey);
          return 'true';
        },
      );

      expect(await prefs.isSkipSilenceEnabled(), isTrue);
    });

    test('a corrupt value falls back to off', () async {
      final prefs = PlayerPreferencesService(read: (key) async => 'yes');

      expect(await prefs.isSkipSilenceEnabled(), isFalse);
    });

    test('writes through to the settings key', () async {
      final writes = <String>[];
      final prefs = PlayerPreferencesService(
        read: (key) async => null,
        write: (key, value) async {
          expect(key, PlayerPreferencesService.skipSilenceKey);
          writes.add(value);
        },
      );

      expect(await prefs.setSkipSilenceEnabled(true), isTrue);
      expect(await prefs.setSkipSilenceEnabled(false), isFalse);

      expect(writes, ['true', 'false']);
    });

    test('a storage failure never breaks playback', () async {
      final prefs = PlayerPreferencesService(
        read: (key) async => throw StateError('db closed'),
        write: (key, value) async => throw StateError('db closed'),
      );

      expect(await prefs.isSkipSilenceEnabled(), isFalse);
      // The toggle still works for this session even when it cannot persist.
      expect(await prefs.setSkipSilenceEnabled(true), isTrue);
    });
  });

  group('PlayerPreferencesService — audio only', () {
    test('defaults to off and round-trips through the settings key', () async {
      final store = <String, String>{};
      final prefs = PlayerPreferencesService(
        read: (key) async => store[key],
        write: (key, value) async => store[key] = value,
      );

      expect(await prefs.isAudioOnlyEnabled(), isFalse);
      expect(await prefs.setAudioOnlyEnabled(true), isTrue);
      expect(store[PlayerPreferencesService.audioOnlyKey], 'true');
      expect(await prefs.isAudioOnlyEnabled(), isTrue);
    });
  });

  group('PlayerPreferencesService — per-channel speed', () {
    test('returns null for a channel with no stored speed (global default wins)',
        () async {
      final prefs = PlayerPreferencesService(read: (key) async => null);

      expect(await prefs.channelSpeed('https://x/channel/UC1'), isNull);
    });

    test('stores and reads a speed per channel without clobbering other channels',
        () async {
      final store = <String, String>{};
      final prefs = PlayerPreferencesService(
        read: (key) async => store[key],
        write: (key, value) async => store[key] = value,
      );

      await prefs.setChannelSpeed('UC1', 1.5);
      await prefs.setChannelSpeed('UC2', 2.0);

      expect(await prefs.channelSpeed('UC1'), 1.5);
      expect(await prefs.channelSpeed('UC2'), 2.0);
      expect(await prefs.allChannelSpeeds(), {'UC1': 1.5, 'UC2': 2.0});
    });

    test('clamps speeds into the range both engines accept', () async {
      final store = <String, String>{};
      final prefs = PlayerPreferencesService(
        read: (key) async => store[key],
        write: (key, value) async => store[key] = value,
      );

      await prefs.setChannelSpeed('slow', 0.1);
      await prefs.setChannelSpeed('fast', 5.0);

      expect(await prefs.channelSpeed('slow'), PlayerPreferencesService.minSpeed);
      expect(await prefs.channelSpeed('fast'), PlayerPreferencesService.maxSpeed);
    });

    test('clearing a channel speed falls back to the global default', () async {
      final store = <String, String>{};
      final prefs = PlayerPreferencesService(
        read: (key) async => store[key],
        write: (key, value) async => store[key] = value,
      );

      await prefs.setChannelSpeed('UC1', 1.75);
      await prefs.setChannelSpeed('UC1', null);

      expect(await prefs.channelSpeed('UC1'), isNull);
      expect(await prefs.allChannelSpeeds(), isEmpty);
    });

    test('corrupt stored JSON does not break playback', () async {
      final prefs = PlayerPreferencesService(
        read: (key) async => 'not json at all',
      );

      expect(await prefs.channelSpeed('UC1'), isNull);
      expect(await prefs.allChannelSpeeds(), isEmpty);
    });
  });

  group('PlayerPreferencesService — resume positions', () {
    test('saves and reads a position per video', () async {
      final store = <String, String>{};
      final prefs = PlayerPreferencesService(
        read: (key) async => store[key],
        write: (key, value) async => store[key] = value,
      );

      await prefs.saveResumePosition('abc', 125);

      expect(await prefs.resumePosition('abc'), 125);
      expect(await prefs.resumePosition('other'), isNull);
    });

    test('a zero or negative position is cleared, not stored', () async {
      final store = <String, String>{};
      final prefs = PlayerPreferencesService(
        read: (key) async => store[key],
        write: (key, value) async => store[key] = value,
      );

      await prefs.saveResumePosition('abc', 10);
      await prefs.saveResumePosition('abc', 0);

      expect(await prefs.resumePosition('abc'), isNull);
    });

    test('clearResumePosition removes one video only', () async {
      final store = <String, String>{};
      final prefs = PlayerPreferencesService(
        read: (key) async => store[key],
        write: (key, value) async => store[key] = value,
      );

      await prefs.saveResumePosition('a', 30);
      await prefs.saveResumePosition('b', 60);
      await prefs.clearResumePosition('a');

      expect(await prefs.resumePosition('a'), isNull);
      expect(await prefs.resumePosition('b'), 60);
    });
  });

  group('ExternalPlayerService', () {
    test('sends the resolved url with a mime type and title', () async {
      final calls = <MapEntry<String, Map<String, Object?>?>>[];
      final service = ExternalPlayerService(
        isAndroid: true,
        invoke: (method, args) async {
          calls.add(MapEntry(method, args));
          return true;
        },
      );

      final opened = await service.open(
        url: 'https://example.test/video.mp4',
        mimeType: 'video/mp4',
        title: 'A video',
      );

      expect(opened, isTrue);
      expect(calls.single.key, 'openExternalPlayer');
      expect(calls.single.value, {
        'url': 'https://example.test/video.mp4',
        'mimeType': 'video/mp4',
        'title': 'A video',
      });
    });

    test('an empty url is rejected without a channel call', () async {
      var called = false;
      final service = ExternalPlayerService(
        isAndroid: true,
        invoke: (method, args) async {
          called = true;
          return true;
        },
      );

      expect(await service.open(url: '   '), isFalse);
      expect(called, isFalse);
    });

    test('reports false when no player is installed', () async {
      final service = ExternalPlayerService(
        isAndroid: true,
        invoke: (method, args) async => throw PlatformException(
          code: 'NO_HANDLER',
          message: 'No app can play this stream',
        ),
      );

      expect(await service.open(url: 'https://example.test/v.mp4'), isFalse);
    });

    test('reports false when the native method is missing', () async {
      final service = ExternalPlayerService(
        isAndroid: true,
        invoke: (method, args) async => throw MissingPluginException(),
      );

      expect(await service.open(url: 'https://example.test/v.mp4'), isFalse);
    });

    test('is a no-op off Android', () async {
      final service = ExternalPlayerService(
        isAndroid: false,
        invoke: (method, args) async => true,
      );

      expect(await service.open(url: 'https://example.test/v.mp4'), isFalse);
    });

    test('mimeTypeFor understands the containers VyPlay resolves', () {
      expect(ExternalPlayerService.mimeTypeFor('https://x/a.m3u8?t=1'),
          'application/x-mpegURL');
      expect(ExternalPlayerService.mimeTypeFor('https://x/a.mpd'), 'application/dash+xml');
      expect(ExternalPlayerService.mimeTypeFor('https://x/a.webm'), 'video/webm');
      expect(ExternalPlayerService.mimeTypeFor('https://x/a.mkv'), 'video/x-matroska');
      expect(ExternalPlayerService.mimeTypeFor('https://x/a.mp4'), 'video/mp4');
      // Unknown containers default to video/mp4 rather than a wildcard, which
      // makes the chooser list only real players.
      expect(ExternalPlayerService.mimeTypeFor('https://x/stream'), 'video/mp4');
    });
  });
}
