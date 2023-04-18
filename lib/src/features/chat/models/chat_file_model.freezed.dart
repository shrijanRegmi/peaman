// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanChatFile _$PeamanChatFileFromJson(Map<String, dynamic> json) {
  return _PeamanChatFile.fromJson(json);
}

/// @nodoc
mixin _$PeamanChatFile {
  String? get id => throw _privateConstructorUsedError;
  String? get ownerId => throw _privateConstructorUsedError;
  List<PeamanFileUrl> get urls => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanChatFileCopyWith<PeamanChatFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanChatFileCopyWith<$Res> {
  factory $PeamanChatFileCopyWith(
          PeamanChatFile value, $Res Function(PeamanChatFile) then) =
      _$PeamanChatFileCopyWithImpl<$Res, PeamanChatFile>;
  @useResult
  $Res call(
      {String? id,
      String? ownerId,
      List<PeamanFileUrl> urls,
      int? createdAt,
      int? updatedAt});
}

/// @nodoc
class _$PeamanChatFileCopyWithImpl<$Res, $Val extends PeamanChatFile>
    implements $PeamanChatFileCopyWith<$Res> {
  _$PeamanChatFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ownerId = freezed,
    Object? urls = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<PeamanFileUrl>,
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
abstract class _$$_PeamanChatFileCopyWith<$Res>
    implements $PeamanChatFileCopyWith<$Res> {
  factory _$$_PeamanChatFileCopyWith(
          _$_PeamanChatFile value, $Res Function(_$_PeamanChatFile) then) =
      __$$_PeamanChatFileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? ownerId,
      List<PeamanFileUrl> urls,
      int? createdAt,
      int? updatedAt});
}

/// @nodoc
class __$$_PeamanChatFileCopyWithImpl<$Res>
    extends _$PeamanChatFileCopyWithImpl<$Res, _$_PeamanChatFile>
    implements _$$_PeamanChatFileCopyWith<$Res> {
  __$$_PeamanChatFileCopyWithImpl(
      _$_PeamanChatFile _value, $Res Function(_$_PeamanChatFile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ownerId = freezed,
    Object? urls = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_PeamanChatFile(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      urls: null == urls
          ? _value._urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<PeamanFileUrl>,
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
class _$_PeamanChatFile implements _PeamanChatFile {
  const _$_PeamanChatFile(
      {this.id,
      this.ownerId,
      final List<PeamanFileUrl> urls = const <PeamanFileUrl>[],
      this.createdAt,
      this.updatedAt})
      : _urls = urls;

  factory _$_PeamanChatFile.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanChatFileFromJson(json);

  @override
  final String? id;
  @override
  final String? ownerId;
  final List<PeamanFileUrl> _urls;
  @override
  @JsonKey()
  List<PeamanFileUrl> get urls {
    if (_urls is EqualUnmodifiableListView) return _urls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_urls);
  }

  @override
  final int? createdAt;
  @override
  final int? updatedAt;

  @override
  String toString() {
    return 'PeamanChatFile(id: $id, ownerId: $ownerId, urls: $urls, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanChatFile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            const DeepCollectionEquality().equals(other._urls, _urls) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, ownerId,
      const DeepCollectionEquality().hash(_urls), createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanChatFileCopyWith<_$_PeamanChatFile> get copyWith =>
      __$$_PeamanChatFileCopyWithImpl<_$_PeamanChatFile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanChatFileToJson(
      this,
    );
  }
}

abstract class _PeamanChatFile implements PeamanChatFile {
  const factory _PeamanChatFile(
      {final String? id,
      final String? ownerId,
      final List<PeamanFileUrl> urls,
      final int? createdAt,
      final int? updatedAt}) = _$_PeamanChatFile;

  factory _PeamanChatFile.fromJson(Map<String, dynamic> json) =
      _$_PeamanChatFile.fromJson;

  @override
  String? get id;
  @override
  String? get ownerId;
  @override
  List<PeamanFileUrl> get urls;
  @override
  int? get createdAt;
  @override
  int? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanChatFileCopyWith<_$_PeamanChatFile> get copyWith =>
      throw _privateConstructorUsedError;
}
