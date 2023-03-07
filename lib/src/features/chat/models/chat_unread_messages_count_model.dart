class PeamanChatUnreadMessage {
  PeamanChatUnreadMessage({
    this.uid,
    this.unreadMessagesCount = 0,
  });

  final String? uid;
  final int unreadMessagesCount;
}
