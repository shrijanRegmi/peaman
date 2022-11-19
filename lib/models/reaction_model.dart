import '../peaman.dart';

class PeamanReaction {
  final String? id;
  final String? feedId;
  final String? ownerId;
  final PeamanReactionParent parent;
  final String? parentId;
  final String? parentOwnerId;
  final bool unreacted;
  final int? createdAt;
  final int? updatedAt;
  final bool visibility;
  final Map<String, dynamic> extraData;

  PeamanReaction({
    this.id,
    this.feedId,
    this.ownerId,
    this.parent = PeamanReactionParent.feed,
    this.parentId,
    this.parentOwnerId,
    this.unreacted = false,
    this.createdAt,
    this.updatedAt,
    this.visibility = true,
    this.extraData = const {},
  });

  PeamanReaction copyWith({
    final String? id,
    final String? feedId,
    final String? ownerId,
    final PeamanReactionParent? parent,
    final String? parentId,
    final String? parentOwnerId,
    final bool? unreacted,
    final int? createdAt,
    final int? updatedAt,
    final bool? visibility,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanReaction(
      id: id ?? this.id,
      feedId: feedId ?? this.feedId,
      ownerId: ownerId ?? this.ownerId,
      parent: parent ?? this.parent,
      parentId: parentId ?? this.parentId,
      parentOwnerId: parentOwnerId ?? this.parentOwnerId,
      unreacted: unreacted ?? this.unreacted,
      updatedAt: updatedAt ?? this.updatedAt,
      visibility: visibility ?? this.visibility,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanReaction fromJson(final Map<String, dynamic> data) {
    return PeamanReaction(
      id: data['id'],
      feedId: data['feed_id'],
      ownerId: data['owner_id'],
      parent: PeamanReactionParent.values[data['parent'] ?? 0],
      parentId: data['parent_id'],
      parentOwnerId: data['parent_owner_id'],
      unreacted: data['unreacted'] ?? false,
      updatedAt: data['updated_at'] ?? DateTime.now().millisecondsSinceEpoch,
      visibility: data['visibility'] ?? true,
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'feed_id': feedId,
      'owner_id': ownerId,
      'parent': parent.index,
      'parent_id': parentId,
      'parent_owner_id': parentOwnerId,
      'created_at': updatedAt,
      'updated_at': updatedAt,
      'visibility': visibility,
      ...extraData,
    };
  }
}
