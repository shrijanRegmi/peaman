class PeamanMoment {
  final String? id;
  final String? ownerId;
  final List<String> photos;
  final int? updatedAt;
  final int? expiresAt;
  final int views;

  PeamanMoment({
    this.id,
    this.ownerId,
    this.photos = const [],
    this.views = 0,
    this.updatedAt,
    this.expiresAt,
  });

  PeamanMoment copyWith({
    final String? id,
    final String? ownerId,
    final List<String>? photos,
    final int? updatedAt,
    final int? views,
  }) {
    return PeamanMoment(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      photos: photos ?? this.photos,
      views: views ?? this.views,
      updatedAt: updatedAt ?? this.updatedAt,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  static PeamanMoment fromJson(final Map<String, dynamic> data) {
    return PeamanMoment(
      id: data['id'],
      ownerId: data['owner_id'],
      photos: List<String>.from(data['photos'] ?? []),
      views: data['views'] ?? 0,
      updatedAt: data['updated_at'],
      expiresAt: data['expires_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = {
      'id': id,
      'photos': photos,
      'owner_id': ownerId,
      'updated_at': updatedAt,
      'expires_at': expiresAt,
    };

    _data.removeWhere((key, value) => value == null);
    return _data;
  }
}
