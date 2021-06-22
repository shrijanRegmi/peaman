import 'package:peaman/services/database_services/friend_provider.dart';

class PFriendProvider {
  static Future follow(
    final String appUserId,
    final String friendId,
  ) async {
    return await FriendProvider(appUserId: appUserId, friendId: friendId)
        .follow();
  }

  static Future acceptFollow(
    final String appUserId,
    final String friendId,
  ) async {
    return await FriendProvider(appUserId: appUserId, friendId: friendId)
        .acceptFollow();
  }

  static Future followBack(
    final String appUserId,
    final String friendId,
  ) async {
    return await FriendProvider(appUserId: appUserId, friendId: friendId)
        .followBack();
  }

  static Future cancleFollow(
    final String appUserId,
    final String friendId,
  ) async {
    return await FriendProvider(appUserId: appUserId, friendId: friendId)
        .cancleFollow();
  }
}
