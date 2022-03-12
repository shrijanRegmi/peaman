import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/peaman.dart';

class MessageProvider {
  final String? chatId;
  final DocumentReference<Map<String, dynamic>>? messageRef;
  final String? appUserId;
  final int limit;
  MessageProvider({
    this.chatId,
    this.messageRef,
    this.appUserId,
    this.limit = 10,
  });

  final _ref = FirebaseFirestore.instance;

  // send message
  Future sendMessage({required final PeamanMessage message}) async {
    try {
      final _messagesRef =
          _ref.collection('chats').doc(chatId).collection('messages');
      final _chatRef = _ref.collection('chats').doc(chatId);

      final _messagesDocs = await _messagesRef.limit(2).get();

      if (_messagesDocs.docs.length == 0) {
        await _chatRef.set({'id': chatId});
      }
      final bool _isAppUserFirstUser = PChatHelper.isAppUserFirstUser(
          myId: message.senderId, friendId: message.receiverId);

      final _chatSnap = await _chatRef.get();
      if (_isAppUserFirstUser) {
        final _secondUserUnreadMessagesCount = _chatSnap.data() != null
            ? _chatSnap.data()!['second_user_unread_messages_count'] ?? 0
            : 0;

        _chatRef.update(
          {
            'second_user_unread_messages_count':
                _secondUserUnreadMessagesCount + 1
          },
        );
      } else {
        final _firstUserUnreadMessagesCount = _chatSnap.data() != null
            ? _chatSnap.data()!['first_user_unread_messages_count'] ?? 0
            : 0;

        _chatRef.update(
          {
            'first_user_unread_messages_count':
                _firstUserUnreadMessagesCount + 1
          },
        );
      }

      final _lastMsgRef = _messagesRef.doc();
      final _message = message.copyWith(id: _lastMsgRef.id).toJson();

      _lastMsgRef.set(_message);

      _chatRef.update({'last_updated': DateTime.now()});
      _chatRef.update({'last_msg_ref': _lastMsgRef});

      if (_messagesDocs.docs.length == 0) {
        _sendAdditionalProperties(
          myId: message.senderId,
          friendId: message.receiverId,
        );
      }
      print('Success: Sending message to ${message.receiverId}');
    } catch (e) {
      print(e);
      print('Error: Sending message to ${message.receiverId}');
      return null;
    }
  }

  // send additional properties with message
  Future _sendAdditionalProperties({
    final String? myId,
    final String? friendId,
  }) async {
    try {
      final _chatRef = _ref.collection('chats').doc(chatId);

      final bool _isAppUserFirstUser = PChatHelper.isAppUserFirstUser(
        myId: myId ?? '',
        friendId: friendId ?? '',
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
        'chat_request_status': PeamanChatRequestStatus.idle,
        'chat_request_sender_id': myId,
      });

      print('Success: Sending additonal fields in chats collection');
    } catch (e) {
      print(e);
      print('Error!!!: Sending additonal fields in chats collection');
    }
  }

  // set pinned status
  Future setPinnedStatus({
    final bool? isPinned,
    final String? myId,
    final String? friendId,
  }) async {
    try {
      final _isAppUserFirstUser = PChatHelper.isAppUserFirstUser(
        myId: myId ?? '',
        friendId: friendId ?? '',
      );

      final _chatRef = _ref.collection('chats').doc(chatId);

      Map<String, dynamic> _data;

      if (_isAppUserFirstUser) {
        _data = {
          'first_user_pinned_second_user': isPinned,
        };
      } else {
        _data = {
          'second_user_pinned_first_user': isPinned,
        };
      }

      await _chatRef.update(_data);
      print('Success: Pinned user with id $friendId');
      return 'Sucess';
    } catch (e) {
      print(e);
      print('Error!!!: Pinned user with id $friendId');
      return null;
    }
  }

  // update chat data
  Future updateChatData(final Map<String, dynamic> data) async {
    try {
      final _chatRef = _ref.collection('chats').doc(chatId);
      await _chatRef.update(data);
      print('Success: Updating chat data having chatId $chatId');
      return 'Success';
    } catch (e) {
      print(e);
      print('Error!!!: Updating chat data having chatId $chatId');
      return null;
    }
  }

  // read chat message
  Future readChatMessage(
    final PeamanChatUser chatUser,
  ) async {
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
  Future setTyping(
    final PeamanChatUser chatUser,
    final PeamanTypingState typingState,
  ) async {
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
  Future acceptChatRequest() async {
    try {
      final _chatRef = _ref.collection('chats').doc(chatId);
      await _chatRef.update({
        'chat_request_status': PeamanChatRequestStatus.accepted,
      });
      print('Success: Accepting chat request $chatId');
    } catch (e) {
      print(e);
      print('Error: Accepting chat request $chatId');
    }
  }

  // decline chat request
  Future declineChatRequest() async {
    try {
      final _chatRef = _ref.collection('chats').doc(chatId);
      await _chatRef.update({
        'chat_request_status': PeamanChatRequestStatus.declined,
      });
      print('Success: Accepting chat request $chatId');
    } catch (e) {
      print(e);
      print('Error: Accepting chat request $chatId');
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

  // message from firebase
  PeamanMessage _singleMessageFrom(
      DocumentSnapshot<Map<String, dynamic>> snap) {
    return PeamanMessage.fromJson(snap.data() ?? {});
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
  Stream<List<PeamanMessage>> get messagesList {
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
  Stream<PeamanMessage> message(final String messageId) {
    return _ref
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(messageId)
        .snapshots()
        .map(_messageFromFirebase);
  }

  // stream of chats
  Stream<List<PeamanChat>> get chatList {
    return _ref
        .collection('chats')
        .where('users', arrayContains: appUserId)
        .orderBy('last_updated', descending: true)
        .snapshots()
        .map(_chatsFromFirebase);
  }

  // stream of idle chats
  Stream<List<PeamanIdleChat>> get idleChatsList {
    return _ref
        .collection('chats')
        .where('users', arrayContains: appUserId)
        .where(
          'chat_request_status',
          isEqualTo: PeamanChatRequestStatus.idle.index,
        )
        .orderBy('last_updated', descending: true)
        .snapshots()
        .map(_idleChatsFromFirebase);
  }

  // stream of accepted chats
  Stream<List<PeamanAcceptedChat>> get acceptedChatsList {
    return _ref
        .collection('chats')
        .where('users', arrayContains: appUserId)
        .where(
          'chat_request_status',
          isEqualTo: PeamanChatRequestStatus.accepted.index,
        )
        .orderBy('last_updated', descending: true)
        .snapshots()
        .map(_acceptedChatsFromFirebase);
  }

  // stream of declined chats
  Stream<List<PeamanDeclinedChat>> get declinedChatsList {
    return _ref
        .collection('chats')
        .where('users', arrayContains: appUserId)
        .where(
          'chat_request_status',
          isEqualTo: PeamanChatRequestStatus.declined.index,
        )
        .orderBy('last_updated', descending: true)
        .snapshots()
        .map(_declinedChatsFromFirebase);
  }

  // stream of message from a particular reference
  Stream<PeamanMessage>? get messageFromRef {
    return messageRef?.snapshots().map(_singleMessageFrom);
  }
}
