// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_messages_cursor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanChatMessagesCursor _$PeamanChatMessagesCursorFromJson(
    Map<String, dynamic> json) {
  return _PeamanChatMessagesCursor.fromJson(json);
}

/// @nodoc
mixin _$PeamanChatMessagesCursor {
  @JsonKey(ignore: true)
  String? get uid => throw _privateConstructorUsedError;
  int? get startAfter => throw _privateConstructorUsedError;
  int? get endAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanChatMessagesCursorCopyWith<PeamanChatMessagesCursor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanChatMessagesCursorCopyWith<$Res> {
  factory $PeamanChatMessagesCursorCopyWith(PeamanChatMessagesCursor value,
          $Res Function(PeamanChatMessagesCursor) then) =
      _$PeamanChatMessagesCursorCopyWithImpl<$Res, PeamanChatMessagesCursor>;
  @useResult
  $Res call({@JsonKey(ignore: true) String? uid, int? startAfter, int? endAt});
}

/// @nodoc
class _$PeamanChatMessagesCursorCopyWithImpl<$Res,
        $Val extends PeamanChatMessagesCursor>
    implements $PeamanChatMessagesCursorCopyWith<$Res> {
  _$PeamanChatMessagesCursorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? startAfter = freezed,
    Object? endAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      startAfter: freezed == startAfter
          ? _value.startAfter
          : startAfter // ignore: cast_nullable_to_non_nullable
              as int?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanChatMessagesCursorCopyWith<$Res>
    implements $PeamanChatMessagesCursorCopyWith<$Res> {
  factory _$$_PeamanChatMessagesCursorCopyWith(
          _$_PeamanChatMessagesCursor value,
          $Res Function(_$_PeamanChatMessagesCursor) then) =
      __$$_PeamanChatMessagesCursorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(ignore: true) String? uid, int? startAfter, int? endAt});
}

/// @nodoc
class __$$_PeamanChatMessagesCursorCopyWithImpl<$Res>
    extends _$PeamanChatMessagesCursorCopyWithImpl<$Res,
        _$_PeamanChatMessagesCursor>
    implements _$$_PeamanChatMessagesCursorCopyWith<$Res> {
  __$$_PeamanChatMessagesCursorCopyWithImpl(_$_PeamanChatMessagesCursor _value,
      $Res Function(_$_PeamanChatMessagesCursor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? startAfter = freezed,
    Object? endAt = freezed,
  }) {
    return _then(_$_PeamanChatMessagesCursor(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      startAfter: freezed == startAfter
          ? _value.startAfter
          : startAfter // ignore: cast_nullable_to_non_nullable
              as int?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PeamanChatMessagesCursor implements _PeamanChatMessagesCursor {
  const _$_PeamanChatMessagesCursor(
      {@JsonKey(ignore: true) this.uid, this.startAfter, this.endAt});

  factory _$_PeamanChatMessagesCursor.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanChatMessagesCursorFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? uid;
  @override
  final int? startAfter;
  @override
  final int? endAt;

  @override
  String toString() {
    return 'PeamanChatMessagesCursor(uid: $uid, startAfter: $startAfter, endAt: $endAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanChatMessagesCursor &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.startAfter, startAfter) ||
                other.startAfter == startAfter) &&
            (identical(other.endAt, endAt) || other.endAt == endAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, startAfter, endAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanChatMessagesCursorCopyWith<_$_PeamanChatMessagesCursor>
      get copyWith => __$$_PeamanChatMessagesCursorCopyWithImpl<
          _$_PeamanChatMessagesCursor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanChatMessagesCursorToJson(
      this,
    );
  }
}

abstract class _PeamanChatMessagesCursor implements PeamanChatMessagesCursor {
  const factory _PeamanChatMessagesCursor(
      {@JsonKey(ignore: true) final String? uid,
      final int? startAfter,
      final int? endAt}) = _$_PeamanChatMessagesCursor;

  factory _PeamanChatMessagesCursor.fromJson(Map<String, dynamic> json) =
      _$_PeamanChatMessagesCursor.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get uid;
  @override
  int? get startAfter;
  @override
  int? get endAt;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanChatMessagesCursorCopyWith<_$_PeamanChatMessagesCursor>
      get copyWith => throw _privateConstructorUsedError;
}
