import '../peaman.dart';

class PeamanReaction {
  final String? id;
  final String? feedId;
  final String? ownerId;
  final PeamanReactionParent parent;
  final String? parentId;
  final bool unreacted;
  final int? createdAt;
  final int? updatedAt;
  final Map<String, dynamic> extraData;

  PeamanReaction({
    this.id,
    this.feedId,
    this.ownerId,
    this.parent = PeamanReactionParent.feed,
    this.parentId,
    this.unreacted = false,
    this.createdAt,
    this.updatedAt,
    this.extraData = const {},
  });

  PeamanReaction copyWith({
    final String? id,
    final String? feedId,
    final String? ownerId,
    final PeamanReactionParent? parent,
    final String? parentId,
    final bool? unreacted,
    final int? createdAt,
    final int? updatedAt,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanReaction(
      id: id ?? this.id,
      feedId: feedId ?? this.feedId,
      ownerId: ownerId ?? this.ownerId,
      parent: parent ?? this.parent,
      parentId: parentId ?? this.parentId,
      unreacted: unreacted ?? this.unreacted,
      updatedAt: updatedAt ?? this.updatedAt,
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
      unreacted: data['unreacted'] ?? false,
      updatedAt: data['updated_at'] ?? DateTime.now().millisecondsSinceEpoch,
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
      'created_at': updatedAt,
      'updated_at': updatedAt,
      ...extraData,
    };
  }
}
