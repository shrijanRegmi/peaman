// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanSubUser _$$_PeamanSubUserFromJson(Map<String, dynamic> json) =>
    _$_PeamanSubUser(
      uid: json['uid'] as String?,
      createdAt: json['created_at'] as int?,
      updatedAt: json['updated_at'] as int?,
    );

Map<String, dynamic> _$$_PeamanSubUserToJson(_$_PeamanSubUser instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('uid', instance.uid);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  return val;
}
