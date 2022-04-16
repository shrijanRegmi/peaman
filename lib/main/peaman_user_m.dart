import 'package:peaman/helpers/common_helper.dart';
import 'package:peaman/peaman.dart';
import 'package:peaman/services/database_services/user_provider.dart';

class PUserProvider {
  static Future<void> setUserOnlineStatus({
    required final String uid,
    required final PeamanOnlineStatus onlineStatus,
  }) {
    return AppUserProvider().setUserActiveStatus(
      uid: uid,
      onlineStatus: onlineStatus,
    );
  }

  static Future<void> updateUserData({
    required final String uid,
    required final Map<String, dynamic> data,
    final bool partial = false,
  }) {
    return AppUserProvider().updateUserDetail(
      uid: uid,
      data: data,
      partial: partial,
    );
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

  static Future<void> followUser({
    required final String uid,
    required final String friendId,
  }) {
    return AppUserProvider().followUser(
      uid: uid,
      friendId: friendId,
    );
  }

  static Future<void> acceptFollowRequest({
    required final String uid,
    required final String friendId,
  }) {
    return AppUserProvider().acceptFollowRequest(
      uid: uid,
      friendId: friendId,
    );
  }

  static Future<void> followBackUser({
    required final String uid,
    required final String friendId,
  }) {
    return AppUserProvider().followBackUser(
      uid: uid,
      friendId: friendId,
    );
  }

  static Future<void> cancleFollowRequest({
    required final String uid,
    required final String friendId,
  }) {
    return AppUserProvider().cancleFollowRequest(
      uid: uid,
      friendId: friendId,
    );
  }

  static Future<void> unfollowUser({
    required final String uid,
    required final String friendId,
  }) {
    return AppUserProvider().unfollowUser(
      uid: uid,
      friendId: friendId,
    );
  }

  static Future<void> blockUser({
    required final String uid,
    required final String friendId,
  }) {
    return AppUserProvider().blockUser(
      uid: uid,
      friendId: friendId,
    );
  }

  static Future<void> unblockUser({
    required final String uid,
    required final String friendId,
  }) {
    return AppUserProvider().unblockUser(
      uid: uid,
      friendId: friendId,
    );
  }

  static Future<bool> checkIfBlocked({
    required final String uid,
    required final String friendId,
  }) {
    return AppUserProvider().checkIfBlocked(
      uid: uid,
      friendId: friendId,
    );
  }

  static Stream<PeamanUser> getUserById({
    required final String uid,
  }) {
    PeamanCommonHelper.printListening(text: 'userById');
    return AppUserProvider().getUserById(uid: uid);
  }

  static Stream<List<PeamanUser>> getUsersBySearchKeyword({
    required final String searchKeyword,
  }) {
    PeamanCommonHelper.printListening(text: 'userBySearchKeyword');
    return AppUserProvider().getUserBySearchKey(
      searchKey: searchKeyword,
    );
  }

  static Stream<List<PeamanFollowRequest>> getFollowRequests({
    required final String uid,
  }) {
    PeamanCommonHelper.printListening(text: 'followRequests');
    return AppUserProvider().getFollowRequests(uid: uid);
  }

  static Stream<List<PeamanFollower>> getFollowers({
    required final String uid,
  }) {
    PeamanCommonHelper.printListening(text: 'followers');
    return AppUserProvider().getFollowers(uid: uid);
  }

  static Stream<List<PeamanFollowing>> getFollowings({
    required final String uid,
  }) {
    PeamanCommonHelper.printListening(text: 'followings');
    return AppUserProvider().getFollowings(uid: uid);
  }

  static Stream<List<PeamanBlockedUser>> getBlockedUsers({
    required final String uid,
  }) {
    PeamanCommonHelper.printListening(text: 'blockedUsers');
    return AppUserProvider().getBlockedUsers(uid: uid);
  }
}
