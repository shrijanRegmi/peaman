class PeamanFollower {
  final String? uid;
  final int? updatedAt;

  PeamanFollower({
    this.updatedAt,
    this.uid,
  });

  static PeamanFollower fromJson(final Map<String, dynamic> data) {
    return PeamanFollower(
      uid: data['uid'],
      updatedAt: data['updated_at'],
    );
  }
}
