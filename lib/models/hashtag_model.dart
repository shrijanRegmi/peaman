class PeamanHashtag {
  final String? id;
  final String? title;
  final int? feeds;
  final List<String> searchKeys;
  final bool visibility;
  final int? updatedAt;

  PeamanHashtag({
    this.id,
    this.title,
    this.feeds,
    this.searchKeys = const <String>[],
    this.visibility = true,
    this.updatedAt,
  });

  static PeamanHashtag fromJson(final Map<String, dynamic> data) {
    return PeamanHashtag(
      id: data['id'],
      title: data['title'],
      feeds: data['feeds'] ?? 0,
      searchKeys: List<String>.from(data['search_keys'] ?? []),
      visibility: data['visibility'] ?? true,
      updatedAt: data['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'title': title,
      'feeds': feeds,
      'search_keys': searchKeys,
      'visibility': true,
      'updated_at': updatedAt,
    };

    return data..removeWhere((key, value) => value == null);
  }
}
