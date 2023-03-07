// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follower_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanFollower _$PeamanFollowerFromJson(Map<String, dynamic> json) {
  return _PeamanFollower.fromJson(json);
}

/// @nodoc
mixin _$PeamanFollower {
  String? get uid => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanFollowerCopyWith<PeamanFollower> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanFollowerCopyWith<$Res> {
  factory $PeamanFollowerCopyWith(
          PeamanFollower value, $Res Function(PeamanFollower) then) =
      _$PeamanFollowerCopyWithImpl<$Res, PeamanFollower>;
  @useResult
  $Res call({String? uid, int? createdAt, int? updatedAt});
}

/// @nodoc
class _$PeamanFollowerCopyWithImpl<$Res, $Val extends PeamanFollower>
    implements $PeamanFollowerCopyWith<$Res> {
  _$PeamanFollowerCopyWithImpl(this._value, this._then);

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
abstract class _$$_PeamanFollowerCopyWith<$Res>
    implements $PeamanFollowerCopyWith<$Res> {
  factory _$$_PeamanFollowerCopyWith(
          _$_PeamanFollower value, $Res Function(_$_PeamanFollower) then) =
      __$$_PeamanFollowerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? uid, int? createdAt, int? updatedAt});
}

/// @nodoc
class __$$_PeamanFollowerCopyWithImpl<$Res>
    extends _$PeamanFollowerCopyWithImpl<$Res, _$_PeamanFollower>
    implements _$$_PeamanFollowerCopyWith<$Res> {
  __$$_PeamanFollowerCopyWithImpl(
      _$_PeamanFollower _value, $Res Function(_$_PeamanFollower) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_PeamanFollower(
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
class _$_PeamanFollower implements _PeamanFollower {
  const _$_PeamanFollower({this.uid, this.createdAt, this.updatedAt});

  factory _$_PeamanFollower.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanFollowerFromJson(json);

  @override
  final String? uid;
  @override
  final int? createdAt;
  @override
  final int? updatedAt;

  @override
  String toString() {
    return 'PeamanFollower(uid: $uid, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanFollower &&
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
  _$$_PeamanFollowerCopyWith<_$_PeamanFollower> get copyWith =>
      __$$_PeamanFollowerCopyWithImpl<_$_PeamanFollower>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanFollowerToJson(
      this,
    );
  }
}

abstract class _PeamanFollower implements PeamanFollower {
  const factory _PeamanFollower(
      {final String? uid,
      final int? createdAt,
      final int? updatedAt}) = _$_PeamanFollower;

  factory _PeamanFollower.fromJson(Map<String, dynamic> json) =
      _$_PeamanFollower.fromJson;

  @override
  String? get uid;
  @override
  int? get createdAt;
  @override
  int? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanFollowerCopyWith<_$_PeamanFollower> get copyWith =>
      throw _privateConstructorUsedError;
}
