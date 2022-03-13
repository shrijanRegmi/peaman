import '../peaman.dart';

class PeamanReaction {
  final String? id;
  final String? ownerId;
  final PeamanReactionParent parent;
  final String? parentId;
  final bool unreacted;
  final int? updatedAt;

  PeamanReaction({
    this.id,
    this.ownerId,
    this.parent = PeamanReactionParent.feed,
    this.parentId,
    this.unreacted = false,
    this.updatedAt,
  });

  PeamanReaction copyWith({
    final String? id,
    final PeamanUser? owner,
    final String? ownerId,
    final PeamanReactionParent? parent,
    final String? parentId,
    final bool? unreacted,
    final bool? initialReaction,
    final int? updatedAt,
  }) {
    return PeamanReaction(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      parent: parent ?? this.parent,
      parentId: parentId ?? this.parentId,
      unreacted: unreacted ?? this.unreacted,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  static PeamanReaction fromJson(final Map<String, dynamic> data) {
    return PeamanReaction(
      id: data['id'],
      ownerId: data['owner_id'],
      parent: PeamanReactionParent.values[data['parent'] ?? 0],
      parentId: data['parent_id'],
      unreacted: data['unreacted'] ?? '',
      updatedAt: data['updated_at'] ?? DateTime.now().millisecondsSinceEpoch,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'owner_id': ownerId,
      'parent': parent.index,
      'parent_id': parentId,
      'updated_at': updatedAt,
    };
  }
}
