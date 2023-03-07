// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanChatFile _$$_PeamanChatFileFromJson(Map<String, dynamic> json) =>
    _$_PeamanChatFile(
      id: json['id'] as String?,
      urls: (json['urls'] as List<dynamic>?)
              ?.map(
                  (e) => PeamanChatFileUrl.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PeamanChatFileUrl>[],
      createdAt: json['createdAt'] as int?,
      updatedAt: json['updatedAt'] as int?,
    );

Map<String, dynamic> _$$_PeamanChatFileToJson(_$_PeamanChatFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'urls': instance.urls,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
