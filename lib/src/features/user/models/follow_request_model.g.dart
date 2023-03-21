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
        _$_PeamanFollowRequest instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_accepted': instance.isAccepted,
      'is_ignored': instance.isIgnored,
    };
