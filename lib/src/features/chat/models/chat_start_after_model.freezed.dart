// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_start_after_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeamanChatStartAfter {
  String? get uid => throw _privateConstructorUsedError;
  int? get messageCreatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeamanChatStartAfterCopyWith<PeamanChatStartAfter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanChatStartAfterCopyWith<$Res> {
  factory $PeamanChatStartAfterCopyWith(PeamanChatStartAfter value,
          $Res Function(PeamanChatStartAfter) then) =
      _$PeamanChatStartAfterCopyWithImpl<$Res, PeamanChatStartAfter>;
  @useResult
  $Res call({String? uid, int? messageCreatedAt});
}

/// @nodoc
class _$PeamanChatStartAfterCopyWithImpl<$Res,
        $Val extends PeamanChatStartAfter>
    implements $PeamanChatStartAfterCopyWith<$Res> {
  _$PeamanChatStartAfterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? messageCreatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      messageCreatedAt: freezed == messageCreatedAt
          ? _value.messageCreatedAt
          : messageCreatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanChatStartAfterCopyWith<$Res>
    implements $PeamanChatStartAfterCopyWith<$Res> {
  factory _$$_PeamanChatStartAfterCopyWith(_$_PeamanChatStartAfter value,
          $Res Function(_$_PeamanChatStartAfter) then) =
      __$$_PeamanChatStartAfterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? uid, int? messageCreatedAt});
}

/// @nodoc
class __$$_PeamanChatStartAfterCopyWithImpl<$Res>
    extends _$PeamanChatStartAfterCopyWithImpl<$Res, _$_PeamanChatStartAfter>
    implements _$$_PeamanChatStartAfterCopyWith<$Res> {
  __$$_PeamanChatStartAfterCopyWithImpl(_$_PeamanChatStartAfter _value,
      $Res Function(_$_PeamanChatStartAfter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? messageCreatedAt = freezed,
  }) {
    return _then(_$_PeamanChatStartAfter(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      messageCreatedAt: freezed == messageCreatedAt
          ? _value.messageCreatedAt
          : messageCreatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_PeamanChatStartAfter implements _PeamanChatStartAfter {
  const _$_PeamanChatStartAfter({this.uid, this.messageCreatedAt});

  @override
  final String? uid;
  @override
  final int? messageCreatedAt;

  @override
  String toString() {
    return 'PeamanChatStartAfter(uid: $uid, messageCreatedAt: $messageCreatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanChatStartAfter &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.messageCreatedAt, messageCreatedAt) ||
                other.messageCreatedAt == messageCreatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, messageCreatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanChatStartAfterCopyWith<_$_PeamanChatStartAfter> get copyWith =>
      __$$_PeamanChatStartAfterCopyWithImpl<_$_PeamanChatStartAfter>(
          this, _$identity);
}

abstract class _PeamanChatStartAfter implements PeamanChatStartAfter {
  const factory _PeamanChatStartAfter(
      {final String? uid,
      final int? messageCreatedAt}) = _$_PeamanChatStartAfter;

  @override
  String? get uid;
  @override
  int? get messageCreatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanChatStartAfterCopyWith<_$_PeamanChatStartAfter> get copyWith =>
      throw _privateConstructorUsedError;
}
