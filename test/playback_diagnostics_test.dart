import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/services/playback_diagnostics.dart';

void main() {
  final diagnostics = PlaybackDiagnostics.instance;

  setUp(diagnostics.clear);
  tearDown(diagnostics.clear);

  test('redacts signed primary and secondary media URLs', () {
    diagnostics.recordFailure(
      backend: 'newpipe',
      player: 'android-media3',
      videoId: 'video123',
      errorCode: 'ERROR_CODE_IO_BAD_HTTP_STATUS',
      message: 'HTTP 404 at https://rr1.googlevideo.com/videoplayback?expire=123&sig=secret-token',
      url: 'https://rr1.googlevideo.com/videoplayback?expire=123&sig=primary-secret',
      secondaryUrl: 'https://rr1.googlevideo.com/audio?sig=secondary-secret',
      httpStatus: 404,
    );

    final output = diagnostics.dump();
    expect(output, contains('url=https://rr1.googlevideo.com/videoplayback'));
    expect(output, contains('secondaryUrl=https://rr1.googlevideo.com/audio'));
    expect(output, contains('httpStatus=404'));
    expect(output, isNot(contains('expire=')));
    expect(output, isNot(contains('primary-secret')));
    expect(output, isNot(contains('secondary-secret')));
    expect(output, isNot(contains('secret-token')));
  });

  test('redacts signed URLs from messages while preserving useful status text', () {
    final output = diagnostics.redactMessage(
      'Response code: 404 for https://youtube.com/watch?v=abc&token=secret',
    );

    expect(output, contains('404'));
    expect(output, contains('https://youtube.com/watch'));
    expect(output, isNot(contains('token=')));
    expect(output, isNot(contains('secret')));
  });
}
