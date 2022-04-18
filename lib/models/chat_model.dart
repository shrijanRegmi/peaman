import 'package:peaman/peaman.dart';

class PeamanChat {
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
  final List<String> userIds;
  final Map<String, dynamic> extraData;

  PeamanChat({
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
    this.userIds = const [],
    this.createdAt,
    this.updatedAt,
    this.extraData = const {},
  });

  PeamanChat copyWith({
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
    final List<String>? userIds,
    final int? createdAt,
    final int? updatedAt,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanChat(
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
      userIds: userIds ?? this.userIds,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanChat fromJson(Map<String, dynamic> data) {
    return PeamanChat(
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
      userIds: List<String>.from(data['user_ids'] ?? []),
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
      'user_ids': userIds,
      'created_at': createdAt,
      'updated_at': updatedAt,
      ...extraData,
    };
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
