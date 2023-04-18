// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanChat _$PeamanChatFromJson(Map<String, dynamic> json) {
  return _PeamanChat.fromJson(json);
}

/// @nodoc
mixin _$PeamanChat {
  String? get id => throw _privateConstructorUsedError;
  PeamanChatType get type => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get lastMessageId => throw _privateConstructorUsedError;
  int? get lastMessageCreatedAt => throw _privateConstructorUsedError;
  List<String> get userIds => throw _privateConstructorUsedError;
  List<String> get hiddenToUserIds => throw _privateConstructorUsedError;
  List<String> get archivedByUserIds => throw _privateConstructorUsedError;
  List<String> get typingUserIds => throw _privateConstructorUsedError;
  List<String> get pinnedChatUserIds => throw _privateConstructorUsedError;
  PeamanChatRequestStatus get chatRequestStatus =>
      throw _privateConstructorUsedError;
  String? get chatRequestSenderId => throw _privateConstructorUsedError;
  int get totalSentMessages => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<PeamanChatSentMessage> get sentMessages =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<PeamanChatUnreadMessage> get unreadMessages =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<PeamanChatMessagesCursor> get messagesCursors =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<PeamanChatMutedUntil> get mutedUntils =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<PeamanChatAddedBy> get addedBys => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<PeamanChatRemovedBy> get removedBys =>
      throw _privateConstructorUsedError;
  bool get visibility => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Map<String, dynamic> get extraData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanChatCopyWith<PeamanChat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanChatCopyWith<$Res> {
  factory $PeamanChatCopyWith(
          PeamanChat value, $Res Function(PeamanChat) then) =
      _$PeamanChatCopyWithImpl<$Res, PeamanChat>;
  @useResult
  $Res call(
      {String? id,
      PeamanChatType type,
      String? title,
      String? lastMessageId,
      int? lastMessageCreatedAt,
      List<String> userIds,
      List<String> hiddenToUserIds,
      List<String> archivedByUserIds,
      List<String> typingUserIds,
      List<String> pinnedChatUserIds,
      PeamanChatRequestStatus chatRequestStatus,
      String? chatRequestSenderId,
      int totalSentMessages,
      @JsonKey(ignore: true) List<PeamanChatSentMessage> sentMessages,
      @JsonKey(ignore: true) List<PeamanChatUnreadMessage> unreadMessages,
      @JsonKey(ignore: true) List<PeamanChatMessagesCursor> messagesCursors,
      @JsonKey(ignore: true) List<PeamanChatMutedUntil> mutedUntils,
      @JsonKey(ignore: true) List<PeamanChatAddedBy> addedBys,
      @JsonKey(ignore: true) List<PeamanChatRemovedBy> removedBys,
      bool visibility,
      int? createdAt,
      int? updatedAt,
      @JsonKey(ignore: true) Map<String, dynamic> extraData});
}

/// @nodoc
class _$PeamanChatCopyWithImpl<$Res, $Val extends PeamanChat>
    implements $PeamanChatCopyWith<$Res> {
  _$PeamanChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = null,
    Object? title = freezed,
    Object? lastMessageId = freezed,
    Object? lastMessageCreatedAt = freezed,
    Object? userIds = null,
    Object? hiddenToUserIds = null,
    Object? archivedByUserIds = null,
    Object? typingUserIds = null,
    Object? pinnedChatUserIds = null,
    Object? chatRequestStatus = null,
    Object? chatRequestSenderId = freezed,
    Object? totalSentMessages = null,
    Object? sentMessages = null,
    Object? unreadMessages = null,
    Object? messagesCursors = null,
    Object? mutedUntils = null,
    Object? addedBys = null,
    Object? removedBys = null,
    Object? visibility = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? extraData = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PeamanChatType,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageId: freezed == lastMessageId
          ? _value.lastMessageId
          : lastMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageCreatedAt: freezed == lastMessageCreatedAt
          ? _value.lastMessageCreatedAt
          : lastMessageCreatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      userIds: null == userIds
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hiddenToUserIds: null == hiddenToUserIds
          ? _value.hiddenToUserIds
          : hiddenToUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      archivedByUserIds: null == archivedByUserIds
          ? _value.archivedByUserIds
          : archivedByUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      typingUserIds: null == typingUserIds
          ? _value.typingUserIds
          : typingUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pinnedChatUserIds: null == pinnedChatUserIds
          ? _value.pinnedChatUserIds
          : pinnedChatUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      chatRequestStatus: null == chatRequestStatus
          ? _value.chatRequestStatus
          : chatRequestStatus // ignore: cast_nullable_to_non_nullable
              as PeamanChatRequestStatus,
      chatRequestSenderId: freezed == chatRequestSenderId
          ? _value.chatRequestSenderId
          : chatRequestSenderId // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSentMessages: null == totalSentMessages
          ? _value.totalSentMessages
          : totalSentMessages // ignore: cast_nullable_to_non_nullable
              as int,
      sentMessages: null == sentMessages
          ? _value.sentMessages
          : sentMessages // ignore: cast_nullable_to_non_nullable
              as List<PeamanChatSentMessage>,
      unreadMessages: null == unreadMessages
          ? _value.unreadMessages
          : unreadMessages // ignore: cast_nullable_to_non_nullable
              as List<PeamanChatUnreadMessage>,
      messagesCursors: null == messagesCursors
          ? _value.messagesCursors
          : messagesCursors // ignore: cast_nullable_to_non_nullable
              as List<PeamanChatMessagesCursor>,
      mutedUntils: null == mutedUntils
          ? _value.mutedUntils
          : mutedUntils // ignore: cast_nullable_to_non_nullable
              as List<PeamanChatMutedUntil>,
      addedBys: null == addedBys
          ? _value.addedBys
          : addedBys // ignore: cast_nullable_to_non_nullable
              as List<PeamanChatAddedBy>,
      removedBys: null == removedBys
          ? _value.removedBys
          : removedBys // ignore: cast_nullable_to_non_nullable
              as List<PeamanChatRemovedBy>,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      extraData: null == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanChatCopyWith<$Res>
    implements $PeamanChatCopyWith<$Res> {
  factory _$$_PeamanChatCopyWith(
          _$_PeamanChat value, $Res Function(_$_PeamanChat) then) =
      __$$_PeamanChatCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      PeamanChatType type,
      String? title,
      String? lastMessageId,
      int? lastMessageCreatedAt,
      List<String> userIds,
      List<String> hiddenToUserIds,
      List<String> archivedByUserIds,
      List<String> typingUserIds,
      List<String> pinnedChatUserIds,
      PeamanChatRequestStatus chatRequestStatus,
      String? chatRequestSenderId,
      int totalSentMessages,
      @JsonKey(ignore: true) List<PeamanChatSentMessage> sentMessages,
      @JsonKey(ignore: true) List<PeamanChatUnreadMessage> unreadMessages,
      @JsonKey(ignore: true) List<PeamanChatMessagesCursor> messagesCursors,
      @JsonKey(ignore: true) List<PeamanChatMutedUntil> mutedUntils,
      @JsonKey(ignore: true) List<PeamanChatAddedBy> addedBys,
      @JsonKey(ignore: true) List<PeamanChatRemovedBy> removedBys,
      bool visibility,
      int? createdAt,
      int? updatedAt,
      @JsonKey(ignore: true) Map<String, dynamic> extraData});
}

/// @nodoc
class __$$_PeamanChatCopyWithImpl<$Res>
    extends _$PeamanChatCopyWithImpl<$Res, _$_PeamanChat>
    implements _$$_PeamanChatCopyWith<$Res> {
  __$$_PeamanChatCopyWithImpl(
      _$_PeamanChat _value, $Res Function(_$_PeamanChat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = null,
    Object? title = freezed,
    Object? lastMessageId = freezed,
    Object? lastMessageCreatedAt = freezed,
    Object? userIds = null,
    Object? hiddenToUserIds = null,
    Object? archivedByUserIds = null,
    Object? typingUserIds = null,
    Object? pinnedChatUserIds = null,
    Object? chatRequestStatus = null,
    Object? chatRequestSenderId = freezed,
    Object? totalSentMessages = null,
    Object? sentMessages = null,
    Object? unreadMessages = null,
    Object? messagesCursors = null,
    Object? mutedUntils = null,
    Object? addedBys = null,
    Object? removedBys = null,
    Object? visibility = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? extraData = null,
  }) {
    return _then(_$_PeamanChat(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PeamanChatType,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageId: freezed == lastMessageId
          ? _value.lastMessageId
          : lastMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageCreatedAt: freezed == lastMessageCreatedAt
          ? _value.lastMessageCreatedAt
          : lastMessageCreatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      userIds: null == userIds
          ? _value._userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hiddenToUserIds: null == hiddenToUserIds
          ? _value._hiddenToUserIds
          : hiddenToUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      archivedByUserIds: null == archivedByUserIds
          ? _value._archivedByUserIds
          : archivedByUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      typingUserIds: null == typingUserIds
          ? _value._typingUserIds
          : typingUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pinnedChatUserIds: null == pinnedChatUserIds
          ? _value._pinnedChatUserIds
          : pinnedChatUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      chatRequestStatus: null == chatRequestStatus
          ? _value.chatRequestStatus
          : chatRequestStatus // ignore: cast_nullable_to_non_nullable
              as PeamanChatRequestStatus,
      chatRequestSenderId: freezed == chatRequestSenderId
          ? _value.chatRequestSenderId
          : chatRequestSenderId // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSentMessages: null == totalSentMessages
          ? _value.totalSentMessages
          : totalSentMessages // ignore: cast_nullable_to_non_nullable
              as int,
      sentMessages: null == sentMessages
          ? _value._sentMessages
          : sentMessages // ignore: cast_nullable_to_non_nullable
              as List<PeamanChatSentMessage>,
      unreadMessages: null == unreadMessages
          ? _value._unreadMessages
          : unreadMessages // ignore: cast_nullable_to_non_nullable
              as List<PeamanChatUnreadMessage>,
      messagesCursors: null == messagesCursors
          ? _value._messagesCursors
          : messagesCursors // ignore: cast_nullable_to_non_nullable
              as List<PeamanChatMessagesCursor>,
      mutedUntils: null == mutedUntils
          ? _value._mutedUntils
          : mutedUntils // ignore: cast_nullable_to_non_nullable
              as List<PeamanChatMutedUntil>,
      addedBys: null == addedBys
          ? _value._addedBys
          : addedBys // ignore: cast_nullable_to_non_nullable
              as List<PeamanChatAddedBy>,
      removedBys: null == removedBys
          ? _value._removedBys
          : removedBys // ignore: cast_nullable_to_non_nullable
              as List<PeamanChatRemovedBy>,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      extraData: null == extraData
          ? _value._extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PeamanChat implements _PeamanChat {
  const _$_PeamanChat(
      {this.id,
      this.type = PeamanChatType.oneToOne,
      this.title,
      this.lastMessageId,
      this.lastMessageCreatedAt,
      final List<String> userIds = const <String>[],
      final List<String> hiddenToUserIds = const <String>[],
      final List<String> archivedByUserIds = const <String>[],
      final List<String> typingUserIds = const <String>[],
      final List<String> pinnedChatUserIds = const <String>[],
      this.chatRequestStatus = PeamanChatRequestStatus.idle,
      this.chatRequestSenderId,
      this.totalSentMessages = 0,
      @JsonKey(ignore: true)
          final List<PeamanChatSentMessage>
              sentMessages = const <PeamanChatSentMessage>[],
      @JsonKey(ignore: true)
          final List<PeamanChatUnreadMessage>
              unreadMessages = const <PeamanChatUnreadMessage>[],
      @JsonKey(ignore: true)
          final List<PeamanChatMessagesCursor>
              messagesCursors = const <PeamanChatMessagesCursor>[],
      @JsonKey(ignore: true)
          final List<PeamanChatMutedUntil>
              mutedUntils = const <PeamanChatMutedUntil>[],
      @JsonKey(ignore: true)
          final List<PeamanChatAddedBy> addedBys = const <PeamanChatAddedBy>[],
      @JsonKey(ignore: true)
          final List<PeamanChatRemovedBy>
              removedBys = const <PeamanChatRemovedBy>[],
      this.visibility = true,
      this.createdAt,
      this.updatedAt,
      @JsonKey(ignore: true)
          final Map<String, dynamic> extraData = const <String, dynamic>{}})
      : _userIds = userIds,
        _hiddenToUserIds = hiddenToUserIds,
        _archivedByUserIds = archivedByUserIds,
        _typingUserIds = typingUserIds,
        _pinnedChatUserIds = pinnedChatUserIds,
        _sentMessages = sentMessages,
        _unreadMessages = unreadMessages,
        _messagesCursors = messagesCursors,
        _mutedUntils = mutedUntils,
        _addedBys = addedBys,
        _removedBys = removedBys,
        _extraData = extraData;

  factory _$_PeamanChat.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanChatFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey()
  final PeamanChatType type;
  @override
  final String? title;
  @override
  final String? lastMessageId;
  @override
  final int? lastMessageCreatedAt;
  final List<String> _userIds;
  @override
  @JsonKey()
  List<String> get userIds {
    if (_userIds is EqualUnmodifiableListView) return _userIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIds);
  }

  final List<String> _hiddenToUserIds;
  @override
  @JsonKey()
  List<String> get hiddenToUserIds {
    if (_hiddenToUserIds is EqualUnmodifiableListView) return _hiddenToUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hiddenToUserIds);
  }

  final List<String> _archivedByUserIds;
  @override
  @JsonKey()
  List<String> get archivedByUserIds {
    if (_archivedByUserIds is EqualUnmodifiableListView)
      return _archivedByUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_archivedByUserIds);
  }

  final List<String> _typingUserIds;
  @override
  @JsonKey()
  List<String> get typingUserIds {
    if (_typingUserIds is EqualUnmodifiableListView) return _typingUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typingUserIds);
  }

  final List<String> _pinnedChatUserIds;
  @override
  @JsonKey()
  List<String> get pinnedChatUserIds {
    if (_pinnedChatUserIds is EqualUnmodifiableListView)
      return _pinnedChatUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pinnedChatUserIds);
  }

  @override
  @JsonKey()
  final PeamanChatRequestStatus chatRequestStatus;
  @override
  final String? chatRequestSenderId;
  @override
  @JsonKey()
  final int totalSentMessages;
  final List<PeamanChatSentMessage> _sentMessages;
  @override
  @JsonKey(ignore: true)
  List<PeamanChatSentMessage> get sentMessages {
    if (_sentMessages is EqualUnmodifiableListView) return _sentMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sentMessages);
  }

  final List<PeamanChatUnreadMessage> _unreadMessages;
  @override
  @JsonKey(ignore: true)
  List<PeamanChatUnreadMessage> get unreadMessages {
    if (_unreadMessages is EqualUnmodifiableListView) return _unreadMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unreadMessages);
  }

  final List<PeamanChatMessagesCursor> _messagesCursors;
  @override
  @JsonKey(ignore: true)
  List<PeamanChatMessagesCursor> get messagesCursors {
    if (_messagesCursors is EqualUnmodifiableListView) return _messagesCursors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messagesCursors);
  }

  final List<PeamanChatMutedUntil> _mutedUntils;
  @override
  @JsonKey(ignore: true)
  List<PeamanChatMutedUntil> get mutedUntils {
    if (_mutedUntils is EqualUnmodifiableListView) return _mutedUntils;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mutedUntils);
  }

  final List<PeamanChatAddedBy> _addedBys;
  @override
  @JsonKey(ignore: true)
  List<PeamanChatAddedBy> get addedBys {
    if (_addedBys is EqualUnmodifiableListView) return _addedBys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addedBys);
  }

  final List<PeamanChatRemovedBy> _removedBys;
  @override
  @JsonKey(ignore: true)
  List<PeamanChatRemovedBy> get removedBys {
    if (_removedBys is EqualUnmodifiableListView) return _removedBys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_removedBys);
  }

  @override
  @JsonKey()
  final bool visibility;
  @override
  final int? createdAt;
  @override
  final int? updatedAt;
  final Map<String, dynamic> _extraData;
  @override
  @JsonKey(ignore: true)
  Map<String, dynamic> get extraData {
    if (_extraData is EqualUnmodifiableMapView) return _extraData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_extraData);
  }

  @override
  String toString() {
    return 'PeamanChat(id: $id, type: $type, title: $title, lastMessageId: $lastMessageId, lastMessageCreatedAt: $lastMessageCreatedAt, userIds: $userIds, hiddenToUserIds: $hiddenToUserIds, archivedByUserIds: $archivedByUserIds, typingUserIds: $typingUserIds, pinnedChatUserIds: $pinnedChatUserIds, chatRequestStatus: $chatRequestStatus, chatRequestSenderId: $chatRequestSenderId, totalSentMessages: $totalSentMessages, sentMessages: $sentMessages, unreadMessages: $unreadMessages, messagesCursors: $messagesCursors, mutedUntils: $mutedUntils, addedBys: $addedBys, removedBys: $removedBys, visibility: $visibility, createdAt: $createdAt, updatedAt: $updatedAt, extraData: $extraData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanChat &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.lastMessageId, lastMessageId) ||
                other.lastMessageId == lastMessageId) &&
            (identical(other.lastMessageCreatedAt, lastMessageCreatedAt) ||
                other.lastMessageCreatedAt == lastMessageCreatedAt) &&
            const DeepCollectionEquality().equals(other._userIds, _userIds) &&
            const DeepCollectionEquality()
                .equals(other._hiddenToUserIds, _hiddenToUserIds) &&
            const DeepCollectionEquality()
                .equals(other._archivedByUserIds, _archivedByUserIds) &&
            const DeepCollectionEquality()
                .equals(other._typingUserIds, _typingUserIds) &&
            const DeepCollectionEquality()
                .equals(other._pinnedChatUserIds, _pinnedChatUserIds) &&
            (identical(other.chatRequestStatus, chatRequestStatus) ||
                other.chatRequestStatus == chatRequestStatus) &&
            (identical(other.chatRequestSenderId, chatRequestSenderId) ||
                other.chatRequestSenderId == chatRequestSenderId) &&
            (identical(other.totalSentMessages, totalSentMessages) ||
                other.totalSentMessages == totalSentMessages) &&
            const DeepCollectionEquality()
                .equals(other._sentMessages, _sentMessages) &&
            const DeepCollectionEquality()
                .equals(other._unreadMessages, _unreadMessages) &&
            const DeepCollectionEquality()
                .equals(other._messagesCursors, _messagesCursors) &&
            const DeepCollectionEquality()
                .equals(other._mutedUntils, _mutedUntils) &&
            const DeepCollectionEquality().equals(other._addedBys, _addedBys) &&
            const DeepCollectionEquality()
                .equals(other._removedBys, _removedBys) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._extraData, _extraData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        type,
        title,
        lastMessageId,
        lastMessageCreatedAt,
        const DeepCollectionEquality().hash(_userIds),
        const DeepCollectionEquality().hash(_hiddenToUserIds),
        const DeepCollectionEquality().hash(_archivedByUserIds),
        const DeepCollectionEquality().hash(_typingUserIds),
        const DeepCollectionEquality().hash(_pinnedChatUserIds),
        chatRequestStatus,
        chatRequestSenderId,
        totalSentMessages,
        const DeepCollectionEquality().hash(_sentMessages),
        const DeepCollectionEquality().hash(_unreadMessages),
        const DeepCollectionEquality().hash(_messagesCursors),
        const DeepCollectionEquality().hash(_mutedUntils),
        const DeepCollectionEquality().hash(_addedBys),
        const DeepCollectionEquality().hash(_removedBys),
        visibility,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_extraData)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanChatCopyWith<_$_PeamanChat> get copyWith =>
      __$$_PeamanChatCopyWithImpl<_$_PeamanChat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanChatToJson(
      this,
    );
  }
}

abstract class _PeamanChat implements PeamanChat {
  const factory _PeamanChat(
      {final String? id,
      final PeamanChatType type,
      final String? title,
      final String? lastMessageId,
      final int? lastMessageCreatedAt,
      final List<String> userIds,
      final List<String> hiddenToUserIds,
      final List<String> archivedByUserIds,
      final List<String> typingUserIds,
      final List<String> pinnedChatUserIds,
      final PeamanChatRequestStatus chatRequestStatus,
      final String? chatRequestSenderId,
      final int totalSentMessages,
      @JsonKey(ignore: true)
          final List<PeamanChatSentMessage> sentMessages,
      @JsonKey(ignore: true)
          final List<PeamanChatUnreadMessage> unreadMessages,
      @JsonKey(ignore: true)
          final List<PeamanChatMessagesCursor> messagesCursors,
      @JsonKey(ignore: true)
          final List<PeamanChatMutedUntil> mutedUntils,
      @JsonKey(ignore: true)
          final List<PeamanChatAddedBy> addedBys,
      @JsonKey(ignore: true)
          final List<PeamanChatRemovedBy> removedBys,
      final bool visibility,
      final int? createdAt,
      final int? updatedAt,
      @JsonKey(ignore: true)
          final Map<String, dynamic> extraData}) = _$_PeamanChat;

  factory _PeamanChat.fromJson(Map<String, dynamic> json) =
      _$_PeamanChat.fromJson;

  @override
  String? get id;
  @override
  PeamanChatType get type;
  @override
  String? get title;
  @override
  String? get lastMessageId;
  @override
  int? get lastMessageCreatedAt;
  @override
  List<String> get userIds;
  @override
  List<String> get hiddenToUserIds;
  @override
  List<String> get archivedByUserIds;
  @override
  List<String> get typingUserIds;
  @override
  List<String> get pinnedChatUserIds;
  @override
  PeamanChatRequestStatus get chatRequestStatus;
  @override
  String? get chatRequestSenderId;
  @override
  int get totalSentMessages;
  @override
  @JsonKey(ignore: true)
  List<PeamanChatSentMessage> get sentMessages;
  @override
  @JsonKey(ignore: true)
  List<PeamanChatUnreadMessage> get unreadMessages;
  @override
  @JsonKey(ignore: true)
  List<PeamanChatMessagesCursor> get messagesCursors;
  @override
  @JsonKey(ignore: true)
  List<PeamanChatMutedUntil> get mutedUntils;
  @override
  @JsonKey(ignore: true)
  List<PeamanChatAddedBy> get addedBys;
  @override
  @JsonKey(ignore: true)
  List<PeamanChatRemovedBy> get removedBys;
  @override
  bool get visibility;
  @override
  int? get createdAt;
  @override
  int? get updatedAt;
  @override
  @JsonKey(ignore: true)
  Map<String, dynamic> get extraData;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanChatCopyWith<_$_PeamanChat> get copyWith =>
      throw _privateConstructorUsedError;
}
