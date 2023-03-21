// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanFeed _$$_PeamanFeedFromJson(Map<String, dynamic> json) =>
    _$_PeamanFeed(
      id: json['id'] as String?,
      ownerId: json['owner_id'] as String?,
      caption: json['caption'] as String?,
      files: (json['files'] as List<dynamic>?)
              ?.map((e) => PeamanFileUrl.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PeamanFileUrl>[],
      type: $enumDecodeNullable(_$PeamanFeedTypeEnumMap, json['type']) ??
          PeamanFeedType.text,
      reactionsCount: json['reactions_count'] as int? ?? 0,
      commentsCount: json['comments_count'] as int? ?? 0,
      repliesCount: json['replies_count'] as int? ?? 0,
      savesCount: json['saves_count'] as int? ?? 0,
      sharesCount: json['shares_count'] as int? ?? 0,
      viewsCount: json['views_count'] as int? ?? 0,
      featured: json['featured'] as bool? ?? false,
      searchKeys: (json['search_keys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      createdAt: json['created_at'] as int?,
      updatedAt: json['updated_at'] as int?,
      visibility: json['visibility'] as bool? ?? true,
      extraData: json['extra_data'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$_PeamanFeedToJson(_$_PeamanFeed instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'caption': instance.caption,
      'files': instance.files,
      'type': _$PeamanFeedTypeEnumMap[instance.type]!,
      'reactions_count': instance.reactionsCount,
      'comments_count': instance.commentsCount,
      'replies_count': instance.repliesCount,
      'saves_count': instance.savesCount,
      'shares_count': instance.sharesCount,
      'views_count': instance.viewsCount,
      'featured': instance.featured,
      'search_keys': instance.searchKeys,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'visibility': instance.visibility,
      'extra_data': instance.extraData,
    };

const _$PeamanFeedTypeEnumMap = {
  PeamanFeedType.text: 'text',
  PeamanFeedType.file: 'file',
  PeamanFeedType.other: 'other',
};
