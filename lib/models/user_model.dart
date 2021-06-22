import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/enums/online_status.dart';

class PeamanUser {
  final String? uid;
  final String? photoUrl;
  final String? name;
  final String? email;
  final String? profileStatus;
  final PeamanOnlineStatus? onlineStatus;
  final DocumentReference? appUserRef;
  final int? photos;
  final int? followers;
  final int? following;
  final int? notifCount;
  final bool? newFeeds;

  PeamanUser({
    required this.uid,
    required this.photoUrl,
    required this.name,
    required this.email,
    required this.appUserRef,
    this.photos = 0,
    this.profileStatus = '',
    this.onlineStatus = PeamanOnlineStatus.away,
    this.followers = 0,
    this.following = 0,
    this.notifCount = 0,
    this.newFeeds = false,
  });

  PeamanUser copyWith({
    final String? uid,
    final String? photoUrl,
    final String? name,
    final String? email,
    final String? profileStatus,
    final PeamanOnlineStatus? onlineStatus,
    final DocumentReference? appUserRef,
    final int? photos,
    final int? followers,
    final int? following,
    final int? notifCount,
    final bool? newFeeds,
  }) {
    return PeamanUser(
      uid: uid ?? this.uid,
      photoUrl: photoUrl ?? this.photoUrl,
      name: name ?? this.name,
      email: email ?? this.email,
      profileStatus: profileStatus ?? this.profileStatus,
      onlineStatus: onlineStatus ?? this.onlineStatus,
      appUserRef: appUserRef ?? this.appUserRef,
      photos: photos ?? this.photos,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      notifCount: notifCount ?? this.notifCount,
      newFeeds: newFeeds ?? this.newFeeds,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'photoUrl': photoUrl,
      'name': name,
      'email': email,
    };
  }

  Map<String, dynamic> toFeedUser() {
    return {
      'uid': uid,
      'photoUrl': photoUrl,
      'name': name,
      'email': email,
    };
  }

  static PeamanUser fromJson(Map<String, dynamic> data) {
    final _ref = FirebaseFirestore.instance;

    return PeamanUser(
      uid: data['uid'],
      photoUrl: data['photoUrl'],
      name: data['name'],
      email: data['email'],
      onlineStatus: data['active_status'] == 1
          ? PeamanOnlineStatus.active
          : PeamanOnlineStatus.away,
      profileStatus: data['profile_status'] ?? 'I am a person with good heart',
      appUserRef: _ref.collection('users').doc(data['uid']),
      photos: data['photos'] ?? 0,
      followers: data['followers'] ?? 0,
      following: data['following'] ?? 0,
      notifCount: data['notification_count'] ?? 0,
      newFeeds: data['new_posts'] ?? false,
    );
  }

  DocumentReference getUserRef(final String uid) {
    final _ref = FirebaseFirestore.instance;
    return _ref.collection('users').doc(uid);
  }

  Future<PeamanUser?> fromRef(
      final DocumentReference<Map<String, dynamic>> userRef) async {
    final _userSnap = await userRef.get();

    if (_userSnap.exists) {
      final _userData = _userSnap.data();
      if (_userData != null) {
        return PeamanUser.fromJson(_userData);
      }
    }
  }
}
