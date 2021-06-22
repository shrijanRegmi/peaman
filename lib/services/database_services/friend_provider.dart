import 'package:cloud_firestore/cloud_firestore.dart';

class FriendProvider {
  final String appUserId;
  final String friendId;
  FriendProvider({
    required this.appUserId,
    required this.friendId,
  });

  final _ref = FirebaseFirestore.instance;

  // follow friend
  Future follow() async {
    try {
      final _friendRef = _ref.collection('users').doc(friendId);
      final _requestRef = _friendRef.collection('requests').doc(appUserId);

      final _data = {
        'id': appUserId,
        'created_at': DateTime.now().millisecondsSinceEpoch,
      };

      await _requestRef.set(_data);
      print('Success: Following $friendId');
      return 'Success';
    } catch (e) {
      print(e);
      print('Error!!!: Following $friendId');
    }
  }

  // accept follow request
  Future acceptFollow() async {
    try {
      final _userRef = _ref.collection('users').doc(appUserId);
      final _requestRef = _userRef.collection('requests').doc(friendId);
      final _followRequestRef =
          _userRef.collection('follow_requests').doc(friendId);

      await _followRequestRef.update({
        'is_accepted': true,
      });
      await _requestRef.delete();
      print('Success: Deleting request doc with id $friendId');

      _addFollower();

      return 'Success';
    } catch (e) {
      print(e);
      print('Error!!!: Deleting request doc with id $friendId');
      return null;
    }
  }

  // follow back
  Future followBack() async {
    try {
      final _friendRef = _ref.collection('users').doc(friendId);
      final _userRef = _ref.collection('users').doc(appUserId);
      final _followReqRef = _ref
          .collection('users')
          .doc(appUserId)
          .collection('follow_requests')
          .doc(friendId);

      final _friendFollowersRef =
          _friendRef.collection('followers').doc(appUserId);
      final _userFollowingRef = _userRef.collection('following').doc(friendId);

      final _milli = DateTime.now().millisecondsSinceEpoch;

      await _friendFollowersRef.set({
        'id': appUserId,
        'updated_at': _milli,
      });
      await _userFollowingRef.set({
        'id': appUserId,
        'updated_at': _milli,
      });

      await _friendRef.update({
        'followers': FieldValue.increment(1),
      });
      await _userRef.update({
        'following': FieldValue.increment(1),
      });

      await _followReqRef.delete();

      print('Success: Following back $friendId');
      return 'Success';
    } catch (e) {
      print(e);
      print('Error!!!: Following back $friendId');
      return null;
    }
  }

  // cancle follow
  Future cancleFollow() async {
    try {
      final _userRef = _ref.collection('users').doc(appUserId);
      final _requestRef = _userRef.collection('requests').doc(friendId);
      final _followReqRef =
          _userRef.collection('follow_requests').doc(friendId);

      await _requestRef.delete();
      await _followReqRef.delete();
      print('Success: Deleting request doc with id $friendId');
      return 'Success';
    } catch (e) {
      print(e);
      print('Error!!!: Deleting request doc with id $friendId');
      return null;
    }
  }

  // add follower
  Future _addFollower() async {
    try {
      final _userRef = _ref.collection('users').doc(appUserId);
      final _friendRef = _ref.collection('users').doc(friendId);

      final _userFollowersRef = _userRef.collection('followers').doc(friendId);
      final _friendFollowingRef =
          _friendRef.collection('following').doc(appUserId);

      final _milli = DateTime.now().millisecondsSinceEpoch;

      await _userFollowersRef.set({
        'id': friendId,
        'updated_at': _milli,
      });
      await _friendFollowingRef.set({
        'id': appUserId,
        'updated_at': _milli,
      });

      await _userRef.update({
        'followers': FieldValue.increment(1),
      });
      await _friendRef.update({
        'following': FieldValue.increment(1),
      });

      print('Success: Adding follower $friendId');
      return 'Success';
    } catch (e) {
      print(e);
      print('Error!!!: Adding follower $friendId');
      return null;
    }
  }
}
