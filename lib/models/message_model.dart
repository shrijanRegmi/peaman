import 'package:peaman/peaman.dart';

class PeamanMessage {
  final String? id;
  final String? chatId;
  final String? text;
  final List<PeamanFileUrl> files;
  final PeamanMessageType type;
  final String? senderId;
  final List<String> receiverIds;
  final String? extraId;
  final int? createdAt;
  final int? updatedAt;
  final bool visibility;
  final Map<String, dynamic> extraData;

  PeamanMessage({
    this.id,
    this.chatId,
    this.text,
    this.files = const [],
    this.senderId,
    this.type = PeamanMessageType.text,
    this.receiverIds = const <String>[],
    this.extraId,
    this.createdAt,
    this.updatedAt,
    this.visibility = true,
    this.extraData = const {},
  });

  PeamanMessage copyWith({
    final String? id,
    final String? chatId,
    final String? text,
    final String? senderId,
    final List<String>? receiverId,
    final String? extraId,
    final List<PeamanFileUrl>? files,
    final PeamanMessageType? type,
    final int? createdAt,
    final int? updatedAt,
    final bool? visibility,
    final Map<String, dynamic>? extraData,
  }) {
    return PeamanMessage(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      text: text ?? this.text,
      files: files ?? this.files,
      senderId: senderId ?? this.senderId,
      type: type ?? this.type,
      receiverIds: receiverId ?? this.receiverIds,
      extraId: extraId ?? this.extraId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      visibility: visibility ?? this.visibility,
      extraData: extraData ?? this.extraData,
    );
  }

  static PeamanMessage fromJson(Map<String, dynamic> data) {
    return PeamanMessage(
      id: data['id'],
      chatId: data['chat_id'],
      text: data['text'],
      files: List<PeamanFileUrl>.from(
        (data['files'] ?? []).map((e) => PeamanFileUrl.fromJson(e)).toList(),
      ),
      senderId: data['sender_id'],
      type: PeamanMessageType.values[data['type'] ?? 0],
      receiverIds: List<String>.from(data['receiver_ids'] ?? []),
      extraId: data['extra_id'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      visibility: data['visibility'] ?? true,
      extraData: data,
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{
      'id': id,
      'chat_id': chatId,
      'text': text,
      'files': files.map((e) => e.toJson()).toList(),
      'sender_id': senderId,
      'type': type.index,
      'receiver_ids': receiverIds,
      'extra_id': extraId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'visibility': visibility,
      ...extraData,
    };

    return _data..removeWhere((key, value) => value == null);
  }
}
