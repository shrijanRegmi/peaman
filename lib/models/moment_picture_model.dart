class PeamanMomentPicture {
  final String? id;
  final String url;
  final int updatedAt;
  final int expiresAt;

  PeamanMomentPicture({
    this.id,
    this.url = '',
    this.updatedAt = -1,
    this.expiresAt = -1,
  });

  static PeamanMomentPicture fromJson(final Map<String, dynamic> data) {
    return PeamanMomentPicture(
      id: data['id'],
      url: data['url'] ?? '',
      updatedAt: data['updated_at'] ?? -1,
      expiresAt: data['expires_at'] ?? -1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'updated_at': updatedAt,
      'expires_at': expiresAt,
    };
  }
}
