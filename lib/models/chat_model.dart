import 'package:peaman/peaman.dart';

class PeamanChat {
  final String? id;
  final String? lastMessageId;
  final List<String> userIds;
  final List<String> typingUserIds;
  final List<String> pinnedChatUserIds;
  final PeamanChatRequestStatus chatRequestStatus;
  final String? chatRequestSenderId;
  final int Function(String uid)? unreadMessagesCount;
  final int? createdAt;
  final int? updatedAt;
  final Map<String, dynamic> extraData;

  PeamanChat({
    this.id,
    this.lastMessageId,
    this.userIds = const <String>[],
    this.typingUserIds = const <String>[],
    this.pinnedChatUserIds = const <String>[],
    this.chatRequestStatus = PeamanChatRequestStatus.idle,
    this.chatRequestSenderId,
    this.unreadMessagesCount,
    this.createdAt,
    this.updatedAt,
    this.extraData = const {},
  });

  PeamanChat copyWith({
    final String? id,
    final String? lastMessageId,
    final List<String>? userIds,
    final List<String>? typingUserIds,
    final List<String>? pinnedChatUserIds,
    final PeamanChatRequestStatus? chatRequestStatus,
    final String? chatRequestSenderId,
    final int Function(String)? unreadMessagesCount,
    final int? createdAt,
    final int? updatedAt,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanChat(
      id: id ?? this.id,
      lastMessageId: lastMessageId ?? this.lastMessageId,
      userIds: userIds ?? this.userIds,
      typingUserIds: typingUserIds ?? this.typingUserIds,
      pinnedChatUserIds: pinnedChatUserIds ?? this.pinnedChatUserIds,
      chatRequestStatus: chatRequestStatus ?? this.chatRequestStatus,
      chatRequestSenderId: chatRequestSenderId ?? this.chatRequestSenderId,
      unreadMessagesCount: unreadMessagesCount ?? this.unreadMessagesCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanChat fromJson(Map<String, dynamic> data) {
    return PeamanChat(
      id: data['id'],
      lastMessageId: data['last_message_id'],
      userIds: List<String>.from(data['user_ids'] ?? []),
      typingUserIds: List<String>.from(data['typing_user_ids'] ?? []),
      pinnedChatUserIds: List<String>.from(data['pinned_chat_user_ids'] ?? []),
      chatRequestStatus:
          PeamanChatRequestStatus.values[data['chat_request_status'] ?? 0],
      chatRequestSenderId: data['chat_request_sender_id'],
      unreadMessagesCount: (uid) => _getUnreadMessagesCountByUid(uid, data),
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'last_message_id': lastMessageId,
      'user_ids': userIds,
      'typing_user_ids': typingUserIds,
      'pinned_chat_user_ids': pinnedChatUserIds,
      'chat_request_status': chatRequestStatus.index,
      'chat_request_sender_id': chatRequestSenderId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      ...extraData,
    };
  }

  static int _getUnreadMessagesCountByUid(
    final String uid,
    final Map<String, dynamic> data,
  ) {
    final _key = 'z_${uid}_unread_messages';
    final _count = data[_key] ?? 0;
    return _count;
  }
}

class PeamanIdleChat {
  final String? id;
  final String? lastMessageId;
  final List<String> userIds;
  final List<String> typingUserIds;
  final List<String> pinnedChatUserIds;
  final PeamanChatRequestStatus chatRequestStatus;
  final String? chatRequestSenderId;
  final int Function(String uid)? unreadMessagesCount;
  final int? createdAt;
  final int? updatedAt;
  final Map<String, dynamic> extraData;

  PeamanIdleChat({
    this.id,
    this.lastMessageId,
    this.userIds = const <String>[],
    this.typingUserIds = const <String>[],
    this.pinnedChatUserIds = const <String>[],
    this.chatRequestStatus = PeamanChatRequestStatus.idle,
    this.chatRequestSenderId,
    this.unreadMessagesCount,
    this.createdAt,
    this.updatedAt,
    this.extraData = const {},
  });

  PeamanIdleChat copyWith({
    final String? id,
    final String? lastMessageId,
    final List<String>? userIds,
    final List<String>? typingUserIds,
    final List<String>? pinnedChatUserIds,
    final PeamanChatRequestStatus? chatRequestStatus,
    final String? chatRequestSenderId,
    final int Function(String)? unreadMessagesCount,
    final int? createdAt,
    final int? updatedAt,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanIdleChat(
      id: id ?? this.id,
      lastMessageId: lastMessageId ?? this.lastMessageId,
      userIds: userIds ?? this.userIds,
      typingUserIds: typingUserIds ?? this.typingUserIds,
      pinnedChatUserIds: pinnedChatUserIds ?? this.pinnedChatUserIds,
      chatRequestStatus: chatRequestStatus ?? this.chatRequestStatus,
      chatRequestSenderId: chatRequestSenderId ?? this.chatRequestSenderId,
      unreadMessagesCount: unreadMessagesCount ?? this.unreadMessagesCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanIdleChat fromJson(Map<String, dynamic> data) {
    return PeamanIdleChat(
      id: data['id'],
      lastMessageId: data['last_message_id'],
      userIds: List<String>.from(data['user_ids'] ?? []),
      typingUserIds: List<String>.from(data['typing_user_ids'] ?? []),
      pinnedChatUserIds: List<String>.from(data['pinned_chat_user_ids'] ?? []),
      chatRequestStatus:
          PeamanChatRequestStatus.values[data['chat_request_status'] ?? 0],
      chatRequestSenderId: data['chat_request_sender_id'],
      unreadMessagesCount: (uid) => _getUnreadMessagesCountByUid(uid, data),
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'last_message_id': lastMessageId,
      'user_ids': userIds,
      'typing_user_ids': typingUserIds,
      'pinned_chat_user_ids': pinnedChatUserIds,
      'chat_request_status': chatRequestStatus.index,
      'chat_request_sender_id': chatRequestSenderId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      ...extraData,
    };
  }

  static int _getUnreadMessagesCountByUid(
    final String uid,
    final Map<String, dynamic> data,
  ) {
    final _key = 'z_${uid}_unread_messages';
    final _count = data[_key] ?? 0;
    return _count;
  }
}

class PeamanAcceptedChat {
  final String? id;
  final String? lastMessageId;
  final List<String> userIds;
  final List<String> typingUserIds;
  final List<String> pinnedChatUserIds;
  final PeamanChatRequestStatus chatRequestStatus;
  final String? chatRequestSenderId;
  final int Function(String uid)? unreadMessagesCount;
  final int? createdAt;
  final int? updatedAt;
  final Map<String, dynamic> extraData;

  PeamanAcceptedChat({
    this.id,
    this.lastMessageId,
    this.userIds = const <String>[],
    this.typingUserIds = const <String>[],
    this.pinnedChatUserIds = const <String>[],
    this.chatRequestStatus = PeamanChatRequestStatus.idle,
    this.chatRequestSenderId,
    this.unreadMessagesCount,
    this.createdAt,
    this.updatedAt,
    this.extraData = const {},
  });

  PeamanAcceptedChat copyWith({
    final String? id,
    final String? lastMessageId,
    final List<String>? userIds,
    final List<String>? typingUserIds,
    final List<String>? pinnedChatUserIds,
    final PeamanChatRequestStatus? chatRequestStatus,
    final String? chatRequestSenderId,
    final int Function(String)? unreadMessagesCount,
    final int? createdAt,
    final int? updatedAt,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanAcceptedChat(
      id: id ?? this.id,
      lastMessageId: lastMessageId ?? this.lastMessageId,
      userIds: userIds ?? this.userIds,
      typingUserIds: typingUserIds ?? this.typingUserIds,
      pinnedChatUserIds: pinnedChatUserIds ?? this.pinnedChatUserIds,
      chatRequestStatus: chatRequestStatus ?? this.chatRequestStatus,
      chatRequestSenderId: chatRequestSenderId ?? this.chatRequestSenderId,
      unreadMessagesCount: unreadMessagesCount ?? this.unreadMessagesCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanAcceptedChat fromJson(Map<String, dynamic> data) {
    return PeamanAcceptedChat(
      id: data['id'],
      lastMessageId: data['last_message_id'],
      userIds: List<String>.from(data['user_ids'] ?? []),
      typingUserIds: List<String>.from(data['typing_user_ids'] ?? []),
      pinnedChatUserIds: List<String>.from(data['pinned_chat_user_ids'] ?? []),
      chatRequestStatus:
          PeamanChatRequestStatus.values[data['chat_request_status'] ?? 0],
      chatRequestSenderId: data['chat_request_sender_id'],
      unreadMessagesCount: (uid) => _getUnreadMessagesCountByUid(uid, data),
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'last_message_id': lastMessageId,
      'user_ids': userIds,
      'typing_user_ids': typingUserIds,
      'pinned_chat_user_ids': pinnedChatUserIds,
      'chat_request_status': chatRequestStatus.index,
      'chat_request_sender_id': chatRequestSenderId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      ...extraData,
    };
  }

  static int _getUnreadMessagesCountByUid(
    final String uid,
    final Map<String, dynamic> data,
  ) {
    final _key = 'z_${uid}_unread_messages';
    final _count = data[_key] ?? 0;
    return _count;
  }
}

class PeamanDeclinedChat {
  final String? id;
  final String? lastMessageId;
  final List<String> userIds;
  final List<String> typingUserIds;
  final List<String> pinnedChatUserIds;
  final PeamanChatRequestStatus chatRequestStatus;
  final String? chatRequestSenderId;
  final int Function(String uid)? unreadMessagesCount;
  final int? createdAt;
  final int? updatedAt;
  final Map<String, dynamic> extraData;

  PeamanDeclinedChat({
    this.id,
    this.lastMessageId,
    this.userIds = const <String>[],
    this.typingUserIds = const <String>[],
    this.pinnedChatUserIds = const <String>[],
    this.chatRequestStatus = PeamanChatRequestStatus.idle,
    this.chatRequestSenderId,
    this.unreadMessagesCount,
    this.createdAt,
    this.updatedAt,
    this.extraData = const {},
  });

  PeamanDeclinedChat copyWith({
    final String? id,
    final String? lastMessageId,
    final List<String>? userIds,
    final List<String>? typingUserIds,
    final List<String>? pinnedChatUserIds,
    final PeamanChatRequestStatus? chatRequestStatus,
    final String? chatRequestSenderId,
    final int Function(String)? unreadMessagesCount,
    final int? createdAt,
    final int? updatedAt,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanDeclinedChat(
      id: id ?? this.id,
      lastMessageId: lastMessageId ?? this.lastMessageId,
      userIds: userIds ?? this.userIds,
      typingUserIds: typingUserIds ?? this.typingUserIds,
      pinnedChatUserIds: pinnedChatUserIds ?? this.pinnedChatUserIds,
      chatRequestStatus: chatRequestStatus ?? this.chatRequestStatus,
      chatRequestSenderId: chatRequestSenderId ?? this.chatRequestSenderId,
      unreadMessagesCount: unreadMessagesCount ?? this.unreadMessagesCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanDeclinedChat fromJson(Map<String, dynamic> data) {
    return PeamanDeclinedChat(
      id: data['id'],
      lastMessageId: data['last_message_id'],
      userIds: List<String>.from(data['user_ids'] ?? []),
      typingUserIds: List<String>.from(data['typing_user_ids'] ?? []),
      pinnedChatUserIds: List<String>.from(data['pinned_chat_user_ids'] ?? []),
      chatRequestStatus:
          PeamanChatRequestStatus.values[data['chat_request_status'] ?? 0],
      chatRequestSenderId: data['chat_request_sender_id'],
      unreadMessagesCount: (uid) => _getUnreadMessagesCountByUid(uid, data),
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'last_message_id': lastMessageId,
      'user_ids': userIds,
      'typing_user_ids': typingUserIds,
      'pinned_chat_user_ids': pinnedChatUserIds,
      'chat_request_status': chatRequestStatus.index,
      'chat_request_sender_id': chatRequestSenderId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      ...extraData,
    };
  }

  static int _getUnreadMessagesCountByUid(
    final String uid,
    final Map<String, dynamic> data,
  ) {
    final _key = 'z_${uid}_unread_messages';
    final _count = data[_key] ?? 0;
    return _count;
  }
}
