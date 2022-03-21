import 'package:peaman/enums/message_type.dart';

class PeamanMessage {
  final String? id;
  final String? chatId;
  final String? text;
  final String? senderId;
  final String? receiverId;
  final int? updatedAt;
  final String? momentId;
  final PeamanMessageType type;

  PeamanMessage({
    this.id,
    this.chatId,
    this.text,
    this.senderId,
    this.receiverId,
    this.updatedAt,
    this.momentId,
    this.type = PeamanMessageType.text,
  });

  PeamanMessage copyWith({
    final String? id,
    final String? chatId,
    final String? text,
    final String? senderId,
    final String? receiverId,
    final int? updatedAt,
    final String? momentId,
    final PeamanMessageType? type,
  }) {
    return PeamanMessage(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      text: text ?? this.text,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      updatedAt: updatedAt ?? this.updatedAt,
      momentId: momentId ?? this.momentId,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chat_id': chatId,
      'text': text,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'updated_at': updatedAt,
      'moment_id': momentId,
      'type': type.index,
    };
  }

  static PeamanMessage fromJson(Map<String, dynamic> data) {
    return PeamanMessage(
      id: data['id'],
      text: data['text'],
      senderId: data['sender_id'],
      receiverId: data['receiver_id'],
      updatedAt: data['updated_at'],
      momentId: data['moment_id'],
      type: PeamanMessageType.values[data['type'] ?? 0],
    );
  }
}
