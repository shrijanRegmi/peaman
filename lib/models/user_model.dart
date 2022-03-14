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
  final bool newFeeds;
  final List<String> searchKeys;
  final bool admin;
  final PeamanOnlineStatus onlineStatus;
  final int photos;
  final int followers;
  final int following;
  final int notifCount;
  final int likeableFeeds;
  final int likeableComments;
  final int likeableReplies;
  final int reactionsReceived;
  final int commentsReceived;
  final int repliesReceived;

  PeamanUser({
    this.uid,
    this.photoUrl,
    this.name,
    this.email,
    this.phone,
    this.country,
    this.bio,
    this.photos = 0,
    this.onlineStatus = PeamanOnlineStatus.away,
    this.newFeeds = false,
    this.searchKeys = const [],
    this.admin = false,
    this.followers = 0,
    this.following = 0,
    this.notifCount = 0,
    this.likeableFeeds = 0,
    this.likeableComments = 0,
    this.likeableReplies = 0,
    this.reactionsReceived = 0,
    this.commentsReceived = 0,
    this.repliesReceived = 0,
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
    final bool? admin,
    final int? likeableFeeds,
    final int? likeableComments,
    final int? likeableReplies,
    final int? reactionsReceived,
    final int? commentsReceived,
    final int? repliesReceived,
  }) {
    return PeamanUser(
      uid: uid ?? this.uid,
      photoUrl: photoUrl ?? this.photoUrl,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      country: country ?? this.country,
      bio: bio ?? this.bio,
      onlineStatus: onlineStatus ?? this.onlineStatus,
      photos: photos ?? this.photos,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      notifCount: notifCount ?? this.notifCount,
      newFeeds: newFeeds ?? this.newFeeds,
      searchKeys: searchKeys ?? this.searchKeys,
      admin: admin ?? this.admin,
      likeableFeeds: likeableFeeds ?? this.likeableFeeds,
      likeableComments: likeableComments ?? this.likeableComments,
      likeableReplies: likeableReplies ?? this.likeableReplies,
      reactionsReceived: reactionsReceived ?? this.reactionsReceived,
      commentsReceived: commentsReceived ?? this.commentsReceived,
      repliesReceived: repliesReceived ?? this.repliesReceived,
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

  static PeamanUser fromJson(Map<String, dynamic> data) {
    return PeamanUser(
      uid: data['uid'],
      photoUrl: data['photoUrl'],
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
      country: data['country'],
      bio: data['bio'],
      onlineStatus: PeamanOnlineStatus.values[data['active_status'] ?? 0],
      photos: data['photos'] ?? 0,
      followers: data['followers'] ?? 0,
      following: data['following'] ?? 0,
      notifCount: data['notification_count'] ?? 0,
      newFeeds: data['new_posts'] ?? false,
      searchKeys: List<String>.from(data['search_keys'] ?? []),
      admin: data['admin'] ?? false,
      likeableFeeds: data['likeable_feeds'] ?? 0,
      likeableComments: data['likeable_comments'] ?? 0,
      likeableReplies: data['likeable_replies'] ?? 0,
      reactionsReceived: data['reactions_received'] ?? 0,
      commentsReceived: data['comments_received'] ?? 0,
      repliesReceived: data['replies_received'] ?? 0,
    );
  }
}
