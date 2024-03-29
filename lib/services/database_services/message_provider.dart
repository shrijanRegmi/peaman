import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/peaman.dart';

class MessageProvider {
  // send message
  Future<void> sendMessage({
    required final PeamanMessage message,
    final Function(PeamanMessage)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    assert(
      message.senderId != null && message.receiverIds.isNotEmpty,
    );

    try {
      final _currentMillis = DateTime.now().millisecondsSinceEpoch;

      final _chatRef = PeamanReferenceHelper.chatsCol.doc(message.chatId);
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

      _chatUpdateData['hidden_to_user_ids'] = [];
      _chatUpdateData['total_sent_messages'] = FieldValue.increment(1);
      _chatUpdateData['z_${message.senderId}_sent_messages'] =
          FieldValue.increment(1);
      message.receiverIds.forEach((receiverId) {
        _chatUpdateData['z_${receiverId}_unread_messages'] =
            FieldValue.increment(1);
      });

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
      onSuccess?.call(_message);
      print('Success: Sending message to ${message.receiverIds}');
    } catch (e) {
      print(e);
      print('Error: Sending message to ${message.receiverIds}');
      onError?.call(e);
    }
  }

  Future<void> deleteChat({
    required String uid,
    required String chatId,
    required int lastMessageCreatedAt,
  }) async {
    final _chatRef = PeamanReferenceHelper.chatDoc(chatId: chatId);
    await _chatRef.update({
      'hidden_to_user_ids': FieldValue.arrayUnion([uid]),
      'z_${uid}_start_after': lastMessageCreatedAt,
    });
  }

  Future<void> deleteChatMessage({
    required String chatId,
    required String messageId,
  }) async {
    final _messageRef =
        PeamanReferenceHelper.messagesCol(chatId: chatId).doc(messageId);
    await _messageRef.delete();
  }

  Future<void> unsendChatMessage({
    required String chatId,
    required String messageId,
  }) async {
    final _messageRef =
        PeamanReferenceHelper.messagesCol(chatId: chatId).doc(messageId);
    await _messageRef.update({'unsent': true});
  }

  // send additional properties with message
  Future<void> _sendAdditionalProperties({
    required final PeamanMessage message,
  }) async {
    try {
      final _chatRef = PeamanReferenceHelper.chatsCol.doc(message.chatId);

      await _chatRef.update({
        'user_ids': message.receiverIds..add(message.senderId!),
        'chat_request_status': PeamanChatRequestStatus.idle.index,
        'chat_request_sender_id': message.senderId,
      });
    } catch (e) {
      print(e);
      print('Error!!!: Sending additonal fields in chats collection');
    }
  }

  Future<void> _sendMediaInformation({
    required final PeamanMessage message,
  }) async {
    try {
      final _fileRef = PeamanReferenceHelper.chatFilesCol(
        chatId: message.chatId!,
      ).doc();

      final file = PeamanChatFile(
        id: _fileRef.id,
        urls: message.files,
        createdAt: message.createdAt,
        updatedAt: message.updatedAt,
      );

      await _fileRef.set(file.toJson());
      print('Success: Sending media information');
    } catch (e) {
      print(e);
      print('Error!!!: Sending media information');
    }
  }

  // set pinned status
  Future<void> setPinnedStatus({
    required final String chatId,
    required final String uid,
    required final bool pinned,
  }) async {
    try {
      final _chatRef = PeamanReferenceHelper.chatsCol.doc(chatId);

      await _chatRef.update({
        'pinned_chat_user_ids': pinned
            ? FieldValue.arrayUnion([uid])
            : FieldValue.arrayRemove([uid])
      });
      print('Success: Pinning chat by $uid');
    } catch (e) {
      print(e);
      print('Error!!!: Pinning chat by $uid');
    }
  }

  // update chat data
  Future<void> updateChatData({
    required final String chatId,
    final PeamanChatUpdater? updater,
    final PeamanChatPartialUpdater? positivePartialUpdater,
    final PeamanChatPartialUpdater? negativePartialUpdater,
  }) async {
    try {
      final _chatRef = PeamanReferenceHelper.chatsCol.doc(chatId);
      final _data = <String, dynamic>{};

      final _updaterData = updater?.toJson() ?? _data;
      final _positivePartialUpdaterData =
          positivePartialUpdater?.toPositiveUpdateJson() ?? _data;
      final _negativePartialUpdaterData =
          negativePartialUpdater?.toNegativeUpdateJson() ?? _data;

      _data.addAll(_updaterData);
      _data.addAll(_positivePartialUpdaterData);
      _data.addAll(_negativePartialUpdaterData);

      if (_data.isNotEmpty) {
        await _chatRef.update(_data);
      }

      print('Success: Updating chat data $chatId');
    } catch (e) {
      print(e);
      print('Error!!!: Updating chat data');
    }
  }

  // read chat message
  Future<void> readChatMessage({
    required final String chatId,
    required final String uid,
  }) async {
    try {
      final _chatRef = PeamanReferenceHelper.chatsCol.doc(chatId);

      await _chatRef.update({
        'z_${uid}_unread_messages': FieldValue.delete(),
      });
      print('Success: Reading message by $uid');
    } catch (e) {
      print(e);
      print('Error!!!: Reading message by $uid');
    }
  }

  // set typing status
  Future<void> setTypingStatus({
    required final String chatId,
    required final String uid,
    required final PeamanTypingStatus typingStatus,
  }) async {
    try {
      final _chatRef = PeamanReferenceHelper.chatsCol.doc(chatId);
      await _chatRef.update({
        'typing_user_ids': typingStatus == PeamanTypingStatus.typing
            ? FieldValue.arrayUnion([uid])
            : FieldValue.arrayRemove([uid])
      });
      print('Success: Setting typing status of $uid');
    } catch (e) {
      print(e);
      print('Error!!!: Setting typing status of $uid');
    }
  }

  // accept chat request
  Future<void> acceptChatRequest({
    required final String chatId,
    final Function(PeamanChatRequestStatus)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _chatRef = PeamanReferenceHelper.chatsCol.doc(chatId);
      await _chatRef.update({
        'chat_request_status': PeamanChatRequestStatus.accepted.index,
      });
      print('Success: Accepting chat request $chatId');
      onSuccess?.call(PeamanChatRequestStatus.accepted);
    } catch (e) {
      print(e);
      print('Error!!!: Accepting chat request $chatId');
      onError?.call(e);
    }
  }

  // decline chat request
  Future<void> declineChatRequest({
    required final String chatId,
    final Function(PeamanChatRequestStatus)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _chatRef = PeamanReferenceHelper.chatsCol.doc(chatId);
      await _chatRef.update({
        'chat_request_status': PeamanChatRequestStatus.declined.index,
      });
      print('Success: Declining chat request $chatId');
      onSuccess?.call(PeamanChatRequestStatus.declined);
    } catch (e) {
      print(e);
      print('Error: Declining chat request');
      onError?.call(e);
    }
  }

  // list of messages from firestore
  List<PeamanMessage> _messagesFromFirestore(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((doc) {
      return PeamanMessage.fromJson(doc.data());
    }).toList();
  }

  // single message from firestore
  PeamanMessage _messageFromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    return PeamanMessage.fromJson(doc.data() ?? {});
  }

  // chats from firestore
  List<PeamanChat> _chatsFromFirestore(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((doc) {
      return PeamanChat.fromJson(doc.data());
    }).toList();
  }

  // idle chats from firestore
  List<PeamanIdleChat> _idleChatsFromFirestore(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((doc) {
      return PeamanIdleChat.fromJson(doc.data());
    }).toList();
  }

  // accepted chats from firestore
  List<PeamanAcceptedChat> _acceptedChatsFromFirestore(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((doc) {
      return PeamanAcceptedChat.fromJson(doc.data());
    }).toList();
  }

  // declined chats from firestore
  List<PeamanDeclinedChat> _declinedChatsFromFirestore(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((doc) {
      return PeamanDeclinedChat.fromJson(doc.data());
    }).toList();
  }

  // future of list of messages
  Future<List<PeamanMessage>> getMessages({
    required final String chatId,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.messagesCol(chatId: chatId)
        .where('visibility', isEqualTo: true)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.get().then(_messagesFromFirestore);
  }

  // stream of list of messages
  Stream<List<PeamanMessage>> getMessagesStream({
    required String chatId,
    int? startAfter,
  }) {
    final query = PeamanReferenceHelper.messagesCol(chatId: chatId)
        .where('visibility', isEqualTo: true)
        .orderBy('created_at', descending: true);
    if (startAfter != null) {
      return query
          .endBefore([startAfter])
          .snapshots()
          .map(_messagesFromFirestore);
    }
    return query.snapshots().map(_messagesFromFirestore);
  }

  // future of single message by id
  Future<PeamanMessage> getSingleMessageById({
    required final String chatId,
    required final String messageId,
  }) {
    return PeamanReferenceHelper.messagesCol(chatId: chatId)
        .doc(messageId)
        .get()
        .then(_messageFromFirestore);
  }

  // stream of single message by id
  Stream<PeamanMessage> getSingleMessageByIdStream({
    required final String chatId,
    required final String messageId,
  }) {
    return PeamanReferenceHelper.messagesCol(chatId: chatId)
        .doc(messageId)
        .snapshots()
        .map(_messageFromFirestore);
  }

  // future of list of chats
  Future<List<PeamanChat>> getChats({
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.chatsCol
        .where('visibility', isEqualTo: true)
        .orderBy('updated_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.get().then(_chatsFromFirestore);
  }

  // stream of list of chats
  Stream<List<PeamanChat>> getChatsStream({
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.chatsCol
        .where('visibility', isEqualTo: true)
        .orderBy('updated_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_chatsFromFirestore);
  }

  // future of list of user chats
  Future<List<PeamanChat>> getUserChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.chatsCol
        .where('visibility', isEqualTo: true)
        .where('user_ids', arrayContains: uid)
        .orderBy('updated_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.get().then(_chatsFromFirestore);
  }

  // stream of list of user chats
  Stream<List<PeamanChat>> getUserChatsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.chatsCol
        .where('visibility', isEqualTo: true)
        .where('user_ids', arrayContains: uid)
        .orderBy('updated_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_chatsFromFirestore);
  }

  // future of list of idle chats
  Future<List<PeamanIdleChat>> getUserIdleChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.chatsCol
        .where('visibility', isEqualTo: true)
        .where('user_ids', arrayContains: uid)
        .where(
          'chat_request_status',
          isEqualTo: PeamanChatRequestStatus.idle.index,
        )
        .orderBy('updated_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.get().then(_idleChatsFromFirestore);
  }

  // stream of list of idle chats
  Stream<List<PeamanIdleChat>> getUserIdleChatsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.chatsCol
        .where('visibility', isEqualTo: true)
        .where('user_ids', arrayContains: uid)
        .where(
          'chat_request_status',
          isEqualTo: PeamanChatRequestStatus.idle.index,
        )
        .orderBy('updated_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_idleChatsFromFirestore);
  }

  // future of list of accepted chats
  Future<List<PeamanAcceptedChat>> getUserAcceptedChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.chatsCol
        .where('visibility', isEqualTo: true)
        .where('user_ids', arrayContains: uid)
        .where(
          'chat_request_status',
          isEqualTo: PeamanChatRequestStatus.accepted.index,
        )
        .orderBy('updated_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.get().then(_acceptedChatsFromFirestore);
  }

  // stream of list of accepted chats
  Stream<List<PeamanAcceptedChat>> getUserAcceptedChatsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.chatsCol
        .where('visibility', isEqualTo: true)
        .where('user_ids', arrayContains: uid)
        .where(
          'chat_request_status',
          isEqualTo: PeamanChatRequestStatus.accepted.index,
        )
        .orderBy('updated_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_acceptedChatsFromFirestore);
  }

  // future of list of declined chats
  Future<List<PeamanDeclinedChat>> getUserDeclinedChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.chatsCol
        .where('visibility', isEqualTo: true)
        .where('user_ids', arrayContains: uid)
        .where(
          'chat_request_status',
          isEqualTo: PeamanChatRequestStatus.declined.index,
        )
        .orderBy('updated_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.get().then(_declinedChatsFromFirestore);
  }

  // stream of list of declined chats
  Stream<List<PeamanDeclinedChat>> getUserDeclinedChatsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.chatsCol
        .where('visibility', isEqualTo: true)
        .where('user_ids', arrayContains: uid)
        .where(
          'chat_request_status',
          isEqualTo: PeamanChatRequestStatus.declined.index,
        )
        .orderBy('updated_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_declinedChatsFromFirestore);
  }
}
