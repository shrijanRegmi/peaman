class PeamanMomentPicture {
  final String? id;
  final String url;
  final int updatedAt;

  PeamanMomentPicture({
    this.id,
    this.url = '',
    this.updatedAt = -1,
  });

  static PeamanMomentPicture fromJson(final Map<String, dynamic> data) {
    return PeamanMomentPicture(
      id: data['id'],
      url: data['url'] ?? '',
      updatedAt: data['updated_at'] ?? -1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'updated_at': updatedAt,
    };
  }
}
