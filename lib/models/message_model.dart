import 'package:peaman/enums/message_type.dart';

class PeamanMessage {
  String? text;
  final String? senderId;
  final String? receiverId;
  final int? milliseconds;
  final PeamanMessageType? type;
  PeamanMessage({
    this.text,
    this.senderId,
    this.receiverId,
    this.milliseconds,
    this.type,
  });

  static Map<String, dynamic> toJson(PeamanMessage message) {
    return {
      'text': message.text,
      'senderId': message.senderId,
      'receiverId': message.receiverId,
      'milliseconds': message.milliseconds,
      'type': message.type?.index,
    };
  }

  static PeamanMessage fromJson(Map<String, dynamic> data) {
    if (data['type'] == PeamanMessageType?.Image.index) {
      return ImageMessage(
        text: data['text'],
        senderId: data['senderId'],
        receiverId: data['receiverId'],
        milliseconds: data['milliseconds'],
        type: PeamanMessageType.Image,
      );
    }
    return TextMessage(
      text: data['text'],
      senderId: data['senderId'],
      receiverId: data['receiverId'],
      milliseconds: data['milliseconds'],
      type: PeamanMessageType.Text,
    );
  }
}

class TextMessage extends PeamanMessage {
  String? text;
  final String? senderId;
  final String? receiverId;
  final int? milliseconds;
  final PeamanMessageType? type;

  TextMessage({
    this.text,
    this.senderId,
    this.receiverId,
    this.milliseconds,
    this.type,
  }) : super(
          text: text,
          senderId: senderId,
          receiverId: receiverId,
          milliseconds: milliseconds,
          type: PeamanMessageType.Text,
        );
}

class ImageMessage extends PeamanMessage {
  String? text;
  final String? senderId;
  final String? receiverId;
  final int? milliseconds;
  final PeamanMessageType? type;

  ImageMessage({
    this.text,
    this.senderId,
    this.receiverId,
    this.milliseconds,
    this.type,
  }) : super(
          text: text,
          senderId: senderId,
          receiverId: receiverId,
          milliseconds: milliseconds,
          type: PeamanMessageType.Image,
        );
}
