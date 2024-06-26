// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_sent_messages_count_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeamanChatSentMessage {
  String? get uid => throw _privateConstructorUsedError;
  int get sentMessagesCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeamanChatSentMessageCopyWith<PeamanChatSentMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanChatSentMessageCopyWith<$Res> {
  factory $PeamanChatSentMessageCopyWith(PeamanChatSentMessage value,
          $Res Function(PeamanChatSentMessage) then) =
      _$PeamanChatSentMessageCopyWithImpl<$Res, PeamanChatSentMessage>;
  @useResult
  $Res call({String? uid, int sentMessagesCount});
}

/// @nodoc
class _$PeamanChatSentMessageCopyWithImpl<$Res,
        $Val extends PeamanChatSentMessage>
    implements $PeamanChatSentMessageCopyWith<$Res> {
  _$PeamanChatSentMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? sentMessagesCount = null,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      sentMessagesCount: null == sentMessagesCount
          ? _value.sentMessagesCount
          : sentMessagesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanChatSentMessageCopyWith<$Res>
    implements $PeamanChatSentMessageCopyWith<$Res> {
  factory _$$_PeamanChatSentMessageCopyWith(_$_PeamanChatSentMessage value,
          $Res Function(_$_PeamanChatSentMessage) then) =
      __$$_PeamanChatSentMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? uid, int sentMessagesCount});
}

/// @nodoc
class __$$_PeamanChatSentMessageCopyWithImpl<$Res>
    extends _$PeamanChatSentMessageCopyWithImpl<$Res, _$_PeamanChatSentMessage>
    implements _$$_PeamanChatSentMessageCopyWith<$Res> {
  __$$_PeamanChatSentMessageCopyWithImpl(_$_PeamanChatSentMessage _value,
      $Res Function(_$_PeamanChatSentMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? sentMessagesCount = null,
  }) {
    return _then(_$_PeamanChatSentMessage(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      sentMessagesCount: null == sentMessagesCount
          ? _value.sentMessagesCount
          : sentMessagesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PeamanChatSentMessage implements _PeamanChatSentMessage {
  const _$_PeamanChatSentMessage({this.uid, this.sentMessagesCount = 0});

  @override
  final String? uid;
  @override
  @JsonKey()
  final int sentMessagesCount;

  @override
  String toString() {
    return 'PeamanChatSentMessage(uid: $uid, sentMessagesCount: $sentMessagesCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanChatSentMessage &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.sentMessagesCount, sentMessagesCount) ||
                other.sentMessagesCount == sentMessagesCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, sentMessagesCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanChatSentMessageCopyWith<_$_PeamanChatSentMessage> get copyWith =>
      __$$_PeamanChatSentMessageCopyWithImpl<_$_PeamanChatSentMessage>(
          this, _$identity);
}

abstract class _PeamanChatSentMessage implements PeamanChatSentMessage {
  const factory _PeamanChatSentMessage(
      {final String? uid,
      final int sentMessagesCount}) = _$_PeamanChatSentMessage;

  @override
  String? get uid;
  @override
  int get sentMessagesCount;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanChatSentMessageCopyWith<_$_PeamanChatSentMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
