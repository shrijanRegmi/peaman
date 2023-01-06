import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/peaman.dart';

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
  Future<void> setUserOnlineStatus({
    required final String uid,
    required PeamanOnlineStatus onlineStatus,
  }) async {
    try {
      final _currentMillis = DateTime.now().millisecondsSinceEpoch;

      final _userRef = PeamanReferenceHelper.usersCol.doc(uid);
      final _data = <String, dynamic>{
        'online_status': onlineStatus.index,
        'last_online_at': _currentMillis,
      };

      await _userRef.update(_data);
      print(
        'Success: Setting activity status of user $uid to ${onlineStatus.index}',
      );
    } catch (e) {
      print(
        'Error!!!: Setting activity status of user $uid to ${onlineStatus.index}',
      );
      print(e);
    }
  }

  // set completed signup
  Future<void> setUserOnboardingCompleted({
    required final String uid,
    required final bool onboardingCompleted,
  }) async {
    try {
      final _userRef = PeamanReferenceHelper.usersCol.doc(uid);
      await _userRef.update({
        'onboarding_completed': onboardingCompleted,
      });

      print(
        'Success: Setting onboarding completed status of user $uid to $onboardingCompleted',
      );
    } catch (e) {
      print(e);
      print(
        'Error!!!: Setting onboarding completed status of user $uid to $onboardingCompleted',
      );
    }
  }

  // update user details
  Future<void> updateUserDetail({
    required final String uid,
    final PeamanUserUpdater? updater,
    final PeamanUserPartialUpdater? positivePartialUpdater,
    final PeamanUserPartialUpdater? negativePartialUpdater,
  }) async {
    try {
      final _userRef = PeamanReferenceHelper.usersCol.doc(uid);
      final _data = <String, dynamic>{};

      final _updaterData = updater?.toJson() ?? _data;
      final _positivePartialUpdaterData =
          positivePartialUpdater?.toPositiveUpdateJson() ?? _data;
      final _negativePartialUpdaterData =
          negativePartialUpdater?.toNegativeUpdateJson() ?? _data;

      _data.addAll(_updaterData);
      _data.addAll(_positivePartialUpdaterData);
      _data.addAll(_negativePartialUpdaterData);

      if (_data.isNotEmpty) {
        await _userRef.update(_data);
      }

      print('Success: Updating details of user $uid');
    } catch (e) {
      print(e);
      print('Error!!!: Updating details of user');
    }
  }

  // update user properties count
  Future<void> updateUserPropertiesCount({
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
    try {
      final _usersRef = PeamanReferenceHelper.usersCol.doc(uid);
      final _data = <String, dynamic>{
        'onboarding_step': FieldValue.increment(onboardingStep),
        'followers': FieldValue.increment(followers),
        'following': FieldValue.increment(following),
        'notif_count': FieldValue.increment(notifCount),
        'reactions_received_from_feeds':
            FieldValue.increment(reactionsReceivedFromFeeds),
        'comments_received_from_feeds':
            FieldValue.increment(commentsReceivedFromFeeds),
        'replies_received_from_feeds':
            FieldValue.increment(repliesReceivedFromFeeds),
        'shares_received_from_feeds':
            FieldValue.increment(sharesReceivedFromFeeds),
        'views_received_from_feeds':
            FieldValue.increment(viewsReceivedFromFeeds),
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

      final _receivedRef = PeamanReferenceHelper.receivedFollowRequestsCol(
        uid: friendId,
      ).doc(uid);
      final _sentRef = PeamanReferenceHelper.sentFollowRequestsCol(
        uid: uid,
      ).doc(friendId);

      final _received = PeamanReceivedFollowRequest(
        uid: uid,
        createdAt: _currentMillis,
        updatedAt: _currentMillis,
      );
      final _sent = PeamanSentFollowRequest(
        uid: friendId,
        createdAt: _currentMillis,
        updatedAt: _currentMillis,
      );

      final _receivedFuture = _receivedRef.set(_received.toJson());
      final _sentFuture = _sentRef.set(_sent.toJson());

      await Future.wait([
        _receivedFuture,
        _sentFuture,
      ]);
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
      final _receivedRef = PeamanReferenceHelper.receivedFollowRequestsCol(
        uid: uid,
      ).doc(friendId);
      final _sentRef = PeamanReferenceHelper.sentFollowRequestsCol(
        uid: friendId,
      ).doc(uid);

      final _futures = <Future>[];

      final _receivedFuture = _receivedRef.update({
        'accepted': true,
      });
      _futures.add(_receivedFuture);

      final _sentFuture = _sentRef.update({
        'accepted': true,
      });
      _futures.add(_sentFuture);

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

  // ignore follow request
  Future<void> ignoreFollowRequest({
    required final String uid,
    required final String friendId,
  }) async {
    try {
      final _receivedRef = PeamanReferenceHelper.receivedFollowRequestsCol(
        uid: uid,
      ).doc(friendId);
      final _sentRef = PeamanReferenceHelper.sentFollowRequestsCol(
        uid: friendId,
      ).doc(uid);

      final _futures = <Future>[];

      final _receivedFuture = _receivedRef.update({
        'ignored': true,
      });
      _futures.add(_receivedFuture);

      final _sentFuture = _sentRef.update({
        'ignored': true,
      });
      _futures.add(_sentFuture);

      await Future.wait(_futures);
      print('Success: Ignoring follow request $friendId');
    } catch (e) {
      print(e);
      print('Error!!!: Ignoring follow request');
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
      final _receivedRef = PeamanReferenceHelper.receivedFollowRequestsCol(
        uid: uid,
      ).doc(friendId);
      final _sentRef = PeamanReferenceHelper.sentFollowRequestsCol(
        uid: friendId,
      ).doc(uid);

      final _friendFollowersRef = PeamanReferenceHelper.userFollowersCol(
        uid: friendId,
      ).doc(uid);
      final _userFollowingRef = PeamanReferenceHelper.userFollowingsCol(
        uid: uid,
      ).doc(friendId);

      final _futures = <Future>[];

      final _friendFollowersFuture = _friendFollowersRef.set({
        'uid': uid,
        'created_at': _currentMillis,
        'updated_at': _currentMillis,
      });
      _futures.add(_friendFollowersFuture);

      final _userFollowingFuture = _userFollowingRef.set({
        'uid': friendId,
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

      final _requestFuture = _receivedRef.delete();
      _futures.add(_requestFuture);

      final _sentFuture = _sentRef.delete();
      _futures.add(_sentFuture);

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
      final _receivedRef = PeamanReferenceHelper.receivedFollowRequestsCol(
        uid: friendId,
      ).doc(uid);
      final _sentRef = PeamanReferenceHelper.sentFollowRequestsCol(
        uid: uid,
      ).doc(friendId);

      final _receivedFututre = _receivedRef.delete();
      final _sentFuture = _sentRef.delete();

      await Future.wait([
        _receivedFututre,
        _sentFuture,
      ]);
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
  Future<dynamic> _addFollower({
    required final String uid,
    required final String friendId,
  }) {
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

    return Future.wait(_futures).then((value) {
      print('Success: Adding follower $friendId');
    }).catchError((e) {
      print(e);
      print('Error!!!: Adding follower');
    });
  }

  // user from firestore
  PeamanUser _appUserFromFirebase(
    DocumentSnapshot<Map<String, dynamic>> snap,
  ) {
    return PeamanUser.fromJson(snap.data() ?? <String, dynamic>{});
  }

  // list of users from firestore
  List<PeamanUser> _usersFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((doc) {
      return PeamanUser.fromJson(doc.data());
    }).toList();
  }

  // list of received follow requests from firestore
  List<PeamanReceivedFollowRequest> _receivedFollowRequestsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs
        .map((e) => PeamanReceivedFollowRequest.fromJson(e.data()))
        .toList();
  }

  // list of sent follow requests from firestore
  List<PeamanSentFollowRequest> _sentFollowRequestsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs
        .map((e) => PeamanSentFollowRequest.fromJson(e.data()))
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

  // list of blocked by users from firestore
  List<PeamanBlockedByUser> _blockedByUsersFromFirestore(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs
        .map((e) => PeamanBlockedByUser.fromJson(e.data()))
        .toList();
  }

  // future of users by search key from firestore
  Future<List<PeamanUser>> getUserBySearchKey({
    required final String searchKey,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.usersCol
        .where('visibility', isEqualTo: true)
        .where('search_keys', arrayContains: searchKey);
    final _query = query?.call(_ref) ?? _ref;
    return _query.get().then(_usersFromFirebase);
  }

  // stream of users by search key from firestore
  Stream<List<PeamanUser>> getUserBySearchKeyStream({
    required final String searchKey,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.usersCol
        .where('visibility', isEqualTo: true)
        .where('search_keys', arrayContains: searchKey);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_usersFromFirebase);
  }

  // future of list of users
  Future<List<PeamanUser>> getUsers({
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.usersCol
        .where('visibility', isEqualTo: true)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.get().then(_usersFromFirebase);
  }

  // stream of list of users
  Stream<List<PeamanUser>> getUsersStream({
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.usersCol
        .where('visibility', isEqualTo: true)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_usersFromFirebase);
  }

  // stream of user by id
  Future<PeamanUser> getUserById({
    required final String uid,
  }) {
    return PeamanReferenceHelper.usersCol
        .doc(uid)
        .get()
        .then(_appUserFromFirebase);
  }

  // stream of user by id
  Stream<PeamanUser> getUserByIdStream({
    required final String uid,
  }) {
    return PeamanReferenceHelper.usersCol
        .doc(uid)
        .snapshots()
        .map(_appUserFromFirebase);
  }

  // future of list of received follow requests
  Future<List<PeamanReceivedFollowRequest>> getReceivedFollowRequests({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.receivedFollowRequestsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;

    return _query.get().then(_receivedFollowRequestsFromFirebase);
  }

  // stream of list of received follow requests
  Stream<List<PeamanReceivedFollowRequest>> getReceivedFollowRequestsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.receivedFollowRequestsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;

    return _query.snapshots().map(_receivedFollowRequestsFromFirebase);
  }

  // future of list of sent follow requests
  Future<List<PeamanSentFollowRequest>> getSentFollowRequests({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.sentFollowRequestsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;

    return _query.get().then(_sentFollowRequestsFromFirebase);
  }

  // stream of list of sent follow requests
  Stream<List<PeamanSentFollowRequest>> getSentFollowRequestsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.sentFollowRequestsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;

    return _query.snapshots().map(_sentFollowRequestsFromFirebase);
  }

  // future of list of follower
  Future<List<PeamanFollower>> getFollowers({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.userFollowersCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;

    return _query.get().then(_followersFromFirebase);
  }

  // stream of list of follower
  Stream<List<PeamanFollower>> getFollowersStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.userFollowersCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;

    return _query.snapshots().map(_followersFromFirebase);
  }

  // future of list of following
  Future<List<PeamanFollowing>> getFollowings({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.userFollowingsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.get().then(_followingFromFirebase);
  }

  // stream of list of following
  Stream<List<PeamanFollowing>> getFollowingsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.userFollowingsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_followingFromFirebase);
  }

  // future of list of blocked users
  Future<List<PeamanBlockedUser>> getBlockedUsers({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.blockedUsersCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;

    return _query.get().then(_blockedUsersFromFirestore);
  }

  // stream of list of blocked users
  Stream<List<PeamanBlockedUser>> getBlockedUsersStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.blockedUsersCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;

    return _query.snapshots().map(_blockedUsersFromFirestore);
  }

  // future of list of blocked users
  Future<List<PeamanBlockedByUser>> getBlockedByUsers({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.blockedByUsersCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;

    return _query.get().then(_blockedByUsersFromFirestore);
  }

  // stream of list of blocked users
  Stream<List<PeamanBlockedByUser>> getBlockedByUsersStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.blockedByUsersCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;

    return _query.snapshots().map(_blockedByUsersFromFirestore);
  }
}
