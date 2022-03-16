import '../peaman.dart';

class PeamanComment {
  final String? id;
  final String? feedId;
  final String? ownerId;
  final String? secondUserId;
  final String? secondUserName;
  final PeamanCommentParent parent;
  final String? parentId;
  final String? comment;
  final int reactionsCount;
  final int repliesCount;
  final int? updatedAt;

  PeamanComment({
    this.id,
    this.feedId,
    this.ownerId,
    this.secondUserId,
    this.secondUserName,
    this.parent = PeamanCommentParent.feed,
    this.parentId,
    this.comment,
    this.reactionsCount = 0,
    this.repliesCount = 0,
    this.updatedAt,
  });

  PeamanComment copyWith({
    final String? id,
    final String? feedId,
    final String? ownerId,
    final String? secondUserId,
    final String? secondUserName,
    final PeamanCommentParent? parent,
    final String? parentId,
    final String? comment,
    final int? reactionsCount,
    final int? repliesCount,
    final int? updatedAt,
  }) {
    return PeamanComment(
      id: id ?? this.id,
      feedId: feedId ?? this.feedId,
      ownerId: ownerId ?? this.ownerId,
      secondUserId: secondUserId ?? this.secondUserId,
      secondUserName: secondUserName ?? this.secondUserName,
      parent: parent ?? this.parent,
      parentId: parentId ?? this.parentId,
      comment: comment ?? this.comment,
      reactionsCount: reactionsCount ?? this.reactionsCount,
      repliesCount: repliesCount ?? this.repliesCount,
      updatedAt: updatedAt ?? this.updatedAt,
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
      comment: data['comment'] ?? '',
      reactionsCount: data['reactions_count'] ?? 0,
      repliesCount: data['replies_count'] ?? 0,
      updatedAt: data['updated_at'] ?? DateTime.now().millisecondsSinceEpoch,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'feed_id': feedId,
      'owner_id': ownerId,
      'second_user_id': secondUserId,
      'second_user_name': secondUserName,
      'parent': parent.index,
      'parent_id': parentId,
      'comment': comment,
      'updated_at': updatedAt,
    };
  }
}
