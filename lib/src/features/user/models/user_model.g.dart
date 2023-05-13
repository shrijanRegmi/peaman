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
      isVerified: json['is_verified'] as bool? ?? false,
      onboardingStep: json['onboarding_step'] as int? ?? 0,
      isOnboardingCompleted: json['is_onboarding_completed'] as bool? ?? false,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      createdAt: json['created_at'] as int?,
      visibility: json['visibility'] as bool? ?? true,
    );

Map<String, dynamic> _$$_PeamanUserToJson(_$_PeamanUser instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('uid', instance.uid);
  writeNotNull('name', instance.name);
  writeNotNull('user_name', instance.userName);
  writeNotNull('email', instance.email);
  writeNotNull('photo', instance.photo);
  writeNotNull('phone', instance.phone);
  writeNotNull('country', instance.country);
  writeNotNull('bio', instance.bio);
  writeNotNull('profession', instance.profession);
  val['gender'] = _$PeamanGenderEnumMap[instance.gender]!;
  writeNotNull('dob', instance.dob);
  val['search_keys'] = instance.searchKeys;
  val['online_status'] = _$PeamanOnlineStatusEnumMap[instance.onlineStatus]!;
  writeNotNull('last_online_at', instance.lastOnlineAt);
  val['feeds_count'] = instance.feedsCount;
  val['photos_count'] = instance.photosCount;
  val['videos_count'] = instance.videosCount;
  val['followers_count'] = instance.followersCount;
  val['following_count'] = instance.followingCount;
  val['reactions_received_from_feeds_count'] =
      instance.reactionsReceivedFromFeedsCount;
  val['comments_received_from_feeds_count'] =
      instance.commentsReceivedFromFeedsCount;
  val['replies_received_from_feeds_count'] =
      instance.repliesReceivedFromFeedsCount;
  val['shares_received_from_feeds_count'] =
      instance.sharesReceivedFromFeedsCount;
  val['views_received_from_feeds_count'] = instance.viewsReceivedFromFeedsCount;
  val['is_admin'] = instance.isAdmin;
  val['is_editor'] = instance.isEditor;
  val['is_tester'] = instance.isTester;
  val['is_verified'] = instance.isVerified;
  val['onboarding_step'] = instance.onboardingStep;
  val['is_onboarding_completed'] = instance.isOnboardingCompleted;
  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  writeNotNull('created_at', instance.createdAt);
  val['visibility'] = instance.visibility;
  return val;
}

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
