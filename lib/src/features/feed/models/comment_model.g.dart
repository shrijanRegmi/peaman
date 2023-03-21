// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanComment _$$_PeamanCommentFromJson(Map<String, dynamic> json) =>
    _$_PeamanComment(
      id: json['id'] as String?,
      feedId: json['feed_id'] as String?,
      ownerId: json['owner_id'] as String?,
      secondUserId: json['second_user_id'] as String?,
      secondUserName: json['second_user_name'] as String?,
      parent:
          $enumDecodeNullable(_$PeamanCommentParentEnumMap, json['parent']) ??
              PeamanCommentParent.feed,
      parentId: json['parent_id'] as String?,
      parentOwnerId: json['parent_owner_id'] as String?,
      comment: json['comment'] as String?,
      reactionsCount: json['reactions_count'] as int? ?? 0,
      repliesCount: json['replies_count'] as int? ?? 0,
      createdAt: json['created_at'] as int?,
      updatedAt: json['updated_at'] as int?,
      visibility: json['visibility'] as bool? ?? true,
      extraData: json['extra_data'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$_PeamanCommentToJson(_$_PeamanComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feed_id': instance.feedId,
      'owner_id': instance.ownerId,
      'second_user_id': instance.secondUserId,
      'second_user_name': instance.secondUserName,
      'parent': _$PeamanCommentParentEnumMap[instance.parent]!,
      'parent_id': instance.parentId,
      'parent_owner_id': instance.parentOwnerId,
      'comment': instance.comment,
      'reactions_count': instance.reactionsCount,
      'replies_count': instance.repliesCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'visibility': instance.visibility,
      'extra_data': instance.extraData,
    };

const _$PeamanCommentParentEnumMap = {
  PeamanCommentParent.feed: 'feed',
  PeamanCommentParent.comment: 'comment',
};
