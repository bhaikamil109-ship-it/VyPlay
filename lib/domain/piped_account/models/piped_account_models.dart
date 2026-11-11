/// A channel subscription returned by the Piped backend.
class PipedSubscription {
  const PipedSubscription({
    required this.id,
    required this.name,
    this.avatarUrl,
    this.verified = false,
  });

  final String id;
  final String name;
  final String? avatarUrl;
  final bool verified;

  factory PipedSubscription.fromJson(Map<String, dynamic> json) {
    final url = (json['url'] as String?) ?? '';
    final parts = url.split('/').where((part) => part.isNotEmpty).toList();
    final id = url.contains('/channel/')
        ? parts[parts.indexOf('channel') + 1]
        : parts.join('/');
    return PipedSubscription(
      id: id,
      name: (json['name'] as String?) ?? '',
      avatarUrl: json['avatar'] as String?,
      verified: json['verified'] == true,
    );
  }
}

/// A user playlist returned by the Piped backend.
class PipedPlaylist {
  const PipedPlaylist({
    required this.id,
    required this.name,
    this.description,
    this.thumbnailUrl,
    this.videoCount = 0,
  });

  final String id;
  final String name;
  final String? description;
  final String? thumbnailUrl;
  final int videoCount;

  factory PipedPlaylist.fromJson(Map<String, dynamic> json) {
    return PipedPlaylist(
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      description: json['shortDescription'] as String?,
      thumbnailUrl: json['thumbnail'] as String?,
      videoCount: (json['videos'] as num?)?.toInt() ?? 0,
    );
  }
}
