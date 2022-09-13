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
  final String? firstUserId;
  final String? secondUserId;
  final String? lastMessageId;
  final bool firstUserTyping;
  final bool secondUserTyping;
  final bool firstUserPinnedSecondUser;
  final bool secondUserPinnedFirstUser;
  final int firstUserUnreadMessagesCount;
  final int secondUserUnreadMessagesCount;
  final PeamanChatRequestStatus chatRequestStatus;
  final String? chatRequestSenderId;
  final int? createdAt;
  final int? updatedAt;
  final Map<String, dynamic> extraData;

  PeamanIdleChat({
    this.id,
    this.firstUserId,
    this.secondUserId,
    this.lastMessageId,
    this.firstUserTyping = false,
    this.secondUserTyping = false,
    this.firstUserPinnedSecondUser = false,
    this.secondUserPinnedFirstUser = false,
    this.firstUserUnreadMessagesCount = 0,
    this.secondUserUnreadMessagesCount = 0,
    this.chatRequestStatus = PeamanChatRequestStatus.idle,
    this.chatRequestSenderId,
    this.createdAt,
    this.updatedAt,
    this.extraData = const {},
  });

  PeamanIdleChat copyWith({
    final String? id,
    final String? firstUserId,
    final String? secondUserId,
    final String? lastMessageId,
    final bool? firstUserTyping,
    final bool? secondUserTyping,
    final bool? firstUserPinnedSecondUser,
    final bool? secondUserPinnedFirstUser,
    final int? firstUserUnreadMessagesCount,
    final int? secondUserUnreadMessagesCount,
    final PeamanChatRequestStatus? chatRequestStatus,
    final String? chatRequestSenderId,
    final int? createdAt,
    final int? updatedAt,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanIdleChat(
      id: id ?? this.id,
      firstUserId: firstUserId ?? this.firstUserId,
      secondUserId: secondUserId ?? this.secondUserId,
      lastMessageId: lastMessageId ?? this.lastMessageId,
      firstUserTyping: firstUserTyping ?? this.firstUserTyping,
      secondUserTyping: secondUserTyping ?? this.secondUserTyping,
      firstUserPinnedSecondUser:
          firstUserPinnedSecondUser ?? this.firstUserPinnedSecondUser,
      secondUserPinnedFirstUser:
          secondUserPinnedFirstUser ?? this.secondUserPinnedFirstUser,
      firstUserUnreadMessagesCount:
          firstUserUnreadMessagesCount ?? this.firstUserUnreadMessagesCount,
      secondUserUnreadMessagesCount:
          secondUserUnreadMessagesCount ?? this.secondUserUnreadMessagesCount,
      chatRequestStatus: chatRequestStatus ?? this.chatRequestStatus,
      chatRequestSenderId: chatRequestSenderId ?? this.chatRequestSenderId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanIdleChat fromJson(Map<String, dynamic> data) {
    return PeamanIdleChat(
      id: data['id'],
      firstUserId: data['first_user_id'],
      secondUserId: data['second_user_id'],
      lastMessageId: data['last_message_id'],
      firstUserTyping: data['first_user_typing'] ?? false,
      secondUserTyping: data['second_user_typing'] ?? false,
      firstUserPinnedSecondUser: data['first_user_pinned_second_user'] ?? false,
      secondUserPinnedFirstUser: data['second_user_pinned_first_user'] ?? false,
      firstUserUnreadMessagesCount:
          data['first_user_unread_messages_count'] ?? 0,
      secondUserUnreadMessagesCount:
          data['second_user_unread_messages_count'] ?? 0,
      chatRequestStatus:
          PeamanChatRequestStatus.values[data['chat_request_status'] ?? 0],
      chatRequestSenderId: data['chat_request_sender_id'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_user_id': firstUserId,
      'second_user_id': secondUserId,
      'last_message_id': lastMessageId,
      'first_user_typing': firstUserTyping,
      'second_user_typing': secondUserTyping,
      'first_user_pinned_second_user': firstUserPinnedSecondUser,
      'second_user_pinned_first_user': secondUserPinnedFirstUser,
      'chat_request_status': chatRequestStatus.index,
      'chat_request_sender_id': chatRequestSenderId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      ...extraData,
    };
  }
}

class PeamanAcceptedChat {
  final String? id;
  final String? firstUserId;
  final String? secondUserId;
  final String? lastMessageId;
  final bool firstUserTyping;
  final bool secondUserTyping;
  final bool firstUserPinnedSecondUser;
  final bool secondUserPinnedFirstUser;
  final int firstUserUnreadMessagesCount;
  final int secondUserUnreadMessagesCount;
  final PeamanChatRequestStatus chatRequestStatus;
  final String? chatRequestSenderId;
  final int? createdAt;
  final int? updatedAt;
  final Map<String, dynamic> extraData;

  PeamanAcceptedChat({
    this.id,
    this.firstUserId,
    this.secondUserId,
    this.lastMessageId,
    this.firstUserTyping = false,
    this.secondUserTyping = false,
    this.firstUserPinnedSecondUser = false,
    this.secondUserPinnedFirstUser = false,
    this.firstUserUnreadMessagesCount = 0,
    this.secondUserUnreadMessagesCount = 0,
    this.chatRequestStatus = PeamanChatRequestStatus.idle,
    this.chatRequestSenderId,
    this.createdAt,
    this.updatedAt,
    this.extraData = const {},
  });

  PeamanAcceptedChat copyWith({
    final String? id,
    final String? firstUserId,
    final String? secondUserId,
    final String? lastMessageId,
    final bool? firstUserTyping,
    final bool? secondUserTyping,
    final bool? firstUserPinnedSecondUser,
    final bool? secondUserPinnedFirstUser,
    final int? firstUserUnreadMessagesCount,
    final int? secondUserUnreadMessagesCount,
    final PeamanChatRequestStatus? chatRequestStatus,
    final String? chatRequestSenderId,
    final int? createdAt,
    final int? updatedAt,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanAcceptedChat(
      id: id ?? this.id,
      firstUserId: firstUserId ?? this.firstUserId,
      secondUserId: secondUserId ?? this.secondUserId,
      lastMessageId: lastMessageId ?? this.lastMessageId,
      firstUserTyping: firstUserTyping ?? this.firstUserTyping,
      secondUserTyping: secondUserTyping ?? this.secondUserTyping,
      firstUserPinnedSecondUser:
          firstUserPinnedSecondUser ?? this.firstUserPinnedSecondUser,
      secondUserPinnedFirstUser:
          secondUserPinnedFirstUser ?? this.secondUserPinnedFirstUser,
      firstUserUnreadMessagesCount:
          firstUserUnreadMessagesCount ?? this.firstUserUnreadMessagesCount,
      secondUserUnreadMessagesCount:
          secondUserUnreadMessagesCount ?? this.secondUserUnreadMessagesCount,
      chatRequestStatus: chatRequestStatus ?? this.chatRequestStatus,
      chatRequestSenderId: chatRequestSenderId ?? this.chatRequestSenderId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanAcceptedChat fromJson(Map<String, dynamic> data) {
    return PeamanAcceptedChat(
      id: data['id'],
      firstUserId: data['first_user_id'],
      secondUserId: data['second_user_id'],
      lastMessageId: data['last_message_id'],
      firstUserTyping: data['first_user_typing'] ?? false,
      secondUserTyping: data['second_user_typing'] ?? false,
      firstUserPinnedSecondUser: data['first_user_pinned_second_user'] ?? false,
      secondUserPinnedFirstUser: data['second_user_pinned_first_user'] ?? false,
      firstUserUnreadMessagesCount:
          data['first_user_unread_messages_count'] ?? 0,
      secondUserUnreadMessagesCount:
          data['second_user_unread_messages_count'] ?? 0,
      chatRequestStatus:
          PeamanChatRequestStatus.values[data['chat_request_status'] ?? 0],
      chatRequestSenderId: data['chat_request_sender_id'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_user_id': firstUserId,
      'second_user_id': secondUserId,
      'last_message_id': lastMessageId,
      'first_user_typing': firstUserTyping,
      'second_user_typing': secondUserTyping,
      'first_user_pinned_second_user': firstUserPinnedSecondUser,
      'second_user_pinned_first_user': secondUserPinnedFirstUser,
      'chat_request_status': chatRequestStatus.index,
      'chat_request_sender_id': chatRequestSenderId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      ...extraData,
    };
  }
}

class PeamanDeclinedChat {
  final String? id;
  final String? firstUserId;
  final String? secondUserId;
  final String? lastMessageId;
  final bool firstUserTyping;
  final bool secondUserTyping;
  final bool firstUserPinnedSecondUser;
  final bool secondUserPinnedFirstUser;
  final int firstUserUnreadMessagesCount;
  final int secondUserUnreadMessagesCount;
  final PeamanChatRequestStatus chatRequestStatus;
  final String? chatRequestSenderId;
  final int? createdAt;
  final int? updatedAt;
  final Map<String, dynamic> extraData;

  PeamanDeclinedChat({
    this.id,
    this.firstUserId,
    this.secondUserId,
    this.lastMessageId,
    this.firstUserTyping = false,
    this.secondUserTyping = false,
    this.firstUserPinnedSecondUser = false,
    this.secondUserPinnedFirstUser = false,
    this.firstUserUnreadMessagesCount = 0,
    this.secondUserUnreadMessagesCount = 0,
    this.chatRequestStatus = PeamanChatRequestStatus.idle,
    this.chatRequestSenderId,
    this.createdAt,
    this.updatedAt,
    this.extraData = const {},
  });

  PeamanDeclinedChat copyWith({
    final String? id,
    final String? firstUserId,
    final String? secondUserId,
    final String? lastMessageId,
    final bool? firstUserTyping,
    final bool? secondUserTyping,
    final bool? firstUserPinnedSecondUser,
    final bool? secondUserPinnedFirstUser,
    final int? firstUserUnreadMessagesCount,
    final int? secondUserUnreadMessagesCount,
    final PeamanChatRequestStatus? chatRequestStatus,
    final String? chatRequestSenderId,
    final int? createdAt,
    final int? updatedAt,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanDeclinedChat(
      id: id ?? this.id,
      firstUserId: firstUserId ?? this.firstUserId,
      secondUserId: secondUserId ?? this.secondUserId,
      lastMessageId: lastMessageId ?? this.lastMessageId,
      firstUserTyping: firstUserTyping ?? this.firstUserTyping,
      secondUserTyping: secondUserTyping ?? this.secondUserTyping,
      firstUserPinnedSecondUser:
          firstUserPinnedSecondUser ?? this.firstUserPinnedSecondUser,
      secondUserPinnedFirstUser:
          secondUserPinnedFirstUser ?? this.secondUserPinnedFirstUser,
      firstUserUnreadMessagesCount:
          firstUserUnreadMessagesCount ?? this.firstUserUnreadMessagesCount,
      secondUserUnreadMessagesCount:
          secondUserUnreadMessagesCount ?? this.secondUserUnreadMessagesCount,
      chatRequestStatus: chatRequestStatus ?? this.chatRequestStatus,
      chatRequestSenderId: chatRequestSenderId ?? this.chatRequestSenderId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanDeclinedChat fromJson(Map<String, dynamic> data) {
    return PeamanDeclinedChat(
      id: data['id'],
      firstUserId: data['first_user_id'],
      secondUserId: data['second_user_id'],
      lastMessageId: data['last_message_id'],
      firstUserTyping: data['first_user_typing'] ?? false,
      secondUserTyping: data['second_user_typing'] ?? false,
      firstUserPinnedSecondUser: data['first_user_pinned_second_user'] ?? false,
      secondUserPinnedFirstUser: data['second_user_pinned_first_user'] ?? false,
      firstUserUnreadMessagesCount:
          data['first_user_unread_messages_count'] ?? 0,
      secondUserUnreadMessagesCount:
          data['second_user_unread_messages_count'] ?? 0,
      chatRequestStatus:
          PeamanChatRequestStatus.values[data['chat_request_status'] ?? 0],
      chatRequestSenderId: data['chat_request_sender_id'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_user_id': firstUserId,
      'second_user_id': secondUserId,
      'last_message_id': lastMessageId,
      'first_user_typing': firstUserTyping,
      'second_user_typing': secondUserTyping,
      'first_user_pinned_second_user': firstUserPinnedSecondUser,
      'second_user_pinned_first_user': secondUserPinnedFirstUser,
      'chat_request_status': chatRequestStatus.index,
      'chat_request_sender_id': chatRequestSenderId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      ...extraData,
    };
  }
}
