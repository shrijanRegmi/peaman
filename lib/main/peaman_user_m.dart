import 'package:peaman/helpers/common_helper.dart';
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
    final bool partial = false,
  }) async {
    return AppUserProvider(uid: uid).updateUserDetail(
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

  static Stream<PeamanUser> getUserById({
    required final String uid,
  }) {
    CommonHelper.printListening(text: 'userById');
    return AppUserProvider(uid: uid).appUser;
  }

  static Stream<List<PeamanUser>> getUsersBySearchKeyword({
    required final String searchKeyword,
  }) {
    CommonHelper.printListening(text: 'userBySearchKeyword');
    return AppUserProvider(searchKey: searchKeyword).appUserFromKey;
  }

  static Stream<List<PeamanFollowRequest>> getFollowRequests({
    required final String uid,
  }) {
    CommonHelper.printListening(text: 'followRequests');
    return AppUserProvider(uid: uid).followRequests;
  }

  static Stream<List<PeamanFollower>> getFollowers({
    required final String uid,
  }) {
    CommonHelper.printListening(text: 'followers');
    return AppUserProvider(uid: uid).followers;
  }

  static Stream<List<PeamanFollowing>> getFollowing({
    required final String uid,
  }) {
    CommonHelper.printListening(text: 'followings');
    return AppUserProvider(uid: uid).following;
  }
}
