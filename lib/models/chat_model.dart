import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/peaman.dart';

class PeamanChat {
  final String? id;
  final DocumentReference? firstUserRef;
  final DocumentReference? secondUserRef;
  final DocumentReference? lastMsgRef;
  final bool firstUserTyping;
  final bool secondUserTyping;
  final bool firstUserPinnedSecondUser;
  final bool secondUserPinnedFirstUser;
  final int firstUserUnreadMessagesCount;
  final int secondUserUnreadMessagesCount;
  final PeamanChatRequestStatus chatRequestStatus;

  PeamanChat({
    this.id,
    this.lastMsgRef,
    this.firstUserRef,
    this.secondUserRef,
    this.firstUserTyping = false,
    this.secondUserTyping = false,
    this.firstUserPinnedSecondUser = false,
    this.secondUserPinnedFirstUser = false,
    this.firstUserUnreadMessagesCount = 0,
    this.secondUserUnreadMessagesCount = 0,
    this.chatRequestStatus = PeamanChatRequestStatus.idle,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_user_ref': firstUserRef,
      'second_user_ref': secondUserRef,
      'first_user_typing': firstUserTyping,
      'second_user_typing': secondUserTyping,
      'last_msg_ref': lastMsgRef,
      'id': id,
      'first_user_pinned_second_user': firstUserPinnedSecondUser,
      'second_user_pinned_first_user': secondUserPinnedFirstUser,
      'chat_request_status': chatRequestStatus.index,
    };
  }

  static PeamanChat fromJson(Map<String, dynamic> data) {
    return PeamanChat(
      firstUserRef: data['first_user_ref'],
      secondUserRef: data['second_user_ref'],
      firstUserTyping: data['first_user_typing'] ?? false,
      secondUserTyping: data['second_user_typing'] ?? false,
      lastMsgRef: data['last_msg_ref'],
      id: data['id'],
      firstUserPinnedSecondUser: data['first_user_pinned_second_user'] ?? false,
      secondUserPinnedFirstUser: data['second_user_pinned_first_user'] ?? false,
      firstUserUnreadMessagesCount:
          data['first_user_unread_messages_count'] ?? 0,
      secondUserUnreadMessagesCount:
          data['second_user_unread_messages_count'] ?? 0,
      chatRequestStatus:
          PeamanChatRequestStatus.values[data['chat_request_status'] ?? 0],
    );
  }
}

class PeamanIdleChat extends PeamanChat {
  final String? id;
  final DocumentReference? firstUserRef;
  final DocumentReference? secondUserRef;
  final DocumentReference? lastMsgRef;
  final bool firstUserTyping;
  final bool secondUserTyping;
  final bool firstUserPinnedSecondUser;
  final bool secondUserPinnedFirstUser;
  final int firstUserUnreadMessagesCount;
  final int secondUserUnreadMessagesCount;
  final PeamanChatRequestStatus chatRequestStatus;

  PeamanIdleChat({
    this.id,
    this.lastMsgRef,
    this.firstUserRef,
    this.secondUserRef,
    this.firstUserTyping = false,
    this.secondUserTyping = false,
    this.firstUserPinnedSecondUser = false,
    this.secondUserPinnedFirstUser = false,
    this.firstUserUnreadMessagesCount = 0,
    this.secondUserUnreadMessagesCount = 0,
    this.chatRequestStatus = PeamanChatRequestStatus.idle,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_user_ref': firstUserRef,
      'second_user_ref': secondUserRef,
      'first_user_typing': firstUserTyping,
      'second_user_typing': secondUserTyping,
      'last_msg_ref': lastMsgRef,
      'id': id,
      'first_user_pinned_second_user': firstUserPinnedSecondUser,
      'second_user_pinned_first_user': secondUserPinnedFirstUser,
      'chat_request_status': chatRequestStatus.index,
    };
  }

  static PeamanIdleChat fromJson(Map<String, dynamic> data) {
    return PeamanIdleChat(
      firstUserRef: data['first_user_ref'],
      secondUserRef: data['second_user_ref'],
      firstUserTyping: data['first_user_typing'] ?? false,
      secondUserTyping: data['second_user_typing'] ?? false,
      lastMsgRef: data['last_msg_ref'],
      id: data['id'],
      firstUserPinnedSecondUser: data['first_user_pinned_second_user'] ?? false,
      secondUserPinnedFirstUser: data['second_user_pinned_first_user'] ?? false,
      firstUserUnreadMessagesCount:
          data['first_user_unread_messages_count'] ?? 0,
      secondUserUnreadMessagesCount:
          data['second_user_unread_messages_count'] ?? 0,
      chatRequestStatus:
          PeamanChatRequestStatus.values[data['chat_request_status'] ?? 0],
    );
  }
}

class PeamanAcceptedChat extends PeamanChat {
  final String? id;
  final DocumentReference? firstUserRef;
  final DocumentReference? secondUserRef;
  final DocumentReference? lastMsgRef;
  final bool firstUserTyping;
  final bool secondUserTyping;
  final bool firstUserPinnedSecondUser;
  final bool secondUserPinnedFirstUser;
  final int firstUserUnreadMessagesCount;
  final int secondUserUnreadMessagesCount;
  final PeamanChatRequestStatus chatRequestStatus;

  PeamanAcceptedChat({
    this.id,
    this.lastMsgRef,
    this.firstUserRef,
    this.secondUserRef,
    this.firstUserTyping = false,
    this.secondUserTyping = false,
    this.firstUserPinnedSecondUser = false,
    this.secondUserPinnedFirstUser = false,
    this.firstUserUnreadMessagesCount = 0,
    this.secondUserUnreadMessagesCount = 0,
    this.chatRequestStatus = PeamanChatRequestStatus.idle,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_user_ref': firstUserRef,
      'second_user_ref': secondUserRef,
      'first_user_typing': firstUserTyping,
      'second_user_typing': secondUserTyping,
      'last_msg_ref': lastMsgRef,
      'id': id,
      'first_user_pinned_second_user': firstUserPinnedSecondUser,
      'second_user_pinned_first_user': secondUserPinnedFirstUser,
      'chat_request_status': chatRequestStatus.index,
    };
  }

  static PeamanAcceptedChat fromJson(Map<String, dynamic> data) {
    return PeamanAcceptedChat(
      firstUserRef: data['first_user_ref'],
      secondUserRef: data['second_user_ref'],
      firstUserTyping: data['first_user_typing'] ?? false,
      secondUserTyping: data['second_user_typing'] ?? false,
      lastMsgRef: data['last_msg_ref'],
      id: data['id'],
      firstUserPinnedSecondUser: data['first_user_pinned_second_user'] ?? false,
      secondUserPinnedFirstUser: data['second_user_pinned_first_user'] ?? false,
      firstUserUnreadMessagesCount:
          data['first_user_unread_messages_count'] ?? 0,
      secondUserUnreadMessagesCount:
          data['second_user_unread_messages_count'] ?? 0,
      chatRequestStatus:
          PeamanChatRequestStatus.values[data['chat_request_status'] ?? 0],
    );
  }
}

class PeamanDeclinedChat extends PeamanChat {
  final String? id;
  final DocumentReference? firstUserRef;
  final DocumentReference? secondUserRef;
  final DocumentReference? lastMsgRef;
  final bool firstUserTyping;
  final bool secondUserTyping;
  final bool firstUserPinnedSecondUser;
  final bool secondUserPinnedFirstUser;
  final int firstUserUnreadMessagesCount;
  final int secondUserUnreadMessagesCount;
  final PeamanChatRequestStatus chatRequestStatus;

  PeamanDeclinedChat({
    this.id,
    this.lastMsgRef,
    this.firstUserRef,
    this.secondUserRef,
    this.firstUserTyping = false,
    this.secondUserTyping = false,
    this.firstUserPinnedSecondUser = false,
    this.secondUserPinnedFirstUser = false,
    this.firstUserUnreadMessagesCount = 0,
    this.secondUserUnreadMessagesCount = 0,
    this.chatRequestStatus = PeamanChatRequestStatus.idle,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_user_ref': firstUserRef,
      'second_user_ref': secondUserRef,
      'first_user_typing': firstUserTyping,
      'second_user_typing': secondUserTyping,
      'last_msg_ref': lastMsgRef,
      'id': id,
      'first_user_pinned_second_user': firstUserPinnedSecondUser,
      'second_user_pinned_first_user': secondUserPinnedFirstUser,
      'chat_request_status': chatRequestStatus.index,
    };
  }

  static PeamanDeclinedChat fromJson(Map<String, dynamic> data) {
    return PeamanDeclinedChat(
      firstUserRef: data['first_user_ref'],
      secondUserRef: data['second_user_ref'],
      firstUserTyping: data['first_user_typing'] ?? false,
      secondUserTyping: data['second_user_typing'] ?? false,
      lastMsgRef: data['last_msg_ref'],
      id: data['id'],
      firstUserPinnedSecondUser: data['first_user_pinned_second_user'] ?? false,
      secondUserPinnedFirstUser: data['second_user_pinned_first_user'] ?? false,
      firstUserUnreadMessagesCount:
          data['first_user_unread_messages_count'] ?? 0,
      secondUserUnreadMessagesCount:
          data['second_user_unread_messages_count'] ?? 0,
      chatRequestStatus:
          PeamanChatRequestStatus.values[data['chat_request_status'] ?? 0],
    );
  }
}
