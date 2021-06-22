import 'package:peaman/enums/message_type.dart';

class PeamanMessage {
  final String? id;
  final String text;
  final String senderId;
  final String receiverId;
  final int milliseconds;
  final PeamanMessageType type;
  PeamanMessage({
    required this.id,
    required this.text,
    required this.senderId,
    required this.receiverId,
    required this.milliseconds,
    required this.type,
  });

  PeamanMessage copyWith({
    final String? id,
    final String? text,
    final String? senderId,
    final String? receiverId,
    final int? milliseconds,
    final PeamanMessageType? type,
  }) {
    return PeamanMessage(
      id: id ?? this.id,
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
  final String text;
  final String senderId;
  final String receiverId;
  final int milliseconds;
  final PeamanMessageType type;

  TextMessage({
    required this.id,
    required this.text,
    required this.senderId,
    required this.receiverId,
    required this.milliseconds,
    required this.type,
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
  final String text;
  final String senderId;
  final String receiverId;
  final int milliseconds;
  final PeamanMessageType type;

  ImageMessage({
    required this.id,
    required this.text,
    required this.senderId,
    required this.receiverId,
    required this.milliseconds,
    required this.type,
  }) : super(
          id: id,
          text: text,
          senderId: senderId,
          receiverId: receiverId,
          milliseconds: milliseconds,
          type: PeamanMessageType.Image,
        );
}
