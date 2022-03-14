import 'package:peaman/enums/message_type.dart';

class PeamanMessage {
  final String? id;
  final String? chatId;
  final String? text;
  final String? senderId;
  final String? receiverId;
  final int? milliseconds;
  final PeamanMessageType type;
  PeamanMessage({
    this.id,
    this.chatId,
    this.text,
    this.senderId,
    this.receiverId,
    this.milliseconds,
    this.type = PeamanMessageType.Text,
  });

  PeamanMessage copyWith({
    final String? id,
    final String? chatId,
    final String? text,
    final String? senderId,
    final String? receiverId,
    final int? milliseconds,
    final PeamanMessageType? type,
  }) {
    return PeamanMessage(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      text: text ?? this.text,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      milliseconds: milliseconds ?? this.milliseconds,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chat_id': chatId,
      'text': text,
      'senderId': senderId,
      'receiverId': receiverId,
      'milliseconds': milliseconds,
      'type': type.index,
    };
  }

  static PeamanMessage fromJson(Map<String, dynamic> data) {
    if (data['type'] == PeamanMessageType.Image.index) {
      return ImageMessage(
        id: data['id'],
        text: data['text'],
        senderId: data['senderId'],
        receiverId: data['receiverId'],
        milliseconds: data['milliseconds'],
        type: PeamanMessageType.Image,
      );
    }
    return TextMessage(
      id: data['id'],
      text: data['text'],
      senderId: data['senderId'],
      receiverId: data['receiverId'],
      milliseconds: data['milliseconds'],
      type: PeamanMessageType.Text,
    );
  }
}

class TextMessage extends PeamanMessage {
  final String? id;
  final String? chatId;
  final String? text;
  final String? senderId;
  final String? receiverId;
  final int? milliseconds;
  final PeamanMessageType type;

  TextMessage({
    this.id,
    this.chatId,
    this.text,
    this.senderId,
    this.receiverId,
    this.milliseconds,
    this.type = PeamanMessageType.Text,
  }) : super(
          id: id,
          text: text,
          senderId: senderId,
          receiverId: receiverId,
          milliseconds: milliseconds,
          type: PeamanMessageType.Text,
        );
}

class ImageMessage extends PeamanMessage {
  final String? id;
  final String? chatId;
  final String? text;
  final String? senderId;
  final String? receiverId;
  final int? milliseconds;
  final PeamanMessageType type;

  ImageMessage({
    this.id,
    this.chatId,
    this.text,
    this.senderId,
    this.receiverId,
    this.milliseconds,
    this.type = PeamanMessageType.Image,
  }) : super(
          id: id,
          chatId: chatId,
          text: text,
          senderId: senderId,
          receiverId: receiverId,
          milliseconds: milliseconds,
          type: PeamanMessageType.Image,
        );
}
