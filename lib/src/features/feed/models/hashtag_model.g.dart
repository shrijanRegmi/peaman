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
      searchKeys: (json['searchKeys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      visibility: json['visibility'] as bool? ?? true,
      createdAt: json['createdAt'] as int?,
      updatedAt: json['updatedAt'] as int?,
    );

Map<String, dynamic> _$$_PeamanHashtagToJson(_$_PeamanHashtag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'feeds': instance.feeds,
      'searchKeys': instance.searchKeys,
      'visibility': instance.visibility,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
