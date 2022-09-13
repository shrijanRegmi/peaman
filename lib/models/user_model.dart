import 'package:peaman/enums/gender.dart';
import 'package:peaman/enums/online_status.dart';

class PeamanUser {
  final String? uid;
  final String? name;
  final String? userName;
  final String? email;
  final String? photo;
  final String? phone;
  final String? country;
  final String? bio;
  final String? profession;
  final PeamanGender gender;
  final int? dob;
  final List<String> searchKeys;
  final PeamanOnlineStatus onlineStatus;
  final int? lastOnlineAt;
  final int photos;
  final int followers;
  final int following;
  final int reactionsReceivedFromFeeds;
  final int commentsReceivedFromFeeds;
  final int repliesReceivedFromFeeds;
  final int sharesReceivedFromFeeds;
  final int viewsReceivedFromFeeds;
  final bool admin;
  final bool editor;
  final bool tester;
  final int onboardingStep;
  final bool onboardingCompleted;
  final double? latitude;
  final double? longitude;
  final int? createdAt;
  final Map<String, dynamic> extraData;

  PeamanUser({
    this.uid,
    this.name,
    this.userName,
    this.email,
    this.photo,
    this.phone,
    this.country,
    this.bio,
    this.gender = PeamanGender.np,
    this.dob,
    this.profession,
    this.photos = 0,
    this.onlineStatus = PeamanOnlineStatus.away,
    this.lastOnlineAt,
    this.searchKeys = const [],
    this.followers = 0,
    this.following = 0,
    this.reactionsReceivedFromFeeds = 0,
    this.commentsReceivedFromFeeds = 0,
    this.repliesReceivedFromFeeds = 0,
    this.sharesReceivedFromFeeds = 0,
    this.viewsReceivedFromFeeds = 0,
    this.admin = false,
    this.editor = false,
    this.tester = false,
    this.onboardingStep = 0,
    this.onboardingCompleted = false,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.extraData = const {},
  });

  PeamanUser copyWith({
    final String? uid,
    final String? name,
    final String? userName,
    final String? email,
    final String? photo,
    final String? phone,
    final String? country,
    final String? bio,
    final PeamanGender? gender,
    final int? dob,
    final String? profession,
    final String? profileStatus,
    final PeamanOnlineStatus? onlineStatus,
    final int? lastOnlineAt,
    final int? photos,
    final int? followers,
    final int? following,
    final List<String>? searchKeys,
    final int? reactionsReceivedFromFeeds,
    final int? commentsReceivedFromFeeds,
    final int? repliesReceivedFromFeeds,
    final int? sharesReceivedFromFeeds,
    final int? viewsReceivedFromFeeds,
    final bool? admin,
    final bool? editor,
    final bool? tester,
    final int? onboardingStep,
    final bool? onboardingCompleted,
    final int? createdAt,
    final double? latitude,
    final double? longitude,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanUser(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      photo: photo ?? this.photo,
      phone: phone ?? this.phone,
      country: country ?? this.country,
      bio: bio ?? this.bio,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      profession: profession ?? this.profession,
      onlineStatus: onlineStatus ?? this.onlineStatus,
      lastOnlineAt: lastOnlineAt ?? this.lastOnlineAt,
      photos: photos ?? this.photos,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      searchKeys: searchKeys ?? this.searchKeys,
      reactionsReceivedFromFeeds:
          reactionsReceivedFromFeeds ?? this.reactionsReceivedFromFeeds,
      commentsReceivedFromFeeds:
          commentsReceivedFromFeeds ?? this.commentsReceivedFromFeeds,
      repliesReceivedFromFeeds:
          repliesReceivedFromFeeds ?? this.repliesReceivedFromFeeds,
      sharesReceivedFromFeeds:
          sharesReceivedFromFeeds ?? this.sharesReceivedFromFeeds,
      viewsReceivedFromFeeds:
          viewsReceivedFromFeeds ?? this.viewsReceivedFromFeeds,
      createdAt: createdAt ?? this.createdAt,
      admin: admin ?? this.admin,
      editor: editor ?? this.editor,
      tester: tester ?? this.tester,
      onboardingStep: onboardingStep ?? this.onboardingStep,
      onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      extraData: extraData ?? this.extraData,
    );
  }

  Map<String, dynamic> toJson() {
    final _data = {
      'uid': uid,
      'name': name,
      'user_name': userName,
      'email': email,
      'photo': photo,
      'phone': phone,
      'country': country,
      'bio': bio,
      'gender': gender.index,
      'dob': dob,
      'profession': profession,
      'online_status': onlineStatus.index,
      'last_online_at': lastOnlineAt,
      'photos': photos,
      'followers': followers,
      'following': following,
      'search_keys': searchKeys,
      'reactions_received_from_feeds': reactionsReceivedFromFeeds,
      'comments_received_from_feeds': commentsReceivedFromFeeds,
      'replies_received_from_feeds': repliesReceivedFromFeeds,
      'shares_received_from_feeds': sharesReceivedFromFeeds,
      'views_received_from_feeds': viewsReceivedFromFeeds,
      'admin': admin,
      'editor': editor,
      'tester': tester,
      'onboarding_step': onboardingStep,
      'onboarding_completed': onboardingCompleted,
      'latitude': latitude,
      'longitude': longitude,
      'created_at': createdAt,
      ...extraData,
    };

    _data.removeWhere((key, value) => value == null);

    return _data;
  }

  static PeamanUser fromJson(Map<String, dynamic> data) {
    return PeamanUser(
      uid: data['uid'],
      photo: data['photo'],
      name: data['name'],
      userName: data['user_name'],
      email: data['email'],
      phone: data['phone'],
      country: data['country'],
      bio: data['bio'],
      dob: data['dob'],
      gender: PeamanGender.values[data['gender'] ?? 0],
      profession: data['profession'],
      onlineStatus: PeamanOnlineStatus.values[data['online_status'] ?? 0],
      lastOnlineAt: data['last_online_at'],
      photos: data['photos'] ?? 0,
      followers: data['followers'] ?? 0,
      following: data['following'] ?? 0,
      searchKeys: List<String>.from(data['search_keys'] ?? []),
      reactionsReceivedFromFeeds: data['reactions_received_from_feeds'] ?? 0,
      commentsReceivedFromFeeds: data['comments_received_from_feeds'] ?? 0,
      repliesReceivedFromFeeds: data['replies_received_from_feeds'] ?? 0,
      sharesReceivedFromFeeds: data['shares_received_from_feeds'] ?? 0,
      viewsReceivedFromFeeds: data['views_received_from_feeds'] ?? 0,
      admin: data['admin'] ?? false,
      editor: data['editor'] ?? false,
      tester: data['tester'] ?? false,
      onboardingStep: data['onboarding_step'] ?? 0,
      onboardingCompleted: data['onboarding_completed'] ?? false,
      latitude: data['latitude'],
      longitude: data['longitude'],
      createdAt: data['created_at'],
      extraData: data,
    );
  }
}

class PeamanUserUpdater {
  String? uid;
  String? name;
  String? userName;
  String? email;
  String? photo;
  String? phone;
  String? country;
  String? bio;
  String? profession;
  PeamanGender? gender;
  int? dob;
  List<String>? searchKeys;
  PeamanOnlineStatus? onlineStatus;
  int? lastOnlineAt;
  int? photos;
  int? followers;
  int? following;
  int? reactionsReceivedFromFeeds;
  int? commentsReceivedFromFeeds;
  int? repliesReceivedFromFeeds;
  int? sharesReceivedFromFeeds;
  int? viewsReceivedFromFeeds;
  bool? admin;
  bool? editor;
  bool? tester;
  int? onboardingStep;
  bool? onboardingCompleted;
  double? latitude;
  double? longitude;
  int? createdAt;
  Map<String, dynamic> extraData;

  PeamanUserUpdater({
    this.uid,
    this.name,
    this.userName,
    this.email,
    this.photo,
    this.phone,
    this.country,
    this.bio,
    this.gender,
    this.dob,
    this.profession,
    this.photos,
    this.onlineStatus,
    this.lastOnlineAt,
    this.searchKeys,
    this.followers,
    this.following,
    this.reactionsReceivedFromFeeds,
    this.commentsReceivedFromFeeds,
    this.repliesReceivedFromFeeds,
    this.sharesReceivedFromFeeds,
    this.viewsReceivedFromFeeds,
    this.admin,
    this.editor,
    this.tester,
    this.onboardingStep,
    this.onboardingCompleted,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.extraData = const {},
  });

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{
      'uid': uid,
      'name': name,
      'user_name': userName,
      'email': email,
      'photo': photo,
      'phone': phone,
      'country': country,
      'bio': bio,
      'gender': gender?.index,
      'dob': dob,
      'profession': profession,
      'online_status': onlineStatus?.index,
      'last_online_at': lastOnlineAt,
      'photos': photos,
      'followers': followers,
      'following': following,
      'search_keys': searchKeys,
      'reactions_received_from_feeds': reactionsReceivedFromFeeds,
      'comments_received_from_feeds': commentsReceivedFromFeeds,
      'replies_received_from_feeds': repliesReceivedFromFeeds,
      'shares_received_from_feeds': sharesReceivedFromFeeds,
      'views_received_from_feeds': viewsReceivedFromFeeds,
      'admin': admin,
      'editor': editor,
      'tester': tester,
      'onboarding_step': onboardingStep,
      'onboarding_completed': onboardingCompleted,
      'latitude': latitude,
      'longitude': longitude,
      'created_at': createdAt,
      ...extraData,
    };

    _data.removeWhere((key, value) => value == null);
    return _data;
  }
}
