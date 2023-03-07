// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanSubUser _$PeamanSubUserFromJson(Map<String, dynamic> json) {
  return _PeamanSubUser.fromJson(json);
}

/// @nodoc
mixin _$PeamanSubUser {
  String? get uid => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanSubUserCopyWith<PeamanSubUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanSubUserCopyWith<$Res> {
  factory $PeamanSubUserCopyWith(
          PeamanSubUser value, $Res Function(PeamanSubUser) then) =
      _$PeamanSubUserCopyWithImpl<$Res, PeamanSubUser>;
  @useResult
  $Res call({String? uid, int? createdAt, int? updatedAt});
}

/// @nodoc
class _$PeamanSubUserCopyWithImpl<$Res, $Val extends PeamanSubUser>
    implements $PeamanSubUserCopyWith<$Res> {
  _$PeamanSubUserCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanSubUserCopyWith<$Res>
    implements $PeamanSubUserCopyWith<$Res> {
  factory _$$_PeamanSubUserCopyWith(
          _$_PeamanSubUser value, $Res Function(_$_PeamanSubUser) then) =
      __$$_PeamanSubUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? uid, int? createdAt, int? updatedAt});
}

/// @nodoc
class __$$_PeamanSubUserCopyWithImpl<$Res>
    extends _$PeamanSubUserCopyWithImpl<$Res, _$_PeamanSubUser>
    implements _$$_PeamanSubUserCopyWith<$Res> {
  __$$_PeamanSubUserCopyWithImpl(
      _$_PeamanSubUser _value, $Res Function(_$_PeamanSubUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_PeamanSubUser(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PeamanSubUser implements _PeamanSubUser {
  const _$_PeamanSubUser({this.uid, this.createdAt, this.updatedAt});

  factory _$_PeamanSubUser.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanSubUserFromJson(json);

  @override
  final String? uid;
  @override
  final int? createdAt;
  @override
  final int? updatedAt;

  @override
  String toString() {
    return 'PeamanSubUser(uid: $uid, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanSubUser &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanSubUserCopyWith<_$_PeamanSubUser> get copyWith =>
      __$$_PeamanSubUserCopyWithImpl<_$_PeamanSubUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanSubUserToJson(
      this,
    );
  }
}

abstract class _PeamanSubUser implements PeamanSubUser {
  const factory _PeamanSubUser(
      {final String? uid,
      final int? createdAt,
      final int? updatedAt}) = _$_PeamanSubUser;

  factory _PeamanSubUser.fromJson(Map<String, dynamic> json) =
      _$_PeamanSubUser.fromJson;

  @override
  String? get uid;
  @override
  int? get createdAt;
  @override
  int? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanSubUserCopyWith<_$_PeamanSubUser> get copyWith =>
      throw _privateConstructorUsedError;
}
