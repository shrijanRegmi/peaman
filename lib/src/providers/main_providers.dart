import 'package:riverpod/riverpod.dart';

import '../features/auth/repositories/auth_repository.dart';
import '../features/chat/repositories/chat_repository.dart';
import '../features/feed/repositories/feed_repository.dart';
import '../features/user/repositories/user_repository.dart';

final providerOfPeamanAuthRepository = Provider<PeamanAuthRepository>((ref) {
  return PeamanAuthRepositoryImpl(
    peamanUserRepository: ref.watch(providerOfPeamanUserRepository),
  );
});

final providerOfPeamanUserRepository = Provider<PeamanUserRepository>((ref) {
  return PeamanUserRepositoryImpl();
});

final providerOfPeamanChatRepository = Provider<PeamanChatRepository>((ref) {
  return PeamanChatRepositoryImpl();
});

final providerOfPeamanFeedRepository = Provider<PeamanFeedRepository>((ref) {
  return PeamanFeedRepositoryImpl();
});
