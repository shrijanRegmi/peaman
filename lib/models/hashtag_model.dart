class PeamanHashtag {
  final String? id;
  final String? title;
  final int? feeds;
  final bool visibility;
  final int? updatedAt;

  PeamanHashtag({
    this.id,
    this.title,
    this.feeds,
    this.visibility = true,
    this.updatedAt,
  });

  static PeamanHashtag fromJson(final Map<String, dynamic> data) {
    return PeamanHashtag(
      id: data['id'],
      title: data['title'],
      feeds: data['feeds'] ?? 0,
      visibility: data['visibility'] ?? true,
      updatedAt: data['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'title': title,
      'feeds': feeds,
      'visibility': true,
      'updated_at': updatedAt,
    };

    return data..removeWhere((key, value) => value == null);
  }
}
