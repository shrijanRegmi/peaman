// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanChatFile _$$_PeamanChatFileFromJson(Map<String, dynamic> json) =>
    _$_PeamanChatFile(
      id: json['id'] as String?,
      urls: (json['urls'] as List<dynamic>?)
              ?.map((e) => PeamanFileUrl.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PeamanFileUrl>[],
      createdAt: json['created_at'] as int?,
      updatedAt: json['updated_at'] as int?,
    );

Map<String, dynamic> _$$_PeamanChatFileToJson(_$_PeamanChatFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'urls': instance.urls,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
