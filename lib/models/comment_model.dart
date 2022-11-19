import '../peaman.dart';

class PeamanComment {
  final String? id;
  final String? feedId;
  final String? ownerId;
  final String? secondUserId;
  final String? secondUserName;
  final PeamanCommentParent parent;
  final String? parentId;
  final String? parentOwnerId;
  final String? comment;
  final int reactionsCount;
  final int repliesCount;
  final int? createdAt;
  final int? updatedAt;
  final bool visibility;
  final Map<String, dynamic> extraData;

  PeamanComment({
    this.id,
    this.feedId,
    this.ownerId,
    this.secondUserId,
    this.secondUserName,
    this.parent = PeamanCommentParent.feed,
    this.parentId,
    this.parentOwnerId,
    this.comment,
    this.reactionsCount = 0,
    this.repliesCount = 0,
    this.createdAt,
    this.updatedAt,
    this.visibility = true,
    this.extraData = const {},
  });

  PeamanComment copyWith({
    final String? id,
    final String? feedId,
    final String? ownerId,
    final String? secondUserId,
    final String? secondUserName,
    final PeamanCommentParent? parent,
    final String? parentId,
    final String? parentOwnerId,
    final String? comment,
    final int? reactionsCount,
    final int? repliesCount,
    final int? createdAt,
    final int? updatedAt,
    final bool? visibility,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanComment(
      id: id ?? this.id,
      feedId: feedId ?? this.feedId,
      ownerId: ownerId ?? this.ownerId,
      secondUserId: secondUserId ?? this.secondUserId,
      secondUserName: secondUserName ?? this.secondUserName,
      parent: parent ?? this.parent,
      parentId: parentId ?? this.parentId,
      parentOwnerId: parentOwnerId ?? this.parentOwnerId,
      comment: comment ?? this.comment,
      reactionsCount: reactionsCount ?? this.reactionsCount,
      repliesCount: repliesCount ?? this.repliesCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      visibility: visibility ?? this.visibility,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanComment fromJson(final Map<String, dynamic> data) {
    return PeamanComment(
      id: data['id'],
      feedId: data['feed_id'],
      ownerId: data['owner_id'],
      secondUserId: data['second_user_id'],
      secondUserName: data['second_user_name'],
      parent: PeamanCommentParent.values[data['parent'] ?? 0],
      parentId: data['parent_id'],
      parentOwnerId: data['parent_owner_id'],
      comment: data['comment'] ?? '',
      reactionsCount: data['reactions_count'] ?? 0,
      repliesCount: data['replies_count'] ?? 0,
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      visibility: data['visibility'] ?? true,
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    final _data = {
      'id': id,
      'feed_id': feedId,
      'owner_id': ownerId,
      'second_user_id': secondUserId,
      'second_user_name': secondUserName,
      'parent': parent.index,
      'parent_id': parentId,
      'parent_owner_id': parentOwnerId,
      'comment': comment,
      'reactions_count': reactionsCount,
      'replies_count': repliesCount,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'visibility': visibility,
      ...extraData,
    };

    _data.removeWhere((key, value) => value == null);

    return _data;
  }
}
