class PeamanBlockedUser {
  final String? uid;
  final int? createdAt;
  final int? updatedAt;

  PeamanBlockedUser({
    this.uid,
    this.createdAt,
    this.updatedAt,
  });

  static PeamanBlockedUser fromJson(final Map<String, dynamic> data) {
    return PeamanBlockedUser(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
