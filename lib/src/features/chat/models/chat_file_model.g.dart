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

Map<String, dynamic> _$$_PeamanChatFileToJson(_$_PeamanChatFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['urls'] = instance.urls;
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  return val;
}
