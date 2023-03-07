// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanReaction _$$_PeamanReactionFromJson(Map<String, dynamic> json) =>
    _$_PeamanReaction(
      id: json['id'] as String?,
      feedId: json['feedId'] as String?,
      ownerId: json['ownerId'] as String?,
      parent:
          $enumDecodeNullable(_$PeamanReactionParentEnumMap, json['parent']) ??
              PeamanReactionParent.feed,
      parentId: json['parentId'] as String?,
      parentOwnerId: json['parentOwnerId'] as String?,
      unreacted: json['unreacted'] as bool? ?? false,
      createdAt: json['createdAt'] as int?,
      updatedAt: json['updatedAt'] as int?,
      visibility: json['visibility'] as bool? ?? true,
      extraData: json['extraData'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$_PeamanReactionToJson(_$_PeamanReaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feedId': instance.feedId,
      'ownerId': instance.ownerId,
      'parent': _$PeamanReactionParentEnumMap[instance.parent]!,
      'parentId': instance.parentId,
      'parentOwnerId': instance.parentOwnerId,
      'unreacted': instance.unreacted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'visibility': instance.visibility,
      'extraData': instance.extraData,
    };

const _$PeamanReactionParentEnumMap = {
  PeamanReactionParent.feed: 'feed',
  PeamanReactionParent.comment: 'comment',
};
