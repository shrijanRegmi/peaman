// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_url_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanChatFileUrl _$$_PeamanChatFileUrlFromJson(Map<String, dynamic> json) =>
    _$_PeamanChatFileUrl(
      url: json['url'] as String?,
      type: $enumDecodeNullable(_$PeamanFileTypeEnumMap, json['type']) ??
          PeamanFileType.unknown,
    );

Map<String, dynamic> _$$_PeamanChatFileUrlToJson(
    _$_PeamanChatFileUrl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  val['type'] = _$PeamanFileTypeEnumMap[instance.type]!;
  return val;
}

const _$PeamanFileTypeEnumMap = {
  PeamanFileType.unknown: 'unknown',
  PeamanFileType.image: 'image',
  PeamanFileType.video: 'video',
  PeamanFileType.pdf: 'pdf',
  PeamanFileType.other: 'other',
};
