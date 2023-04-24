// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_url_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanFileUrl _$PeamanFileUrlFromJson(Map<String, dynamic> json) {
  return _PeamanChatFileUrl.fromJson(json);
}

/// @nodoc
mixin _$PeamanFileUrl {
  String? get id => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  PeamanFileType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanFileUrlCopyWith<PeamanFileUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanFileUrlCopyWith<$Res> {
  factory $PeamanFileUrlCopyWith(
          PeamanFileUrl value, $Res Function(PeamanFileUrl) then) =
      _$PeamanFileUrlCopyWithImpl<$Res, PeamanFileUrl>;
  @useResult
  $Res call(
      {String? id, String? url, String? thumbnailUrl, PeamanFileType type});
}

/// @nodoc
class _$PeamanFileUrlCopyWithImpl<$Res, $Val extends PeamanFileUrl>
    implements $PeamanFileUrlCopyWith<$Res> {
  _$PeamanFileUrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? thumbnailUrl = freezed,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PeamanFileType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanChatFileUrlCopyWith<$Res>
    implements $PeamanFileUrlCopyWith<$Res> {
  factory _$$_PeamanChatFileUrlCopyWith(_$_PeamanChatFileUrl value,
          $Res Function(_$_PeamanChatFileUrl) then) =
      __$$_PeamanChatFileUrlCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id, String? url, String? thumbnailUrl, PeamanFileType type});
}

/// @nodoc
class __$$_PeamanChatFileUrlCopyWithImpl<$Res>
    extends _$PeamanFileUrlCopyWithImpl<$Res, _$_PeamanChatFileUrl>
    implements _$$_PeamanChatFileUrlCopyWith<$Res> {
  __$$_PeamanChatFileUrlCopyWithImpl(
      _$_PeamanChatFileUrl _value, $Res Function(_$_PeamanChatFileUrl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? thumbnailUrl = freezed,
    Object? type = null,
  }) {
    return _then(_$_PeamanChatFileUrl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PeamanFileType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PeamanChatFileUrl implements _PeamanChatFileUrl {
  const _$_PeamanChatFileUrl(
      {this.id,
      this.url,
      this.thumbnailUrl,
      this.type = PeamanFileType.unknown});

  factory _$_PeamanChatFileUrl.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanChatFileUrlFromJson(json);

  @override
  final String? id;
  @override
  final String? url;
  @override
  final String? thumbnailUrl;
  @override
  @JsonKey()
  final PeamanFileType type;

  @override
  String toString() {
    return 'PeamanFileUrl(id: $id, url: $url, thumbnailUrl: $thumbnailUrl, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanChatFileUrl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, url, thumbnailUrl, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanChatFileUrlCopyWith<_$_PeamanChatFileUrl> get copyWith =>
      __$$_PeamanChatFileUrlCopyWithImpl<_$_PeamanChatFileUrl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanChatFileUrlToJson(
      this,
    );
  }
}

abstract class _PeamanChatFileUrl implements PeamanFileUrl {
  const factory _PeamanChatFileUrl(
      {final String? id,
      final String? url,
      final String? thumbnailUrl,
      final PeamanFileType type}) = _$_PeamanChatFileUrl;

  factory _PeamanChatFileUrl.fromJson(Map<String, dynamic> json) =
      _$_PeamanChatFileUrl.fromJson;

  @override
  String? get id;
  @override
  String? get url;
  @override
  String? get thumbnailUrl;
  @override
  PeamanFileType get type;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanChatFileUrlCopyWith<_$_PeamanChatFileUrl> get copyWith =>
      throw _privateConstructorUsedError;
}
