import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/peaman.dart';

class MessageProvider {
  final _ref = FirebaseFirestore.instance;

  // send message
  Future<void> sendMessage({
    required final PeamanMessage message,
    final Function(PeamanMessage)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _messagesRef =
          _ref.collection('chats').doc(message.chatId).collection('messages');
      final _chatRef = _ref.collection('chats').doc(message.chatId);

      final _messagesDocs = await _messagesRef.limit(2).get();

      if (_messagesDocs.docs.length == 0) {
        await _chatRef.set({'id': message.chatId});
      }
      final bool _isAppUserFirstUser = PChatHelper.isAppUserFirstUser(
        myId: message.senderId!,
        friendId: message.receiverId!,
      );

      final _chatSnap = await _chatRef.get();
      if (_isAppUserFirstUser) {
        final _secondUserUnreadMessagesCount = _chatSnap.data() != null
            ? _chatSnap.data()!['second_user_unread_messages_count'] ?? 0
            : 0;

        _chatRef.update({
          'second_user_unread_messages_count':
              _secondUserUnreadMessagesCount + 1
        });
      } else {
        final _firstUserUnreadMessagesCount = _chatSnap.data() != null
            ? _chatSnap.data()!['first_user_unread_messages_count'] ?? 0
            : 0;

        _chatRef.update({
          'first_user_unread_messages_count': _firstUserUnreadMessagesCount + 1
        });
      }

      final _lastMsgRef = _messagesRef.doc();
      final _message = message.copyWith(id: _lastMsgRef.id);

      final _futures = <Future>[];

      final _lastMsgFuture = _lastMsgRef.set(_message.toJson());
      _futures.add(_lastMsgFuture);

      final _chatUpdateFuture = _chatRef.update({
        'last_updated': DateTime.now(),
        'last_msg_ref': _lastMsgRef,
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
      final _chatRef = _ref.collection('chats').doc(chatId);

      final bool _isAppUserFirstUser = PChatHelper.isAppUserFirstUser(
        myId: myId,
        friendId: friendId,
      );

      DocumentReference _firstUserRef;
      DocumentReference _secondUserRef;

      final _users = [myId, friendId];
      Map<String, dynamic> _userData = {
        'users': _users,
      };

      if (_isAppUserFirstUser) {
        _firstUserRef = _ref.collection('users').doc(myId);
        _secondUserRef = _ref.collection('users').doc(friendId);
      } else {
        _firstUserRef = _ref.collection('users').doc(friendId);
        _secondUserRef = _ref.collection('users').doc(myId);
      }
      await _chatRef.update({
        ..._userData,
        'first_user_ref': _firstUserRef,
        'second_user_ref': _secondUserRef,
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
      final _chatRef = _ref.collection('chats').doc(chatId);

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
      final _chatRef = _ref.collection('chats').doc(chatId);
      await _chatRef.update(data);
      print('Success: Updating chat data $chatId');
    } catch (e) {
      print(e);
      print('Error!!!: Updating chat data');
    }
  }

  // read chat message
  Future readChatMessage({
    required final String chatId,
    required final PeamanChatUser chatUser,
  }) async {
    try {
      final _chatRef = _ref.collection('chats').doc(chatId);
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
      print('Error: Reading message by user');
    }
  }

  // read chat message
  Future setTyping({
    required final String chatId,
    required final PeamanChatUser chatUser,
    required final PeamanTypingState typingState,
  }) async {
    try {
      final _chatRef = _ref.collection('chats').doc(chatId);
      var _data = <String, dynamic>{};

      if (chatUser == PeamanChatUser.first) {
        _data['first_user_typing'] = typingState == PeamanTypingState.typing;
      } else {
        _data['second_user_typing'] = typingState == PeamanTypingState.typing;
      }

      await _chatRef.update(_data);
      print('Success: Reading message by user');
    } catch (e) {
      print(e);
      print('Error: Reading message by user');
    }
  }

  // accept chat request
  Future acceptChatRequest({
    required final String chatId,
    final Function(PeamanChatRequestStatus)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _chatRef = _ref.collection('chats').doc(chatId);
      await _chatRef.update({
        'chat_request_status': PeamanChatRequestStatus.accepted.index,
      });
      print('Success: Accepting chat request $chatId');
      onSuccess?.call(PeamanChatRequestStatus.accepted);
    } catch (e) {
      print(e);
      print('Error: Accepting chat request $chatId');
      onError?.call(e);
    }
  }

  // decline chat request
  Future declineChatRequest({
    required final String chatId,
    final Function(PeamanChatRequestStatus)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _chatRef = _ref.collection('chats').doc(chatId);
      await _chatRef.update({
        'chat_request_status': PeamanChatRequestStatus.declined.index,
      });
      print('Success: Accepting chat request $chatId');
      onSuccess?.call(PeamanChatRequestStatus.declined);
    } catch (e) {
      print(e);
      print('Error: Accepting chat request $chatId');
      onError?.call(e);
    }
  }

  // messages from firebase
  List<PeamanMessage> _messagesFromFirebase(
      QuerySnapshot<Map<String, dynamic>> snap) {
    return snap.docs.map((doc) {
      return PeamanMessage.fromJson(doc.data());
    }).toList();
  }

  // single message from firebase
  PeamanMessage _messageFromFirebase(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return PeamanMessage.fromJson(doc.data() ?? {});
  }

  // chats from firebase
  List<PeamanChat> _chatsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((doc) {
      return PeamanChat.fromJson(doc.data());
    }).toList();
  }

  // idle chats from firebase
  List<PeamanIdleChat> _idleChatsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((doc) {
      return PeamanIdleChat.fromJson(doc.data());
    }).toList();
  }

  // accepted chats from firebase
  List<PeamanAcceptedChat> _acceptedChatsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((doc) {
      return PeamanAcceptedChat.fromJson(doc.data());
    }).toList();
  }

  // declined chats from firebase
  List<PeamanDeclinedChat> _declinedChatsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((doc) {
      return PeamanDeclinedChat.fromJson(doc.data());
    }).toList();
  }

  // stream of messages;
  Stream<List<PeamanMessage>> messagesList({
    required final String chatId,
    required final int limit,
  }) {
    return _ref
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('milliseconds', descending: true)
        .limit(limit)
        .snapshots()
        .map(_messagesFromFirebase);
  }

  // stream of message;
  Stream<PeamanMessage> message({
    required final String chatId,
    required final String messageId,
  }) {
    return _ref
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(messageId)
        .snapshots()
        .map(_messageFromFirebase);
  }

  // stream of chats
  Stream<List<PeamanChat>> chatList({
    required final String uid,
  }) {
    return _ref
        .collection('chats')
        .where('users', arrayContains: uid)
        .orderBy('last_updated', descending: true)
        .snapshots()
        .map(_chatsFromFirebase);
  }

  // stream of idle chats
  Stream<List<PeamanIdleChat>> idleChatsList({
    required final String uid,
  }) {
    return _ref
        .collection('chats')
        .where('users', arrayContains: uid)
        .where(
          'chat_request_status',
          isEqualTo: PeamanChatRequestStatus.idle.index,
        )
        .orderBy('last_updated', descending: true)
        .snapshots()
        .map(_idleChatsFromFirebase);
  }

  // stream of accepted chats
  Stream<List<PeamanAcceptedChat>> acceptedChatsList({
    required final String uid,
  }) {
    return _ref
        .collection('chats')
        .where('users', arrayContains: uid)
        .where(
          'chat_request_status',
          isEqualTo: PeamanChatRequestStatus.accepted.index,
        )
        .orderBy('last_updated', descending: true)
        .snapshots()
        .map(_acceptedChatsFromFirebase);
  }

  // stream of declined chats
  Stream<List<PeamanDeclinedChat>> declinedChatsList({
    required final String uid,
  }) {
    return _ref
        .collection('chats')
        .where('users', arrayContains: uid)
        .where(
          'chat_request_status',
          isEqualTo: PeamanChatRequestStatus.declined.index,
        )
        .orderBy('last_updated', descending: true)
        .snapshots()
        .map(_declinedChatsFromFirebase);
  }
}
