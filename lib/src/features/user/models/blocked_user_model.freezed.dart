// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blocked_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanBlockedUser _$PeamanBlockedUserFromJson(Map<String, dynamic> json) {
  return _PeamanBlockedUser.fromJson(json);
}

/// @nodoc
mixin _$PeamanBlockedUser {
  String? get uid => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;
  bool get isAccepted => throw _privateConstructorUsedError;
  bool get isIgnored => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanBlockedUserCopyWith<PeamanBlockedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanBlockedUserCopyWith<$Res> {
  factory $PeamanBlockedUserCopyWith(
          PeamanBlockedUser value, $Res Function(PeamanBlockedUser) then) =
      _$PeamanBlockedUserCopyWithImpl<$Res, PeamanBlockedUser>;
  @useResult
  $Res call(
      {String? uid,
      int? createdAt,
      int? updatedAt,
      bool isAccepted,
      bool isIgnored});
}

/// @nodoc
class _$PeamanBlockedUserCopyWithImpl<$Res, $Val extends PeamanBlockedUser>
    implements $PeamanBlockedUserCopyWith<$Res> {
  _$PeamanBlockedUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isAccepted = null,
    Object? isIgnored = null,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      isAccepted: null == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      isIgnored: null == isIgnored
          ? _value.isIgnored
          : isIgnored // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanBlockedUserCopyWith<$Res>
    implements $PeamanBlockedUserCopyWith<$Res> {
  factory _$$_PeamanBlockedUserCopyWith(_$_PeamanBlockedUser value,
          $Res Function(_$_PeamanBlockedUser) then) =
      __$$_PeamanBlockedUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      int? createdAt,
      int? updatedAt,
      bool isAccepted,
      bool isIgnored});
}

/// @nodoc
class __$$_PeamanBlockedUserCopyWithImpl<$Res>
    extends _$PeamanBlockedUserCopyWithImpl<$Res, _$_PeamanBlockedUser>
    implements _$$_PeamanBlockedUserCopyWith<$Res> {
  __$$_PeamanBlockedUserCopyWithImpl(
      _$_PeamanBlockedUser _value, $Res Function(_$_PeamanBlockedUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isAccepted = null,
    Object? isIgnored = null,
  }) {
    return _then(_$_PeamanBlockedUser(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      isAccepted: null == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      isIgnored: null == isIgnored
          ? _value.isIgnored
          : isIgnored // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PeamanBlockedUser implements _PeamanBlockedUser {
  const _$_PeamanBlockedUser(
      {this.uid,
      this.createdAt,
      this.updatedAt,
      this.isAccepted = false,
      this.isIgnored = false});

  factory _$_PeamanBlockedUser.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanBlockedUserFromJson(json);

  @override
  final String? uid;
  @override
  final int? createdAt;
  @override
  final int? updatedAt;
  @override
  @JsonKey()
  final bool isAccepted;
  @override
  @JsonKey()
  final bool isIgnored;

  @override
  String toString() {
    return 'PeamanBlockedUser(uid: $uid, createdAt: $createdAt, updatedAt: $updatedAt, isAccepted: $isAccepted, isIgnored: $isIgnored)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanBlockedUser &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isAccepted, isAccepted) ||
                other.isAccepted == isAccepted) &&
            (identical(other.isIgnored, isIgnored) ||
                other.isIgnored == isIgnored));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, createdAt, updatedAt, isAccepted, isIgnored);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanBlockedUserCopyWith<_$_PeamanBlockedUser> get copyWith =>
      __$$_PeamanBlockedUserCopyWithImpl<_$_PeamanBlockedUser>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanBlockedUserToJson(
      this,
    );
  }
}

abstract class _PeamanBlockedUser implements PeamanBlockedUser {
  const factory _PeamanBlockedUser(
      {final String? uid,
      final int? createdAt,
      final int? updatedAt,
      final bool isAccepted,
      final bool isIgnored}) = _$_PeamanBlockedUser;

  factory _PeamanBlockedUser.fromJson(Map<String, dynamic> json) =
      _$_PeamanBlockedUser.fromJson;

  @override
  String? get uid;
  @override
  int? get createdAt;
  @override
  int? get updatedAt;
  @override
  bool get isAccepted;
  @override
  bool get isIgnored;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanBlockedUserCopyWith<_$_PeamanBlockedUser> get copyWith =>
      throw _privateConstructorUsedError;
}
