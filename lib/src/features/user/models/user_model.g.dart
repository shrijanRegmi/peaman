// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanUser _$$_PeamanUserFromJson(Map<String, dynamic> json) =>
    _$_PeamanUser(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      userName: json['user_name'] as String?,
      email: json['email'] as String?,
      photo: json['photo'] as String?,
      phone: json['phone'] as String?,
      country: json['country'] as String?,
      bio: json['bio'] as String?,
      profession: json['profession'] as String?,
      gender: $enumDecodeNullable(_$PeamanGenderEnumMap, json['gender']) ??
          PeamanGender.unknown,
      dob: json['dob'] as int?,
      searchKeys: (json['search_keys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      onlineStatus: $enumDecodeNullable(
              _$PeamanOnlineStatusEnumMap, json['online_status']) ??
          PeamanOnlineStatus.unknown,
      lastOnlineAt: json['last_online_at'] as int?,
      feedsCount: json['feeds_count'] as int? ?? 0,
      photosCount: json['photos_count'] as int? ?? 0,
      videosCount: json['videos_count'] as int? ?? 0,
      followersCount: json['followers_count'] as int? ?? 0,
      followingCount: json['following_count'] as int? ?? 0,
      reactionsReceivedFromFeedsCount:
          json['reactions_received_from_feeds_count'] as int? ?? 0,
      commentsReceivedFromFeedsCount:
          json['comments_received_from_feeds_count'] as int? ?? 0,
      repliesReceivedFromFeedsCount:
          json['replies_received_from_feeds_count'] as int? ?? 0,
      sharesReceivedFromFeedsCount:
          json['shares_received_from_feeds_count'] as int? ?? 0,
      viewsReceivedFromFeedsCount:
          json['views_received_from_feeds_count'] as int? ?? 0,
      isAdmin: json['is_admin'] as bool? ?? false,
      isEditor: json['is_editor'] as bool? ?? false,
      isTester: json['is_tester'] as bool? ?? false,
      onboardingStep: json['onboarding_step'] as int? ?? 0,
      isOnboardingCompleted: json['is_onboarding_completed'] as bool? ?? false,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      createdAt: json['created_at'] as int?,
      visibility: json['visibility'] as bool? ?? true,
      extraData: json['extra_data'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$_PeamanUserToJson(_$_PeamanUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'user_name': instance.userName,
      'email': instance.email,
      'photo': instance.photo,
      'phone': instance.phone,
      'country': instance.country,
      'bio': instance.bio,
      'profession': instance.profession,
      'gender': _$PeamanGenderEnumMap[instance.gender]!,
      'dob': instance.dob,
      'search_keys': instance.searchKeys,
      'online_status': _$PeamanOnlineStatusEnumMap[instance.onlineStatus]!,
      'last_online_at': instance.lastOnlineAt,
      'feeds_count': instance.feedsCount,
      'photos_count': instance.photosCount,
      'videos_count': instance.videosCount,
      'followers_count': instance.followersCount,
      'following_count': instance.followingCount,
      'reactions_received_from_feeds_count':
          instance.reactionsReceivedFromFeedsCount,
      'comments_received_from_feeds_count':
          instance.commentsReceivedFromFeedsCount,
      'replies_received_from_feeds_count':
          instance.repliesReceivedFromFeedsCount,
      'shares_received_from_feeds_count': instance.sharesReceivedFromFeedsCount,
      'views_received_from_feeds_count': instance.viewsReceivedFromFeedsCount,
      'is_admin': instance.isAdmin,
      'is_editor': instance.isEditor,
      'is_tester': instance.isTester,
      'onboarding_step': instance.onboardingStep,
      'is_onboarding_completed': instance.isOnboardingCompleted,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'created_at': instance.createdAt,
      'visibility': instance.visibility,
      'extra_data': instance.extraData,
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
