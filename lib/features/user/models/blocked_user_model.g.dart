// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocked_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanBlockedUser _$$_PeamanBlockedUserFromJson(Map<String, dynamic> json) =>
    _$_PeamanBlockedUser(
      uid: json['uid'] as String?,
      createdAt: json['createdAt'] as int?,
      updatedAt: json['updatedAt'] as int?,
      isAccepted: json['isAccepted'] as bool? ?? false,
      isIgnored: json['isIgnored'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PeamanBlockedUserToJson(
        _$_PeamanBlockedUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isAccepted': instance.isAccepted,
      'isIgnored': instance.isIgnored,
    };
