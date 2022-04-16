class PeamanNotification {
  final String? id;
  final String? senderId;
  final String? receiverId;
  final String title;
  final String body;
  final int? createdAt;
  final int? updatedAt;
  final Map<String, dynamic> extraData;

  PeamanNotification({
    this.id,
    this.senderId,
    this.receiverId,
    this.title = '',
    this.body = '',
    this.createdAt,
    this.updatedAt,
    this.extraData = const {},
  });

  static PeamanNotification fromJson(final Map<String, dynamic> data) {
    return PeamanNotification(
      id: data['id'],
      senderId: data['sender_id'],
      receiverId: data['receiver_id'],
      title: data['title'] ?? '',
      body: data['body'] ?? '',
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    final _data = {
      'id': id,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'title': title,
      'body': body,
      'created_at': createdAt,
      'updated_at': updatedAt,
      ...extraData,
    };

    _data.removeWhere((key, value) => value == null);

    return _data;
  }
}
