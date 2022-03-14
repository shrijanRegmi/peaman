class PeamanMoment {
  final String? id;
  final String? ownerId;
  final String? photo;
  final int? updatedAt;
  final int? expiresAt;
  final int views;

  PeamanMoment({
    this.id,
    this.ownerId,
    this.photo,
    this.views = 0,
    this.updatedAt,
    this.expiresAt,
  });

  PeamanMoment copyWith({
    final String? id,
    final String? ownerId,
    final String? photo,
    final int? updatedAt,
    final int? views,
  }) {
    return PeamanMoment(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      photo: photo ?? this.photo,
      views: views ?? this.views,
      updatedAt: updatedAt ?? this.updatedAt,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  static PeamanMoment fromJson(final Map<String, dynamic> data) {
    return PeamanMoment(
      id: data['id'],
      ownerId: data['owner_id'],
      photo: data['photo'],
      views: data['views'] ?? 0,
      updatedAt: data['updated_at'],
      expiresAt: data['expires_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'photo': photo,
      'owner_id': ownerId,
      'updated_at': updatedAt,
      'expires_at': expiresAt,
    };
  }
}
