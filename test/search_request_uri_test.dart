import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/infrastructure/search/search_request_uri.dart';

void main() {
  test('encodes reserved characters in search text as one query value', () {
    final result = Uri.parse(buildSearchRequestUri(
      'https://piped.example/api/v1/search?q=',
      {
        'q': 'cats & dogs #shorts + 50%',
        'filter': 'videos',
      },
    ));

    expect(result.queryParameters['q'], 'cats & dogs #shorts + 50%');
    expect(result.queryParameters['filter'], 'videos');
    expect(result.queryParameters.length, 2);
  });

  test('keeps backend instance path and Unicode query values', () {
    final result = Uri.parse(buildSearchRequestUri(
      'https://instance.example/proxy/api/v1/search?q=',
      {'q': '東京', 'type': 'video', 'page': '2'},
    ));

    expect(result.host, 'instance.example');
    expect(result.path, '/proxy/api/v1/search');
    expect(result.queryParameters, {
      'q': '東京',
      'type': 'video',
      'page': '2',
    });
  });
}
