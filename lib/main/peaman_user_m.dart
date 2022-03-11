import 'package:firebase_auth/firebase_auth.dart';
import 'package:peaman/peaman.dart';
import 'package:peaman/services/database_services/user_provider.dart';

class PUserProvider {
  static final _auth = FirebaseAuth.instance;

  static Future<void> setUserOnlineStatus({
    required final PeamanOnlineStatus onlineStatus,
  }) async {
    final _uid = _auth.currentUser?.uid;
    return AppUserProvider(uid: _uid).setUserActiveStatus(
      onlineStatus: onlineStatus,
    );
  }

  static Future<void> updateUserData({
    required final Map<String, dynamic> data,
  }) async {
    final _uid = _auth.currentUser?.uid;
    return AppUserProvider(uid: _uid).updateUserDetail(data: data);
  }

  static Stream<PeamanUser> getUserById(final String uid) {
    return AppUserProvider(uid: uid).appUser;
  }

  static Stream<List<PeamanUser>> getUsersBySearchKeyword(
    final String searchKeyword,
  ) {
    return AppUserProvider(searchKey: searchKeyword).appUserFromKey;
  }

  static Stream<List<PeamanFollowRequest>> getUserFollowRequests() {
    final _uid = _auth.currentUser?.uid;
    return AppUserProvider(uid: _uid).followRequests;
  }

  static Stream<List<PeamanFollower>> getUserFollowers() {
    final _uid = _auth.currentUser?.uid;
    return AppUserProvider(uid: _uid).followers;
  }

  static Stream<List<PeamanFollowing>> getUserFollowing() {
    final _uid = _auth.currentUser?.uid;
    return AppUserProvider(uid: _uid).following;
  }
}
