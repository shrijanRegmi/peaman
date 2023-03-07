// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanComment _$$_PeamanCommentFromJson(Map<String, dynamic> json) =>
    _$_PeamanComment(
      id: json['id'] as String?,
      feedId: json['feedId'] as String?,
      ownerId: json['ownerId'] as String?,
      secondUserId: json['secondUserId'] as String?,
      secondUserName: json['secondUserName'] as String?,
      parent:
          $enumDecodeNullable(_$PeamanCommentParentEnumMap, json['parent']) ??
              PeamanCommentParent.feed,
      parentId: json['parentId'] as String?,
      parentOwnerId: json['parentOwnerId'] as String?,
      comment: json['comment'] as String?,
      reactionsCount: json['reactionsCount'] as int? ?? 0,
      repliesCount: json['repliesCount'] as int? ?? 0,
      createdAt: json['createdAt'] as int?,
      updatedAt: json['updatedAt'] as int?,
      visibility: json['visibility'] as bool? ?? true,
      extraData: json['extraData'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$_PeamanCommentToJson(_$_PeamanComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feedId': instance.feedId,
      'ownerId': instance.ownerId,
      'secondUserId': instance.secondUserId,
      'secondUserName': instance.secondUserName,
      'parent': _$PeamanCommentParentEnumMap[instance.parent]!,
      'parentId': instance.parentId,
      'parentOwnerId': instance.parentOwnerId,
      'comment': instance.comment,
      'reactionsCount': instance.reactionsCount,
      'repliesCount': instance.repliesCount,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'visibility': instance.visibility,
      'extraData': instance.extraData,
    };

const _$PeamanCommentParentEnumMap = {
  PeamanCommentParent.feed: 'feed',
  PeamanCommentParent.comment: 'comment',
};
