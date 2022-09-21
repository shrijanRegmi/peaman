class PeamanMessage {
  final String? id;
  final String? chatId;
  final String? text;
  final List<String> files;
  final String? senderId;
  final List<String> receiverIds;
  final String? extraId;
  final int? createdAt;
  final int? updatedAt;
  final Map<String, dynamic> extraData;

  PeamanMessage({
    this.id,
    this.chatId,
    this.text,
    this.files = const [],
    this.senderId,
    this.receiverIds = const <String>[],
    this.extraId,
    this.createdAt,
    this.updatedAt,
    this.extraData = const {},
  });

  PeamanMessage copyWith({
    final String? id,
    final String? chatId,
    final String? text,
    final String? senderId,
    final List<String>? receiverId,
    final String? extraId,
    final List<String>? files,
    final int? createdAt,
    final int? updatedAt,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanMessage(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      text: text ?? this.text,
      files: files ?? this.files,
      senderId: senderId ?? this.senderId,
      receiverIds: receiverId ?? this.receiverIds,
      extraId: extraId ?? this.extraId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanMessage fromJson(Map<String, dynamic> data) {
    return PeamanMessage(
      id: data['id'],
      chatId: data['chat_id'],
      text: data['text'],
      files: List<String>.from(data['files'] ?? []),
      senderId: data['sender_id'],
      receiverIds: List<String>.from(data['receiver_ids'] ?? []),
      extraId: data['extra_id'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{
      'id': id,
      'chat_id': chatId,
      'text': text,
      'files': files,
      'sender_id': senderId,
      'receiver_ids': receiverIds,
      'extra_id': extraId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      ...extraData,
    };

    return _data..removeWhere((key, value) => value == null);
  }
}
