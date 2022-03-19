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
    this.extraData = const <String, dynamic>{},
    this.updatedAt,
    this.searchKeys = const [],
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
    final Map<String, dynamic>? extraData,
    final List<String>? searchKeys,
  }) {
    return PeamanFeed(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
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
      extraData: extraData ?? this.extraData,
      searchKeys: searchKeys ?? this.searchKeys,
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
      extraData: data['extra_data'] ?? <String, dynamic>{},
      searchKeys: List<String>.from(data['search_keys'] ?? []),
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
      'extra_data': extraData,
      'search_keys': searchKeys,
      'updated_at': updatedAt,
    };

    _data.removeWhere((key, value) => value == null);

    return _data;
  }
}
