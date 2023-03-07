import 'package:either_dart/either.dart';

import '../../shared/models/peaman_error.dart';
import '../../shared/models/peaman_field.dart';
import '../../../utils/query_type_def.dart';
import '../enums/online_status_type.dart';
import '../models/follow_request_model.dart';
import '../models/following_model.dart';
import '../models/sub_user_model.dart';
import '../models/user_model.dart';

abstract class PeamanUserRepository {
  Future<Either<bool, PeamanError>> createUser({
    required final PeamanUser user,
  });

  Future<Either<bool, PeamanError>> updateUser({
    required final String uid,
    required final List<PeamanField> fields,
  });

  Future<Either<bool, PeamanError>> deleteUser({
    required final String uid,
  });

  Future<Either<bool, PeamanError>> followUser({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PeamanError>> acceptFollowRequest({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PeamanError>> ignoreFollowRequest({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PeamanError>> cancelFollowRequest({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PeamanError>> followBackUser({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PeamanError>> unfollowUser({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PeamanError>> blockUser({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PeamanError>> unblockUser({
    required final String uid,
    required final String friendId,
  });

  Future<Either<bool, PeamanError>> setUserOnlineStatus({
    required final String uid,
    required final PeamanOnlineStatus onlineStatus,
  });

  Future<Either<bool, PeamanError>> setIsOnboardingCompleted({
    required final String uid,
    required final bool isOnboardingCompleted,
  });

  Future<Either<List<PeamanUser>, PeamanError>> getUsers({
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanUser>, PeamanError>> getUsersStream({
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<PeamanUser, PeamanError>> getSingleUser({
    required final String uid,
  });

  Stream<Either<PeamanUser, PeamanError>> getSingleUserStream({
    required final String uid,
  });

  Future<Either<List<PeamanUser>, PeamanError>> getUsersBySearchKey({
    required final String searchKey,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanUser>, PeamanError>> getUsersBySearchKeyStream({
    required final String searchKey,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanFollowRequest>, PeamanError>>
      getReceivedFollowRequests({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanFollowRequest>, PeamanError>>
      getReceivedFollowRequestsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanFollowRequest>, PeamanError>> getSentFollowRequests({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanFollowRequest>, PeamanError>>
      getSentFollowRequestsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getFollowers({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanSubUser>, PeamanError>> getFollowersStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanFollowing>, PeamanError>> getFollowings({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanFollowing>, PeamanError>> getFollowingsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getBlockedUsers({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanSubUser>, PeamanError>> getBlockedUsersStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getBlockedByUsers({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanSubUser>, PeamanError>> getBlockedByUsersStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });
}

class PeamanUserRepositoryImpl extends PeamanUserRepository {
  @override
  Future<Either<bool, PeamanError>> acceptFollowRequest({
    required String uid,
    required String friendId,
  }) {
    // TODO: implement acceptFollowRequest
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> blockUser({
    required String uid,
    required String friendId,
  }) {
    // TODO: implement blockUser
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> cancelFollowRequest({
    required String uid,
    required String friendId,
  }) {
    // TODO: implement cancelFollowRequest
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> createUser({
    required PeamanUser user,
  }) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> deleteUser({
    required String uid,
  }) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> followBackUser({
    required String uid,
    required String friendId,
  }) {
    // TODO: implement followBackUser
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> followUser({
    required String uid,
    required String friendId,
  }) {
    // TODO: implement followUser
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getBlockedByUsers({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getBlockedByUsers
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanSubUser>, PeamanError>> getBlockedByUsersStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getBlockedByUsersStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getBlockedUsers({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getBlockedUsers
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanSubUser>, PeamanError>> getBlockedUsersStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getBlockedUsersStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getFollowers({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFollowers
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanSubUser>, PeamanError>> getFollowersStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFollowersStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanFollowing>, PeamanError>> getFollowings({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFollowings
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanFollowing>, PeamanError>> getFollowingsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFollowingsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanFollowRequest>, PeamanError>>
      getReceivedFollowRequests({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getReceivedFollowRequests
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanFollowRequest>, PeamanError>>
      getReceivedFollowRequestsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getReceivedFollowRequestsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanFollowRequest>, PeamanError>> getSentFollowRequests({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getSentFollowRequests
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanFollowRequest>, PeamanError>>
      getSentFollowRequestsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getSentFollowRequestsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<PeamanUser, PeamanError>> getSingleUser({
    required String uid,
  }) {
    // TODO: implement getSingleUser
    throw UnimplementedError();
  }

  @override
  Stream<Either<PeamanUser, PeamanError>> getSingleUserStream({
    required String uid,
  }) {
    // TODO: implement getSingleUserStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanUser>, PeamanError>> getUsers({
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanUser>, PeamanError>> getUsersBySearchKey({
    required String searchKey,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUsersBySearchKey
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanUser>, PeamanError>> getUsersBySearchKeyStream({
    required String searchKey,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUsersBySearchKeyStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanUser>, PeamanError>> getUsersStream({
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUsersStream
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> ignoreFollowRequest({
    required String uid,
    required String friendId,
  }) {
    // TODO: implement ignoreFollowRequest
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> setIsOnboardingCompleted({
    required String uid,
    required bool isOnboardingCompleted,
  }) {
    // TODO: implement setIsOnboardingCompleted
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> setUserOnlineStatus({
    required String uid,
    required PeamanOnlineStatus onlineStatus,
  }) {
    // TODO: implement setUserOnlineStatus
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> unblockUser({
    required String uid,
    required String friendId,
  }) {
    // TODO: implement unblockUser
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> unfollowUser({
    required String uid,
    required String friendId,
  }) {
    // TODO: implement unfollowUser
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> updateUser({
    required String uid,
    required List<PeamanField> fields,
  }) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
