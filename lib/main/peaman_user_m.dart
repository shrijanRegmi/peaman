import 'package:peaman/helpers/common_helper.dart';
import 'package:peaman/peaman.dart';
import 'package:peaman/services/database_services/user_provider.dart';

import '../utils/query_type_def.dart';

class PUserProvider {
  static Future<void> setUserOnlineStatus({
    required final String uid,
    required final PeamanOnlineStatus onlineStatus,
  }) {
    return AppUserProvider().setUserOnlineStatus(
      uid: uid,
      onlineStatus: onlineStatus,
    );
  }

  static Future<void> setUserOnboardingCompleted({
    required final String uid,
    required final bool onboardingCompleted,
  }) {
    return AppUserProvider().setUserOnboardingCompleted(
      uid: uid,
      onboardingCompleted: onboardingCompleted,
    );
  }

  static Future<void> updateUserData({
    required final String uid,
    final PeamanUserUpdater? updater,
    final PeamanUserPartialUpdater? positivePartialUpdater,
    final PeamanUserPartialUpdater? negativePartialUpdater,
  }) {
    return AppUserProvider().updateUserDetail(
      uid: uid,
      updater: updater,
      positivePartialUpdater: positivePartialUpdater,
      negativePartialUpdater: negativePartialUpdater,
    );
  }

  static Future<void> updateUserPropertiesCount({
    required final String uid,
    final int onboardingStep = 0,
    final int followers = 0,
    final int following = 0,
    final int notifCount = 0,
    final int reactionsReceivedFromFeeds = 0,
    final int commentsReceivedFromFeeds = 0,
    final int repliesReceivedFromFeeds = 0,
    final int sharesReceivedFromFeeds = 0,
    final int viewsReceivedFromFeeds = 0,
  }) async {
    return AppUserProvider().updateUserPropertiesCount(
      uid: uid,
      onboardingStep: onboardingStep,
      followers: followers,
      following: following,
      notifCount: notifCount,
      reactionsReceivedFromFeeds: reactionsReceivedFromFeeds,
      commentsReceivedFromFeeds: commentsReceivedFromFeeds,
      repliesReceivedFromFeeds: repliesReceivedFromFeeds,
      sharesReceivedFromFeeds: sharesReceivedFromFeeds,
      viewsReceivedFromFeeds: viewsReceivedFromFeeds,
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

  static Future<void> ignoreFollowRequest({
    required final String uid,
    required final String friendId,
  }) {
    return AppUserProvider().ignoreFollowRequest(
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

  static Future<List<PeamanUser>> getUsers({
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'users');
    return AppUserProvider().getUsers(query: query);
  }

  static Stream<List<PeamanUser>> getUsersStream({
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'users');
    return AppUserProvider().getUsersStream(query: query);
  }

  static Future<PeamanUser> getUserById({
    required final String uid,
  }) {
    PeamanCommonHelper.printListening(text: 'userById');
    return AppUserProvider().getUserById(uid: uid);
  }

  static Stream<PeamanUser> getUserByIdStream({
    required final String uid,
  }) {
    PeamanCommonHelper.printListening(text: 'userById');
    return AppUserProvider().getUserByIdStream(uid: uid);
  }

  static Future<List<PeamanUser>> getUsersBySearchKeyword({
    required final String searchKeyword,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userBySearchKeyword');
    return AppUserProvider().getUserBySearchKey(
      searchKey: searchKeyword,
      query: query,
    );
  }

  static Stream<List<PeamanUser>> getUsersBySearchKeywordStream({
    required final String searchKeyword,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userBySearchKeyword');
    return AppUserProvider().getUserBySearchKeyStream(
      searchKey: searchKeyword,
      query: query,
    );
  }

  static Future<List<PeamanReceivedFollowRequest>>
      getUserReceivedFollowRequests({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'receivedFollowRequests');
    return AppUserProvider().getReceivedFollowRequests(
      uid: uid,
      query: query,
    );
  }

  static Stream<List<PeamanReceivedFollowRequest>>
      getUserReceivedFollowRequestsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'receivedFollowRequests');
    return AppUserProvider().getReceivedFollowRequestsStream(
      uid: uid,
      query: query,
    );
  }

  static Future<List<PeamanSentFollowRequest>> getUserSentFollowRequests({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'sentFollowRequests');
    return AppUserProvider().getSentFollowRequests(
      uid: uid,
      query: query,
    );
  }

  static Stream<List<PeamanSentFollowRequest>> getUserSentFollowRequestsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'sentFollowRequests');
    return AppUserProvider().getSentFollowRequestsStream(
      uid: uid,
      query: query,
    );
  }

  static Future<List<PeamanFollower>> getUserFollowers({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'followers');
    return AppUserProvider().getFollowers(
      uid: uid,
      query: query,
    );
  }

  static Stream<List<PeamanFollower>> getUserFollowersStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'followers');
    return AppUserProvider().getFollowersStream(
      uid: uid,
      query: query,
    );
  }

  static Future<List<PeamanFollowing>> getUserFollowings({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'followings');
    return AppUserProvider().getFollowings(
      uid: uid,
      query: query,
    );
  }

  static Stream<List<PeamanFollowing>> getUserFollowingsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'followings');
    return AppUserProvider().getFollowingsStream(
      uid: uid,
      query: query,
    );
  }

  static Future<List<PeamanBlockedUser>> getUserBlockedUsers({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'blockedUsers');
    return AppUserProvider().getBlockedUsers(
      uid: uid,
      query: query,
    );
  }

  static Stream<List<PeamanBlockedUser>> getUserBlockedUsersStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'blockedUsers');
    return AppUserProvider().getBlockedUsersStream(
      uid: uid,
      query: query,
    );
  }

  static Future<List<PeamanBlockedByUser>> getUserBlockedByUsers({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'blockedByUsers');
    return AppUserProvider().getBlockedByUsers(
      uid: uid,
      query: query,
    );
  }

  static Stream<List<PeamanBlockedByUser>> getUserBlockedByUsersStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'blockedByUsers');
    return AppUserProvider().getBlockedByUsersStream(
      uid: uid,
      query: query,
    );
  }
}
