// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reported_by_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanReportedBy _$PeamanReportedByFromJson(Map<String, dynamic> json) {
  return _PeamanReportedBy.fromJson(json);
}

/// @nodoc
mixin _$PeamanReportedBy {
  String get uid => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanReportedByCopyWith<PeamanReportedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanReportedByCopyWith<$Res> {
  factory $PeamanReportedByCopyWith(
          PeamanReportedBy value, $Res Function(PeamanReportedBy) then) =
      _$PeamanReportedByCopyWithImpl<$Res, PeamanReportedBy>;
  @useResult
  $Res call({String uid, String reason, int? createdAt, int? updatedAt});
}

/// @nodoc
class _$PeamanReportedByCopyWithImpl<$Res, $Val extends PeamanReportedBy>
    implements $PeamanReportedByCopyWith<$Res> {
  _$PeamanReportedByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? reason = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_PeamanReportedByCopyWith<$Res>
    implements $PeamanReportedByCopyWith<$Res> {
  factory _$$_PeamanReportedByCopyWith(
          _$_PeamanReportedBy value, $Res Function(_$_PeamanReportedBy) then) =
      __$$_PeamanReportedByCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String reason, int? createdAt, int? updatedAt});
}

/// @nodoc
class __$$_PeamanReportedByCopyWithImpl<$Res>
    extends _$PeamanReportedByCopyWithImpl<$Res, _$_PeamanReportedBy>
    implements _$$_PeamanReportedByCopyWith<$Res> {
  __$$_PeamanReportedByCopyWithImpl(
      _$_PeamanReportedBy _value, $Res Function(_$_PeamanReportedBy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? reason = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_PeamanReportedBy(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_PeamanReportedBy implements _PeamanReportedBy {
  const _$_PeamanReportedBy(
      {required this.uid,
      required this.reason,
      this.createdAt,
      this.updatedAt});

  factory _$_PeamanReportedBy.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanReportedByFromJson(json);

  @override
  final String uid;
  @override
  final String reason;
  @override
  final int? createdAt;
  @override
  final int? updatedAt;

  @override
  String toString() {
    return 'PeamanReportedBy(uid: $uid, reason: $reason, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanReportedBy &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, reason, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanReportedByCopyWith<_$_PeamanReportedBy> get copyWith =>
      __$$_PeamanReportedByCopyWithImpl<_$_PeamanReportedBy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanReportedByToJson(
      this,
    );
  }
}

abstract class _PeamanReportedBy implements PeamanReportedBy {
  const factory _PeamanReportedBy(
      {required final String uid,
      required final String reason,
      final int? createdAt,
      final int? updatedAt}) = _$_PeamanReportedBy;

  factory _PeamanReportedBy.fromJson(Map<String, dynamic> json) =
      _$_PeamanReportedBy.fromJson;

  @override
  String get uid;
  @override
  String get reason;
  @override
  int? get createdAt;
  @override
  int? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanReportedByCopyWith<_$_PeamanReportedBy> get copyWith =>
      throw _privateConstructorUsedError;
}
