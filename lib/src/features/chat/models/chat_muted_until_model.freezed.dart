// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_muted_until_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeamanChatMutedUntil {
  String? get uid => throw _privateConstructorUsedError;
  int? get mutedAt => throw _privateConstructorUsedError;
  int? get mutedUntil => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeamanChatMutedUntilCopyWith<PeamanChatMutedUntil> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanChatMutedUntilCopyWith<$Res> {
  factory $PeamanChatMutedUntilCopyWith(PeamanChatMutedUntil value,
          $Res Function(PeamanChatMutedUntil) then) =
      _$PeamanChatMutedUntilCopyWithImpl<$Res, PeamanChatMutedUntil>;
  @useResult
  $Res call({String? uid, int? mutedAt, int? mutedUntil});
}

/// @nodoc
class _$PeamanChatMutedUntilCopyWithImpl<$Res,
        $Val extends PeamanChatMutedUntil>
    implements $PeamanChatMutedUntilCopyWith<$Res> {
  _$PeamanChatMutedUntilCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? mutedAt = freezed,
    Object? mutedUntil = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      mutedAt: freezed == mutedAt
          ? _value.mutedAt
          : mutedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      mutedUntil: freezed == mutedUntil
          ? _value.mutedUntil
          : mutedUntil // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanChatMutedUsersCopyWith<$Res>
    implements $PeamanChatMutedUntilCopyWith<$Res> {
  factory _$$_PeamanChatMutedUsersCopyWith(_$_PeamanChatMutedUsers value,
          $Res Function(_$_PeamanChatMutedUsers) then) =
      __$$_PeamanChatMutedUsersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? uid, int? mutedAt, int? mutedUntil});
}

/// @nodoc
class __$$_PeamanChatMutedUsersCopyWithImpl<$Res>
    extends _$PeamanChatMutedUntilCopyWithImpl<$Res, _$_PeamanChatMutedUsers>
    implements _$$_PeamanChatMutedUsersCopyWith<$Res> {
  __$$_PeamanChatMutedUsersCopyWithImpl(_$_PeamanChatMutedUsers _value,
      $Res Function(_$_PeamanChatMutedUsers) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? mutedAt = freezed,
    Object? mutedUntil = freezed,
  }) {
    return _then(_$_PeamanChatMutedUsers(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      mutedAt: freezed == mutedAt
          ? _value.mutedAt
          : mutedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      mutedUntil: freezed == mutedUntil
          ? _value.mutedUntil
          : mutedUntil // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_PeamanChatMutedUsers implements _PeamanChatMutedUsers {
  const _$_PeamanChatMutedUsers({this.uid, this.mutedAt, this.mutedUntil});

  @override
  final String? uid;
  @override
  final int? mutedAt;
  @override
  final int? mutedUntil;

  @override
  String toString() {
    return 'PeamanChatMutedUntil(uid: $uid, mutedAt: $mutedAt, mutedUntil: $mutedUntil)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanChatMutedUsers &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.mutedAt, mutedAt) || other.mutedAt == mutedAt) &&
            (identical(other.mutedUntil, mutedUntil) ||
                other.mutedUntil == mutedUntil));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, mutedAt, mutedUntil);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanChatMutedUsersCopyWith<_$_PeamanChatMutedUsers> get copyWith =>
      __$$_PeamanChatMutedUsersCopyWithImpl<_$_PeamanChatMutedUsers>(
          this, _$identity);
}

abstract class _PeamanChatMutedUsers implements PeamanChatMutedUntil {
  const factory _PeamanChatMutedUsers(
      {final String? uid,
      final int? mutedAt,
      final int? mutedUntil}) = _$_PeamanChatMutedUsers;

  @override
  String? get uid;
  @override
  int? get mutedAt;
  @override
  int? get mutedUntil;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanChatMutedUsersCopyWith<_$_PeamanChatMutedUsers> get copyWith =>
      throw _privateConstructorUsedError;
}
