// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peaman_error_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeamanError {
  String get message => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get detailedMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeamanErrorCopyWith<PeamanError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanErrorCopyWith<$Res> {
  factory $PeamanErrorCopyWith(
          PeamanError value, $Res Function(PeamanError) then) =
      _$PeamanErrorCopyWithImpl<$Res, PeamanError>;
  @useResult
  $Res call({String message, String? code, String? detailedMessage});
}

/// @nodoc
class _$PeamanErrorCopyWithImpl<$Res, $Val extends PeamanError>
    implements $PeamanErrorCopyWith<$Res> {
  _$PeamanErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
    Object? detailedMessage = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      detailedMessage: freezed == detailedMessage
          ? _value.detailedMessage
          : detailedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanErrorCopyWith<$Res>
    implements $PeamanErrorCopyWith<$Res> {
  factory _$$_PeamanErrorCopyWith(
          _$_PeamanError value, $Res Function(_$_PeamanError) then) =
      __$$_PeamanErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code, String? detailedMessage});
}

/// @nodoc
class __$$_PeamanErrorCopyWithImpl<$Res>
    extends _$PeamanErrorCopyWithImpl<$Res, _$_PeamanError>
    implements _$$_PeamanErrorCopyWith<$Res> {
  __$$_PeamanErrorCopyWithImpl(
      _$_PeamanError _value, $Res Function(_$_PeamanError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
    Object? detailedMessage = freezed,
  }) {
    return _then(_$_PeamanError(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      detailedMessage: freezed == detailedMessage
          ? _value.detailedMessage
          : detailedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PeamanError implements _PeamanError {
  const _$_PeamanError(
      {required this.message, this.code, this.detailedMessage});

  @override
  final String message;
  @override
  final String? code;
  @override
  final String? detailedMessage;

  @override
  String toString() {
    return 'PeamanError(message: $message, code: $code, detailedMessage: $detailedMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanError &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.detailedMessage, detailedMessage) ||
                other.detailedMessage == detailedMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code, detailedMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanErrorCopyWith<_$_PeamanError> get copyWith =>
      __$$_PeamanErrorCopyWithImpl<_$_PeamanError>(this, _$identity);
}

abstract class _PeamanError implements PeamanError {
  const factory _PeamanError(
      {required final String message,
      final String? code,
      final String? detailedMessage}) = _$_PeamanError;

  @override
  String get message;
  @override
  String? get code;
  @override
  String? get detailedMessage;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanErrorCopyWith<_$_PeamanError> get copyWith =>
      throw _privateConstructorUsedError;
}
