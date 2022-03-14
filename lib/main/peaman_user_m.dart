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

  static Future<void> updateUserPropertiesCount({
    required final String uid,
    final int followers = 0,
    final int following = 0,
    final int notifCount = 0,
    final int likeableFeeds = 0,
    final int likeableComments = 0,
    final int likeableReplies = 0,
    final int reactionsReceived = 0,
    final int commentsReceived = 0,
    final int repliesReceived = 0,
  }) async {
    return AppUserProvider().updateUserPropertiesCount(
      uid: uid,
      followers: followers,
      following: following,
      notifCount: notifCount,
      likeableFeeds: likeableFeeds,
      likeableComments: likeableComments,
      likeableReplies: likeableReplies,
      reactionsReceived: reactionsReceived,
      commentsReceived: commentsReceived,
      repliesReceived: repliesReceived,
    );
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
