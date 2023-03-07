// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_file_url_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanChatFileUrl _$PeamanChatFileUrlFromJson(Map<String, dynamic> json) {
  return _PeamanChatFileUrl.fromJson(json);
}

/// @nodoc
mixin _$PeamanChatFileUrl {
  String? get url => throw _privateConstructorUsedError;
  PeamanChatFileType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanChatFileUrlCopyWith<PeamanChatFileUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanChatFileUrlCopyWith<$Res> {
  factory $PeamanChatFileUrlCopyWith(
          PeamanChatFileUrl value, $Res Function(PeamanChatFileUrl) then) =
      _$PeamanChatFileUrlCopyWithImpl<$Res, PeamanChatFileUrl>;
  @useResult
  $Res call({String? url, PeamanChatFileType type});
}

/// @nodoc
class _$PeamanChatFileUrlCopyWithImpl<$Res, $Val extends PeamanChatFileUrl>
    implements $PeamanChatFileUrlCopyWith<$Res> {
  _$PeamanChatFileUrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PeamanChatFileType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanChatFileUrlCopyWith<$Res>
    implements $PeamanChatFileUrlCopyWith<$Res> {
  factory _$$_PeamanChatFileUrlCopyWith(_$_PeamanChatFileUrl value,
          $Res Function(_$_PeamanChatFileUrl) then) =
      __$$_PeamanChatFileUrlCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, PeamanChatFileType type});
}

/// @nodoc
class __$$_PeamanChatFileUrlCopyWithImpl<$Res>
    extends _$PeamanChatFileUrlCopyWithImpl<$Res, _$_PeamanChatFileUrl>
    implements _$$_PeamanChatFileUrlCopyWith<$Res> {
  __$$_PeamanChatFileUrlCopyWithImpl(
      _$_PeamanChatFileUrl _value, $Res Function(_$_PeamanChatFileUrl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? type = null,
  }) {
    return _then(_$_PeamanChatFileUrl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PeamanChatFileType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PeamanChatFileUrl implements _PeamanChatFileUrl {
  const _$_PeamanChatFileUrl(
      {this.url, this.type = PeamanChatFileType.unknown});

  factory _$_PeamanChatFileUrl.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanChatFileUrlFromJson(json);

  @override
  final String? url;
  @override
  @JsonKey()
  final PeamanChatFileType type;

  @override
  String toString() {
    return 'PeamanChatFileUrl(url: $url, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanChatFileUrl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, type);

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

abstract class _PeamanChatFileUrl implements PeamanChatFileUrl {
  const factory _PeamanChatFileUrl(
      {final String? url,
      final PeamanChatFileType type}) = _$_PeamanChatFileUrl;

  factory _PeamanChatFileUrl.fromJson(Map<String, dynamic> json) =
      _$_PeamanChatFileUrl.fromJson;

  @override
  String? get url;
  @override
  PeamanChatFileType get type;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanChatFileUrlCopyWith<_$_PeamanChatFileUrl> get copyWith =>
      throw _privateConstructorUsedError;
}
