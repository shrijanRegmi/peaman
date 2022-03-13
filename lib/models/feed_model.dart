import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/models/user_model.dart';

class PeamanFeed {
  final String? id;
  final DocumentReference? feedRef;
  final String? ownerId;
  final PeamanUser? owner;
  final int? updatedAt;
  final String? caption;
  final List<String>? photos;
  final PeamanUser? initialReactor;
  final int reactionCount;
  final int commentsCount;
  final int savesCount;
  final int sharesCount;
  final int viewsCount;
  final List<String>? reactorsPhoto;
  final bool? isReacted;
  final bool? isFeatured;
  final bool? isSaved;

  PeamanFeed({
    this.id,
    this.feedRef,
    this.ownerId,
    this.owner,
    this.updatedAt,
    this.caption,
    this.photos,
    this.initialReactor,
    this.reactionCount = 0,
    this.commentsCount = 0,
    this.savesCount = 0,
    this.sharesCount = 0,
    this.viewsCount = 0,
    this.reactorsPhoto = const [],
    this.isReacted = false,
    this.isFeatured = false,
    this.isSaved = false,
  });

  PeamanFeed copyWith({
    String? id,
    final DocumentReference? feedRef,
    final String? ownerId,
    final PeamanUser? owner,
    final int? updatedAt,
    final String? caption,
    final List<String>? photos,
    final PeamanUser? initialReactor,
    final int? reactionCount,
    final int? commentsCount,
    final int? savesCount,
    final int? sharesCount,
    final int? viewsCount,
    final List<String>? reactorsPhoto,
    final bool? isReacted,
    final bool? isFeatured,
    final bool? isSaved,
  }) {
    return PeamanFeed(
      id: id ?? this.id,
      feedRef: feedRef ?? this.feedRef,
      ownerId: ownerId ?? this.ownerId,
      owner: owner ?? this.owner,
      updatedAt: updatedAt ?? this.updatedAt,
      caption: caption ?? this.caption,
      photos: photos ?? this.photos,
      initialReactor: initialReactor ?? this.initialReactor,
      reactionCount: reactionCount ?? this.reactionCount,
      commentsCount: commentsCount ?? this.commentsCount,
      savesCount: savesCount ?? this.savesCount,
      sharesCount: sharesCount ?? this.sharesCount,
      viewsCount: viewsCount ?? this.viewsCount,
      reactorsPhoto: reactorsPhoto ?? this.reactorsPhoto,
      isReacted: isReacted ?? this.isReacted,
      isFeatured: isFeatured ?? this.isFeatured,
      isSaved: isSaved ?? this.isSaved,
    );
  }

  static PeamanFeed fromJson(final Map<String, dynamic> data) {
    final _ref = FirebaseFirestore.instance;
    return PeamanFeed(
      id: data['id'],
      feedRef: _ref.collection('posts').doc(data['id']),
      ownerId: data['owner_id'],
      updatedAt: data['updated_at'] ?? DateTime.now().millisecondsSinceEpoch,
      caption: data['caption'] ?? '',
      photos: List<String>.from(data['photos'] ?? []),
      owner: data['owner'] == null ? null : PeamanUser.fromJson(data['owner']),
      initialReactor: data['init_reactor'] == null
          ? null
          : PeamanUser.fromJson(data['init_reactor']),
      reactionCount: data['reactions_count'] ?? 0,
      commentsCount: data['comments_count'] ?? 0,
      savesCount: data['saves_count'] ?? 0,
      sharesCount: data['shares_count'] ?? 0,
      viewsCount: data['views_count'] ?? 0,
      reactorsPhoto: List<String>.from(data['reactors_photo'] ?? []),
      isReacted: data['is_reacted'] ?? false,
      isFeatured: data['is_featured'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'owner_id': ownerId,
      'updated_at': updatedAt,
      'caption': caption,
      'photos': photos,
      'is_featured': isFeatured,
      'owner': owner?.toFeedUser()
    };
  }
}
