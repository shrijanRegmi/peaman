import 'package:cloud_firestore/cloud_firestore.dart';

class FriendProvider {
  final _ref = FirebaseFirestore.instance;

  // follow friend
  Future<void> follow({
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
  Future<void> acceptFollow({
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
  Future<void> followBack({
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
  Future<void> cancleFollow({
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

  // unfollow friend
  Future<void> unfollowFriend({
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
}
