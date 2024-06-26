// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanFollowRequest _$PeamanFollowRequestFromJson(Map<String, dynamic> json) {
  return _PeamanFollowRequest.fromJson(json);
}

/// @nodoc
mixin _$PeamanFollowRequest {
  String? get uid => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;
  bool get isAccepted => throw _privateConstructorUsedError;
  bool get isIgnored => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanFollowRequestCopyWith<PeamanFollowRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanFollowRequestCopyWith<$Res> {
  factory $PeamanFollowRequestCopyWith(
          PeamanFollowRequest value, $Res Function(PeamanFollowRequest) then) =
      _$PeamanFollowRequestCopyWithImpl<$Res, PeamanFollowRequest>;
  @useResult
  $Res call(
      {String? uid,
      int? createdAt,
      int? updatedAt,
      bool isAccepted,
      bool isIgnored});
}

/// @nodoc
class _$PeamanFollowRequestCopyWithImpl<$Res, $Val extends PeamanFollowRequest>
    implements $PeamanFollowRequestCopyWith<$Res> {
  _$PeamanFollowRequestCopyWithImpl(this._value, this._then);

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
abstract class _$$_PeamanFollowRequestCopyWith<$Res>
    implements $PeamanFollowRequestCopyWith<$Res> {
  factory _$$_PeamanFollowRequestCopyWith(_$_PeamanFollowRequest value,
          $Res Function(_$_PeamanFollowRequest) then) =
      __$$_PeamanFollowRequestCopyWithImpl<$Res>;
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
class __$$_PeamanFollowRequestCopyWithImpl<$Res>
    extends _$PeamanFollowRequestCopyWithImpl<$Res, _$_PeamanFollowRequest>
    implements _$$_PeamanFollowRequestCopyWith<$Res> {
  __$$_PeamanFollowRequestCopyWithImpl(_$_PeamanFollowRequest _value,
      $Res Function(_$_PeamanFollowRequest) _then)
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
    return _then(_$_PeamanFollowRequest(
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
class _$_PeamanFollowRequest implements _PeamanFollowRequest {
  const _$_PeamanFollowRequest(
      {this.uid,
      this.createdAt,
      this.updatedAt,
      this.isAccepted = false,
      this.isIgnored = false});

  factory _$_PeamanFollowRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanFollowRequestFromJson(json);

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
    return 'PeamanFollowRequest(uid: $uid, createdAt: $createdAt, updatedAt: $updatedAt, isAccepted: $isAccepted, isIgnored: $isIgnored)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanFollowRequest &&
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
  _$$_PeamanFollowRequestCopyWith<_$_PeamanFollowRequest> get copyWith =>
      __$$_PeamanFollowRequestCopyWithImpl<_$_PeamanFollowRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanFollowRequestToJson(
      this,
    );
  }
}

abstract class _PeamanFollowRequest implements PeamanFollowRequest {
  const factory _PeamanFollowRequest(
      {final String? uid,
      final int? createdAt,
      final int? updatedAt,
      final bool isAccepted,
      final bool isIgnored}) = _$_PeamanFollowRequest;

  factory _PeamanFollowRequest.fromJson(Map<String, dynamic> json) =
      _$_PeamanFollowRequest.fromJson;

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
  _$$_PeamanFollowRequestCopyWith<_$_PeamanFollowRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
