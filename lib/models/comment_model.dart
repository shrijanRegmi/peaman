import '../peaman.dart';

class PeamanComment {
  final String? id;
  final PeamanUser? owner;
  final String? ownerId;
  final PeamanCommentParent? parent;
  final String? parentId;
  final String? comment;
  final int repliesCount;
  final int? updatedAt;

  PeamanComment({
    this.id,
    this.owner,
    this.ownerId,
    this.parent,
    this.parentId,
    this.comment,
    this.repliesCount = 0,
    this.updatedAt,
  });

  PeamanComment copyWith({
    final String? id,
    final PeamanUser? owner,
    final String? ownerId,
    final PeamanCommentParent? parent,
    final String? parentId,
    final String? comment,
    final int? repliesCount,
    final int? updatedAt,
  }) {
    return PeamanComment(
      id: id ?? this.id,
      owner: owner ?? this.owner,
      ownerId: ownerId ?? this.ownerId,
      parent: parent ?? this.parent,
      parentId: parentId ?? this.parentId,
      comment: comment ?? this.comment,
      repliesCount: repliesCount ?? this.repliesCount,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  static PeamanComment fromJson(
    final Map<String, dynamic> data,
    final PeamanUser owner,
  ) {
    return PeamanComment(
      id: data['id'],
      owner: owner,
      ownerId: data['owner_id'],
      parent: PeamanCommentParent.values[data['parent'] ?? 0],
      parentId: data['parent_id'],
      comment: data['comment'] ?? '',
      repliesCount: data['replies_count'] ?? 0,
      updatedAt: data['updated_at'] ?? DateTime.now().millisecondsSinceEpoch,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'owner_id': ownerId,
      'parent': parent?.index ?? 0,
      'parent_id': parentId,
      'comment': comment,
      'updated_at': updatedAt,
    };
  }
}
