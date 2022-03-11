class PeamanReaction {
  final String? uid;
  final bool unreacted;
  final int? createdAt;
  PeamanReaction({
    this.uid,
    this.unreacted = false,
    this.createdAt,
  });

  static PeamanReaction fromJson(final Map<String, dynamic> data) {
    return PeamanReaction(
      uid: data['uid'],
      unreacted: data['unreacted'] ?? false,
      createdAt: data['updated_at'],
    );
  }
}
