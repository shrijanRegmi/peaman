class PeamanBlockedByUser {
  final String? uid;
  final int? createdAt;
  final int? updatedAt;

  PeamanBlockedByUser({
    this.uid,
    this.createdAt,
    this.updatedAt,
  });

  static PeamanBlockedByUser fromJson(final Map<String, dynamic> data) {
    return PeamanBlockedByUser(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
