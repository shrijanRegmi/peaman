import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';

import '../../../../helpers/async_call_helper.dart';
import '../../../../helpers/common_helper.dart';
import '../../../../helpers/reference_helper.dart';
import '../../shared/models/peaman_error.dart';
import '../enums/chat_request_status.dart';
import '../enums/chat_typing_status.dart';
import '../models/chat_file_model.dart';
import '../models/chat_model.dart';
import '../models/chat_message_model.dart';
import '../../shared/models/peaman_field.dart';
import '../../../utils/query_type_def.dart';

abstract class PeamanChatRepository {
  Future<Either<PeamanChat, PeamanError>> createChat({
    required final PeamanChat chat,
  });

  Future<Either<bool, PeamanError>> updateChat({
    required final String chatId,
    required final List<PeamanField> fields,
  });

  Future<Either<bool, PeamanError>> deleteChat({
    required final String uid,
    required final String chatId,
    required final int lastMessageCreatedAt,
  });

  Future<Either<bool, PeamanError>> archiveChat({
    required final String uid,
    required final String chatId,
  });

  Future<Either<PeamanChatMessage, PeamanError>> createChatMessage({
    required final PeamanChatMessage message,
  });

  Future<Either<bool, PeamanError>> updateChatMessage({
    required final String chatId,
    required final String messageId,
    required final List<PeamanField> fields,
  });

  Future<Either<bool, PeamanError>> deleteChatMessage({
    required final String chatId,
    required final String messageId,
  });

  Future<Either<bool, PeamanError>> unsendChatMessage({
    required final String chatId,
    required final String messageId,
  });

  Future<Either<bool, PeamanError>> readChatMessages({
    required final String chatId,
    required final String uid,
  });

  Future<Either<bool, PeamanError>> setTypingStatus({
    required final String chatId,
    required final String uid,
    required final PeamanChatTypingStatus typingStatus,
  });

  Future<Either<bool, PeamanError>> acceptChatRequest({
    required final String chatId,
  });

  Future<Either<bool, PeamanError>> declineChatRequest({
    required final String chatId,
  });

  Future<Either<List<PeamanChat>, PeamanError>> getChats({
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanChat>> getChatsStream({
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanChat>, PeamanError>> getUserChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanChat>> getUserChatsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<PeamanChat, PeamanError>> getSingleChat({
    required final String chatId,
  });

  Stream<PeamanChat> getSingleChatStream({
    required final String chatId,
  });

  Future<Either<List<PeamanChat>, PeamanError>> getIdleChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanChat>> getIdleChatsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanChat>, PeamanError>> getAcceptedChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanChat>> getAcceptedChatsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanChat>, PeamanError>> getDeclinedChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanChat>> getDeclinedChatsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanChatMessage>, PeamanError>> getChatMessages({
    required final String chatId,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanChatMessage>> getChatMessagesStream({
    required final String chatId,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<PeamanChatMessage, PeamanError>> getSingleChatMessage({
    required final String chatId,
    required final String messageId,
  });

  Stream<PeamanChatMessage> getSingleChatMessageStream({
    required final String chatId,
    required final String messageId,
  });
}

class PeamanChatRepositoryImpl extends PeamanChatRepository {
  @override
  Future<Either<bool, PeamanError>> acceptChatRequest({
    required String chatId,
  }) {
    return updateChat(
      chatId: chatId,
      fields: [
        PeamanField(
          key: 'chat_request_status',
          value: ksPeamanChatRequestStatus[PeamanChatRequestStatus.accepted],
        ),
      ],
    );
  }

  @override
  Future<Either<bool, PeamanError>> archiveChat({
    required String uid,
    required String chatId,
  }) {
    return updateChat(
      chatId: chatId,
      fields: [
        PeamanField.positivePartial(
          key: 'hidden_to_user_ids',
          value: [uid],
        ),
        PeamanField.positivePartial(
          key: 'archived_by_user_ids',
          value: [uid],
        ),
      ],
    );
  }

  @override
  Future<Either<bool, PeamanError>> declineChatRequest({
    required String chatId,
  }) {
    return updateChat(
      chatId: chatId,
      fields: [
        PeamanField(
          key: 'chat_request_status',
          value: ksPeamanChatRequestStatus[PeamanChatRequestStatus.declined],
        ),
      ],
    );
  }

  @override
  Future<Either<bool, PeamanError>> deleteChat({
    required String uid,
    required String chatId,
    required int lastMessageCreatedAt,
  }) {
    return updateChat(
      chatId: chatId,
      fields: [
        PeamanField.positivePartial(
          key: 'hidden_to_user_ids',
          value: [uid],
        ),
        PeamanField(
          key: 'z_${uid}_start_after',
          value: lastMessageCreatedAt,
        ),
      ],
    );
  }

  @override
  Future<Either<bool, PeamanError>> deleteChatMessage({
    required String chatId,
    required String messageId,
  }) {
    return runAsyncCall(
      future: () async {
        final _messageRef =
            PeamanReferenceHelper.messagesCol(chatId: chatId).doc(messageId);
        await _messageRef.delete();
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> unsendChatMessage({
    required String chatId,
    required String messageId,
  }) {
    return updateChatMessage(
      chatId: chatId,
      messageId: messageId,
      fields: [
        PeamanField(
          key: 'unsent',
          value: true,
        ),
      ],
    );
  }

  @override
  Future<Either<List<PeamanChat>, PeamanError>> getAcceptedChats({
    required final String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return getUserChats(
      uid: uid,
      query: (ref) {
        final _ref = ref.where(
          'chat_request_status',
          isEqualTo:
              ksPeamanChatRequestStatus[PeamanChatRequestStatus.accepted],
        );
        final _query = query?.call(ref) ?? _ref;
        return _query;
      },
    );
  }

  @override
  Stream<List<PeamanChat>> getAcceptedChatsStream({
    required final String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return getUserChatsStream(
      uid: uid,
      query: (ref) {
        final _ref = ref.where(
          'chat_request_status',
          isEqualTo:
              ksPeamanChatRequestStatus[PeamanChatRequestStatus.accepted],
        );
        final _query = query?.call(ref) ?? _ref;
        return _query;
      },
    );
  }

  @override
  Future<Either<List<PeamanChatMessage>, PeamanError>> getChatMessages({
    required final String chatId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.messagesCol(chatId: chatId)
            .where('visibility', isEqualTo: true)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        return _query
            .get()
            .then((event) => Left(_messagesFromFirestore(event)));
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanChatMessage>> getChatMessagesStream({
    required final String chatId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.messagesCol(chatId: chatId)
        .where('visibility', isEqualTo: true)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_messagesFromFirestore);
  }

  @override
  Future<Either<List<PeamanChat>, PeamanError>> getChats({
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.chatsCol
            .where('visibility', isEqualTo: true)
            .orderBy('updated_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        return _query.get().then((event) => Left(_chatsFromFirestore(event)));
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanChat>> getChatsStream({
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.chatsCol
        .where('visibility', isEqualTo: true)
        .orderBy('updated_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_chatsFromFirestore);
  }

  @override
  Future<Either<List<PeamanChat>, PeamanError>> getUserChats({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return getChats(
      query: (ref) {
        final _ref = ref.where('user_ids', arrayContains: uid);
        final _query = query?.call(_ref) ?? _ref;
        return _query;
      },
    );
  }

  @override
  Stream<List<PeamanChat>> getUserChatsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return getChatsStream(
      query: (ref) {
        final _ref = ref.where('user_ids', arrayContains: uid);
        final _query = query?.call(_ref) ?? _ref;
        return _query;
      },
    );
  }

  @override
  Future<Either<List<PeamanChat>, PeamanError>> getDeclinedChats({
    required final String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return getUserChats(
      uid: uid,
      query: (ref) {
        final _ref = ref.where(
          'chat_request_status',
          isEqualTo:
              ksPeamanChatRequestStatus[PeamanChatRequestStatus.declined],
        );
        final _query = query?.call(ref) ?? _ref;
        return _query;
      },
    );
  }

  @override
  Stream<List<PeamanChat>> getDeclinedChatsStream({
    required final String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return getUserChatsStream(
      uid: uid,
      query: (ref) {
        final _ref = ref.where(
          'chat_request_status',
          isEqualTo:
              ksPeamanChatRequestStatus[PeamanChatRequestStatus.declined],
        );
        final _query = query?.call(ref) ?? _ref;
        return _query;
      },
    );
  }

  @override
  Future<Either<List<PeamanChat>, PeamanError>> getIdleChats({
    required final String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return getUserChats(
      uid: uid,
      query: (ref) {
        final _ref = ref.where(
          'chat_request_status',
          isEqualTo: ksPeamanChatRequestStatus[PeamanChatRequestStatus.idle],
        );
        final _query = query?.call(ref) ?? _ref;
        return _query;
      },
    );
  }

  @override
  Stream<List<PeamanChat>> getIdleChatsStream({
    required final String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return getUserChatsStream(
      uid: uid,
      query: (ref) {
        final _ref = ref.where(
          'chat_request_status',
          isEqualTo: ksPeamanChatRequestStatus[PeamanChatRequestStatus.idle],
        );
        final _query = query?.call(ref) ?? _ref;
        return _query;
      },
    );
  }

  @override
  Future<Either<PeamanChat, PeamanError>> getSingleChat({
    required String chatId,
  }) {
    return runAsyncCall(
      future: () async {
        final _chatRef = PeamanReferenceHelper.chatDoc(chatId: chatId);

        final _chatSnap = await _chatRef.get();
        if (!_chatSnap.exists) throw Exception('Chat not found!');

        final _chatData = _chatSnap.data();
        if (_chatData == null) throw Exception('Chat not found!');

        final _chat = PeamanChat.fromJson(_chatData);
        return Left(_chat);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<PeamanChatMessage, PeamanError>> getSingleChatMessage({
    required String chatId,
    required String messageId,
  }) {
    return runAsyncCall(
      future: () async {
        final _messageRef =
            PeamanReferenceHelper.messagesCol(chatId: chatId).doc(messageId);

        final _messageSnap = await _messageRef.get();
        if (!_messageSnap.exists) throw Exception('Message not found!');

        final _messageData = _messageSnap.data();
        if (_messageData == null) throw Exception('Message not found!');

        final _message = PeamanChatMessage.fromJson(_messageData);
        return Left(_message);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<PeamanChatMessage> getSingleChatMessageStream({
    required String chatId,
    required String messageId,
  }) {
    return PeamanReferenceHelper.messagesCol(chatId: chatId)
        .doc(messageId)
        .snapshots()
        .map(_messageFromFirestore);
  }

  @override
  Stream<PeamanChat> getSingleChatStream({
    required String chatId,
  }) {
    return PeamanReferenceHelper.chatDoc(chatId: chatId)
        .snapshots()
        .map(_chatFromFirestore);
  }

  @override
  Future<Either<bool, PeamanError>> readChatMessages({
    required String chatId,
    required String uid,
  }) {
    return runAsyncCall(
      future: () async {
        final _chatRef = PeamanReferenceHelper.chatsCol.doc(chatId);
        await _chatRef.update({
          'z_${uid}_unread_messages': FieldValue.delete(),
        });
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> setTypingStatus({
    required String chatId,
    required String uid,
    required PeamanChatTypingStatus typingStatus,
  }) {
    return runAsyncCall(
      future: () async {
        final _chatRef = PeamanReferenceHelper.chatsCol.doc(chatId);
        await _chatRef.update({
          'typing_user_ids': typingStatus == PeamanChatTypingStatus.typing
              ? FieldValue.arrayUnion([uid])
              : FieldValue.arrayRemove([uid])
        });
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> updateChat({
    required String chatId,
    required List<PeamanField> fields,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final _chatRef = PeamanReferenceHelper.chatDoc(chatId: chatId);
        final _data = PeamanCommonHelper.prepareDataToUpdate(fields: fields);
        if (_data.isNotEmpty) {
          await _chatRef.update({
            ..._data,
            'updated_at': _millis,
          });
        }
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> updateChatMessage({
    required String chatId,
    required final String messageId,
    required final List<PeamanField> fields,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final _messageRef =
            PeamanReferenceHelper.messagesCol(chatId: chatId).doc(messageId);
        final _data = PeamanCommonHelper.prepareDataToUpdate(fields: fields);
        if (_data.isNotEmpty) {
          await _messageRef.update({
            ..._data,
            'updated_at': _millis,
          });
        }
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<PeamanChat, PeamanError>> createChat({
    required PeamanChat chat,
  }) {
    return runAsyncCall(
      future: () async {
        final _chatRef = PeamanReferenceHelper.chatsCol.doc();
        final _chat = chat.copyWith(id: _chatRef.id);
        await _chatRef.set(_chat.toJson());
        return Left(_chat);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<PeamanChatMessage, PeamanError>> createChatMessage({
    required PeamanChatMessage message,
  }) {
    return runAsyncCall(
      future: () async {
        if (message.senderId == null) {
          throw Exception("senderId cannot be null");
        } else if (message.receiverIds.isEmpty) {
          throw Exception("receiverIds cannot be empty");
        }
        final _currentMillis = DateTime.now().millisecondsSinceEpoch;

        final _chatRef = PeamanReferenceHelper.chatDoc(chatId: message.chatId);
        final _messagesRef =
            PeamanReferenceHelper.messagesCol(chatId: _chatRef.id);

        final _messagesDocs = await _messagesRef.limit(2).get();

        if (_messagesDocs.docs.isEmpty) {
          await _chatRef.set({
            'id': _chatRef.id,
            'visibility': true,
            'created_at': _currentMillis,
          });
        }

        final _chatUpdateData = <String, dynamic>{};

        _chatUpdateData['total_sent_messages'] = FieldValue.increment(1);
        _chatUpdateData['z_${message.senderId}_sent_messages'] =
            FieldValue.increment(1);
        _chatUpdateData['user_ids'] = FieldValue.arrayUnion(
          List<String>.from(message.receiverIds)..add(message.senderId!),
        );
        _chatUpdateData['hidden_to_user_ids'] = [];
        _chatUpdateData['archived_by_user_ids'] = [];
        for (final receiverId in message.receiverIds) {
          _chatUpdateData['z_${receiverId}_unread_messages'] =
              FieldValue.increment(1);
        }

        final _lastMsgRef = _messagesRef.doc();
        final _message = message.copyWith(
          id: _lastMsgRef.id,
          chatId: _chatRef.id,
          createdAt: message.createdAt ?? _currentMillis,
          updatedAt: message.updatedAt ?? _currentMillis,
        );

        final _futures = <Future>[];

        final _lastMsgFuture = _lastMsgRef.set(_message.toJson());
        _futures.add(_lastMsgFuture);

        _chatUpdateData['updated_at'] = _currentMillis;
        _chatUpdateData['last_message_id'] = _message.id;

        final _chatUpdateFuture = _chatRef.update(_chatUpdateData);
        _futures.add(_chatUpdateFuture);

        if (_messagesDocs.docs.isEmpty) {
          final _additionalPropertiesFuture = _sendAdditionalProperties(
            message: _message,
          );
          _futures.add(_additionalPropertiesFuture);
        }

        if (_message.files.isNotEmpty) {
          final _mediaInfoFuture = _sendMediaInformation(message: _message);
          _futures.add(_mediaInfoFuture);
        }

        await Future.wait(_futures);
        return Left(message);
      },
      onError: Right.new,
    );
  }

  Future<void> _sendAdditionalProperties({
    required final PeamanChatMessage message,
  }) {
    return runAsyncCall(
      future: () {
        final _chatRef = PeamanReferenceHelper.chatsCol.doc(message.chatId);
        return _chatRef.update({
          'user_ids': message.receiverIds..add(message.senderId!),
          'chat_request_status': PeamanChatRequestStatus.idle.index,
          'chat_request_sender_id': message.senderId,
        });
      },
      onError: (e) {},
    );
  }

  Future<void> _sendMediaInformation({
    required final PeamanChatMessage message,
  }) {
    return runAsyncCall(
      future: () {
        final _fileRef = PeamanReferenceHelper.chatFilesCol(
          chatId: message.chatId!,
        ).doc();

        final file = PeamanChatFile(
          id: _fileRef.id,
          urls: message.files,
          createdAt: message.createdAt,
          updatedAt: message.updatedAt,
        );

        return _fileRef.set(file.toJson());
      },
      onError: (e) {},
    );
  }

  List<PeamanChat> _chatsFromFirestore(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((doc) {
      return PeamanChat.fromJson(doc.data());
    }).toList();
  }

  PeamanChat _chatFromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
  ) {
    return PeamanChat.fromJson(snap.data() ?? {});
  }

  List<PeamanChatMessage> _messagesFromFirestore(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((doc) {
      return PeamanChatMessage.fromJson(doc.data());
    }).toList();
  }

  PeamanChatMessage _messageFromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
  ) {
    return PeamanChatMessage.fromJson(snap.data() ?? {});
  }
}
