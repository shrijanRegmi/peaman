// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_feed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanSubFeed _$PeamanSubFeedFromJson(Map<String, dynamic> json) {
  return _PeamanSubFeed.fromJson(json);
}

/// @nodoc
mixin _$PeamanSubFeed {
  String? get id => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanSubFeedCopyWith<PeamanSubFeed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanSubFeedCopyWith<$Res> {
  factory $PeamanSubFeedCopyWith(
          PeamanSubFeed value, $Res Function(PeamanSubFeed) then) =
      _$PeamanSubFeedCopyWithImpl<$Res, PeamanSubFeed>;
  @useResult
  $Res call({String? id, int? createdAt, int? updatedAt});
}

/// @nodoc
class _$PeamanSubFeedCopyWithImpl<$Res, $Val extends PeamanSubFeed>
    implements $PeamanSubFeedCopyWith<$Res> {
  _$PeamanSubFeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_PeamanSubFeedCopyWith<$Res>
    implements $PeamanSubFeedCopyWith<$Res> {
  factory _$$_PeamanSubFeedCopyWith(
          _$_PeamanSubFeed value, $Res Function(_$_PeamanSubFeed) then) =
      __$$_PeamanSubFeedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, int? createdAt, int? updatedAt});
}

/// @nodoc
class __$$_PeamanSubFeedCopyWithImpl<$Res>
    extends _$PeamanSubFeedCopyWithImpl<$Res, _$_PeamanSubFeed>
    implements _$$_PeamanSubFeedCopyWith<$Res> {
  __$$_PeamanSubFeedCopyWithImpl(
      _$_PeamanSubFeed _value, $Res Function(_$_PeamanSubFeed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_PeamanSubFeed(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$_PeamanSubFeed implements _PeamanSubFeed {
  const _$_PeamanSubFeed({this.id, this.createdAt, this.updatedAt});

  factory _$_PeamanSubFeed.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanSubFeedFromJson(json);

  @override
  final String? id;
  @override
  final int? createdAt;
  @override
  final int? updatedAt;

  @override
  String toString() {
    return 'PeamanSubFeed(id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanSubFeed &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanSubFeedCopyWith<_$_PeamanSubFeed> get copyWith =>
      __$$_PeamanSubFeedCopyWithImpl<_$_PeamanSubFeed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanSubFeedToJson(
      this,
    );
  }
}

abstract class _PeamanSubFeed implements PeamanSubFeed {
  const factory _PeamanSubFeed(
      {final String? id,
      final int? createdAt,
      final int? updatedAt}) = _$_PeamanSubFeed;

  factory _PeamanSubFeed.fromJson(Map<String, dynamic> json) =
      _$_PeamanSubFeed.fromJson;

  @override
  String? get id;
  @override
  int? get createdAt;
  @override
  int? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanSubFeedCopyWith<_$_PeamanSubFeed> get copyWith =>
      throw _privateConstructorUsedError;
}
