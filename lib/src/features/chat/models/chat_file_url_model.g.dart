// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_file_url_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanChatFileUrl _$$_PeamanChatFileUrlFromJson(Map<String, dynamic> json) =>
    _$_PeamanChatFileUrl(
      url: json['url'] as String?,
      type: $enumDecodeNullable(_$PeamanChatFileTypeEnumMap, json['type']) ??
          PeamanChatFileType.unknown,
    );

Map<String, dynamic> _$$_PeamanChatFileUrlToJson(
        _$_PeamanChatFileUrl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'type': _$PeamanChatFileTypeEnumMap[instance.type]!,
    };

const _$PeamanChatFileTypeEnumMap = {
  PeamanChatFileType.unknown: 'unknown',
  PeamanChatFileType.image: 'image',
  PeamanChatFileType.video: 'video',
  PeamanChatFileType.pdf: 'pdf',
  PeamanChatFileType.other: 'other',
};
