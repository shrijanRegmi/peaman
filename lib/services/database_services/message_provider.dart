import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/peaman.dart';

import '../../utils/firestore_constants.dart';

class MessageProvider {
  // send message
  Future<void> sendMessage({
    required final PeamanMessage message,
    final Function(PeamanMessage)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _currentMillis = DateTime.now().millisecondsSinceEpoch;

      final _messagesRef =
          PeamanReferenceHelper.messagesCol(chatId: message.chatId!);
      final _chatRef = PeamanReferenceHelper.chatsCol.doc(message.chatId);

      final _messagesDocs = await _messagesRef.limit(2).get();

      if (_messagesDocs.docs.length == 0) {
        await _chatRef.set({
          'id': message.chatId,
          'created_at': _currentMillis,
        });
      }

      final bool _isAppUserFirstUser = PeamanChatHelper.isAppUserFirstUser(
        myId: message.senderId!,
        friendId: message.receiverId!,
      );

      if (_isAppUserFirstUser) {
        _chatRef.update({
          'second_user_unread_messages_count': FieldValue.increment(1),
        });
      } else {
        _chatRef.update({
          'first_user_unread_messages_count': FieldValue.increment(1),
        });
      }

      final _lastMsgRef = _messagesRef.doc();
      final _message = message.copyWith(
        id: _lastMsgRef.id,
        createdAt: message.createdAt ?? _currentMillis,
        updatedAt: message.updatedAt ?? _currentMillis,
      );

      final _futures = <Future>[];

      final _lastMsgFuture = _lastMsgRef.set(_message.toJson());
      _futures.add(_lastMsgFuture);

      final _chatUpdateFuture = _chatRef.update({
        'updated_at': DateTime.now().millisecondsSinceEpoch,
        'last_message_id': _lastMsgRef.id,
      });
      _futures.add(_chatUpdateFuture);

      if (_messagesDocs.docs.length == 0 &&
          message.senderId != null &&
          message.receiverId != null) {
        final _additionalPropertiesFuture = _sendAdditionalProperties(
          chatId: message.chatId!,
          myId: message.senderId!,
          friendId: message.receiverId!,
        );
        _futures.add(_additionalPropertiesFuture);
      }

      await Future.wait(_futures);
      onSuccess?.call(_message);
      print('Success: Sending message to ${message.receiverId}');
    } catch (e) {
      print(e);
      print('Error: Sending message to ${message.receiverId}');
      onError?.call(e);
    }
  }

  // send additional properties with message
  Future<void> _sendAdditionalProperties({
    required final String chatId,
    required final String myId,
    required final String friendId,
  }) async {
    try {
      final _chatRef = PeamanReferenceHelper.chatsCol.doc(chatId);

      final _isAppUserFirstUser = PeamanChatHelper.isAppUserFirstUser(
        myId: myId,
        friendId: friendId,
      );

      String _firstUserId;
      String _secondUserId;

      final _userIds = [myId, friendId];

      if (_isAppUserFirstUser) {
        _firstUserId = myId;
        _secondUserId = friendId;
      } else {
        _firstUserId = friendId;
        _secondUserId = myId;
      }
      await _chatRef.update({
        'first_user_id': _firstUserId,
        'second_user_id': _secondUserId,
        'user_ids': _userIds,
        'chat_request_status': PeamanChatRequestStatus.idle.index,
        'chat_request_sender_id': myId,
      });
    } catch (e) {
      print(e);
      print('Error!!!: Sending additonal fields in chats collection');
    }
  }

  // set pinned status
  Future<void> setPinnedStatus({
    required final String chatId,
    required final PeamanChatUser chatUser,
    required final bool pinned,
  }) async {
    try {
      final _chatRef = PeamanReferenceHelper.chatsCol.doc(chatId);

      Map<String, dynamic> _data;

      if (chatUser == PeamanChatUser.first) {
        _data = {'first_user_pinned_second_user': pinned};
      } else {
        _data = {'second_user_pinned_first_user': pinned};
      }

      await _chatRef.update(_data);
      print('Success: Pinning user');
    } catch (e) {
      print(e);
      print('Error!!!: Pinned user');
    }
  }

  // update chat data
  Future<void> updateChatData({
    required final String chatId,
    required final Map<String, dynamic> data,
  }) async {
    try {
      final _chatRef = PeamanReferenceHelper.chatsCol.doc(chatId);
      await _chatRef.update(data);
      print('Success: Updating chat data $chatId');
    } catch (e) {
      print(e);
      print('Error!!!: Updating chat data');
    }
  }

  // read chat message
  Future<void> readChatMessage({
    required final String chatId,
    required final PeamanChatUser chatUser,
  }) async {
    try {
      final _chatRef = PeamanReferenceHelper.chatsCol.doc(chatId);
      var _data = <String, dynamic>{};

      if (chatUser == PeamanChatUser.first) {
        _data['first_user_unread_messages_count'] = 0;
      } else {
        _data['second_user_unread_messages_count'] = 0;
      }

      await _chatRef.update(_data);
      print('Success: Reading message by user');
    } catch (e) {
      print(e);
      print('Error!!!: Reading message by user');
    }
  }

  // set typing status
  Future<void> setTypingStatus({
    required final String chatId,
    required final PeamanChatUser chatUser,
    required final PeamanTypingStatus typingState,
  }) async {
    try {
      final _chatRef = PeamanReferenceHelper.chatsCol.doc(chatId);
      var _data = <String, dynamic>{};

      if (chatUser == PeamanChatUser.first) {
        _data['first_user_typing'] = typingState == PeamanTypingStatus.typing;
      } else {
        _data['second_user_typing'] = typingState == PeamanTypingStatus.typing;
      }

      await _chatRef.update(_data);
      print('Success: Setting typing status');
    } catch (e) {
      print(e);
      print('Error!!!: Setting typing status');
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

  // stream of list of messages
  Stream<List<PeamanMessage>> getMessages({
    required final String chatId,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.messagesCol(chatId: chatId)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_messagesFromFirestore);
  }

  // stream of single message by id
  Stream<PeamanMessage> getSingleMessageById({
    required final String chatId,
    required final String messageId,
  }) {
    return PeamanReferenceHelper.messagesCol(chatId: chatId)
        .doc(messageId)
        .snapshots()
        .map(_messageFromFirestore);
  }

  // stream of list of chats
  Stream<List<PeamanChat>> getChats({
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref =
        PeamanReferenceHelper.chatsCol.orderBy('updated_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_chatsFromFirestore);
  }

  // stream of list of user chats
  Stream<List<PeamanChat>> getUserChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.chatsCol
        .where('user_ids', arrayContains: uid)
        .orderBy('updated_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_chatsFromFirestore);
  }

  // stream of list of idle chats
  Stream<List<PeamanIdleChat>> getUserIdleChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.chatsCol
        .where('user_ids', arrayContains: uid)
        .where(
          'chat_request_status',
          isEqualTo: PeamanChatRequestStatus.idle.index,
        )
        .orderBy('updated_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_idleChatsFromFirestore);
  }

  // stream of list of accepted chats
  Stream<List<PeamanAcceptedChat>> getUserAcceptedChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.chatsCol
        .where('user_ids', arrayContains: uid)
        .where(
          'chat_request_status',
          isEqualTo: PeamanChatRequestStatus.accepted.index,
        )
        .orderBy('updated_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_acceptedChatsFromFirestore);
  }

  // stream of list of declined chats
  Stream<List<PeamanDeclinedChat>> getUserDeclinedChats({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.chatsCol
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
