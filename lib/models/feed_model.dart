import '../enums/feed_type.dart';

class PeamanFeed {
  final String? id;
  final String? ownerId;
  final String? caption;
  final List<String> photos;
  final List<String> videos;
  final PeamanFeedType type;
  final int reactionsCount;
  final int commentsCount;
  final int savesCount;
  final int sharesCount;
  final int viewsCount;
  final bool featured;
  final List<String> searchKeys;
  final int? createdAt;
  final int? updatedAt;
  final Map<String, dynamic> extraData;

  PeamanFeed({
    this.id,
    this.ownerId,
    this.type = PeamanFeedType.image,
    this.caption,
    this.photos = const <String>[],
    this.videos = const <String>[],
    this.reactionsCount = 0,
    this.commentsCount = 0,
    this.savesCount = 0,
    this.sharesCount = 0,
    this.viewsCount = 0,
    this.featured = false,
    this.searchKeys = const [],
    this.createdAt,
    this.updatedAt,
    this.extraData = const <String, dynamic>{},
  });

  PeamanFeed copyWith({
    String? id,
    final String? ownerId,
    final PeamanFeedType? type,
    final String? caption,
    final List<String>? photos,
    final List<String>? videos,
    final int? reactionsCount,
    final int? commentsCount,
    final int? savesCount,
    final int? sharesCount,
    final int? viewsCount,
    final bool? featured,
    final List<String>? searchKeys,
    final int? createdAt,
    final int? updatedAt,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanFeed(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      type: type ?? this.type,
      caption: caption ?? this.caption,
      photos: photos ?? this.photos,
      videos: videos ?? this.videos,
      reactionsCount: reactionsCount ?? this.reactionsCount,
      commentsCount: commentsCount ?? this.commentsCount,
      savesCount: savesCount ?? this.savesCount,
      sharesCount: sharesCount ?? this.sharesCount,
      viewsCount: viewsCount ?? this.viewsCount,
      featured: featured ?? this.featured,
      searchKeys: searchKeys ?? this.searchKeys,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanFeed fromJson(final Map<String, dynamic> data) {
    return PeamanFeed(
      id: data['id'],
      ownerId: data['owner_id'],
      type: PeamanFeedType.values[data['type'] ?? 0],
      photos: List<String>.from(data['photos'] ?? []),
      videos: List<String>.from(data['videos'] ?? []),
      reactionsCount: data['reactions_count'] ?? 0,
      commentsCount: data['comments_count'] ?? 0,
      savesCount: data['saves_count'] ?? 0,
      caption: data['caption'] ?? '',
      sharesCount: data['shares_count'] ?? 0,
      viewsCount: data['views_count'] ?? 0,
      featured: data['featured'] ?? false,
      searchKeys: List<String>.from(data['search_keys'] ?? []),
      updatedAt: data['updated_at'],
      createdAt: data['created_at'],
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    final _data = {
      'id': id,
      'owner_id': ownerId,
      'type': type.index,
      'caption': caption,
      'photos': photos,
      'videos': videos,
      'search_keys': searchKeys,
      'updated_at': updatedAt,
      'created_at': createdAt,
      ...extraData,
    };

    _data.removeWhere((key, value) => value == null);

    return _data;
  }
}
