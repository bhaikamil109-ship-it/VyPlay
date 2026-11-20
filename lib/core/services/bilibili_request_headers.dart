/// HTTP request headers required when media is served by Bilibili.
///
/// PipePipe sends Bilibili's site Referer on playback and download requests.
/// Keeping this in one place prevents the Android player and Dio downloader
/// from silently using different service headers.
class BilibiliRequestHeaders {
  BilibiliRequestHeaders._();

  static const referer = 'https://www.bilibili.com';
  static const _downloadUserAgent =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:128.0) '
      'Gecko/20100101 Firefox/128.0';

  static const _mediaCdnDomains = <String>[
    'akamaized.net',
    'bilivideo.com',
    'bilivideo.cn',
    'mountaintoys.cn',
  ];

  /// Returns headers for the native player when a Bilibili stream is selected.
  static Map<String, String> forPlaybackService(String serviceId) {
    if (serviceId != 'bilibili') return const <String, String>{};
    return const <String, String>{'Referer': referer};
  }

  /// Identifies Bilibili media CDN URLs using the hostname, not query text.
  static bool isBilibiliMediaUrl(String url) {
    final host = Uri.tryParse(url)?.host.toLowerCase();
    if (host == null || host.isEmpty) return false;
    return _mediaCdnDomains.any(
      (domain) => host == domain || host.endsWith('.$domain'),
    );
  }

  /// Returns Bilibili-specific headers only for its known media CDN hosts.
  ///
  /// Other backends retain their existing request headers unchanged.
  static Map<String, String> forDownloadUrl(String url) {
    if (!isBilibiliMediaUrl(url)) return const <String, String>{};
    return const <String, String>{
      'User-Agent': _downloadUserAgent,
      'Referer': '$referer/',
      'Accept-Language': 'zh-CN,zh;q=0.9',
    };
  }
}
