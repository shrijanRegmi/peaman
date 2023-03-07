// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanFeed _$$_PeamanFeedFromJson(Map<String, dynamic> json) =>
    _$_PeamanFeed(
      id: json['id'] as String?,
      ownerId: json['ownerId'] as String?,
      caption: json['caption'] as String?,
      files: (json['files'] as List<dynamic>?)
              ?.map((e) => PeamanFileUrl.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PeamanFileUrl>[],
      type: $enumDecodeNullable(_$PeamanFeedTypeEnumMap, json['type']) ??
          PeamanFeedType.text,
      reactionsCount: json['reactionsCount'] as int? ?? 0,
      commentsCount: json['commentsCount'] as int? ?? 0,
      repliesCount: json['repliesCount'] as int? ?? 0,
      savesCount: json['savesCount'] as int? ?? 0,
      sharesCount: json['sharesCount'] as int? ?? 0,
      viewsCount: json['viewsCount'] as int? ?? 0,
      featured: json['featured'] as bool? ?? false,
      searchKeys: (json['searchKeys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      createdAt: json['createdAt'] as int?,
      updatedAt: json['updatedAt'] as int?,
      visibility: json['visibility'] as bool? ?? true,
      extraData: json['extraData'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$_PeamanFeedToJson(_$_PeamanFeed instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'caption': instance.caption,
      'files': instance.files,
      'type': _$PeamanFeedTypeEnumMap[instance.type]!,
      'reactionsCount': instance.reactionsCount,
      'commentsCount': instance.commentsCount,
      'repliesCount': instance.repliesCount,
      'savesCount': instance.savesCount,
      'sharesCount': instance.sharesCount,
      'viewsCount': instance.viewsCount,
      'featured': instance.featured,
      'searchKeys': instance.searchKeys,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'visibility': instance.visibility,
      'extraData': instance.extraData,
    };

const _$PeamanFeedTypeEnumMap = {
  PeamanFeedType.text: 'text',
  PeamanFeedType.file: 'file',
  PeamanFeedType.other: 'other',
};
