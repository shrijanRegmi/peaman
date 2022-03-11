class PeamanFollowRequest {
  final String? uid;
  final int? createdAt;
  final bool isAccepted;

  PeamanFollowRequest({
    this.createdAt,
    this.uid,
    this.isAccepted = false,
  });

  static PeamanFollowRequest fromJson(final Map<String, dynamic> data) {
    return PeamanFollowRequest(
      uid: data['uid'],
      createdAt: data['created_at'],
      isAccepted: data['is_accepted'] ?? false,
    );
  }
}
