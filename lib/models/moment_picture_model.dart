class PeamanMomentPicture {
  final String? id;
  final String? url;
  final int? expiresAt;
  final int? createdAt;
  final int? updatedAt;
  final Map<String, dynamic> extraData;

  PeamanMomentPicture({
    this.id,
    this.url,
    this.expiresAt,
    this.createdAt,
    this.updatedAt,
    this.extraData = const {},
  });

  PeamanMomentPicture copyWith({
    final String? id,
    final String? url,
    final int? expiresAt,
    final int? createdAt,
    final int? updatedAt,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanMomentPicture(
      id: id ?? this.id,
      url: url ?? this.url,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanMomentPicture fromJson(final Map<String, dynamic> data) {
    return PeamanMomentPicture(
      id: data['id'],
      url: data['url'],
      expiresAt: data['expires_at'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'expires_at': expiresAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      ...extraData,
    };
  }
}
