import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/peaman.dart';

abstract class PeamanChatRepository {
  Future<PeamanEither<PeamanChat, PeamanError>> createChat({
    required final PeamanChat chat,
  });

  Future<PeamanEither<bool, PeamanError>> updateChat({
    required final String chatId,
    required final List<PeamanField> fields,
  });

  Future<PeamanEither<bool, PeamanError>> deleteChat({
    required final String chatId,
    required final String uid,
    required final int lastMessageCreatedAt,
  });

  Future<PeamanEither<bool, PeamanError>> archiveChat({
    required final String chatId,
    required final String uid,
  });

  Future<PeamanEither<bool, PeamanError>> leaveChat({
    required final String chatId,
    required final String uid,
    required final int lastMessageCreatedAt,
  });

  Future<PeamanEither<bool, PeamanError>> setChatTitle({
    required final String chatId,
    required final String title,
  });

  Future<PeamanEither<bool, PeamanError>> addChatMembers({
    required final String uid,
    required final String chatId,
    required final List<String> friendIds,
  });

  Future<PeamanEither<bool, PeamanError>> removeChatMembers({
    required final String uid,
    required final String chatId,
    required final List<String> friendIds,
    required final int lastMessageCreatedAt,
  });

  Future<PeamanEither<PeamanChatMessage, PeamanError>> createChatMessage({
    required final PeamanChatMessage message,
  });

  Future<PeamanEither<bool, PeamanError>> updateChatMessage({
    required final String chatId,
    required final String messageId,
    required final List<PeamanField> fields,
  });

  Future<PeamanEither<bool, PeamanError>> deleteChatMessage({
    required final String chatId,
    required final String messageId,
  });

  Future<PeamanEither<bool, PeamanError>> unsendChatMessage({
    required final String chatId,
    required final String messageId,
  });

  Future<PeamanEither<bool, PeamanError>> readChatMessages({
    required final String chatId,
    required final String uid,
  });

  Future<PeamanEither<bool, PeamanError>> setTypingStatus({
    required final String chatId,
    required final String uid,
    required final PeamanChatTypingStatus typingStatus,
  });

  Future<PeamanEither<bool, PeamanError>> acceptChatRequest({
    required final String chatId,
  });

  Future<PeamanEither<bool, PeamanError>> declineChatRequest({
    required final String chatId,
  });

  Future<PeamanEither<bool, PeamanError>> muteChat({
    required final String chatId,
    required final String uid,
    required final int mutedAt,
    required final int mutedUntil,
  });

  Future<PeamanEither<bool, PeamanError>> unmuteChat({
    required final String chatId,
    required final String uid,
  });

  Future<PeamanEither<List<PeamanChat>, PeamanError>> getChats({
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanChat>> getChatsStream({
    final MyQuery Function(MyQuery)? query,
  });

  Future<PeamanEither<List<PeamanChat>, PeamanError>> getUserChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanChat>> getUserChatsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<PeamanEither<PeamanChat, PeamanError>> getSingleChat({
    required final String chatId,
  });

  Stream<PeamanChat> getSingleChatStream({
    required final String chatId,
  });

  Future<PeamanEither<List<PeamanChat>, PeamanError>> getIdleChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanChat>> getIdleChatsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<PeamanEither<List<PeamanChat>, PeamanError>> getAcceptedChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanChat>> getAcceptedChatsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<PeamanEither<List<PeamanChat>, PeamanError>> getDeclinedChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanChat>> getDeclinedChatsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<PeamanEither<List<PeamanChatMessage>, PeamanError>> getChatMessages({
    required final String chatId,
    final PeamanChatMessagesCursor? messagesCursor,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanChatMessage>> getChatMessagesStream({
    required final String chatId,
    final PeamanChatMessagesCursor? messagesCursor,
    final MyQuery Function(MyQuery)? query,
  });

  Future<PeamanEither<List<PeamanChatFile>, PeamanError>> getChatFiles({
    required final String chatId,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanChatFile>> getChatFilesStream({
    required final String chatId,
    final MyQuery Function(MyQuery)? query,
  });

  Future<PeamanEither<PeamanChatMessage, PeamanError>> getSingleChatMessage({
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
  Future<PeamanEither<bool, PeamanError>> acceptChatRequest({
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
  Future<PeamanEither<bool, PeamanError>> archiveChat({
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
  Future<PeamanEither<bool, PeamanError>> declineChatRequest({
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
  Future<PeamanEither<bool, PeamanError>> deleteChat({
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
          key: 'z_${uid}_messages_cursor.start_after',
          useKeyAsItIs: true,
          value: lastMessageCreatedAt,
        ),
      ],
    );
  }

  @override
  Future<PeamanEither<bool, PeamanError>> deleteChatMessage({
    required String chatId,
    required String messageId,
  }) {
    return runAsyncCall(
      future: () async {
        final _messageRef =
            PeamanReferenceHelper.messagesCol(chatId: chatId).doc(messageId);
        await _messageRef.delete();
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<PeamanEither<bool, PeamanError>> unsendChatMessage({
    required String chatId,
    required String messageId,
  }) {
    return updateChatMessage(
      chatId: chatId,
      messageId: messageId,
      fields: [
        const PeamanField(
          key: 'unsent',
          value: true,
        ),
      ],
    );
  }

  @override
  Future<PeamanEither<List<PeamanChat>, PeamanError>> getAcceptedChats({
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
  Future<PeamanEither<List<PeamanChatMessage>, PeamanError>> getChatMessages({
    required final String chatId,
    final PeamanChatMessagesCursor? messagesCursor,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.messagesCol(chatId: chatId)
            .where('visibility', isEqualTo: true)
            .orderBy('created_at', descending: true);
        var _query = query?.call(_ref) ?? _ref;
        if (messagesCursor != null) {
          if (messagesCursor.startAfter != null) {
            _query = _query.endBefore([messagesCursor.startAfter]);
          }
          if (messagesCursor.endAt != null) {
            _query = _query.startAt([messagesCursor.endAt]);
          }
        }
        return _query
            .get()
            .then((event) => Success(_messagesFromFirestore(event)));
      },
      onError: Failure.new,
    );
  }

  @override
  Stream<List<PeamanChatMessage>> getChatMessagesStream({
    required final String chatId,
    final PeamanChatMessagesCursor? messagesCursor,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.messagesCol(chatId: chatId)
        .where('visibility', isEqualTo: true)
        .orderBy('created_at', descending: true);
    var _query = query?.call(_ref) ?? _ref;
    if (messagesCursor != null) {
      if (messagesCursor.startAfter != null) {
        _query = _query.endBefore([messagesCursor.startAfter]);
      }
      if (messagesCursor.endAt != null) {
        _query = _query.startAt([messagesCursor.endAt]);
      }
    }
    return _query.snapshots().map(_messagesFromFirestore);
  }

  @override
  Future<PeamanEither<List<PeamanChat>, PeamanError>> getChats({
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.chatsCol
            .where('visibility', isEqualTo: true)
            .orderBy('updated_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        return _query
            .get()
            .then((event) => Success(_chatsFromFirestore(event)));
      },
      onError: Failure.new,
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
  Future<PeamanEither<List<PeamanChat>, PeamanError>> getUserChats({
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
  Future<PeamanEither<List<PeamanChat>, PeamanError>> getDeclinedChats({
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
  Future<PeamanEither<List<PeamanChat>, PeamanError>> getIdleChats({
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
  Future<PeamanEither<PeamanChat, PeamanError>> getSingleChat({
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
        return Success(_chat);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<PeamanEither<PeamanChatMessage, PeamanError>> getSingleChatMessage({
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
        return Success(_message);
      },
      onError: Failure.new,
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
  Future<PeamanEither<bool, PeamanError>> readChatMessages({
    required String chatId,
    required String uid,
  }) {
    return runAsyncCall(
      future: () async {
        final _chatRef = PeamanReferenceHelper.chatsCol.doc(chatId);
        await _chatRef.update({
          'z_${uid}_unread_messages': FieldValue.delete(),
        });
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<PeamanEither<bool, PeamanError>> setTypingStatus({
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
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<PeamanEither<bool, PeamanError>> updateChat({
    required String chatId,
    required List<PeamanField> fields,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final _chatRef = PeamanReferenceHelper.chatDoc(chatId: chatId);
        final _data = PeamanCommonHelper().prepareDataToUpdate(fields: fields);
        if (_data.isNotEmpty) {
          await _chatRef.update({
            ..._data,
            'updated_at': _millis,
          });
        }
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<PeamanEither<bool, PeamanError>> updateChatMessage({
    required String chatId,
    required final String messageId,
    required final List<PeamanField> fields,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final _messageRef =
            PeamanReferenceHelper.messagesCol(chatId: chatId).doc(messageId);
        final _data = PeamanCommonHelper().prepareDataToUpdate(fields: fields);
        if (_data.isNotEmpty) {
          await _messageRef.update({
            ..._data,
            'updated_at': _millis,
          });
        }
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<PeamanEither<PeamanChat, PeamanError>> createChat({
    required PeamanChat chat,
  }) {
    return runAsyncCall(
      future: () async {
        if (chat.adminId == null) {
          throw Exception('adminId cannot be null');
        }

        final _chatRef = PeamanReferenceHelper.chatDoc(chatId: chat.id);
        final _chat = chat.copyWith(id: _chatRef.id);

        final receiverIds = List<String>.from(chat.userIds)
          ..removeWhere((element) => element == chat.adminId);

        final fields = [
          for (final receiverId in receiverIds)
            PeamanField(
              key: 'z_${receiverId}_added_by',
              useKeyAsItIs: true,
              value: PeamanChatAddedBy(
                uid: receiverId,
                addedBy: chat.adminId,
                addedAt: chat.createdAt,
              ).toJson(),
            ),
        ];
        final addedBysData = PeamanCommonHelper().prepareDataToUpdate(
          fields: fields,
        );

        await _chatRef.set({
          ..._chat.toJson(),
          ...addedBysData,
          ..._chat.extraData,
        });
        return Success(_chat);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<PeamanEither<PeamanChatMessage, PeamanError>> createChatMessage({
    required PeamanChatMessage message,
  }) {
    return runAsyncCall(
      future: () async {
        if (message.senderId == null) {
          throw Exception("senderId cannot be null");
        } else if (message.receiverIds.isEmpty) {
          throw Exception("receiverIds cannot be empty");
        } else if (message.chatType == PeamanChatType.oneToOne &&
            message.receiverIds.length > 1) {
          throw Exception(
            "cannot have more than 1 receiver for PeamanChatType.oneToOne",
          );
        } else if ((message.type == PeamanChatMessageType.text ||
                message.type == PeamanChatMessageType.info) &&
            (message.text?.isEmpty ?? true)) {
          throw Exception(
            'text field cannot be empty for PeamanChatMessageType.${ksPeamanChatMessageType[message.type]}',
          );
        }
        final _millis = DateTime.now().millisecondsSinceEpoch;

        final _chatRef = PeamanReferenceHelper.chatDoc(chatId: message.chatId);
        final _messagesRef =
            PeamanReferenceHelper.messagesCol(chatId: _chatRef.id);

        final _chatSnap = await _chatRef.get();
        final isFirstMessage = !_chatSnap.exists;

        if (isFirstMessage) {
          final newChat = PeamanChat(
            id: _chatRef.id,
            visibility: true,
            adminId: message.senderId,
            createdAt: message.createdAt ?? _millis,
          );
          final result = await createChat(chat: newChat);
          if (result.isFailure) throw result.failure;
        }

        final _lastMsgRef = _messagesRef.doc();
        final _message = message.copyWith(
          id: _lastMsgRef.id,
          chatId: _chatRef.id,
          createdAt: message.createdAt ?? _millis,
          updatedAt: message.updatedAt,
        );

        final _futures = <Future>[];

        final _lastMsgFuture = _lastMsgRef.set({
          ..._message.toJson(),
          ..._message.extraData,
        });
        _futures.add(_lastMsgFuture);

        final chatUpdateFields = _getChatUpdateFieldsForCreatingChat(
          message: _message,
          isFirstMessage: isFirstMessage,
        );
        final _chatUpdateFuture = updateChat(
          chatId: _message.chatId!,
          fields: chatUpdateFields,
        );
        _futures.add(_chatUpdateFuture);

        final _mediaInfoFuture = _saveMediasFilesAndLinks(
          message: _message,
        );
        _futures.add(_mediaInfoFuture);

        await Future.wait(_futures);
        return Success(message);
      },
      onError: Failure.new,
    );
  }

  Future<PeamanEither<bool, PeamanError>> _saveMediasFilesAndLinks({
    required final PeamanChatMessage message,
  }) {
    return runAsyncCall(
      future: () async {
        final fileRef = PeamanReferenceHelper.chatMediasLinksFilesCol(
          chatId: message.chatId!,
        ).doc();

        var allFileUrls = message.files;

        final links = PeamanCommonHelper().getUrlsFromText(
          text: message.text ?? '',
        );
        if (links.isNotEmpty) {
          final fileUrlsFromLinks = links.map(
            (e) => PeamanFileUrl(
              url: e,
              type: PeamanFileType.link,
            ),
          );
          allFileUrls = [...allFileUrls, ...fileUrlsFromLinks];
        }

        if (allFileUrls.isNotEmpty) {
          final file = PeamanChatFile(
            id: fileRef.id,
            ownerId: message.senderId,
            urls: allFileUrls,
            createdAt: message.createdAt,
          );
          await fileRef.set(file.toJson());
        }

        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  List<PeamanField> _getChatUpdateFieldsForCreatingChat({
    required final PeamanChatMessage message,
    final bool isFirstMessage = false,
  }) {
    return [
      PeamanField(
        key: 'type',
        value: ksPeamanChatType[message.chatType],
      ),
      PeamanField.positivePartial(
        key: 'user_ids',
        value: [...message.receiverIds, message.senderId],
      ),
      const PeamanField(
        key: 'hidden_to_user_ids',
        value: [],
      ),
      const PeamanField(
        key: 'archived_by_user_ids',
        value: [],
      ),
      PeamanField(
        key: 'last_message_id',
        value: message.id,
      ),
      PeamanField(
        key: 'last_message_created_at',
        value: message.createdAt,
      ),
      const PeamanField.positivePartial(
        key: 'total_sent_messages',
        value: 1,
      ),
      PeamanField.positivePartial(
        key: 'z_${message.senderId}_sent_messages',
        value: 1,
        useKeyAsItIs: true,
      ),
      for (final receiverId in message.receiverIds)
        PeamanField.positivePartial(
          key: 'z_${receiverId}_unread_messages',
          value: 1,
          useKeyAsItIs: true,
        ),
      if (isFirstMessage)
        PeamanField(
          key: 'chat_request_status',
          value: ksPeamanChatRequestStatus[PeamanChatRequestStatus.idle],
        ),
      if (isFirstMessage)
        PeamanField(
          key: 'chat_request_sender_id',
          value: message.senderId,
        ),
    ];
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

  List<PeamanChatFile> _chatFilesFromFirestore(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((doc) {
      return PeamanChatFile.fromJson(doc.data());
    }).toList();
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

  @override
  Future<PeamanEither<bool, PeamanError>> muteChat({
    required String chatId,
    required String uid,
    required int mutedAt,
    required int mutedUntil,
  }) {
    return updateChat(
      chatId: chatId,
      fields: [
        PeamanField(
          key: 'z_${uid}_muted',
          useKeyAsItIs: true,
          value: PeamanChatMutedUntil(
            uid: uid,
            mutedAt: mutedAt,
            mutedUntil: mutedUntil,
          ).toJson(),
        ),
      ],
    );
  }

  @override
  Future<PeamanEither<bool, PeamanError>> unmuteChat({
    required String chatId,
    required String uid,
  }) {
    return updateChat(
      chatId: chatId,
      fields: [
        PeamanField.delete(
          key: 'z_${uid}_muted',
          useKeyAsItIs: true,
        ),
      ],
    );
  }

  @override
  Future<PeamanEither<bool, PeamanError>> addChatMembers({
    required String uid,
    required String chatId,
    required List<String> friendIds,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return updateChat(
      chatId: chatId,
      fields: [
        PeamanField.positivePartial(
          key: 'userIds',
          value: friendIds,
        ),
        for (final friendId in friendIds)
          PeamanField(
            key: 'z_${friendId}_added_by',
            useKeyAsItIs: true,
            value: PeamanChatAddedBy(
              uid: friendId,
              addedBy: uid,
              addedAt: _millis,
            ).toJson(),
          ),
        for (final friendId in friendIds)
          PeamanField.delete(
            key: 'z_${friendId}_removed_by',
            useKeyAsItIs: true,
          ),
        for (final friendId in friendIds)
          PeamanField(
            key: 'z_${friendId}_messages_cursor.end_at',
            useKeyAsItIs: true,
            value: null,
          ),
      ],
    );
  }

  @override
  Future<PeamanEither<bool, PeamanError>> leaveChat({
    required String chatId,
    required String uid,
    required int lastMessageCreatedAt,
  }) {
    return removeChatMembers(
      chatId: chatId,
      uid: uid,
      friendIds: [uid],
      lastMessageCreatedAt: lastMessageCreatedAt,
    );
  }

  @override
  Future<PeamanEither<bool, PeamanError>> removeChatMembers({
    required String uid,
    required String chatId,
    required List<String> friendIds,
    required int lastMessageCreatedAt,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return updateChat(
      chatId: chatId,
      fields: [
        for (final friendId in friendIds)
          PeamanField(
            key: 'z_${friendId}_removed_by',
            useKeyAsItIs: true,
            value: PeamanChatRemovedBy(
              uid: friendId,
              removedBy: uid,
              removedAt: _millis,
            ).toJson(),
          ),
        for (final friendId in friendIds)
          PeamanField(
            key: 'z_${friendId}_messages_cursor.end_at',
            useKeyAsItIs: true,
            value: lastMessageCreatedAt,
          ),
      ],
    );
  }

  @override
  Future<PeamanEither<List<PeamanChatFile>, PeamanError>> getChatFiles({
    required String chatId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.chatMediasLinksFilesCol(
          chatId: chatId,
        );
        final _query = query?.call(_ref) ?? _ref;
        final result = await _query.get();
        return Success(_chatFilesFromFirestore(result));
      },
      onError: Failure.new,
    );
  }

  @override
  Stream<List<PeamanChatFile>> getChatFilesStream({
    required String chatId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.chatMediasLinksFilesCol(
      chatId: chatId,
    );
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_chatFilesFromFirestore);
  }

  @override
  Future<PeamanEither<bool, PeamanError>> setChatTitle({
    required String chatId,
    required String title,
  }) {
    return updateChat(
      chatId: chatId,
      fields: [
        PeamanField(
          key: 'title',
          value: title,
        ),
      ],
    );
  }
}
