// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanFollowRequest _$$_PeamanFollowRequestFromJson(
        Map<String, dynamic> json) =>
    _$_PeamanFollowRequest(
      uid: json['uid'] as String?,
      createdAt: json['created_at'] as int?,
      updatedAt: json['updated_at'] as int?,
      isAccepted: json['is_accepted'] as bool? ?? false,
      isIgnored: json['is_ignored'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PeamanFollowRequestToJson(
    _$_PeamanFollowRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('uid', instance.uid);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  val['is_accepted'] = instance.isAccepted;
  val['is_ignored'] = instance.isIgnored;
  return val;
}
