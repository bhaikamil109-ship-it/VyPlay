import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/domain/peertube/models/peertube_models.dart';
import 'package:vyplay/infrastructure/peertube/peertube_instance_store_impl.dart';

Map<String, dynamic> _videoJson({
  String uuid = '11111111-1111-1111-1111-111111111111',
  List<Map<String, dynamic>>? files,
  List<Map<String, dynamic>>? playlists,
}) {
  return {
    'uuid': uuid,
    'shortUUID': 'short',
    'name': 'A PeerTube video',
    'description': 'Description',
    'duration': 125,
    'views': 1250,
    'likes': 42,
    'publishedAt': '2026-11-01T10:00:00.000Z',
    'isLive': false,
    'isLocal': true,
    'nsfw': false,
    'thumbnailPath': '/lazy-static/thumb.jpg',
    'previewPath': '/lazy-static/preview.jpg',
    'url': 'https://tube.test/videos/watch/$uuid',
    'embedPath': '/videos/embed/$uuid',
    'channel': {
      'name': 'channel',
      'displayName': 'Channel name',
      'url': 'https://tube.test/video-channels/channel',
      'host': 'tube.test',
      'avatars': [
        {
          'fileUrl': 'https://tube.test/avatar.jpg',
          'width': 120,
        }
      ],
    },
    'account': {
      'displayName': 'Account name',
      'avatars': [
        {
          'fileUrl': 'https://tube.test/account.jpg',
          'width': 120,
        }
      ],
    },
    if (files != null) 'files': files,
    if (playlists != null) 'streamingPlaylists': playlists,
  };
}

Map<String, dynamic> _file({
  required String label,
  required int id,
  required int height,
  String? fileUrl,
  String? playlistUrl,
  bool hasAudio = true,
  bool hasVideo = true,
}) {
  return {
    'resolution': {'id': id, 'label': label},
    'width': height == 0 ? 0 : (height * 16 / 9).round(),
    'height': height,
    'fps': 25,
    'fileUrl': fileUrl,
    'playlistUrl': playlistUrl,
    'hasAudio': hasAudio,
    'hasVideo': hasVideo,
  };
}

void main() {
  group('PeerTube instance URL validation', () {
    test('normalizes hosts and strips a trailing slash', () {
      expect(
        normalizePeerTubeInstanceUrl('framatube.org/'),
        'https://framatube.org',
      );
      expect(
        normalizePeerTubeInstanceUrl(' https://TilVids.com '),
        'https://tilvids.com',
      );
      expect(
        normalizePeerTubeInstanceUrl('http://localhost:9000'),
        'http://localhost:9000',
      );
    });

    test('rejects paths, credentials and non-http schemes', () {
      expect(normalizePeerTubeInstanceUrl(''), isNull);
      expect(normalizePeerTubeInstanceUrl('ftp://tube.test'), isNull);
      expect(normalizePeerTubeInstanceUrl('https://tube.test/api/v1'), isNull);
      expect(
          normalizePeerTubeInstanceUrl('https://user:pass@tube.test'), isNull);
      expect(normalizePeerTubeInstanceUrl('https://tube.test?x=1'), isNull);
    });
  });

  group('PeerTube config parsing', () {
    test('reads instance capabilities', () {
      final config = PeerTubeInstanceConfig.fromJson({
        'serverVersion': '6.3.0',
        'instance': {
          'name': 'TestTube',
          'shortDescription': 'A test instance',
          'isNSFW': false,
        },
        'signup': {'allowed': false},
        'transcoding': {'enabled': true},
        'live': {'enabled': true},
      }, 'https://tube.test');

      expect(config.name, 'TestTube');
      expect(config.serverVersion, '6.3.0');
      expect(config.transcodingEnabled, isTrue);
      expect(config.liveEnabled, isTrue);
      expect(config.signupAllowed, isFalse);
    });

    test('rejects non-PeerTube JSON', () {
      expect(
        () => PeerTubeInstanceConfig.fromJson({'hello': 'world'}, 'https://x'),
        throwsFormatException,
      );
    });
  });

  group('PeerTube video parsing', () {
    test('resolves relative assets and parses paging', () {
      final page = PeerTubeVideoPage.fromJson({
        'total': 5,
        'start': 0,
        'data': [_videoJson()],
      }, 'https://tube.test');

      expect(page.videos, hasLength(1));
      expect(page.hasMore, isTrue);
      final video = page.videos.single;
      expect(video.channel?.displayName, 'Channel name');
      expect(video.thumbnailUrl, 'https://tube.test/lazy-static/thumb.jpg');
      expect(video.previewUrl, 'https://tube.test/lazy-static/preview.jpg');
      expect(video.channel?.avatarUrl, 'https://tube.test/avatar.jpg');
    });

    test('prefers HLS resolutions and excludes audio-only entries', () {
      final video = PeerTubeVideo.fromJson(
        _videoJson(
          files: [
            _file(
              label: 'Audio only',
              id: 0,
              height: 0,
              fileUrl: 'https://tube.test/audio.mp4',
              hasVideo: false,
            ),
            _file(
              label: '480p',
              id: 480,
              height: 480,
              fileUrl: 'https://tube.test/480.mp4',
            ),
          ],
          playlists: [
            {
              'playlistUrl': 'https://tube.test/master.m3u8',
              'type': 1,
              'files': [
                _file(
                  label: '720p',
                  id: 720,
                  height: 720,
                  playlistUrl: 'https://tube.test/720.m3u8',
                ),
                _file(
                  label: '360p',
                  id: 360,
                  height: 360,
                  playlistUrl: 'https://tube.test/360.m3u8',
                ),
                _file(
                  label: 'Audio only',
                  id: 0,
                  height: 0,
                  playlistUrl: 'https://tube.test/audio.m3u8',
                  hasVideo: false,
                ),
              ],
            }
          ],
        ),
        'https://tube.test',
      );

      final sources = video.playbackSources;
      expect(sources.map((e) => e.label), ['720p', '360p']);
      expect(sources.every((e) => e.isHls), isTrue);
      expect(video.sourceFor('360p')?.url, 'https://tube.test/360.m3u8');
      expect(closestPeerTubeSource(sources, 500)?.label, '360p');
    });

    test('falls back to direct muxed files when HLS is absent', () {
      final video = PeerTubeVideo.fromJson(
        _videoJson(
          files: [
            _file(
              label: '480p',
              id: 480,
              height: 480,
              fileUrl: 'https://tube.test/480.mp4',
            ),
            _file(
              label: 'Audio only',
              id: 0,
              height: 0,
              fileUrl: 'https://tube.test/audio.mp4',
              hasVideo: false,
            ),
          ],
        ),
        'https://tube.test',
      );

      final sources = video.playbackSources;
      expect(sources, hasLength(1));
      expect(sources.single.label, '480p');
      expect(sources.single.isHls, isFalse);
      expect(sources.single.format, 'MP4');
    });

    test('live videos use the master playlist', () {
      final json = _videoJson(
        playlists: [
          {
            'playlistUrl': 'https://tube.test/live.m3u8',
            'type': 1,
            'files': const [],
          }
        ],
      )..['isLive'] = true;
      final video = PeerTubeVideo.fromJson(json, 'https://tube.test');
      expect(video.playbackSources.single.label, 'Auto');
      expect(video.playbackSources.single.isLive, isTrue);
      expect(video.playbackSources.single.isHls, isTrue);
    });
  });

  group('PeerTube instance persistence', () {
    test('round-trips instances and active selection', () async {
      final directory = await Directory.systemTemp.createTemp('peertube_store');
      addTearDown(() => directory.delete(recursive: true));
      final store = PeerTubeInstanceStoreImpl.withDirectory(directory);

      await store.save(const PeerTubeInstanceSelection(
        instances: [
          PeerTubeInstance(url: 'https://tube.one', name: 'One'),
          PeerTubeInstance(url: 'https://tube.two', name: 'Two'),
        ],
        activeUrl: 'https://tube.two',
      ));

      final loaded = await store.load();
      expect(loaded.instances, hasLength(2));
      expect(loaded.instances.first.name, 'One');
      expect(loaded.activeUrl, 'https://tube.two');
    });

    test('corrupt files are ignored instead of crashing', () async {
      final directory = await Directory.systemTemp.createTemp('peertube_store');
      addTearDown(() => directory.delete(recursive: true));
      final file = File('${directory.path}/peertube_instances.json');
      await file.writeAsString('{not valid json');
      final store = PeerTubeInstanceStoreImpl.withDirectory(directory);

      final loaded = await store.load();
      expect(loaded.instances, isEmpty);
      expect(loaded.activeUrl, isNull);
    });
  });

  group('PeerTube formatting', () {
    test('formats durations and counts', () {
      expect(formatPeerTubeDuration(125), '02:05');
      expect(formatPeerTubeDuration(3725), '1:02:05');
      expect(formatPeerTubeCount(999), '999');
      expect(formatPeerTubeCount(1500), '1.5K');
      expect(formatPeerTubeCount(2000000), '2M');
    });
  });
}
