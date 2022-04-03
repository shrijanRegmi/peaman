class PeamanMomentPicture {
  final String? id;
  final String url;
  final int updatedAt;
  final int expiresAt;
  final Map<String, dynamic> extraData;

  PeamanMomentPicture({
    this.id,
    this.url = '',
    this.updatedAt = -1,
    this.expiresAt = -1,
    this.extraData = const {},
  });

  PeamanMomentPicture copyWith({
    final String? id,
    final String? url,
    final int? updatedAt,
    final int? expiresAt,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanMomentPicture(
      id: id ?? this.id,
      url: url ?? this.url,
      updatedAt: updatedAt ?? this.updatedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanMomentPicture fromJson(final Map<String, dynamic> data) {
    return PeamanMomentPicture(
      id: data['id'],
      url: data['url'] ?? '',
      updatedAt: data['updated_at'] ?? -1,
      expiresAt: data['expires_at'] ?? -1,
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'updated_at': updatedAt,
      'expires_at': expiresAt,
      ...extraData,
    };
  }
}
