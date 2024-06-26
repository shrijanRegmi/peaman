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

Map<String, dynamic> _$$_PeamanCommentToJson(_$_PeamanComment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('feed_id', instance.feedId);
  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('second_user_id', instance.secondUserId);
  writeNotNull('second_user_name', instance.secondUserName);
  val['parent'] = _$PeamanCommentParentEnumMap[instance.parent]!;
  writeNotNull('parent_id', instance.parentId);
  writeNotNull('parent_owner_id', instance.parentOwnerId);
  writeNotNull('comment', instance.comment);
  val['reactions_count'] = instance.reactionsCount;
  val['replies_count'] = instance.repliesCount;
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  val['visibility'] = instance.visibility;
  val['extra_data'] = instance.extraData;
  return val;
}

const _$PeamanCommentParentEnumMap = {
  PeamanCommentParent.feed: 'feed',
  PeamanCommentParent.comment: 'comment',
};
