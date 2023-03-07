import 'package:riverpod/riverpod.dart';

import '../features/auth/repositories/auth_repository.dart';
import '../features/chat/repositories/chat_repository.dart';
import '../features/user/repositories/user_repository.dart';

final providerOfPeamanAuth = Provider<PeamanAuthRepository>((ref) {
  return PeamanAuthRepositoryImpl();
});

final providerOfPeamanUser = Provider<PeamanUserRepository>((ref) {
  return PeamanUserRepositoryImpl();
});

final providerOfPeamanChat = Provider<PeamanChatRepository>((ref) {
  return PeamanChatRepositoryImpl();
});
