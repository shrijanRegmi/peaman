// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hashtag_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanHashtag _$PeamanHashtagFromJson(Map<String, dynamic> json) {
  return _PeamanHashtag.fromJson(json);
}

/// @nodoc
mixin _$PeamanHashtag {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get feeds => throw _privateConstructorUsedError;
  List<String> get searchKeys => throw _privateConstructorUsedError;
  bool get visibility => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanHashtagCopyWith<PeamanHashtag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanHashtagCopyWith<$Res> {
  factory $PeamanHashtagCopyWith(
          PeamanHashtag value, $Res Function(PeamanHashtag) then) =
      _$PeamanHashtagCopyWithImpl<$Res, PeamanHashtag>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      int? feeds,
      List<String> searchKeys,
      bool visibility,
      int? createdAt,
      int? updatedAt});
}

/// @nodoc
class _$PeamanHashtagCopyWithImpl<$Res, $Val extends PeamanHashtag>
    implements $PeamanHashtagCopyWith<$Res> {
  _$PeamanHashtagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? feeds = freezed,
    Object? searchKeys = null,
    Object? visibility = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      feeds: freezed == feeds
          ? _value.feeds
          : feeds // ignore: cast_nullable_to_non_nullable
              as int?,
      searchKeys: null == searchKeys
          ? _value.searchKeys
          : searchKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$_PeamanHashtagCopyWith<$Res>
    implements $PeamanHashtagCopyWith<$Res> {
  factory _$$_PeamanHashtagCopyWith(
          _$_PeamanHashtag value, $Res Function(_$_PeamanHashtag) then) =
      __$$_PeamanHashtagCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      int? feeds,
      List<String> searchKeys,
      bool visibility,
      int? createdAt,
      int? updatedAt});
}

/// @nodoc
class __$$_PeamanHashtagCopyWithImpl<$Res>
    extends _$PeamanHashtagCopyWithImpl<$Res, _$_PeamanHashtag>
    implements _$$_PeamanHashtagCopyWith<$Res> {
  __$$_PeamanHashtagCopyWithImpl(
      _$_PeamanHashtag _value, $Res Function(_$_PeamanHashtag) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? feeds = freezed,
    Object? searchKeys = null,
    Object? visibility = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_PeamanHashtag(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      feeds: freezed == feeds
          ? _value.feeds
          : feeds // ignore: cast_nullable_to_non_nullable
              as int?,
      searchKeys: null == searchKeys
          ? _value._searchKeys
          : searchKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$_PeamanHashtag implements _PeamanHashtag {
  const _$_PeamanHashtag(
      {this.id,
      this.title,
      this.feeds,
      final List<String> searchKeys = const <String>[],
      this.visibility = true,
      this.createdAt,
      this.updatedAt})
      : _searchKeys = searchKeys;

  factory _$_PeamanHashtag.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanHashtagFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final int? feeds;
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
  final bool visibility;
  @override
  final int? createdAt;
  @override
  final int? updatedAt;

  @override
  String toString() {
    return 'PeamanHashtag(id: $id, title: $title, feeds: $feeds, searchKeys: $searchKeys, visibility: $visibility, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanHashtag &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.feeds, feeds) || other.feeds == feeds) &&
            const DeepCollectionEquality()
                .equals(other._searchKeys, _searchKeys) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      feeds,
      const DeepCollectionEquality().hash(_searchKeys),
      visibility,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanHashtagCopyWith<_$_PeamanHashtag> get copyWith =>
      __$$_PeamanHashtagCopyWithImpl<_$_PeamanHashtag>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanHashtagToJson(
      this,
    );
  }
}

abstract class _PeamanHashtag implements PeamanHashtag {
  const factory _PeamanHashtag(
      {final String? id,
      final String? title,
      final int? feeds,
      final List<String> searchKeys,
      final bool visibility,
      final int? createdAt,
      final int? updatedAt}) = _$_PeamanHashtag;

  factory _PeamanHashtag.fromJson(Map<String, dynamic> json) =
      _$_PeamanHashtag.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  int? get feeds;
  @override
  List<String> get searchKeys;
  @override
  bool get visibility;
  @override
  int? get createdAt;
  @override
  int? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanHashtagCopyWith<_$_PeamanHashtag> get copyWith =>
      throw _privateConstructorUsedError;
}
