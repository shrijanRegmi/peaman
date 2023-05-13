// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanUser _$PeamanUserFromJson(Map<String, dynamic> json) {
  return _PeamanUser.fromJson(json);
}

/// @nodoc
mixin _$PeamanUser {
  String? get uid => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get profession => throw _privateConstructorUsedError;
  PeamanGender get gender => throw _privateConstructorUsedError;
  int? get dob => throw _privateConstructorUsedError;
  List<String> get searchKeys => throw _privateConstructorUsedError;
  PeamanOnlineStatus get onlineStatus => throw _privateConstructorUsedError;
  int? get lastOnlineAt => throw _privateConstructorUsedError;
  int get feedsCount => throw _privateConstructorUsedError;
  int get photosCount => throw _privateConstructorUsedError;
  int get videosCount => throw _privateConstructorUsedError;
  int get followersCount => throw _privateConstructorUsedError;
  int get followingCount => throw _privateConstructorUsedError;
  int get reactionsReceivedFromFeedsCount => throw _privateConstructorUsedError;
  int get commentsReceivedFromFeedsCount => throw _privateConstructorUsedError;
  int get repliesReceivedFromFeedsCount => throw _privateConstructorUsedError;
  int get sharesReceivedFromFeedsCount => throw _privateConstructorUsedError;
  int get viewsReceivedFromFeedsCount => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;
  bool get isEditor => throw _privateConstructorUsedError;
  bool get isTester => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  int get onboardingStep => throw _privateConstructorUsedError;
  bool get isOnboardingCompleted => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  bool get visibility => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Map<String, dynamic> get extraData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanUserCopyWith<PeamanUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanUserCopyWith<$Res> {
  factory $PeamanUserCopyWith(
          PeamanUser value, $Res Function(PeamanUser) then) =
      _$PeamanUserCopyWithImpl<$Res, PeamanUser>;
  @useResult
  $Res call(
      {String? uid,
      String? name,
      String? userName,
      String? email,
      String? photo,
      String? phone,
      String? country,
      String? bio,
      String? profession,
      PeamanGender gender,
      int? dob,
      List<String> searchKeys,
      PeamanOnlineStatus onlineStatus,
      int? lastOnlineAt,
      int feedsCount,
      int photosCount,
      int videosCount,
      int followersCount,
      int followingCount,
      int reactionsReceivedFromFeedsCount,
      int commentsReceivedFromFeedsCount,
      int repliesReceivedFromFeedsCount,
      int sharesReceivedFromFeedsCount,
      int viewsReceivedFromFeedsCount,
      bool isAdmin,
      bool isEditor,
      bool isTester,
      bool isVerified,
      int onboardingStep,
      bool isOnboardingCompleted,
      double? latitude,
      double? longitude,
      int? createdAt,
      bool visibility,
      @JsonKey(ignore: true) Map<String, dynamic> extraData});
}

/// @nodoc
class _$PeamanUserCopyWithImpl<$Res, $Val extends PeamanUser>
    implements $PeamanUserCopyWith<$Res> {
  _$PeamanUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? photo = freezed,
    Object? phone = freezed,
    Object? country = freezed,
    Object? bio = freezed,
    Object? profession = freezed,
    Object? gender = null,
    Object? dob = freezed,
    Object? searchKeys = null,
    Object? onlineStatus = null,
    Object? lastOnlineAt = freezed,
    Object? feedsCount = null,
    Object? photosCount = null,
    Object? videosCount = null,
    Object? followersCount = null,
    Object? followingCount = null,
    Object? reactionsReceivedFromFeedsCount = null,
    Object? commentsReceivedFromFeedsCount = null,
    Object? repliesReceivedFromFeedsCount = null,
    Object? sharesReceivedFromFeedsCount = null,
    Object? viewsReceivedFromFeedsCount = null,
    Object? isAdmin = null,
    Object? isEditor = null,
    Object? isTester = null,
    Object? isVerified = null,
    Object? onboardingStep = null,
    Object? isOnboardingCompleted = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? createdAt = freezed,
    Object? visibility = null,
    Object? extraData = null,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PeamanGender,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as int?,
      searchKeys: null == searchKeys
          ? _value.searchKeys
          : searchKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onlineStatus: null == onlineStatus
          ? _value.onlineStatus
          : onlineStatus // ignore: cast_nullable_to_non_nullable
              as PeamanOnlineStatus,
      lastOnlineAt: freezed == lastOnlineAt
          ? _value.lastOnlineAt
          : lastOnlineAt // ignore: cast_nullable_to_non_nullable
              as int?,
      feedsCount: null == feedsCount
          ? _value.feedsCount
          : feedsCount // ignore: cast_nullable_to_non_nullable
              as int,
      photosCount: null == photosCount
          ? _value.photosCount
          : photosCount // ignore: cast_nullable_to_non_nullable
              as int,
      videosCount: null == videosCount
          ? _value.videosCount
          : videosCount // ignore: cast_nullable_to_non_nullable
              as int,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      reactionsReceivedFromFeedsCount: null == reactionsReceivedFromFeedsCount
          ? _value.reactionsReceivedFromFeedsCount
          : reactionsReceivedFromFeedsCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsReceivedFromFeedsCount: null == commentsReceivedFromFeedsCount
          ? _value.commentsReceivedFromFeedsCount
          : commentsReceivedFromFeedsCount // ignore: cast_nullable_to_non_nullable
              as int,
      repliesReceivedFromFeedsCount: null == repliesReceivedFromFeedsCount
          ? _value.repliesReceivedFromFeedsCount
          : repliesReceivedFromFeedsCount // ignore: cast_nullable_to_non_nullable
              as int,
      sharesReceivedFromFeedsCount: null == sharesReceivedFromFeedsCount
          ? _value.sharesReceivedFromFeedsCount
          : sharesReceivedFromFeedsCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewsReceivedFromFeedsCount: null == viewsReceivedFromFeedsCount
          ? _value.viewsReceivedFromFeedsCount
          : viewsReceivedFromFeedsCount // ignore: cast_nullable_to_non_nullable
              as int,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditor: null == isEditor
          ? _value.isEditor
          : isEditor // ignore: cast_nullable_to_non_nullable
              as bool,
      isTester: null == isTester
          ? _value.isTester
          : isTester // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      onboardingStep: null == onboardingStep
          ? _value.onboardingStep
          : onboardingStep // ignore: cast_nullable_to_non_nullable
              as int,
      isOnboardingCompleted: null == isOnboardingCompleted
          ? _value.isOnboardingCompleted
          : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
      extraData: null == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanUserCopyWith<$Res>
    implements $PeamanUserCopyWith<$Res> {
  factory _$$_PeamanUserCopyWith(
          _$_PeamanUser value, $Res Function(_$_PeamanUser) then) =
      __$$_PeamanUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String? name,
      String? userName,
      String? email,
      String? photo,
      String? phone,
      String? country,
      String? bio,
      String? profession,
      PeamanGender gender,
      int? dob,
      List<String> searchKeys,
      PeamanOnlineStatus onlineStatus,
      int? lastOnlineAt,
      int feedsCount,
      int photosCount,
      int videosCount,
      int followersCount,
      int followingCount,
      int reactionsReceivedFromFeedsCount,
      int commentsReceivedFromFeedsCount,
      int repliesReceivedFromFeedsCount,
      int sharesReceivedFromFeedsCount,
      int viewsReceivedFromFeedsCount,
      bool isAdmin,
      bool isEditor,
      bool isTester,
      bool isVerified,
      int onboardingStep,
      bool isOnboardingCompleted,
      double? latitude,
      double? longitude,
      int? createdAt,
      bool visibility,
      @JsonKey(ignore: true) Map<String, dynamic> extraData});
}

/// @nodoc
class __$$_PeamanUserCopyWithImpl<$Res>
    extends _$PeamanUserCopyWithImpl<$Res, _$_PeamanUser>
    implements _$$_PeamanUserCopyWith<$Res> {
  __$$_PeamanUserCopyWithImpl(
      _$_PeamanUser _value, $Res Function(_$_PeamanUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? photo = freezed,
    Object? phone = freezed,
    Object? country = freezed,
    Object? bio = freezed,
    Object? profession = freezed,
    Object? gender = null,
    Object? dob = freezed,
    Object? searchKeys = null,
    Object? onlineStatus = null,
    Object? lastOnlineAt = freezed,
    Object? feedsCount = null,
    Object? photosCount = null,
    Object? videosCount = null,
    Object? followersCount = null,
    Object? followingCount = null,
    Object? reactionsReceivedFromFeedsCount = null,
    Object? commentsReceivedFromFeedsCount = null,
    Object? repliesReceivedFromFeedsCount = null,
    Object? sharesReceivedFromFeedsCount = null,
    Object? viewsReceivedFromFeedsCount = null,
    Object? isAdmin = null,
    Object? isEditor = null,
    Object? isTester = null,
    Object? isVerified = null,
    Object? onboardingStep = null,
    Object? isOnboardingCompleted = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? createdAt = freezed,
    Object? visibility = null,
    Object? extraData = null,
  }) {
    return _then(_$_PeamanUser(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PeamanGender,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as int?,
      searchKeys: null == searchKeys
          ? _value._searchKeys
          : searchKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onlineStatus: null == onlineStatus
          ? _value.onlineStatus
          : onlineStatus // ignore: cast_nullable_to_non_nullable
              as PeamanOnlineStatus,
      lastOnlineAt: freezed == lastOnlineAt
          ? _value.lastOnlineAt
          : lastOnlineAt // ignore: cast_nullable_to_non_nullable
              as int?,
      feedsCount: null == feedsCount
          ? _value.feedsCount
          : feedsCount // ignore: cast_nullable_to_non_nullable
              as int,
      photosCount: null == photosCount
          ? _value.photosCount
          : photosCount // ignore: cast_nullable_to_non_nullable
              as int,
      videosCount: null == videosCount
          ? _value.videosCount
          : videosCount // ignore: cast_nullable_to_non_nullable
              as int,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      reactionsReceivedFromFeedsCount: null == reactionsReceivedFromFeedsCount
          ? _value.reactionsReceivedFromFeedsCount
          : reactionsReceivedFromFeedsCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsReceivedFromFeedsCount: null == commentsReceivedFromFeedsCount
          ? _value.commentsReceivedFromFeedsCount
          : commentsReceivedFromFeedsCount // ignore: cast_nullable_to_non_nullable
              as int,
      repliesReceivedFromFeedsCount: null == repliesReceivedFromFeedsCount
          ? _value.repliesReceivedFromFeedsCount
          : repliesReceivedFromFeedsCount // ignore: cast_nullable_to_non_nullable
              as int,
      sharesReceivedFromFeedsCount: null == sharesReceivedFromFeedsCount
          ? _value.sharesReceivedFromFeedsCount
          : sharesReceivedFromFeedsCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewsReceivedFromFeedsCount: null == viewsReceivedFromFeedsCount
          ? _value.viewsReceivedFromFeedsCount
          : viewsReceivedFromFeedsCount // ignore: cast_nullable_to_non_nullable
              as int,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditor: null == isEditor
          ? _value.isEditor
          : isEditor // ignore: cast_nullable_to_non_nullable
              as bool,
      isTester: null == isTester
          ? _value.isTester
          : isTester // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      onboardingStep: null == onboardingStep
          ? _value.onboardingStep
          : onboardingStep // ignore: cast_nullable_to_non_nullable
              as int,
      isOnboardingCompleted: null == isOnboardingCompleted
          ? _value.isOnboardingCompleted
          : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
      extraData: null == extraData
          ? _value._extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PeamanUser implements _PeamanUser {
  const _$_PeamanUser(
      {this.uid,
      this.name,
      this.userName,
      this.email,
      this.photo,
      this.phone,
      this.country,
      this.bio,
      this.profession,
      this.gender = PeamanGender.unknown,
      this.dob,
      final List<String> searchKeys = const <String>[],
      this.onlineStatus = PeamanOnlineStatus.unknown,
      this.lastOnlineAt,
      this.feedsCount = 0,
      this.photosCount = 0,
      this.videosCount = 0,
      this.followersCount = 0,
      this.followingCount = 0,
      this.reactionsReceivedFromFeedsCount = 0,
      this.commentsReceivedFromFeedsCount = 0,
      this.repliesReceivedFromFeedsCount = 0,
      this.sharesReceivedFromFeedsCount = 0,
      this.viewsReceivedFromFeedsCount = 0,
      this.isAdmin = false,
      this.isEditor = false,
      this.isTester = false,
      this.isVerified = false,
      this.onboardingStep = 0,
      this.isOnboardingCompleted = false,
      this.latitude,
      this.longitude,
      this.createdAt,
      this.visibility = true,
      @JsonKey(ignore: true)
          final Map<String, dynamic> extraData = const <String, dynamic>{}})
      : _searchKeys = searchKeys,
        _extraData = extraData;

  factory _$_PeamanUser.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanUserFromJson(json);

  @override
  final String? uid;
  @override
  final String? name;
  @override
  final String? userName;
  @override
  final String? email;
  @override
  final String? photo;
  @override
  final String? phone;
  @override
  final String? country;
  @override
  final String? bio;
  @override
  final String? profession;
  @override
  @JsonKey()
  final PeamanGender gender;
  @override
  final int? dob;
  final List<String> _searchKeys;
  @override
  @JsonKey()
  List<String> get searchKeys {
    if (_searchKeys is EqualUnmodifiableListView) return _searchKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchKeys);
  }

  @override
  @JsonKey()
  final PeamanOnlineStatus onlineStatus;
  @override
  final int? lastOnlineAt;
  @override
  @JsonKey()
  final int feedsCount;
  @override
  @JsonKey()
  final int photosCount;
  @override
  @JsonKey()
  final int videosCount;
  @override
  @JsonKey()
  final int followersCount;
  @override
  @JsonKey()
  final int followingCount;
  @override
  @JsonKey()
  final int reactionsReceivedFromFeedsCount;
  @override
  @JsonKey()
  final int commentsReceivedFromFeedsCount;
  @override
  @JsonKey()
  final int repliesReceivedFromFeedsCount;
  @override
  @JsonKey()
  final int sharesReceivedFromFeedsCount;
  @override
  @JsonKey()
  final int viewsReceivedFromFeedsCount;
  @override
  @JsonKey()
  final bool isAdmin;
  @override
  @JsonKey()
  final bool isEditor;
  @override
  @JsonKey()
  final bool isTester;
  @override
  @JsonKey()
  final bool isVerified;
  @override
  @JsonKey()
  final int onboardingStep;
  @override
  @JsonKey()
  final bool isOnboardingCompleted;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final int? createdAt;
  @override
  @JsonKey()
  final bool visibility;
  final Map<String, dynamic> _extraData;
  @override
  @JsonKey(ignore: true)
  Map<String, dynamic> get extraData {
    if (_extraData is EqualUnmodifiableMapView) return _extraData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_extraData);
  }

  @override
  String toString() {
    return 'PeamanUser(uid: $uid, name: $name, userName: $userName, email: $email, photo: $photo, phone: $phone, country: $country, bio: $bio, profession: $profession, gender: $gender, dob: $dob, searchKeys: $searchKeys, onlineStatus: $onlineStatus, lastOnlineAt: $lastOnlineAt, feedsCount: $feedsCount, photosCount: $photosCount, videosCount: $videosCount, followersCount: $followersCount, followingCount: $followingCount, reactionsReceivedFromFeedsCount: $reactionsReceivedFromFeedsCount, commentsReceivedFromFeedsCount: $commentsReceivedFromFeedsCount, repliesReceivedFromFeedsCount: $repliesReceivedFromFeedsCount, sharesReceivedFromFeedsCount: $sharesReceivedFromFeedsCount, viewsReceivedFromFeedsCount: $viewsReceivedFromFeedsCount, isAdmin: $isAdmin, isEditor: $isEditor, isTester: $isTester, isVerified: $isVerified, onboardingStep: $onboardingStep, isOnboardingCompleted: $isOnboardingCompleted, latitude: $latitude, longitude: $longitude, createdAt: $createdAt, visibility: $visibility, extraData: $extraData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanUser &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            const DeepCollectionEquality()
                .equals(other._searchKeys, _searchKeys) &&
            (identical(other.onlineStatus, onlineStatus) ||
                other.onlineStatus == onlineStatus) &&
            (identical(other.lastOnlineAt, lastOnlineAt) ||
                other.lastOnlineAt == lastOnlineAt) &&
            (identical(other.feedsCount, feedsCount) ||
                other.feedsCount == feedsCount) &&
            (identical(other.photosCount, photosCount) ||
                other.photosCount == photosCount) &&
            (identical(other.videosCount, videosCount) ||
                other.videosCount == videosCount) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.reactionsReceivedFromFeedsCount,
                    reactionsReceivedFromFeedsCount) ||
                other.reactionsReceivedFromFeedsCount ==
                    reactionsReceivedFromFeedsCount) &&
            (identical(other.commentsReceivedFromFeedsCount,
                    commentsReceivedFromFeedsCount) ||
                other.commentsReceivedFromFeedsCount ==
                    commentsReceivedFromFeedsCount) &&
            (identical(other.repliesReceivedFromFeedsCount, repliesReceivedFromFeedsCount) ||
                other.repliesReceivedFromFeedsCount ==
                    repliesReceivedFromFeedsCount) &&
            (identical(other.sharesReceivedFromFeedsCount, sharesReceivedFromFeedsCount) ||
                other.sharesReceivedFromFeedsCount ==
                    sharesReceivedFromFeedsCount) &&
            (identical(other.viewsReceivedFromFeedsCount, viewsReceivedFromFeedsCount) ||
                other.viewsReceivedFromFeedsCount ==
                    viewsReceivedFromFeedsCount) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.isEditor, isEditor) ||
                other.isEditor == isEditor) &&
            (identical(other.isTester, isTester) ||
                other.isTester == isTester) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.onboardingStep, onboardingStep) ||
                other.onboardingStep == onboardingStep) &&
            (identical(other.isOnboardingCompleted, isOnboardingCompleted) ||
                other.isOnboardingCompleted == isOnboardingCompleted) &&
            (identical(other.latitude, latitude) || other.latitude == latitude) &&
            (identical(other.longitude, longitude) || other.longitude == longitude) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.visibility, visibility) || other.visibility == visibility) &&
            const DeepCollectionEquality().equals(other._extraData, _extraData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uid,
        name,
        userName,
        email,
        photo,
        phone,
        country,
        bio,
        profession,
        gender,
        dob,
        const DeepCollectionEquality().hash(_searchKeys),
        onlineStatus,
        lastOnlineAt,
        feedsCount,
        photosCount,
        videosCount,
        followersCount,
        followingCount,
        reactionsReceivedFromFeedsCount,
        commentsReceivedFromFeedsCount,
        repliesReceivedFromFeedsCount,
        sharesReceivedFromFeedsCount,
        viewsReceivedFromFeedsCount,
        isAdmin,
        isEditor,
        isTester,
        isVerified,
        onboardingStep,
        isOnboardingCompleted,
        latitude,
        longitude,
        createdAt,
        visibility,
        const DeepCollectionEquality().hash(_extraData)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanUserCopyWith<_$_PeamanUser> get copyWith =>
      __$$_PeamanUserCopyWithImpl<_$_PeamanUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanUserToJson(
      this,
    );
  }
}

abstract class _PeamanUser implements PeamanUser {
  const factory _PeamanUser(
          {final String? uid,
          final String? name,
          final String? userName,
          final String? email,
          final String? photo,
          final String? phone,
          final String? country,
          final String? bio,
          final String? profession,
          final PeamanGender gender,
          final int? dob,
          final List<String> searchKeys,
          final PeamanOnlineStatus onlineStatus,
          final int? lastOnlineAt,
          final int feedsCount,
          final int photosCount,
          final int videosCount,
          final int followersCount,
          final int followingCount,
          final int reactionsReceivedFromFeedsCount,
          final int commentsReceivedFromFeedsCount,
          final int repliesReceivedFromFeedsCount,
          final int sharesReceivedFromFeedsCount,
          final int viewsReceivedFromFeedsCount,
          final bool isAdmin,
          final bool isEditor,
          final bool isTester,
          final bool isVerified,
          final int onboardingStep,
          final bool isOnboardingCompleted,
          final double? latitude,
          final double? longitude,
          final int? createdAt,
          final bool visibility,
          @JsonKey(ignore: true) final Map<String, dynamic> extraData}) =
      _$_PeamanUser;

  factory _PeamanUser.fromJson(Map<String, dynamic> json) =
      _$_PeamanUser.fromJson;

  @override
  String? get uid;
  @override
  String? get name;
  @override
  String? get userName;
  @override
  String? get email;
  @override
  String? get photo;
  @override
  String? get phone;
  @override
  String? get country;
  @override
  String? get bio;
  @override
  String? get profession;
  @override
  PeamanGender get gender;
  @override
  int? get dob;
  @override
  List<String> get searchKeys;
  @override
  PeamanOnlineStatus get onlineStatus;
  @override
  int? get lastOnlineAt;
  @override
  int get feedsCount;
  @override
  int get photosCount;
  @override
  int get videosCount;
  @override
  int get followersCount;
  @override
  int get followingCount;
  @override
  int get reactionsReceivedFromFeedsCount;
  @override
  int get commentsReceivedFromFeedsCount;
  @override
  int get repliesReceivedFromFeedsCount;
  @override
  int get sharesReceivedFromFeedsCount;
  @override
  int get viewsReceivedFromFeedsCount;
  @override
  bool get isAdmin;
  @override
  bool get isEditor;
  @override
  bool get isTester;
  @override
  bool get isVerified;
  @override
  int get onboardingStep;
  @override
  bool get isOnboardingCompleted;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  int? get createdAt;
  @override
  bool get visibility;
  @override
  @JsonKey(ignore: true)
  Map<String, dynamic> get extraData;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanUserCopyWith<_$_PeamanUser> get copyWith =>
      throw _privateConstructorUsedError;
}
