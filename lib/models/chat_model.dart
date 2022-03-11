import 'package:cloud_firestore/cloud_firestore.dart';

class PeamanChat {
  final DocumentReference? firstUserRef;
  final DocumentReference? secondUserRef;
  final DocumentReference? lastMsgRef;
  final bool? firstUserTyping;
  final bool? secondUserTyping;
  final String? id;
  final bool? firstUserPinnedSecondUser;
  final bool? secondUserPinnedFirstUser;
  final int? firstUserUnreadMessagesCount;
  final int? secondUserUnreadMessagesCount;

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
    );
  }
}
