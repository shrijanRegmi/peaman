import '../peaman.dart';

class PeamanMessage {
  final String? id;
  final String? chatId;
  final String? text;
  final String? senderId;
  final List<String> receiverIds;
  final String? extraId;
  final PeamanMessageType type;
  final int? createdAt;
  final int? updatedAt;
  final Map<String, dynamic> extraData;

  PeamanMessage({
    this.id,
    this.chatId,
    this.text,
    this.senderId,
    this.receiverIds = const <String>[],
    this.extraId,
    this.type = PeamanMessageType.text,
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
    final PeamanMessageType? type,
    final int? createdAt,
    final int? updatedAt,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanMessage(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      text: text ?? this.text,
      senderId: senderId ?? this.senderId,
      receiverIds: receiverId ?? this.receiverIds,
      extraId: extraId ?? this.extraId,
      type: type ?? this.type,
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
      senderId: data['sender_id'],
      receiverIds: List<String>.from(data['receiver_ids'] ?? []),
      extraId: data['extra_id'],
      type: PeamanMessageType.values[data['type'] ?? 0],
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
      'sender_id': senderId,
      'receiver_ids': receiverIds,
      'extra_id': extraId,
      'type': type.index,
      'created_at': createdAt,
      'updated_at': updatedAt,
      ...extraData,
    };

    return _data..removeWhere((key, value) => value == null);
  }
}
