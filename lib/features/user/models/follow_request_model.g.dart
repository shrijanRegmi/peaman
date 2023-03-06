// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanFollowRequest _$$_PeamanFollowRequestFromJson(
        Map<String, dynamic> json) =>
    _$_PeamanFollowRequest(
      uid: json['uid'] as String?,
      createdAt: json['createdAt'] as int?,
      updatedAt: json['updatedAt'] as int?,
      isAccepted: json['isAccepted'] as bool? ?? false,
      isIgnored: json['isIgnored'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PeamanFollowRequestToJson(
        _$_PeamanFollowRequest instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isAccepted': instance.isAccepted,
      'isIgnored': instance.isIgnored,
    };
