class PeamanFollower {
  final String? uid;
  final int? createdAt;

  PeamanFollower({
    this.createdAt,
    this.uid,
  });

  static PeamanFollower fromJson(final Map<String, dynamic> data) {
    return PeamanFollower(
      uid: data['uid'],
      createdAt: data['created_at'],
    );
  }
}
