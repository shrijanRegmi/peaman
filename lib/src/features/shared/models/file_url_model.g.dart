// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_url_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanChatFileUrl _$$_PeamanChatFileUrlFromJson(Map<String, dynamic> json) =>
    _$_PeamanChatFileUrl(
      id: json['id'] as String?,
      url: json['url'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
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

  writeNotNull('id', instance.id);
  writeNotNull('url', instance.url);
  writeNotNull('thumbnail_url', instance.thumbnailUrl);
  val['type'] = _$PeamanFileTypeEnumMap[instance.type]!;
  return val;
}

const _$PeamanFileTypeEnumMap = {
  PeamanFileType.unknown: 'unknown',
  PeamanFileType.image: 'image',
  PeamanFileType.video: 'video',
  PeamanFileType.pdf: 'pdf',
  PeamanFileType.link: 'link',
  PeamanFileType.other: 'other',
};
