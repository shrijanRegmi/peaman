import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman/peaman.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class PeamanChat with _$PeamanChat {
  const factory PeamanChat({
    final String? id,
    @Default(PeamanChatType.oneToOne) final PeamanChatType type,
    final String? lastMessageId,
    final int? lastMessageCreatedAt,
    @Default(<String>[]) final List<String> userIds,
    @Default(<String>[]) final List<String> hiddenToUserIds,
    @Default(<String>[]) final List<String> archivedByUserIds,
    @Default(<String>[]) final List<String> typingUserIds,
    @Default(<String>[]) final List<String> pinnedChatUserIds,
    @Default(PeamanChatRequestStatus.idle)
        final PeamanChatRequestStatus chatRequestStatus,
    final String? chatRequestSenderId,
    @Default(0) final int totalSentMessages,
    @JsonKey(ignore: true)
    @Default(<PeamanChatSentMessage>[])
        final List<PeamanChatSentMessage> sentMessages,
    @JsonKey(ignore: true)
    @Default(<PeamanChatUnreadMessage>[])
        final List<PeamanChatUnreadMessage> unreadMessages,
    @JsonKey(ignore: true)
    @Default(<PeamanChatMessagesCursor>[])
        final List<PeamanChatMessagesCursor> messagesCursors,
    @JsonKey(ignore: true)
    @Default(<PeamanChatMutedUntil>[])
        final List<PeamanChatMutedUntil> mutedUntils,
    @JsonKey(ignore: true)
    @Default(<PeamanChatAddedBy>[])
        final List<PeamanChatAddedBy> addedBys,
    @JsonKey(ignore: true)
    @Default(<PeamanChatRemovedBy>[])
        final List<PeamanChatRemovedBy> removedBys,
    @Default(true) final bool visibility,
    final int? createdAt,
    final int? updatedAt,
    @JsonKey(ignore: true)
    @Default(<String, dynamic>{})
        final Map<String, dynamic> extraData,
  }) = _PeamanChat;

  factory PeamanChat.fromJson(Map<String, dynamic> data) =>
      _$PeamanChatFromJson(data).copyWith(
        sentMessages: _ListGenerator.getSentMessagesCountByUid(data),
        unreadMessages: _ListGenerator.getUnreadMessagesCountByUid(data),
        messagesCursors: _ListGenerator.getMessagesCursorsByUid(data),
        mutedUntils: _ListGenerator.getMutedUntilsByUid(data),
        addedBys: _ListGenerator.getAddedBysByUid(data),
        removedBys: _ListGenerator.getRemovedBysByUid(data),
        extraData: data,
      );
}

class _ListGenerator {
  static List<PeamanChatUnreadMessage> getUnreadMessagesCountByUid(
    final Map<String, dynamic> data,
  ) {
    final list = <PeamanChatUnreadMessage>[];
    data.forEach((key, value) {
      if (key.startsWith('z') && key.endsWith('unread_messages')) {
        final uid = key.split('_')[1];

        if (data[key] == null || data[key] is int) {
          final count = (data[key] ?? 0) as int;

          final unreadMessage = PeamanChatUnreadMessage(
            uid: uid,
            unreadMessagesCount: count,
          );

          list.add(unreadMessage);
        }
      }
    });
    return list;
  }

  static List<PeamanChatSentMessage> getSentMessagesCountByUid(
    final Map<String, dynamic> data,
  ) {
    final list = <PeamanChatSentMessage>[];
    data.forEach((key, value) {
      if (key.startsWith('z') && key.endsWith('sent_messages')) {
        final uid = key.split('_')[1];

        if (data[key] == null || data[key] is int) {
          final count = (data[key] ?? 0) as int;

          final unreadMessage = PeamanChatSentMessage(
            uid: uid,
            sentMessagesCount: count,
          );

          list.add(unreadMessage);
        }
      }
    });
    return list;
  }

  static List<PeamanChatMessagesCursor> getMessagesCursorsByUid(
    final Map<String, dynamic> data,
  ) {
    final list = <PeamanChatMessagesCursor>[];
    data.forEach((key, value) {
      if (key.startsWith('z') && key.endsWith('messages_cursor')) {
        final uid = key.split('_')[1];

        if (data[key] is Map<String, dynamic>) {
          final messagesCursor = PeamanChatMessagesCursor.fromJson(
            data[key],
          ).copyWith(uid: uid);

          list.add(messagesCursor);
        }
      }
    });
    return list;
  }

  static List<PeamanChatMutedUntil> getMutedUntilsByUid(
    final Map<String, dynamic> data,
  ) {
    final list = <PeamanChatMutedUntil>[];
    data.forEach((key, value) {
      if (key.startsWith('z') && key.endsWith('muted')) {
        final uid = key.split('_')[1];

        if (data[key] is Map<String, dynamic>) {
          final mutedUntil = PeamanChatMutedUntil.fromJson(
            data[key],
          ).copyWith(uid: uid);

          list.add(mutedUntil);
        }
      }
    });
    return list;
  }

  static List<PeamanChatAddedBy> getAddedBysByUid(
    final Map<String, dynamic> data,
  ) {
    final list = <PeamanChatAddedBy>[];
    data.forEach((key, value) {
      if (key.startsWith('z') && key.endsWith('added_by')) {
        final uid = key.split('_')[1];

        if (data[key] is Map<String, dynamic>) {
          final addedBy = PeamanChatAddedBy.fromJson(
            data[key],
          ).copyWith(uid: uid);

          list.add(addedBy);
        }
      }
    });
    return list;
  }

  static List<PeamanChatRemovedBy> getRemovedBysByUid(
    final Map<String, dynamic> data,
  ) {
    final list = <PeamanChatRemovedBy>[];
    data.forEach((key, value) {
      if (key.startsWith('z') && key.endsWith('removed_by')) {
        final uid = key.split('_')[1];

        if (data[key] is Map<String, dynamic>) {
          final removedBy = PeamanChatRemovedBy.fromJson(
            data[key],
          ).copyWith(uid: uid);

          list.add(removedBy);
        }
      }
    });
    return list;
  }
}
