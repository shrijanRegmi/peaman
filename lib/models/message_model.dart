import 'package:peaman/enums/message_type.dart';

class PeamanMessage {
  final String? id;
  final String? chatId;
  final String? text;
  final String? senderId;
  final String? receiverId;
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
    this.receiverId,
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
    final String? receiverId,
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
      receiverId: receiverId ?? this.receiverId,
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
      text: data['text'],
      senderId: data['sender_id'],
      receiverId: data['receiver_id'],
      extraId: data['extra_id'],
      type: PeamanMessageType.values[data['type'] ?? 0],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chat_id': chatId,
      'text': text,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'extra_id': extraId,
      'type': type.index,
      'created_at': createdAt,
      'updated_at': updatedAt,
      ...extraData,
    };
  }
}
