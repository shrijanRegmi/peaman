// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_option_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanPollOption _$PeamanPollOptionFromJson(Map<String, dynamic> json) {
  return _PeamanPollOption.fromJson(json);
}

/// @nodoc
mixin _$PeamanPollOption {
  String? get id => throw _privateConstructorUsedError;
  String? get option => throw _privateConstructorUsedError;
  int get popularity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanPollOptionCopyWith<PeamanPollOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanPollOptionCopyWith<$Res> {
  factory $PeamanPollOptionCopyWith(
          PeamanPollOption value, $Res Function(PeamanPollOption) then) =
      _$PeamanPollOptionCopyWithImpl<$Res, PeamanPollOption>;
  @useResult
  $Res call({String? id, String? option, int popularity});
}

/// @nodoc
class _$PeamanPollOptionCopyWithImpl<$Res, $Val extends PeamanPollOption>
    implements $PeamanPollOptionCopyWith<$Res> {
  _$PeamanPollOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? option = freezed,
    Object? popularity = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      option: freezed == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanPollOptionCopyWith<$Res>
    implements $PeamanPollOptionCopyWith<$Res> {
  factory _$$_PeamanPollOptionCopyWith(
          _$_PeamanPollOption value, $Res Function(_$_PeamanPollOption) then) =
      __$$_PeamanPollOptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? option, int popularity});
}

/// @nodoc
class __$$_PeamanPollOptionCopyWithImpl<$Res>
    extends _$PeamanPollOptionCopyWithImpl<$Res, _$_PeamanPollOption>
    implements _$$_PeamanPollOptionCopyWith<$Res> {
  __$$_PeamanPollOptionCopyWithImpl(
      _$_PeamanPollOption _value, $Res Function(_$_PeamanPollOption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? option = freezed,
    Object? popularity = null,
  }) {
    return _then(_$_PeamanPollOption(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      option: freezed == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PeamanPollOption implements _PeamanPollOption {
  const _$_PeamanPollOption({this.id, this.option, this.popularity = 0});

  factory _$_PeamanPollOption.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanPollOptionFromJson(json);

  @override
  final String? id;
  @override
  final String? option;
  @override
  @JsonKey()
  final int popularity;

  @override
  String toString() {
    return 'PeamanPollOption(id: $id, option: $option, popularity: $popularity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanPollOption &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.option, option) || other.option == option) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, option, popularity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanPollOptionCopyWith<_$_PeamanPollOption> get copyWith =>
      __$$_PeamanPollOptionCopyWithImpl<_$_PeamanPollOption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanPollOptionToJson(
      this,
    );
  }
}

abstract class _PeamanPollOption implements PeamanPollOption {
  const factory _PeamanPollOption(
      {final String? id,
      final String? option,
      final int popularity}) = _$_PeamanPollOption;

  factory _PeamanPollOption.fromJson(Map<String, dynamic> json) =
      _$_PeamanPollOption.fromJson;

  @override
  String? get id;
  @override
  String? get option;
  @override
  int get popularity;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanPollOptionCopyWith<_$_PeamanPollOption> get copyWith =>
      throw _privateConstructorUsedError;
}
