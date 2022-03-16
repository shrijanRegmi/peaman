import 'package:peaman/services/database_services/friend_provider.dart';

class PFriendProvider {
  static Future<void> follow({
    required final String uid,
    required final String friendId,
  }) async {
    return await FriendProvider().follow(
      uid: uid,
      friendId: friendId,
    );
  }

  static Future<void> acceptFollow({
    required final String uid,
    required final String friendId,
  }) async {
    return await FriendProvider().acceptFollow(
      uid: uid,
      friendId: friendId,
    );
  }

  static Future<void> followBack({
    required final String uid,
    required final String friendId,
  }) async {
    return await FriendProvider().followBack(
      uid: uid,
      friendId: friendId,
    );
  }

  static Future<void> cancleFollow({
    required final String uid,
    required final String friendId,
  }) async {
    return await FriendProvider().cancleFollow(
      uid: uid,
      friendId: friendId,
    );
  }

  static Future<void> unfollowFriend({
    required final String uid,
    required final String friendId,
  }) async {
    return await FriendProvider().unfollowFriend(
      uid: uid,
      friendId: friendId,
    );
  }
}
