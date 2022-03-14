import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:peaman/peaman.dart';

class AppUserProvider {
  final String? uid;
  final String? searchKey;
  final DocumentReference<Map<String, dynamic>>? userRef;
  final PeamanUser? user;
  AppUserProvider({
    this.uid,
    this.userRef,
    this.searchKey,
    this.user,
  });
  final _ref = FirebaseFirestore.instance;

  // send user to firestore
  Future sendUserToFirestore() async {
    try {
      final _appUserRef = _ref.collection('users').doc(user?.uid);
      await _appUserRef.set(user!.toJson());

      print('Success: Sending user ${user?.uid} to firestore');
      return "Success";
    } catch (e) {
      print(e);
      print("Error!!!: Sending user ${user?.uid} to firestore");
      return null;
    }
  }

  // set user active status
  Future setUserActiveStatus({
    @required PeamanOnlineStatus? onlineStatus,
  }) async {
    try {
      final _userRef = _ref.collection('users').doc(uid);
      final _status = {
        'active_status': onlineStatus?.index,
      };
      await _userRef.update(_status);
      print(
          'Success: Setting activity status of user $uid to ${onlineStatus?.index}');
      return 'Success';
    } catch (e) {
      print(
          'Error!!!: Setting activity status of user $uid to ${onlineStatus?.index}');
      print(e);
      return null;
    }
  }

  // update user details
  Future updateUserDetail({@required final Map<String, dynamic>? data}) async {
    try {
      final _userRef = _ref.collection('users').doc(uid);
      await _userRef.update(data!);

      print('Success: Updating personal info of user $uid');
      return 'Success';
    } catch (e) {
      print(e);
      print('Error!!!: Updating personal info of user $uid');
      return null;
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

  // appuser from firebase;
  PeamanUser _appUserFromFirebase(DocumentSnapshot<Map<String, dynamic>> snap) {
    return PeamanUser.fromJson(snap.data()!);
  }

  // get appuser by id
  Future<PeamanUser?> getUserById() async {
    PeamanUser? _appUser;

    try {
      final _appUserRef = _ref.collection('users').doc(uid);
      final _appUserSnap = await _appUserRef.get();
      if (_appUserSnap.exists) {
        final _appUserData = _appUserSnap.data();
        _appUser = PeamanUser.fromJson(_appUserData!);
      }
    } catch (e) {
      print(e);
      print('Error!!!: Getting user from id $uid');
    }

    return _appUser;
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

  // get old search results
  Future<List<PeamanUser>> getOldSearchResults() async {
    List<PeamanUser> _searchResults = [];

    try {
      final _searchRef = _ref
          .collection('users')
          .where('search_key', arrayContains: searchKey)
          .orderBy('name')
          .startAfter([user?.name]).limit(10);
      final _searchSnap = await _searchRef.get();
      if (_searchSnap.docs.isNotEmpty) {
        for (final doc in _searchSnap.docs) {
          final _userData = doc.data();
          final _appUser = PeamanUser.fromJson(_userData);

          _searchResults.add(_appUser);
        }
      }
      print('Success: Getting old search results with key $searchKey');
    } catch (e) {
      print(e);
      print('Error!!!: Getting old search results with key $searchKey');
    }

    return _searchResults;
  }

  // stream of appuser;
  Stream<PeamanUser> get appUser {
    return _ref
        .collection('users')
        .doc(uid)
        .snapshots()
        .map(_appUserFromFirebase);
  }

  // stream of app user from ref
  Stream<PeamanUser>? get appUserFromRef {
    return userRef?.snapshots().map(_appUserFromFirebase);
  }

  // stream of users from search key
  Stream<List<PeamanUser>> get appUserFromKey {
    return _ref
        .collection('users')
        .where('search_keys', arrayContains: searchKey)
        .limit(10)
        .snapshots()
        .map(_usersFromFirebase);
  }

  // stream of list of users;
  Stream<List<PeamanUser>> get allUsers {
    return _ref
        .collection('users')
        .limit(10)
        .snapshots()
        .map(_usersFromFirebase);
  }

  // stream of list of follow requests
  Stream<List<PeamanFollowRequest>> get followRequests {
    return _ref
        .collection('users')
        .doc(uid)
        .collection('follow_requests')
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(_followRequestsFromFirebase);
  }

  // stream of list of follower
  Stream<List<PeamanFollower>> get followers {
    return _ref
        .collection('users')
        .doc(uid)
        .collection('followers')
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(_followersFromFirebase);
  }

  // stream of list of following
  Stream<List<PeamanFollowing>> get following {
    return _ref
        .collection('users')
        .doc(uid)
        .collection('following')
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(_followingFromFirebase);
  }
}
