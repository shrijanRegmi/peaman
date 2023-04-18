// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanChatMessage _$PeamanChatMessageFromJson(Map<String, dynamic> json) {
  return _PeamanChatMessage.fromJson(json);
}

/// @nodoc
mixin _$PeamanChatMessage {
  String? get id => throw _privateConstructorUsedError;
  String? get chatId => throw _privateConstructorUsedError;
  PeamanChatType get chatType => throw _privateConstructorUsedError;
  String? get chatTitle => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  List<PeamanFileUrl> get files => throw _privateConstructorUsedError;
  PeamanChatMessageType get type => throw _privateConstructorUsedError;
  String? get senderId => throw _privateConstructorUsedError;
  String? get senderName => throw _privateConstructorUsedError;
  List<String> get receiverIds => throw _privateConstructorUsedError;
  String? get extraId => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  String? get parentText => throw _privateConstructorUsedError;
  List<PeamanFileUrl> get parentFiles => throw _privateConstructorUsedError;
  bool get visibility => throw _privateConstructorUsedError;
  bool get isForwarded => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get isTemp => throw _privateConstructorUsedError;
  String? get forwardedFromChatId => throw _privateConstructorUsedError;
  bool get unsent => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Map<String, dynamic> get extraData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanChatMessageCopyWith<PeamanChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanChatMessageCopyWith<$Res> {
  factory $PeamanChatMessageCopyWith(
          PeamanChatMessage value, $Res Function(PeamanChatMessage) then) =
      _$PeamanChatMessageCopyWithImpl<$Res, PeamanChatMessage>;
  @useResult
  $Res call(
      {String? id,
      String? chatId,
      PeamanChatType chatType,
      String? chatTitle,
      String? text,
      List<PeamanFileUrl> files,
      PeamanChatMessageType type,
      String? senderId,
      String? senderName,
      List<String> receiverIds,
      String? extraId,
      String? parentId,
      String? parentText,
      List<PeamanFileUrl> parentFiles,
      bool visibility,
      bool isForwarded,
      @JsonKey(ignore: true) bool isTemp,
      String? forwardedFromChatId,
      bool unsent,
      int? createdAt,
      int? updatedAt,
      @JsonKey(ignore: true) Map<String, dynamic> extraData});
}

/// @nodoc
class _$PeamanChatMessageCopyWithImpl<$Res, $Val extends PeamanChatMessage>
    implements $PeamanChatMessageCopyWith<$Res> {
  _$PeamanChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chatId = freezed,
    Object? chatType = null,
    Object? chatTitle = freezed,
    Object? text = freezed,
    Object? files = null,
    Object? type = null,
    Object? senderId = freezed,
    Object? senderName = freezed,
    Object? receiverIds = null,
    Object? extraId = freezed,
    Object? parentId = freezed,
    Object? parentText = freezed,
    Object? parentFiles = null,
    Object? visibility = null,
    Object? isForwarded = null,
    Object? isTemp = null,
    Object? forwardedFromChatId = freezed,
    Object? unsent = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? extraData = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String?,
      chatType: null == chatType
          ? _value.chatType
          : chatType // ignore: cast_nullable_to_non_nullable
              as PeamanChatType,
      chatTitle: freezed == chatTitle
          ? _value.chatTitle
          : chatTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<PeamanFileUrl>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PeamanChatMessageType,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverIds: null == receiverIds
          ? _value.receiverIds
          : receiverIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      extraId: freezed == extraId
          ? _value.extraId
          : extraId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentText: freezed == parentText
          ? _value.parentText
          : parentText // ignore: cast_nullable_to_non_nullable
              as String?,
      parentFiles: null == parentFiles
          ? _value.parentFiles
          : parentFiles // ignore: cast_nullable_to_non_nullable
              as List<PeamanFileUrl>,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
      isForwarded: null == isForwarded
          ? _value.isForwarded
          : isForwarded // ignore: cast_nullable_to_non_nullable
              as bool,
      isTemp: null == isTemp
          ? _value.isTemp
          : isTemp // ignore: cast_nullable_to_non_nullable
              as bool,
      forwardedFromChatId: freezed == forwardedFromChatId
          ? _value.forwardedFromChatId
          : forwardedFromChatId // ignore: cast_nullable_to_non_nullable
              as String?,
      unsent: null == unsent
          ? _value.unsent
          : unsent // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_PeamanChatMessageCopyWith<$Res>
    implements $PeamanChatMessageCopyWith<$Res> {
  factory _$$_PeamanChatMessageCopyWith(_$_PeamanChatMessage value,
          $Res Function(_$_PeamanChatMessage) then) =
      __$$_PeamanChatMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? chatId,
      PeamanChatType chatType,
      String? chatTitle,
      String? text,
      List<PeamanFileUrl> files,
      PeamanChatMessageType type,
      String? senderId,
      String? senderName,
      List<String> receiverIds,
      String? extraId,
      String? parentId,
      String? parentText,
      List<PeamanFileUrl> parentFiles,
      bool visibility,
      bool isForwarded,
      @JsonKey(ignore: true) bool isTemp,
      String? forwardedFromChatId,
      bool unsent,
      int? createdAt,
      int? updatedAt,
      @JsonKey(ignore: true) Map<String, dynamic> extraData});
}

/// @nodoc
class __$$_PeamanChatMessageCopyWithImpl<$Res>
    extends _$PeamanChatMessageCopyWithImpl<$Res, _$_PeamanChatMessage>
    implements _$$_PeamanChatMessageCopyWith<$Res> {
  __$$_PeamanChatMessageCopyWithImpl(
      _$_PeamanChatMessage _value, $Res Function(_$_PeamanChatMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chatId = freezed,
    Object? chatType = null,
    Object? chatTitle = freezed,
    Object? text = freezed,
    Object? files = null,
    Object? type = null,
    Object? senderId = freezed,
    Object? senderName = freezed,
    Object? receiverIds = null,
    Object? extraId = freezed,
    Object? parentId = freezed,
    Object? parentText = freezed,
    Object? parentFiles = null,
    Object? visibility = null,
    Object? isForwarded = null,
    Object? isTemp = null,
    Object? forwardedFromChatId = freezed,
    Object? unsent = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? extraData = null,
  }) {
    return _then(_$_PeamanChatMessage(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String?,
      chatType: null == chatType
          ? _value.chatType
          : chatType // ignore: cast_nullable_to_non_nullable
              as PeamanChatType,
      chatTitle: freezed == chatTitle
          ? _value.chatTitle
          : chatTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<PeamanFileUrl>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PeamanChatMessageType,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverIds: null == receiverIds
          ? _value._receiverIds
          : receiverIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      extraId: freezed == extraId
          ? _value.extraId
          : extraId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentText: freezed == parentText
          ? _value.parentText
          : parentText // ignore: cast_nullable_to_non_nullable
              as String?,
      parentFiles: null == parentFiles
          ? _value._parentFiles
          : parentFiles // ignore: cast_nullable_to_non_nullable
              as List<PeamanFileUrl>,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
      isForwarded: null == isForwarded
          ? _value.isForwarded
          : isForwarded // ignore: cast_nullable_to_non_nullable
              as bool,
      isTemp: null == isTemp
          ? _value.isTemp
          : isTemp // ignore: cast_nullable_to_non_nullable
              as bool,
      forwardedFromChatId: freezed == forwardedFromChatId
          ? _value.forwardedFromChatId
          : forwardedFromChatId // ignore: cast_nullable_to_non_nullable
              as String?,
      unsent: null == unsent
          ? _value.unsent
          : unsent // ignore: cast_nullable_to_non_nullable
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
class _$_PeamanChatMessage implements _PeamanChatMessage {
  const _$_PeamanChatMessage(
      {this.id,
      this.chatId,
      this.chatType = PeamanChatType.oneToOne,
      this.chatTitle,
      this.text,
      final List<PeamanFileUrl> files = const <PeamanFileUrl>[],
      this.type = PeamanChatMessageType.text,
      this.senderId,
      this.senderName,
      final List<String> receiverIds = const <String>[],
      this.extraId,
      this.parentId,
      this.parentText,
      final List<PeamanFileUrl> parentFiles = const <PeamanFileUrl>[],
      this.visibility = true,
      this.isForwarded = false,
      @JsonKey(ignore: true)
          this.isTemp = false,
      this.forwardedFromChatId,
      this.unsent = false,
      this.createdAt,
      this.updatedAt,
      @JsonKey(ignore: true)
          final Map<String, dynamic> extraData = const <String, dynamic>{}})
      : _files = files,
        _receiverIds = receiverIds,
        _parentFiles = parentFiles,
        _extraData = extraData;

  factory _$_PeamanChatMessage.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanChatMessageFromJson(json);

  @override
  final String? id;
  @override
  final String? chatId;
  @override
  @JsonKey()
  final PeamanChatType chatType;
  @override
  final String? chatTitle;
  @override
  final String? text;
  final List<PeamanFileUrl> _files;
  @override
  @JsonKey()
  List<PeamanFileUrl> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  @JsonKey()
  final PeamanChatMessageType type;
  @override
  final String? senderId;
  @override
  final String? senderName;
  final List<String> _receiverIds;
  @override
  @JsonKey()
  List<String> get receiverIds {
    if (_receiverIds is EqualUnmodifiableListView) return _receiverIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_receiverIds);
  }

  @override
  final String? extraId;
  @override
  final String? parentId;
  @override
  final String? parentText;
  final List<PeamanFileUrl> _parentFiles;
  @override
  @JsonKey()
  List<PeamanFileUrl> get parentFiles {
    if (_parentFiles is EqualUnmodifiableListView) return _parentFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parentFiles);
  }

  @override
  @JsonKey()
  final bool visibility;
  @override
  @JsonKey()
  final bool isForwarded;
  @override
  @JsonKey(ignore: true)
  final bool isTemp;
  @override
  final String? forwardedFromChatId;
  @override
  @JsonKey()
  final bool unsent;
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
    return 'PeamanChatMessage(id: $id, chatId: $chatId, chatType: $chatType, chatTitle: $chatTitle, text: $text, files: $files, type: $type, senderId: $senderId, senderName: $senderName, receiverIds: $receiverIds, extraId: $extraId, parentId: $parentId, parentText: $parentText, parentFiles: $parentFiles, visibility: $visibility, isForwarded: $isForwarded, isTemp: $isTemp, forwardedFromChatId: $forwardedFromChatId, unsent: $unsent, createdAt: $createdAt, updatedAt: $updatedAt, extraData: $extraData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanChatMessage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.chatType, chatType) ||
                other.chatType == chatType) &&
            (identical(other.chatTitle, chatTitle) ||
                other.chatTitle == chatTitle) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            const DeepCollectionEquality()
                .equals(other._receiverIds, _receiverIds) &&
            (identical(other.extraId, extraId) || other.extraId == extraId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.parentText, parentText) ||
                other.parentText == parentText) &&
            const DeepCollectionEquality()
                .equals(other._parentFiles, _parentFiles) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.isForwarded, isForwarded) ||
                other.isForwarded == isForwarded) &&
            (identical(other.isTemp, isTemp) || other.isTemp == isTemp) &&
            (identical(other.forwardedFromChatId, forwardedFromChatId) ||
                other.forwardedFromChatId == forwardedFromChatId) &&
            (identical(other.unsent, unsent) || other.unsent == unsent) &&
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
        chatId,
        chatType,
        chatTitle,
        text,
        const DeepCollectionEquality().hash(_files),
        type,
        senderId,
        senderName,
        const DeepCollectionEquality().hash(_receiverIds),
        extraId,
        parentId,
        parentText,
        const DeepCollectionEquality().hash(_parentFiles),
        visibility,
        isForwarded,
        isTemp,
        forwardedFromChatId,
        unsent,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_extraData)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanChatMessageCopyWith<_$_PeamanChatMessage> get copyWith =>
      __$$_PeamanChatMessageCopyWithImpl<_$_PeamanChatMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanChatMessageToJson(
      this,
    );
  }
}

abstract class _PeamanChatMessage implements PeamanChatMessage {
  const factory _PeamanChatMessage(
          {final String? id,
          final String? chatId,
          final PeamanChatType chatType,
          final String? chatTitle,
          final String? text,
          final List<PeamanFileUrl> files,
          final PeamanChatMessageType type,
          final String? senderId,
          final String? senderName,
          final List<String> receiverIds,
          final String? extraId,
          final String? parentId,
          final String? parentText,
          final List<PeamanFileUrl> parentFiles,
          final bool visibility,
          final bool isForwarded,
          @JsonKey(ignore: true) final bool isTemp,
          final String? forwardedFromChatId,
          final bool unsent,
          final int? createdAt,
          final int? updatedAt,
          @JsonKey(ignore: true) final Map<String, dynamic> extraData}) =
      _$_PeamanChatMessage;

  factory _PeamanChatMessage.fromJson(Map<String, dynamic> json) =
      _$_PeamanChatMessage.fromJson;

  @override
  String? get id;
  @override
  String? get chatId;
  @override
  PeamanChatType get chatType;
  @override
  String? get chatTitle;
  @override
  String? get text;
  @override
  List<PeamanFileUrl> get files;
  @override
  PeamanChatMessageType get type;
  @override
  String? get senderId;
  @override
  String? get senderName;
  @override
  List<String> get receiverIds;
  @override
  String? get extraId;
  @override
  String? get parentId;
  @override
  String? get parentText;
  @override
  List<PeamanFileUrl> get parentFiles;
  @override
  bool get visibility;
  @override
  bool get isForwarded;
  @override
  @JsonKey(ignore: true)
  bool get isTemp;
  @override
  String? get forwardedFromChatId;
  @override
  bool get unsent;
  @override
  int? get createdAt;
  @override
  int? get updatedAt;
  @override
  @JsonKey(ignore: true)
  Map<String, dynamic> get extraData;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanChatMessageCopyWith<_$_PeamanChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
