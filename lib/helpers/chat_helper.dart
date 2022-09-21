import '../peaman.dart';

class PeamanChatHelper {
  // get chat id from user's and friend's id;
  static String getChatId({
    required final String myId,
    required final String friendId,
  }) {
    final _result = myId.compareTo(friendId);
    if (_result > 0) {
      return '${myId}_$friendId';
    } else {
      return '${friendId}_$myId';
    }
  }

  // get first user, second user
  static bool isAppUserFirstUser({
    required final String myId,
    required final String friendId,
  }) {
    final _result = myId.compareTo(friendId);
    return _result > 0;
  }

  // get sent messages count by user id
  static List<PeamanSentMessage> getSentMessagesCountByUid(
    final Map<String, dynamic> data,
  ) {
    final list = <PeamanSentMessage>[];
    data.forEach((key, value) {
      if (key.startsWith('z') && key.endsWith('sent_messages')) {
        final uid = key.split('_')[1];
        final count = data[key] ?? 0;

        final unreadMessage = PeamanSentMessage(
          uid: uid,
          sentMessagesCount: count,
        );

        list.add(unreadMessage);
      }
    });
    return list;
  }

  // get unread messages count by user id
  static List<PeamanUnreadMessage> getUnreadMessagesCountByUid(
    final Map<String, dynamic> data,
  ) {
    final list = <PeamanUnreadMessage>[];
    data.forEach((key, value) {
      if (key.startsWith('z') && key.endsWith('unread_messages')) {
        final uid = key.split('_')[1];
        final count = data[key] ?? 0;

        final unreadMessage = PeamanUnreadMessage(
          uid: uid,
          unreadMessagesCount: count,
        );

        list.add(unreadMessage);
      }
    });
    return list;
  }
}
