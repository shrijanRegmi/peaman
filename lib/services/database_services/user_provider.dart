import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/peaman.dart';

typedef MyQuery = Query<Map<String, dynamic>>;

class AppUserProvider {
  // create user
  Future<void> createUser({
    required final PeamanUser user,
  }) async {
    try {
      final _appUserRef = PeamanReferenceHelper.usersCol.doc(user.uid);
      await _appUserRef.set(user.toJson());

      print('Success: Creating user ${user.uid}');
    } catch (e) {
      print(e);
      print("Error!!!: Creating user");
    }
  }

  // set user active status
  Future<void> setUserActiveStatus({
    required final String uid,
    required PeamanOnlineStatus onlineStatus,
  }) async {
    try {
      final _userRef = PeamanReferenceHelper.usersCol.doc(uid);
      final _status = {'active_status': onlineStatus.index};
      await _userRef.update(_status);
      print(
        'Success: Setting activity status of user $uid to ${onlineStatus.index}',
      );
    } catch (e) {
      print('Error!!!: Setting activity status of user');
      print(e);
    }
  }

  // update user details
  Future<void> updateUserDetail({
    required final String uid,
    required final Map<String, dynamic> data,
  }) async {
    try {
      final _userRef = PeamanReferenceHelper.usersCol.doc(uid);
      await _userRef.update(data);

      print('Success: Updating details of user $uid');
    } catch (e) {
      print(e);
      print('Error!!!: Updating details of user');
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
      final _usersRef = PeamanReferenceHelper.usersCol.doc(uid);
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
      final _currentMillis = DateTime.now().millisecondsSinceEpoch;

      final _requestRef =
          PeamanReferenceHelper.followRequestsCol(uid: friendId).doc(uid);

      final _data = {
        'uid': uid,
        'created_at': _currentMillis,
        'updated_at': _currentMillis,
      };

      await _requestRef.set(_data);
      print('Success: Following user $friendId');
    } catch (e) {
      print(e);
      print('Error!!!: Following user');
    }
  }

  // accept follow request
  Future<void> acceptFollowRequest({
    required final String uid,
    required final String friendId,
  }) async {
    try {
      final _followRequestRef =
          PeamanReferenceHelper.followRequestsCol(uid: uid).doc(friendId);

      final _futures = <Future>[];

      final _followRequestFuture = _followRequestRef.update({
        'accepted': true,
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
      final _currentMillis = DateTime.now().millisecondsSinceEpoch;

      final _friendRef = PeamanReferenceHelper.usersCol.doc(friendId);
      final _userRef = PeamanReferenceHelper.usersCol.doc(uid);
      final _followReqRef =
          PeamanReferenceHelper.followRequestsCol(uid: uid).doc(friendId);

      final _friendFollowersRef =
          PeamanReferenceHelper.userFollowersCol(uid: friendId).doc(uid);
      final _userFollowingRef =
          PeamanReferenceHelper.userFollowingsCol(uid: uid).doc(friendId);

      final _futures = <Future>[];

      final _friendFollowersFuture = _friendFollowersRef.set({
        'uid': uid,
        'created_at': _currentMillis,
        'updated_at': _currentMillis,
      });
      _futures.add(_friendFollowersFuture);

      final _userFollowingFuture = _userFollowingRef.set({
        'uid': uid,
        'created_at': _currentMillis,
        'updated_at': _currentMillis,
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
      final _followReqRef =
          PeamanReferenceHelper.followRequestsCol(uid: uid).doc(friendId);

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
      final _userRef = PeamanReferenceHelper.usersCol.doc(uid);
      final _friendRef = PeamanReferenceHelper.usersCol.doc(friendId);

      final _userFollowingRef =
          PeamanReferenceHelper.userFollowingsCol(uid: uid).doc(friendId);
      final _friendFollowersRef =
          PeamanReferenceHelper.userFollowersCol(uid: friendId).doc(uid);

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
      final _currentMillis = DateTime.now().millisecondsSinceEpoch;

      final _blockedUserRef =
          PeamanReferenceHelper.blockedUsersCol(uid: uid).doc(friendId);
      final _blockedByUserRef =
          PeamanReferenceHelper.blockedByUsersCol(uid: friendId).doc(uid);

      final _blockedUserFuture = _blockedUserRef.set({
        'uid': friendId,
        'created_at': _currentMillis,
        'updated_at': _currentMillis,
      });

      final _blockedByUserFuture = _blockedByUserRef.set({
        'uid': uid,
        'created_at': _currentMillis,
        'updated_at': _currentMillis,
      });

      await Future.wait([
        _blockedUserFuture,
        _blockedByUserFuture,
      ]);

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
      final _blockedUserRef =
          PeamanReferenceHelper.blockedUsersCol(uid: uid).doc(friendId);
      final _blockedByUserRef =
          PeamanReferenceHelper.blockedByUsersCol(uid: friendId).doc(uid);

      await Future.wait([
        _blockedUserRef.delete(),
        _blockedByUserRef.delete(),
      ]);

      print('Success: Blocking user');
    } catch (e) {
      print(e);
      print('Error!!!: Blocking user');
    }
  }

  // check if user is blocked
  Future<bool> checkIfBlocked({
    required final String uid,
    required final String friendId,
  }) async {
    bool _blocked = false;
    try {
      final _blockedRef =
          PeamanReferenceHelper.blockedUsersCol(uid: friendId).doc(uid);
      final _blockedSnap = await _blockedRef.get();

      _blocked = _blockedSnap.exists;
      print('Success: Checking if user is blocked');
    } catch (e) {
      print(e);
      print('Error!!!: Checking if user is blocked');
    }
    return _blocked;
  }

  // add follower
  Future<void> _addFollower({
    required final String uid,
    required final String friendId,
  }) async {
    try {
      final _userRef = PeamanReferenceHelper.usersCol.doc(uid);
      final _friendRef = PeamanReferenceHelper.usersCol.doc(friendId);

      final _userFollowersRef =
          PeamanReferenceHelper.userFollowersCol(uid: uid).doc(friendId);
      final _friendFollowingRef =
          PeamanReferenceHelper.userFollowingsCol(uid: friendId).doc(uid);

      final _milli = DateTime.now().millisecondsSinceEpoch;

      final _futures = <Future>[];

      final _userFollowersFuture = _userFollowersRef.set({
        'uid': friendId,
        'created_at': _milli,
        'updated_at': _milli,
      });
      _futures.add(_userFollowersFuture);

      final _friendFollowingFuture = _friendFollowingRef.set({
        'uid': uid,
        'created_at': _milli,
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

  // user from firestore
  PeamanUser _appUserFromFirebase(
    DocumentSnapshot<Map<String, dynamic>> snap,
  ) {
    return PeamanUser.fromJson(snap.data()!);
  }

  // list of users from firestore
  List<PeamanUser> _usersFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((doc) {
      return PeamanUser.fromJson(doc.data());
    }).toList();
  }

  // list of follow requests from firestore
  List<PeamanFollowRequest> _followRequestsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs
        .map((e) => PeamanFollowRequest.fromJson(e.data()))
        .toList();
  }

  // list of followers from firestore
  List<PeamanFollower> _followersFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanFollower.fromJson(e.data())).toList();
  }

  // list of following from firestore
  List<PeamanFollowing> _followingFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanFollowing.fromJson(e.data())).toList();
  }

  // list of blocked users from firestore
  List<PeamanBlockedUser> _blockedUsersFromFirestore(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanBlockedUser.fromJson(e.data())).toList();
  }

  // stream of users by search key from firestore
  Stream<List<PeamanUser>> getUserBySearchKey({
    required final String searchKey,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.usersCol
        .where('search_keys', arrayContains: searchKey);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_usersFromFirebase);
  }

  // stream of list of users
  Stream<List<PeamanUser>> getUsers({
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.usersCol;
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_usersFromFirebase);
  }

  // get user by id
  Stream<PeamanUser> getUserById({
    required final String uid,
  }) {
    return PeamanReferenceHelper.usersCol
        .doc(uid)
        .snapshots()
        .map(_appUserFromFirebase);
  }

  // stream of list of follow requests
  Stream<List<PeamanFollowRequest>> getFollowRequests({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.followRequestsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;

    return _query.snapshots().map(_followRequestsFromFirebase);
  }

  // stream of list of follower
  Stream<List<PeamanFollower>> getFollowers({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.userFollowersCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;

    return _query.snapshots().map(_followersFromFirebase);
  }

  // stream of list of following
  Stream<List<PeamanFollowing>> getFollowings({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.userFollowingsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_followingFromFirebase);
  }

  // stream of list of blocked users
  Stream<List<PeamanBlockedUser>> getBlockedUsers({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.blockedUsersCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;

    return _query.snapshots().map(_blockedUsersFromFirestore);
  }
}
