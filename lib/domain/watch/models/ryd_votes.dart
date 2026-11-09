/// Response of the Return YouTube Dislike API (`/votes?videoId=...`).
class RydVotes {
  const RydVotes({
    required this.id,
    required this.likes,
    required this.dislikes,
    required this.rating,
    required this.viewCount,
  });

  final String id;
  final int likes;
  final int dislikes;
  final double rating;
  final int viewCount;

  /// Parses the API payload. Unknown or malformed values are treated as zero so
  /// a changed API never crashes the watch screen.
  factory RydVotes.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    return RydVotes(
      id: id is String ? id : '',
      likes: _asInt(json['likes']),
      dislikes: _asInt(json['dislikes']),
      rating: _asDouble(json['rating']),
      viewCount: _asInt(json['viewCount']),
    );
  }

  static int _asInt(Object? value) {
    if (value is int) return value;
    if (value is num) return value.round();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  static double _asDouble(Object? value) {
    if (value is double) return value;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0;
    return 0;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RydVotes &&
          other.id == id &&
          other.likes == likes &&
          other.dislikes == dislikes &&
          other.rating == rating &&
          other.viewCount == viewCount;

  @override
  int get hashCode => Object.hash(id, likes, dislikes, rating, viewCount);
}
