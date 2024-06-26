// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanReaction _$$_PeamanReactionFromJson(Map<String, dynamic> json) =>
    _$_PeamanReaction(
      id: json['id'] as String?,
      feedId: json['feed_id'] as String?,
      ownerId: json['owner_id'] as String?,
      parent:
          $enumDecodeNullable(_$PeamanReactionParentEnumMap, json['parent']) ??
              PeamanReactionParent.feed,
      parentId: json['parent_id'] as String?,
      parentOwnerId: json['parent_owner_id'] as String?,
      unreacted: json['unreacted'] as bool? ?? false,
      createdAt: json['created_at'] as int?,
      updatedAt: json['updated_at'] as int?,
      visibility: json['visibility'] as bool? ?? true,
      extraData: json['extra_data'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$_PeamanReactionToJson(_$_PeamanReaction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('feed_id', instance.feedId);
  writeNotNull('owner_id', instance.ownerId);
  val['parent'] = _$PeamanReactionParentEnumMap[instance.parent]!;
  writeNotNull('parent_id', instance.parentId);
  writeNotNull('parent_owner_id', instance.parentOwnerId);
  val['unreacted'] = instance.unreacted;
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  val['visibility'] = instance.visibility;
  val['extra_data'] = instance.extraData;
  return val;
}

const _$PeamanReactionParentEnumMap = {
  PeamanReactionParent.feed: 'feed',
  PeamanReactionParent.comment: 'comment',
};
