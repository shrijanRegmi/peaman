import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:peaman/helpers/async_call_helper.dart';

import '../../../../helpers/common_helper.dart';
import '../../../../helpers/reference_helper.dart';
import '../../shared/models/peaman_error.dart';
import '../../shared/models/peaman_field.dart';
import '../../../utils/query_type_def.dart';
import '../enums/online_status_type.dart';
import '../models/follow_request_model.dart';
import '../models/following_model.dart';
import '../models/sub_user_model.dart';
import '../models/user_model.dart';

abstract class PeamanUserRepository {
  Future<Either<bool, PeamanError>> createUser({
    required final PeamanUser user,
  });

  Future<Either<bool, PeamanError>> updateUser({
    required final String uid,
    required final List<PeamanField> fields,
  });

  Future<Either<bool, PeamanError>> deleteUser({
    required final String uid,
  });

  Future<Either<bool, PeamanError>> followUser({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PeamanError>> acceptFollowRequest({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PeamanError>> ignoreFollowRequest({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PeamanError>> cancelFollowRequest({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PeamanError>> followBackUser({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PeamanError>> unfollowUser({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PeamanError>> blockUser({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PeamanError>> unblockUser({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PeamanError>> setUserOnlineStatus({
    required final String uid,
    required final PeamanOnlineStatus onlineStatus,
  });

  Future<Either<bool, PeamanError>> setIsOnboardingCompleted({
    required final String uid,
    required final bool isOnboardingCompleted,
  });

  Future<Either<List<PeamanUser>, PeamanError>> getUsers({
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanUser>> getUsersStream({
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<PeamanUser, PeamanError>> getSingleUser({
    required final String uid,
  });

  Stream<PeamanUser> getSingleUserStream({
    required final String uid,
  });

  Future<Either<List<PeamanUser>, PeamanError>> getUsersBySearchKey({
    required final String searchKey,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanUser>> getUsersBySearchKeyStream({
    required final String searchKey,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanFollowRequest>, PeamanError>>
      getReceivedFollowRequests({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanFollowRequest>> getReceivedFollowRequestsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanFollowRequest>, PeamanError>> getSentFollowRequests({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanFollowRequest>> getSentFollowRequestsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getFollowers({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanSubUser>> getFollowersStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getFollowings({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanSubUser>> getFollowingsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getBlockedUsers({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanSubUser>> getBlockedUsersStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getBlockedByUsers({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanSubUser>> getBlockedByUsersStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });
}

class PeamanUserRepositoryImpl extends PeamanUserRepository {
  @override
  Future<Either<bool, PeamanError>> acceptFollowRequest({
    required String uid,
    required String friendId,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final _receivedRef = PeamanReferenceHelper.receivedFollowRequestsCol(
          uid: uid,
        ).doc(friendId);
        final _sentRef = PeamanReferenceHelper.sentFollowRequestsCol(
          uid: friendId,
        ).doc(uid);

        final _futures = <Future>[];

        final _receivedFuture = _receivedRef.update({
          'accepted': true,
          'updated_at': _millis,
        });
        _futures.add(_receivedFuture);

        final _sentFuture = _sentRef.update({
          'accepted': true,
          'updated_at': _millis,
        });
        _futures.add(_sentFuture);

        final _addFollowFuture = _addFollowerFollowing(
          uid: uid,
          friendId: friendId,
        );
        _futures.add(_addFollowFuture);

        await Future.wait(_futures);
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> blockUser({
    required String uid,
    required String friendId,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final _blockedUserRef =
            PeamanReferenceHelper.blockedUsersCol(uid: uid).doc(friendId);
        final _blockedByUserRef =
            PeamanReferenceHelper.blockedByUsersCol(uid: friendId).doc(uid);

        final _blockedUser = PeamanSubUser(
          uid: friendId,
          createdAt: _millis,
        );
        final _blockedByUser = PeamanSubUser(
          uid: uid,
          createdAt: _millis,
        );

        final _blockedUserFuture = _blockedUserRef.set(
          _blockedUser.toJson(),
        );
        final _blockedByUserFuture = _blockedByUserRef.set(
          _blockedByUser.toJson(),
        );

        await Future.wait([
          _blockedUserFuture,
          _blockedByUserFuture,
        ]);

        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> cancelFollowRequest({
    required String uid,
    required String friendId,
  }) {
    return runAsyncCall(
      future: () async {
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
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> createUser({
    required PeamanUser user,
  }) {
    return runAsyncCall(
      future: () async {
        final _appUserRef = PeamanReferenceHelper.usersCol.doc(user.uid);
        await _appUserRef.set(user.toJson());
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> deleteUser({
    required String uid,
  }) {
    return runAsyncCall(
      future: () async {
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> followBackUser({
    required String uid,
    required String friendId,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
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

        final _friendFollower = PeamanSubUser(
          uid: uid,
          createdAt: _millis,
        );
        final _userFollowing = PeamanSubUser(
          uid: friendId,
          createdAt: _millis,
        );

        final _friendFollowersFuture = _friendFollowersRef.set(
          _friendFollower.toJson(),
        );
        _futures.add(_friendFollowersFuture);

        final _userFollowingFuture = _userFollowingRef.set(
          _userFollowing.toJson(),
        );
        _futures.add(_userFollowingFuture);

        final _addFollowerFollowingFuture = _addFollowerFollowing(
          uid: friendId,
          friendId: uid,
        );
        _futures.add(_addFollowerFollowingFuture);

        final _requestFuture = _receivedRef.delete();
        _futures.add(_requestFuture);

        final _sentFuture = _sentRef.delete();
        _futures.add(_sentFuture);

        await Future.wait(_futures);
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> followUser({
    required String uid,
    required String friendId,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final _receivedRef = PeamanReferenceHelper.receivedFollowRequestsCol(
          uid: friendId,
        ).doc(uid);
        final _sentRef = PeamanReferenceHelper.sentFollowRequestsCol(
          uid: uid,
        ).doc(friendId);

        final _received = PeamanFollowRequest(
          uid: uid,
          createdAt: _millis,
        );
        final _sent = PeamanFollowRequest(
          uid: friendId,
          createdAt: _millis,
        );

        final _receivedFuture = _receivedRef.set(_received.toJson());
        final _sentFuture = _sentRef.set(_sent.toJson());

        await Future.wait([
          _receivedFuture,
          _sentFuture,
        ]);
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getBlockedByUsers({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.blockedByUsersCol(uid: uid)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_subUsersFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanSubUser>> getBlockedByUsersStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.blockedByUsersCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_subUsersFromFirestore);
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getBlockedUsers({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.blockedUsersCol(uid: uid)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_subUsersFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanSubUser>> getBlockedUsersStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.blockedUsersCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_subUsersFromFirestore);
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getFollowers({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.userFollowersCol(uid: uid)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_subUsersFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanSubUser>> getFollowersStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.userFollowersCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_subUsersFromFirestore);
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getFollowings({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.userFollowingsCol(uid: uid)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_subUsersFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanSubUser>> getFollowingsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.userFollowingsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_subUsersFromFirestore);
  }

  @override
  Future<Either<List<PeamanFollowRequest>, PeamanError>>
      getReceivedFollowRequests({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.receivedFollowRequestsCol(uid: uid)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_followRequestsFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanFollowRequest>> getReceivedFollowRequestsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.receivedFollowRequestsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_followRequestsFromFirestore);
  }

  @override
  Future<Either<List<PeamanFollowRequest>, PeamanError>> getSentFollowRequests({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.sentFollowRequestsCol(uid: uid)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_followRequestsFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanFollowRequest>> getSentFollowRequestsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.sentFollowRequestsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_followRequestsFromFirestore);
  }

  @override
  Future<Either<PeamanUser, PeamanError>> getSingleUser({
    required String uid,
  }) {
    return runAsyncCall(
      future: () async {
        final _userRef = PeamanReferenceHelper.userDoc(uid: uid);
        final _userSnap = await _userRef.get();
        final _userData = _userSnap.data();
        if (_userData == null) throw Exception('user data is null');
        final _user = PeamanUser.fromJson(_userData);
        return Left(_user);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<PeamanUser> getSingleUserStream({
    required String uid,
  }) {
    final _userRef = PeamanReferenceHelper.userDoc(uid: uid);
    return _userRef.snapshots().map(_userFromFirestore);
  }

  @override
  Future<Either<List<PeamanUser>, PeamanError>> getUsers({
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.usersCol
            .where('visibility', isEqualTo: true)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_usersFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<List<PeamanUser>, PeamanError>> getUsersBySearchKey({
    required String searchKey,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.usersCol
            .where('visibility', isEqualTo: true)
            .where('search_keys', arrayContains: searchKey);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_usersFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanUser>> getUsersBySearchKeyStream({
    required String searchKey,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.usersCol
        .where('visibility', isEqualTo: true)
        .where('search_keys', arrayContains: searchKey);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_usersFromFirestore);
  }

  @override
  Stream<List<PeamanUser>> getUsersStream({
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.usersCol
        .where('visibility', isEqualTo: true)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_usersFromFirestore);
  }

  @override
  Future<Either<bool, PeamanError>> ignoreFollowRequest({
    required String uid,
    required String friendId,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final _receivedRef = PeamanReferenceHelper.receivedFollowRequestsCol(
          uid: uid,
        ).doc(friendId);
        final _sentRef = PeamanReferenceHelper.sentFollowRequestsCol(
          uid: friendId,
        ).doc(uid);

        final _futures = <Future>[];

        final _receivedFuture = _receivedRef.update({
          'ignored': true,
          'updated_at': _millis,
        });
        _futures.add(_receivedFuture);

        final _sentFuture = _sentRef.update({
          'ignored': true,
          'updated_at': _millis,
        });
        _futures.add(_sentFuture);

        await Future.wait(_futures);
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> setIsOnboardingCompleted({
    required String uid,
    required bool isOnboardingCompleted,
  }) {
    return updateUser(
      uid: uid,
      fields: [
        PeamanField(
          key: 'is_onboarding_completed',
          value: true,
        ),
      ],
    );
  }

  @override
  Future<Either<bool, PeamanError>> setUserOnlineStatus({
    required String uid,
    required PeamanOnlineStatus onlineStatus,
  }) {
    return updateUser(
      uid: uid,
      fields: [
        PeamanField(
          key: 'online_status',
          value: ksPeamanOnlineStatus[onlineStatus],
        ),
      ],
    );
  }

  @override
  Future<Either<bool, PeamanError>> unblockUser({
    required String uid,
    required String friendId,
  }) {
    return runAsyncCall(
      future: () async {
        final _blockedUserRef =
            PeamanReferenceHelper.blockedUsersCol(uid: uid).doc(friendId);
        final _blockedByUserRef =
            PeamanReferenceHelper.blockedByUsersCol(uid: friendId).doc(uid);

        await Future.wait([
          _blockedUserRef.delete(),
          _blockedByUserRef.delete(),
        ]);
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> unfollowUser({
    required String uid,
    required String friendId,
  }) {
    return runAsyncCall(
      future: () async {
        final _userFollowingRef =
            PeamanReferenceHelper.userFollowingsCol(uid: uid).doc(friendId);
        final _friendFollowersRef =
            PeamanReferenceHelper.userFollowersCol(uid: friendId).doc(uid);

        final _futures = <Future>[];

        final _userFollowingFuture = _userFollowingRef.delete();
        _futures.add(_userFollowingFuture);

        final _friendFollowersFuture = _friendFollowersRef.delete();
        _futures.add(_friendFollowersFuture);

        final _userUpdateFuture = updateUser(
          uid: uid,
          fields: [
            PeamanField.negativePartial(
              key: 'following',
              value: 1,
            )
          ],
        );
        _futures.add(_userUpdateFuture);

        final _friendUpdateFuture = updateUser(
          uid: friendId,
          fields: [
            PeamanField.negativePartial(
              key: 'followers',
              value: 1,
            )
          ],
        );
        _futures.add(_friendUpdateFuture);

        await Future.wait(_futures);
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> updateUser({
    required String uid,
    required List<PeamanField> fields,
  }) {
    return runAsyncCall(
      future: () async {
        final _userRef = PeamanReferenceHelper.userDoc(uid: uid);
        final _data = PeamanCommonHelper.prepareDataToUpdate(fields: fields);
        if (_data.isNotEmpty) {
          await _userRef.update(_data);
        }
        return Left(true);
      },
      onError: Right.new,
    );
  }

  Future<dynamic> _addFollowerFollowing({
    required final String uid,
    required final String friendId,
  }) {
    final _userFollowersRef =
        PeamanReferenceHelper.userFollowersCol(uid: uid).doc(friendId);
    final _friendFollowingRef =
        PeamanReferenceHelper.userFollowingsCol(uid: friendId).doc(uid);

    final _milli = DateTime.now().millisecondsSinceEpoch;

    final _futures = <Future>[];

    final _userFollower = PeamanSubUser(
      uid: friendId,
      createdAt: _milli,
    );
    final _friendFollower = PeamanSubUser(
      uid: uid,
      createdAt: _milli,
    );

    final _userFollowersFuture = _userFollowersRef.set(
      _userFollower.toJson(),
    );
    _futures.add(_userFollowersFuture);

    final _friendFollowingFuture = _friendFollowingRef.set(
      _friendFollower.toJson(),
    );
    _futures.add(_friendFollowingFuture);

    final _userUpdateFuture = updateUser(
      uid: uid,
      fields: [
        PeamanField.positivePartial(
          key: 'followers',
          value: 1,
        ),
      ],
    );
    _futures.add(_userUpdateFuture);

    final _friendUpdateFuture = updateUser(
      uid: friendId,
      fields: [
        PeamanField.positivePartial(
          key: 'following',
          value: 1,
        ),
      ],
    );
    _futures.add(_friendUpdateFuture);

    return Future.wait(_futures).then((value) {
      print('Success: Adding follower $friendId');
    }).catchError((e) {
      print(e);
      print('Error!!!: Adding follower');
    });
  }

  PeamanUser _userFromFirestore(
    final DocumentSnapshot<Map<String, dynamic>> snap,
  ) {
    return PeamanUser.fromJson(snap.data() ?? {});
  }

  List<PeamanUser> _usersFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanUser.fromJson(e.data())).toList();
  }

  List<PeamanSubUser> _subUsersFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanSubUser.fromJson(e.data())).toList();
  }

  List<PeamanFollowRequest> _followRequestsFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs
        .map((e) => PeamanFollowRequest.fromJson(e.data()))
        .toList();
  }
}
