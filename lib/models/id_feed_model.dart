class IdFeed {
  final String? id;
  final int? createdAt;
  final int? updatedAt;

  IdFeed({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  static IdFeed fromJson(final Map<String, dynamic> data) {
    return IdFeed(
      id: data['id'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };

    return data..removeWhere((key, value) => value == null);
  }
}
