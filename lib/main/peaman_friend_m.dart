import 'package:firebase_auth/firebase_auth.dart';
import 'package:peaman/services/database_services/friend_provider.dart';

class PFriendProvider {
  static final _auth = FirebaseAuth.instance;

  static Future follow(
    final String friendId,
  ) async {
    final _uid = _auth.currentUser?.uid;
    return await FriendProvider(
      appUserId: _uid!,
      friendId: friendId,
    ).follow();
  }

  static Future acceptFollow(
    final String friendId,
  ) async {
    final _uid = _auth.currentUser?.uid;
    return await FriendProvider(
      appUserId: _uid!,
      friendId: friendId,
    ).acceptFollow();
  }

  static Future followBack(
    final String friendId,
  ) async {
    final _uid = _auth.currentUser?.uid;
    return await FriendProvider(
      appUserId: _uid!,
      friendId: friendId,
    ).followBack();
  }

  static Future cancleFollow(
    final String friendId,
  ) async {
    final _uid = _auth.currentUser?.uid;
    return await FriendProvider(
      appUserId: _uid!,
      friendId: friendId,
    ).cancleFollow();
  }
}
