class PeamanBlockedUser {
  final String? uid;
  final int? updatedAt;

  PeamanBlockedUser({
    this.updatedAt,
    this.uid,
  });

  static PeamanBlockedUser fromJson(final Map<String, dynamic> data) {
    return PeamanBlockedUser(
      uid: data['uid'],
      updatedAt: data['updated_at'],
    );
  }
}
