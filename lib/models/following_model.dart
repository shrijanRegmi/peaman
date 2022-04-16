class PeamanFollowing {
  final String? uid;
  final int? createdAt;
  final int? updatedAt;

  PeamanFollowing({
    this.uid,
    this.createdAt,
    this.updatedAt,
  });

  static PeamanFollowing fromJson(final Map<String, dynamic> data) {
    return PeamanFollowing(
      uid: data['uid'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
