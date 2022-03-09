import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/enums/online_status.dart';

class PeamanUser {
  final String? uid;
  final String? photoUrl;
  final String? name;
  final String? email;
  final String? phone;
  final String? country;
  final String? bio;
  final String? profileStatus;
  final PeamanOnlineStatus? onlineStatus;
  final DocumentReference? appUserRef;
  final int? photos;
  final int? followers;
  final int? following;
  final int? notifCount;
  final bool? newFeeds;
  final List<String> searchKeys;

  PeamanUser({
    this.uid,
    this.photoUrl,
    this.name,
    this.email,
    this.phone,
    this.country,
    this.bio,
    this.appUserRef,
    this.photos = 0,
    this.profileStatus = '',
    this.onlineStatus = PeamanOnlineStatus.away,
    this.followers = 0,
    this.following = 0,
    this.notifCount = 0,
    this.newFeeds = false,
    this.searchKeys = const [],
  });

  PeamanUser copyWith({
    final String? uid,
    final String? photoUrl,
    final String? name,
    final String? email,
    final String? phone,
    final String? country,
    final String? bio,
    final String? profileStatus,
    final PeamanOnlineStatus? onlineStatus,
    final DocumentReference? appUserRef,
    final int? photos,
    final int? followers,
    final int? following,
    final int? notifCount,
    final bool? newFeeds,
    final List<String>? searchKeys,
  }) {
    return PeamanUser(
      uid: uid ?? this.uid,
      photoUrl: photoUrl ?? this.photoUrl,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      country: phone ?? this.phone,
      bio: bio ?? this.bio,
      profileStatus: profileStatus ?? this.profileStatus,
      onlineStatus: onlineStatus ?? this.onlineStatus,
      appUserRef: appUserRef ?? this.appUserRef,
      photos: photos ?? this.photos,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      notifCount: notifCount ?? this.notifCount,
      newFeeds: newFeeds ?? this.newFeeds,
      searchKeys: searchKeys ?? this.searchKeys,
    );
  }

  Map<String, dynamic> toJson() {
    final _data = {
      'uid': uid,
      'photoUrl': photoUrl,
      'name': name,
      'email': email,
      'phone': phone,
      'country': country,
      'bio': bio,
      'search_keys': searchKeys,
    };

    _data.removeWhere((key, value) => value == null);

    return _data;
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
      phone: data['phone'],
      country: data['country'],
      bio: data['bio'],
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
      searchKeys: List<String>.from(data['search_keys'] ?? []),
    );
  }

  DocumentReference getUserRef(final String uid) {
    final _ref = FirebaseFirestore.instance;
    return _ref.collection('users').doc(uid);
  }

  Future<PeamanUser?> fromRef(
    final DocumentReference<Map<String, dynamic>> userRef,
  ) async {
    final _userSnap = await userRef.get();

    if (_userSnap.exists) {
      final _userData = _userSnap.data();
      if (_userData != null) {
        return PeamanUser.fromJson(_userData);
      }
    }

    return null;
  }
}
