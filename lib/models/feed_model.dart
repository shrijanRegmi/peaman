class PeamanFeed {
  final String? id;
  final String? ownerId;
  final String? caption;
  final List<String> photos;
  final int reactionsCount;
  final int commentsCount;
  final int savesCount;
  final int sharesCount;
  final int viewsCount;
  final bool featured;
  final int? updatedAt;
  final List<String> searchKeys;
  final Map<String, dynamic> extraData;

  PeamanFeed({
    this.id,
    this.ownerId,
    this.caption,
    this.photos = const <String>[],
    this.reactionsCount = 0,
    this.commentsCount = 0,
    this.savesCount = 0,
    this.sharesCount = 0,
    this.viewsCount = 0,
    this.featured = false,
    this.extraData = const <String, dynamic>{},
    this.updatedAt,
    this.searchKeys = const [],
  });

  PeamanFeed copyWith({
    String? id,
    final String? ownerId,
    final String? caption,
    final List<String>? photos,
    final int? reactionsCount,
    final int? commentsCount,
    final int? savesCount,
    final int? sharesCount,
    final int? viewsCount,
    final bool? featured,
    final int? updatedAt,
    final Map<String, dynamic>? extraData,
    final List<String>? searchKeys,
  }) {
    return PeamanFeed(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      caption: caption ?? this.caption,
      photos: photos ?? this.photos,
      reactionsCount: reactionsCount ?? this.reactionsCount,
      commentsCount: commentsCount ?? this.commentsCount,
      savesCount: savesCount ?? this.savesCount,
      sharesCount: sharesCount ?? this.sharesCount,
      viewsCount: viewsCount ?? this.viewsCount,
      featured: featured ?? this.featured,
      updatedAt: updatedAt ?? this.updatedAt,
      extraData: extraData ?? this.extraData,
      searchKeys: searchKeys ?? this.searchKeys,
    );
  }

  static PeamanFeed fromJson(final Map<String, dynamic> data) {
    return PeamanFeed(
      id: data['id'],
      ownerId: data['owner_id'],
      updatedAt: data['updated_at'] ?? DateTime.now().millisecondsSinceEpoch,
      caption: data['caption'] ?? '',
      photos: List<String>.from(data['photos'] ?? []),
      reactionsCount: data['reactions_count'] ?? 0,
      commentsCount: data['comments_count'] ?? 0,
      savesCount: data['saves_count'] ?? 0,
      sharesCount: data['shares_count'] ?? 0,
      viewsCount: data['views_count'] ?? 0,
      featured: data['featured'] ?? false,
      extraData: data['extra_data'] ?? <String, dynamic>{},
      searchKeys: List<String>.from(data['search_keys'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    final _data = {
      'id': id,
      'owner_id': ownerId,
      'updated_at': updatedAt,
      'caption': caption,
      'photos': photos,
      'extra_data': extraData,
      'search_keys': searchKeys,
    };

    _data.removeWhere((key, value) => value == null);

    return _data;
  }
}
