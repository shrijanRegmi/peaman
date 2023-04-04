// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_unread_messages_count_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeamanChatUnreadMessage {
  String? get uid => throw _privateConstructorUsedError;
  int get unreadMessagesCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeamanChatUnreadMessageCopyWith<PeamanChatUnreadMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanChatUnreadMessageCopyWith<$Res> {
  factory $PeamanChatUnreadMessageCopyWith(PeamanChatUnreadMessage value,
          $Res Function(PeamanChatUnreadMessage) then) =
      _$PeamanChatUnreadMessageCopyWithImpl<$Res, PeamanChatUnreadMessage>;
  @useResult
  $Res call({String? uid, int unreadMessagesCount});
}

/// @nodoc
class _$PeamanChatUnreadMessageCopyWithImpl<$Res,
        $Val extends PeamanChatUnreadMessage>
    implements $PeamanChatUnreadMessageCopyWith<$Res> {
  _$PeamanChatUnreadMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? unreadMessagesCount = null,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadMessagesCount: null == unreadMessagesCount
          ? _value.unreadMessagesCount
          : unreadMessagesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanChatUnreadMessageCopyWith<$Res>
    implements $PeamanChatUnreadMessageCopyWith<$Res> {
  factory _$$_PeamanChatUnreadMessageCopyWith(_$_PeamanChatUnreadMessage value,
          $Res Function(_$_PeamanChatUnreadMessage) then) =
      __$$_PeamanChatUnreadMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? uid, int unreadMessagesCount});
}

/// @nodoc
class __$$_PeamanChatUnreadMessageCopyWithImpl<$Res>
    extends _$PeamanChatUnreadMessageCopyWithImpl<$Res,
        _$_PeamanChatUnreadMessage>
    implements _$$_PeamanChatUnreadMessageCopyWith<$Res> {
  __$$_PeamanChatUnreadMessageCopyWithImpl(_$_PeamanChatUnreadMessage _value,
      $Res Function(_$_PeamanChatUnreadMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? unreadMessagesCount = null,
  }) {
    return _then(_$_PeamanChatUnreadMessage(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadMessagesCount: null == unreadMessagesCount
          ? _value.unreadMessagesCount
          : unreadMessagesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PeamanChatUnreadMessage implements _PeamanChatUnreadMessage {
  const _$_PeamanChatUnreadMessage({this.uid, this.unreadMessagesCount = 0});

  @override
  final String? uid;
  @override
  @JsonKey()
  final int unreadMessagesCount;

  @override
  String toString() {
    return 'PeamanChatUnreadMessage(uid: $uid, unreadMessagesCount: $unreadMessagesCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanChatUnreadMessage &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.unreadMessagesCount, unreadMessagesCount) ||
                other.unreadMessagesCount == unreadMessagesCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, unreadMessagesCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanChatUnreadMessageCopyWith<_$_PeamanChatUnreadMessage>
      get copyWith =>
          __$$_PeamanChatUnreadMessageCopyWithImpl<_$_PeamanChatUnreadMessage>(
              this, _$identity);
}

abstract class _PeamanChatUnreadMessage implements PeamanChatUnreadMessage {
  const factory _PeamanChatUnreadMessage(
      {final String? uid,
      final int unreadMessagesCount}) = _$_PeamanChatUnreadMessage;

  @override
  String? get uid;
  @override
  int get unreadMessagesCount;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanChatUnreadMessageCopyWith<_$_PeamanChatUnreadMessage>
      get copyWith => throw _privateConstructorUsedError;
}
