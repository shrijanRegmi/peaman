import '../enums/feed_type.dart';

class PeamanFeed {
  final String? id;
  final String? ownerId;
  final PeamanFeedType feedType;
  final String? caption;
  final List<String> photos;
  final List<String> videos;
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
    this.feedType = PeamanFeedType.image,
    this.caption,
    this.photos = const <String>[],
    this.videos = const <String>[],
    this.reactionsCount = 0,
    this.commentsCount = 0,
    this.savesCount = 0,
    this.sharesCount = 0,
    this.viewsCount = 0,
    this.featured = false,
    this.updatedAt,
    this.searchKeys = const [],
    this.extraData = const <String, dynamic>{},
  });

  PeamanFeed copyWith({
    String? id,
    final String? ownerId,
    final PeamanFeedType? feedType,
    final String? caption,
    final List<String>? photos,
    final List<String>? videos,
    final int? reactionsCount,
    final int? commentsCount,
    final int? savesCount,
    final int? sharesCount,
    final int? viewsCount,
    final bool? featured,
    final int? updatedAt,
    final List<String>? searchKeys,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanFeed(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      feedType: feedType ?? this.feedType,
      caption: caption ?? this.caption,
      photos: photos ?? this.photos,
      videos: videos ?? this.videos,
      reactionsCount: reactionsCount ?? this.reactionsCount,
      commentsCount: commentsCount ?? this.commentsCount,
      savesCount: savesCount ?? this.savesCount,
      sharesCount: sharesCount ?? this.sharesCount,
      viewsCount: viewsCount ?? this.viewsCount,
      featured: featured ?? this.featured,
      updatedAt: updatedAt ?? this.updatedAt,
      searchKeys: searchKeys ?? this.searchKeys,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanFeed fromJson(final Map<String, dynamic> data) {
    return PeamanFeed(
      id: data['id'],
      ownerId: data['owner_id'],
      feedType: PeamanFeedType.values[data['feed_type'] ?? 0],
      updatedAt: data['updated_at'] ?? DateTime.now().millisecondsSinceEpoch,
      caption: data['caption'] ?? '',
      photos: List<String>.from(data['photos'] ?? []),
      videos: List<String>.from(data['videos'] ?? []),
      reactionsCount: data['reactions_count'] ?? 0,
      commentsCount: data['comments_count'] ?? 0,
      savesCount: data['saves_count'] ?? 0,
      sharesCount: data['shares_count'] ?? 0,
      viewsCount: data['views_count'] ?? 0,
      featured: data['featured'] ?? false,
      searchKeys: List<String>.from(data['search_keys'] ?? []),
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    final _data = {
      'id': id,
      'owner_id': ownerId,
      'feed_type': feedType.index,
      'caption': caption,
      'photos': photos,
      'videos': videos,
      'search_keys': searchKeys,
      'updated_at': updatedAt,
      ...extraData,
    };

    _data.removeWhere((key, value) => value == null);

    return _data;
  }
}
