class PeamanFollowing {
  final String? uid;
  final int? updatedAt;

  PeamanFollowing({
    this.updatedAt,
    this.uid,
  });

  static PeamanFollowing fromJson(final Map<String, dynamic> data) {
    return PeamanFollowing(
      uid: data['uid'],
      updatedAt: data['updated_at'],
    );
  }
}
