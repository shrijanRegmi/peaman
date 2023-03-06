// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanUser _$$_PeamanUserFromJson(Map<String, dynamic> json) =>
    _$_PeamanUser(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      photo: json['photo'] as String?,
      phone: json['phone'] as String?,
      country: json['country'] as String?,
      bio: json['bio'] as String?,
      profession: json['profession'] as String?,
      gender: $enumDecodeNullable(_$PeamanGenderEnumMap, json['gender']) ??
          PeamanGender.unknown,
      dob: json['dob'] as int?,
      searchKeys: (json['searchKeys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      onlineStatus: $enumDecodeNullable(
              _$PeamanOnlineStatusEnumMap, json['onlineStatus']) ??
          PeamanOnlineStatus.unknown,
      lastOnlineAt: json['lastOnlineAt'] as int?,
      feedsCount: json['feedsCount'] as int? ?? 0,
      photosCount: json['photosCount'] as int? ?? 0,
      videosCount: json['videosCount'] as int? ?? 0,
      followersCount: json['followersCount'] as int? ?? 0,
      followingCount: json['followingCount'] as int? ?? 0,
      reactionsReceivedFromFeedsCount:
          json['reactionsReceivedFromFeedsCount'] as int? ?? 0,
      commentsReceivedFromFeedsCount:
          json['commentsReceivedFromFeedsCount'] as int? ?? 0,
      repliesReceivedFromFeedsCount:
          json['repliesReceivedFromFeedsCount'] as int? ?? 0,
      sharesReceivedFromFeedsCount:
          json['sharesReceivedFromFeedsCount'] as int? ?? 0,
      viewsReceivedFromFeedsCount:
          json['viewsReceivedFromFeedsCount'] as int? ?? 0,
      isAdmin: json['isAdmin'] as bool? ?? false,
      isEditor: json['isEditor'] as bool? ?? false,
      isTester: json['isTester'] as bool? ?? false,
      onboardingStep: json['onboardingStep'] as int? ?? 0,
      isOnboardingCompleted: json['isOnboardingCompleted'] as bool? ?? false,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      createdAt: json['createdAt'] as int?,
      visibility: json['visibility'] as bool? ?? true,
      extraData: json['extraData'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$_PeamanUserToJson(_$_PeamanUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'userName': instance.userName,
      'email': instance.email,
      'photo': instance.photo,
      'phone': instance.phone,
      'country': instance.country,
      'bio': instance.bio,
      'profession': instance.profession,
      'gender': _$PeamanGenderEnumMap[instance.gender]!,
      'dob': instance.dob,
      'searchKeys': instance.searchKeys,
      'onlineStatus': _$PeamanOnlineStatusEnumMap[instance.onlineStatus]!,
      'lastOnlineAt': instance.lastOnlineAt,
      'feedsCount': instance.feedsCount,
      'photosCount': instance.photosCount,
      'videosCount': instance.videosCount,
      'followersCount': instance.followersCount,
      'followingCount': instance.followingCount,
      'reactionsReceivedFromFeedsCount':
          instance.reactionsReceivedFromFeedsCount,
      'commentsReceivedFromFeedsCount': instance.commentsReceivedFromFeedsCount,
      'repliesReceivedFromFeedsCount': instance.repliesReceivedFromFeedsCount,
      'sharesReceivedFromFeedsCount': instance.sharesReceivedFromFeedsCount,
      'viewsReceivedFromFeedsCount': instance.viewsReceivedFromFeedsCount,
      'isAdmin': instance.isAdmin,
      'isEditor': instance.isEditor,
      'isTester': instance.isTester,
      'onboardingStep': instance.onboardingStep,
      'isOnboardingCompleted': instance.isOnboardingCompleted,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'createdAt': instance.createdAt,
      'visibility': instance.visibility,
      'extraData': instance.extraData,
    };

const _$PeamanGenderEnumMap = {
  PeamanGender.unknown: 'unknown',
  PeamanGender.male: 'male',
  PeamanGender.female: 'female',
  PeamanGender.other: 'other',
};

const _$PeamanOnlineStatusEnumMap = {
  PeamanOnlineStatus.unknown: 'unknown',
  PeamanOnlineStatus.away: 'away',
  PeamanOnlineStatus.active: 'active',
};
