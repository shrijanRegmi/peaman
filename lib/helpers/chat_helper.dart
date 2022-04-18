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
}
