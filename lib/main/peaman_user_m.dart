import 'package:peaman/peaman.dart';
import 'package:peaman/services/database_services/user_provider.dart';

class PUserProvider {
  static Future<void> setUserOnlineStatus({
    required final String uid,
    required final PeamanOnlineStatus onlineStatus,
  }) async {
    return AppUserProvider(uid: uid).setUserActiveStatus(
      onlineStatus: onlineStatus,
    );
  }

  static Future<void> updateUserData({
    required final String uid,
    required final Map<String, dynamic> data,
  }) async {
    return AppUserProvider(uid: uid).updateUserDetail(data: data);
  }

  static Stream<PeamanUser> getUserById({
    required final String uid,
  }) {
    return AppUserProvider(uid: uid).appUser;
  }

  static Stream<List<PeamanUser>> getUsersBySearchKeyword({
    required final String searchKeyword,
  }) {
    return AppUserProvider(searchKey: searchKeyword).appUserFromKey;
  }

  static Stream<List<PeamanFollowRequest>> getUserFollowRequests({
    required final String uid,
  }) {
    return AppUserProvider(uid: uid).followRequests;
  }

  static Stream<List<PeamanFollower>> getUserFollowers({
    required final String uid,
  }) {
    return AppUserProvider(uid: uid).followers;
  }

  static Stream<List<PeamanFollowing>> getUserFollowing({
    required final String uid,
  }) {
    return AppUserProvider(uid: uid).following;
  }
}
