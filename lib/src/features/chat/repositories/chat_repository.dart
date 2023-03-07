import 'package:either_dart/either.dart';
import 'package:peaman/src/features/shared/models/peaman_error.dart';

import '../enums/chat_typing_status.dart';
import '../models/chat_model.dart';
import '../models/chat_message_model.dart';
import '../../shared/models/peaman_field.dart';
import '../../../utils/query_type_def.dart';

abstract class PeamanChatRepository {
  Future<Either<bool, PeamanError>> sendMessage({
    required final PeamanChatMessage message,
  });

  Future<Either<bool, PeamanError>> updateChat({
    required final String chatId,
    required final List<PeamanField> fields,
  });

  Future<Either<bool, PeamanError>> deleteChat({
    required final String chatId,
  });

  Future<Either<bool, PeamanError>> archiveChat({
    required final String chatId,
  });

  Future<Either<bool, PeamanError>> updateChatMessage({
    required final String chatId,
  });

  Future<Either<bool, PeamanError>> deleteChatMessage({
    required final String chatId,
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

  Stream<Either<List<PeamanChat>, PeamanError>> getChatsStream({
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<PeamanChat, PeamanError>> getSingleChat({
    required final String chatId,
  });

  Stream<Either<PeamanChat, PeamanError>> getSingleChatStream({
    required final String chatId,
  });

  Future<Either<List<PeamanChat>, PeamanError>> getIdleChats({
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanChat>, PeamanError>> getIdleChatsStream({
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanChat>, PeamanError>> getAcceptedChats({
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanChat>, PeamanError>> getAcceptedChatsStream({
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanChat>, PeamanError>> getDeclinedChats({
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanChat>, PeamanError>> getDeclinedChatsStream({
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanChatMessage>, PeamanError>> getChatMessages({
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanChatMessage>, PeamanError>> getChatMessagesStream({
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<PeamanChatMessage, PeamanError>> getSingleChatMessage({
    required final String chatId,
    required final String messageId,
  });

  Stream<Either<PeamanChatMessage, PeamanError>> getSingleChatMessageStream({
    required final String chatId,
    required final String messageId,
  });
}

class PeamanChatRepositoryImpl extends PeamanChatRepository {
  @override
  Future<Either<bool, PeamanError>> acceptChatRequest({
    required String chatId,
  }) {
    // TODO: implement acceptChatRequest
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> archiveChat({
    required String chatId,
  }) {
    // TODO: implement archiveChat
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> declineChatRequest({
    required String chatId,
  }) {
    // TODO: implement declineChatRequest
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> deleteChat({
    required String chatId,
  }) {
    // TODO: implement deleteChat
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> deleteChatMessage({
    required String chatId,
  }) {
    // TODO: implement deleteChatMessage
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanChat>, PeamanError>> getAcceptedChats({
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getAcceptedChats
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanChat>, PeamanError>> getAcceptedChatsStream({
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getAcceptedChatsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanChatMessage>, PeamanError>> getChatMessages({
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getChatMessages
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanChatMessage>, PeamanError>> getChatMessagesStream({
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getChatMessagesStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanChat>, PeamanError>> getChats({
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getChats
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanChat>, PeamanError>> getChatsStream({
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getChatsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanChat>, PeamanError>> getDeclinedChats({
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getDeclinedChats
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanChat>, PeamanError>> getDeclinedChatsStream({
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getDeclinedChatsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanChat>, PeamanError>> getIdleChats({
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getIdleChats
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanChat>, PeamanError>> getIdleChatsStream({
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getIdleChatsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<PeamanChat, PeamanError>> getSingleChat({
    required String chatId,
  }) {
    // TODO: implement getSingleChat
    throw UnimplementedError();
  }

  @override
  Future<Either<PeamanChatMessage, PeamanError>> getSingleChatMessage({
    required String chatId,
    required String messageId,
  }) {
    // TODO: implement getSingleChatMessage
    throw UnimplementedError();
  }

  @override
  Stream<Either<PeamanChatMessage, PeamanError>> getSingleChatMessageStream({
    required String chatId,
    required String messageId,
  }) {
    // TODO: implement getSingleChatMessageStream
    throw UnimplementedError();
  }

  @override
  Stream<Either<PeamanChat, PeamanError>> getSingleChatStream({
    required String chatId,
  }) {
    // TODO: implement getSingleChatStream
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> readChatMessages({
    required String chatId,
    required String uid,
  }) {
    // TODO: implement readChatMessages
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> sendMessage({
    required PeamanChatMessage message,
  }) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> setTypingStatus({
    required String chatId,
    required String uid,
    required PeamanChatTypingStatus typingStatus,
  }) {
    // TODO: implement setTypingStatus
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> updateChat({
    required String chatId,
    required List<PeamanField> fields,
  }) {
    // TODO: implement updateChat
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> updateChatMessage({
    required String chatId,
  }) {
    // TODO: implement updateChatMessage
    throw UnimplementedError();
  }
}
