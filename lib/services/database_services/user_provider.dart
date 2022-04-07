import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/helpers/common_helper.dart';
import 'package:peaman/peaman.dart';

class AppUserProvider {
  final _ref = FirebaseFirestore.instance;

  // send user to firestore
  Future<void> sendUserToFirestore({
    required final PeamanUser user,
  }) async {
    try {
      final _appUserRef = _ref.collection('users').doc(user.uid);
      await _appUserRef.set(user.toJson());

      print('Success: Sending user ${user.uid} to firestore');
    } catch (e) {
      print(e);
      print("Error!!!: Sending user to firestore");
    }
  }

  // set user active status
  Future<void> setUserActiveStatus({
    required final String uid,
    required PeamanOnlineStatus? onlineStatus,
  }) async {
    try {
      final _userRef = _ref.collection('users').doc(uid);
      final _status = {
        'active_status': onlineStatus?.index,
      };
      await _userRef.update(_status);
      print(
        'Success: Setting activity status of user $uid to ${onlineStatus?.index}',
      );
    } catch (e) {
      print(
        'Error!!!: Setting activity status of user $uid to ${onlineStatus?.index}',
      );
      print(e);
    }
  }

  // update user details
  Future<void> updateUserDetail({
    required final String uid,
    required final Map<String, dynamic> data,
    final bool partial = false,
  }) async {
    try {
      final _data = CommonHelper.prepareDataToUpdate(
        data: data,
        partial: partial,
      );

      final _userRef = _ref.collection('users').doc(uid);
      await _userRef.update(_data);

      print('Success: Updating personal info of user $uid');
    } catch (e) {
      print(e);
      print('Error!!!: Updating personal info of user $uid');
    }
  }

  // update user properties count
  Future<void> updateUserPropertiesCount({
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
    try {
      final _usersRef = _ref.collection('users').doc(uid);
      final _data = <String, dynamic>{
        'followers': FieldValue.increment(followers),
        'following': FieldValue.increment(following),
        'notif_count': FieldValue.increment(notifCount),
        'likeable_feeds': FieldValue.increment(likeableFeeds),
        'likeable_comments': FieldValue.increment(likeableComments),
        'likeable_replies': FieldValue.increment(likeableReplies),
        'reactions_received': FieldValue.increment(reactionsReceived),
        'comments_received': FieldValue.increment(commentsReceived),
        'replies_received': FieldValue.increment(repliesReceived),
      };

      _data.removeWhere((key, value) => value == 0);

      await _usersRef.update(_data);
      print('Success: Updating user properties count $uid');
    } catch (e) {
      print(e);
      print('Error: Updating user properties count');
    }
  }

  // follow user
  Future<void> followUser({
    required final String uid,
    required final String friendId,
  }) async {
    try {
      final _friendRef = _ref.collection('users').doc(friendId);
      final _requestRef = _friendRef.collection('follow_requests').doc(uid);

      final _data = {
        'uid': uid,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      };

      await _requestRef.set(_data);
      print('Success: Following friend $friendId');
    } catch (e) {
      print(e);
      print('Error!!!: Following friend');
    }
  }

  // accept follow request
  Future<void> acceptFollowRequest({
    required final String uid,
    required final String friendId,
  }) async {
    try {
      final _userRef = _ref.collection('users').doc(uid);
      final _followRequestRef =
          _userRef.collection('follow_requests').doc(friendId);

      final _futures = <Future>[];

      final _followRequestFuture = _followRequestRef.update({
        'is_accepted': true,
      });
      _futures.add(_followRequestFuture);

      final _addFollowFuture = _addFollower(
        uid: uid,
        friendId: friendId,
      );
      _futures.add(_addFollowFuture);

      await Future.wait(_futures);
      print('Success: Accepting follow request $friendId');
    } catch (e) {
      print(e);
      print('Error!!!: Accepting follow request');
      return null;
    }
  }

  // follow back
  Future<void> followBackUser({
    required final String uid,
    required final String friendId,
  }) async {
    try {
      final _friendRef = _ref.collection('users').doc(friendId);
      final _userRef = _ref.collection('users').doc(uid);
      final _followReqRef =
          _userRef.collection('follow_requests').doc(friendId);

      final _friendFollowersRef = _friendRef.collection('followers').doc(uid);
      final _userFollowingRef = _userRef.collection('following').doc(friendId);

      final _milli = DateTime.now().millisecondsSinceEpoch;

      final _futures = <Future>[];

      final _friendFollowersFuture = _friendFollowersRef.set({
        'uid': uid,
        'updated_at': _milli,
      });
      _futures.add(_friendFollowersFuture);

      final _userFollowingFuture = _userFollowingRef.set({
        'uid': uid,
        'updated_at': _milli,
      });
      _futures.add(_userFollowingFuture);

      final _friendUpdateFuture = _friendRef.update({
        'followers': FieldValue.increment(1),
      });
      _futures.add(_friendUpdateFuture);

      final _userUpdateFuture = _userRef.update({
        'following': FieldValue.increment(1),
      });
      _futures.add(_userUpdateFuture);

      final _followRequestDeleteFuture = _followReqRef.delete();
      _futures.add(_followRequestDeleteFuture);

      await Future.wait(_futures);
      print('Success: Following back $friendId');
    } catch (e) {
      print(e);
      print('Error!!!: Following back');
    }
  }

  // cancle follow
  Future<void> cancleFollowRequest({
    required final String uid,
    required final String friendId,
  }) async {
    try {
      final _userRef = _ref.collection('users').doc(uid);
      final _followReqRef =
          _userRef.collection('follow_requests').doc(friendId);

      await _followReqRef.delete();
      print('Success: Canceling follow $friendId');
    } catch (e) {
      print(e);
      print('Error!!!: Canceling follow');
    }
  }

  // unfollow user
  Future<void> unfollowUser({
    required final String uid,
    required final String friendId,
  }) async {
    try {
      final _userRef = _ref.collection('users').doc(uid);
      final _friendRef = _ref.collection('users').doc(friendId);

      final _userFollowingRef = _userRef.collection('following').doc(friendId);
      final _friendFollowersRef = _friendRef.collection('followers').doc(uid);

      final _futures = <Future>[];

      final _userFollowingFuture = _userFollowingRef.delete();
      _futures.add(_userFollowingFuture);

      final _friendFollowersFuture = _friendFollowersRef.delete();
      _futures.add(_friendFollowersFuture);

      final _userUpdateFuture = _userRef.update({
        'following': FieldValue.increment(-1),
      });
      _futures.add(_userUpdateFuture);

      final _friendUpdateFuture = _friendRef.update({
        'followers': FieldValue.increment(-1),
      });
      _futures.add(_friendUpdateFuture);

      await Future.wait(_futures);
      print('Success: Unfollowing friend $friendId');
    } catch (e) {
      print(e);
      print('Error!!!: Unfollowing friend');
    }
  }

  // block user
  Future<void> blockUser({
    required final String uid,
    required final String friendId,
  }) async {
    try {
      final _blockedUsersRef = _ref
          .collection('users')
          .doc(uid)
          .collection('blocked_users')
          .doc(friendId);

      await _blockedUsersRef.set({
        'uid': friendId,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      });

      print('Success: Blocking user');
    } catch (e) {
      print(e);
      print('Error!!!: Blocking user');
    }
  }

  // un block user
  Future<void> unblockUser({
    required final String uid,
    required final String friendId,
  }) async {
    try {
      final _blockedUsersRef = _ref
          .collection('users')
          .doc(uid)
          .collection('blocked_users')
          .doc(friendId);

      await _blockedUsersRef.delete();

      print('Success: Blocking user');
    } catch (e) {
      print(e);
      print('Error!!!: Blocking user');
    }
  }

  // add follower
  Future<void> _addFollower({
    required final String uid,
    required final String friendId,
  }) async {
    try {
      final _userRef = _ref.collection('users').doc(uid);
      final _friendRef = _ref.collection('users').doc(friendId);

      final _userFollowersRef = _userRef.collection('followers').doc(friendId);
      final _friendFollowingRef = _friendRef.collection('following').doc(uid);

      final _milli = DateTime.now().millisecondsSinceEpoch;

      final _futures = <Future>[];

      final _userFollowersFuture = _userFollowersRef.set({
        'uid': friendId,
        'updated_at': _milli,
      });
      _futures.add(_userFollowersFuture);

      final _friendFollowingFuture = _friendFollowingRef.set({
        'uid': uid,
        'updated_at': _milli,
      });
      _futures.add(_friendFollowingFuture);

      final _userUpdateFuture = _userRef.update({
        'followers': FieldValue.increment(1),
      });
      _futures.add(_userUpdateFuture);

      final _friendUpdateFuture = _friendRef.update({
        'following': FieldValue.increment(1),
      });
      _futures.add(_friendUpdateFuture);

      await Future.wait(_futures);
      print('Success: Adding follower $friendId');
    } catch (e) {
      print(e);
      print('Error!!!: Adding follower');
    }
  }

  // appuser from firebase;
  PeamanUser _appUserFromFirebase(
    DocumentSnapshot<Map<String, dynamic>> snap,
  ) {
    return PeamanUser.fromJson(snap.data()!);
  }

  // list of users;
  List<PeamanUser> _usersFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((doc) {
      return PeamanUser.fromJson(doc.data());
    }).toList();
  }

  // list of follow requests
  List<PeamanFollowRequest> _followRequestsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs
        .map((e) => PeamanFollowRequest.fromJson(e.data()))
        .toList();
  }

  // list of followers
  List<PeamanFollower> _followersFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanFollower.fromJson(e.data())).toList();
  }

  // list of following
  List<PeamanFollowing> _followingFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanFollowing.fromJson(e.data())).toList();
  }

  // list of blocked users
  List<PeamanBlockedUser> _blockedUsersFromFirestore(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanBlockedUser.fromJson(e.data())).toList();
  }

  // stream of users from search key
  Stream<List<PeamanUser>> getUserBySearchKey({
    required final String searchKey,
  }) {
    return _ref
        .collection('users')
        .where('search_keys', arrayContains: searchKey)
        .snapshots()
        .map(_usersFromFirebase);
  }

  // stream of list of users;
  Stream<List<PeamanUser>> get allUsers {
    return _ref.collection('users').snapshots().map(_usersFromFirebase);
  }

  // get appuser by id
  Stream<PeamanUser> getUserById({
    required final String uid,
  }) {
    return _ref
        .collection('users')
        .doc(uid)
        .snapshots()
        .map(_appUserFromFirebase);
  }

  // stream of list of follow requests
  Stream<List<PeamanFollowRequest>> getFollowRequests({
    required final String uid,
  }) {
    return _ref
        .collection('users')
        .doc(uid)
        .collection('follow_requests')
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(_followRequestsFromFirebase);
  }

  // stream of list of follower
  Stream<List<PeamanFollower>> getFollowers({
    required final String uid,
  }) {
    return _ref
        .collection('users')
        .doc(uid)
        .collection('followers')
        .orderBy('updated_at', descending: true)
        .snapshots()
        .map(_followersFromFirebase);
  }

  // stream of list of following
  Stream<List<PeamanFollowing>> getFollowings({
    required final String uid,
  }) {
    return _ref
        .collection('users')
        .doc(uid)
        .collection('following')
        .orderBy('updated_at', descending: true)
        .snapshots()
        .map(_followingFromFirebase);
  }

  // stream of list of blocked users
  Stream<List<PeamanBlockedUser>> getBlockedUsers({
    required final String uid,
  }) {
    return _ref
        .collection('users')
        .doc(uid)
        .collection('blocked_users')
        .orderBy('updated_at', descending: true)
        .snapshots()
        .map(_blockedUsersFromFirestore);
  }
}
