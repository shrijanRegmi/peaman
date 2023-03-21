// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hashtag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanHashtag _$$_PeamanHashtagFromJson(Map<String, dynamic> json) =>
    _$_PeamanHashtag(
      id: json['id'] as String?,
      title: json['title'] as String?,
      feeds: json['feeds'] as int?,
      searchKeys: (json['search_keys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      visibility: json['visibility'] as bool? ?? true,
      createdAt: json['created_at'] as int?,
      updatedAt: json['updated_at'] as int?,
    );

Map<String, dynamic> _$$_PeamanHashtagToJson(_$_PeamanHashtag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'feeds': instance.feeds,
      'search_keys': instance.searchKeys,
      'visibility': instance.visibility,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
