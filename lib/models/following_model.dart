class PeamanFollowing {
  final String? uid;
  final int? createdAt;

  PeamanFollowing({
    this.createdAt,
    this.uid,
  });

  static PeamanFollowing fromJson(final Map<String, dynamic> data) {
    return PeamanFollowing(
      uid: data['uid'],
      createdAt: data['created_at'],
    );
  }
}
