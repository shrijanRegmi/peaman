import 'package:either_dart/either.dart';

import '../../../utils/query_type_def.dart';
import '../../shared/models/peaman_error.dart';
import '../../shared/models/peaman_field.dart';
import '../../user/models/sub_user_model.dart';
import '../enums/comment_parent_type.dart';
import '../enums/reaction_parent_type.dart';
import '../models/comment_model.dart';
import '../models/feed_model.dart';
import '../models/reaction_model.dart';
import '../models/sub_feed_model.dart';

abstract class PeamanFeedRepository {
  Future<Either<PeamanFeed, PeamanError>> createFeed({
    required final PeamanFeed feed,
  });

  Future<Either<bool, PeamanError>> updateFeed({
    required final String feedId,
    required final List<PeamanField> fields,
  });

  Future<Either<bool, PeamanError>> deleteFeed({
    required final String feedId,
  });

  Future<Either<bool, PeamanError>> addFeedToHashtags({
    required final String feedId,
    required final List<String> hashtags,
  });

  Future<Either<bool, PeamanError>> removeFeedFromHashtags({
    required final String feedId,
    required final List<String> hashtags,
  });

  Future<Either<bool, PeamanError>> followFeed({
    required final String feedId,
    required final String uid,
  });

  Future<Either<bool, PeamanError>> unfollowFeed({
    required final String feedId,
    required final String uid,
  });

  Future<Either<bool, PeamanError>> saveFeed({
    required final String feedId,
    required final String uid,
  });

  Future<Either<bool, PeamanError>> unsaveFeed({
    required final String feedId,
    required final String uid,
  });

  Future<Either<bool, PeamanError>> viewFeed({
    required final String feedId,
    required final String uid,
  });

  Future<Either<bool, PeamanError>> unviewFeed({
    required final String feedId,
    required final String uid,
  });

  Future<Either<PeamanReaction, PeamanError>> createReaction({
    required final PeamanReaction reaction,
    final bool updateParentReactionsCount = true,
    final bool updateUserReactionsCount = true,
  });

  Future<Either<PeamanReaction, PeamanError>> deleteReaction({
    required final String feedId,
    required final String reactionId,
    required final String ownerId,
    required final String parentId,
    required final String parentOwnerId,
    final bool updateParentReactionsCount = true,
    final bool updateUserReactionsCount = true,
  });

  Future<Either<PeamanComment, PeamanError>> createComment({
    required final PeamanComment comment,
  });

  Future<Either<PeamanComment, PeamanError>> updateComment({
    required final String commentId,
    required final List<PeamanField> fields,
  });

  Future<Either<PeamanComment, PeamanError>> deleteComment({
    required final PeamanComment comment,
  });

  Future<Either<List<PeamanFeed>, PeamanError>> getFeeds({
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanFeed>, PeamanError>> getFeedsStream({
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanFeed>, PeamanError>> getUserFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanFeed>, PeamanError>> getUserFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserReactedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanSubFeed>, PeamanError>> getUserReactedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserCommentedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanSubFeed>, PeamanError>> getUserCommentedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserRepliedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanSubFeed>, PeamanError>> getUserRepliedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserFollowedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanSubFeed>, PeamanError>> getUserFollowedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserSavedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanSubFeed>, PeamanError>> getUserSavedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserViewedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanSubFeed>, PeamanError>> getUserViewedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanSubUser>, PeamanError>> getFeedReactors({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanSubUser>, PeamanError>> getFeedReactorsStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedCommenters({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanSubUser>, PeamanError>> getFeedCommentersStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedRepliers({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanSubUser>, PeamanError>> getFeedRepliersStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedFollowers({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanSubUser>, PeamanError>> getFeedFollowersStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedSavers({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanSubUser>, PeamanError>> getFeedSaversStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedViewers({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanSubUser>, PeamanError>> getFeedViewersStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanReaction>, PeamanError>> getReactions({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanReaction>, PeamanError>> getReactionsStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanReaction>, PeamanError>> getReactionsByOwnerId({
    required final String feedId,
    required final String ownerId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanReaction>, PeamanError>>
      getReactionsByOwnerIdStream({
    required final String feedId,
    required final String ownerId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanReaction>, PeamanError>> getReactionsByParentId({
    required final String feedId,
    required final String parentId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanReaction>, PeamanError>>
      getReactionsByParentIdStream({
    required final String feedId,
    required final String parentId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanComment>, PeamanError>> getComments({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanComment>, PeamanError>> getCommentsStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanComment>, PeamanError>> getCommentsByOwnerId({
    required final String feedId,
    required final String ownerId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanComment>, PeamanError>> getCommentsByOwnerIdStream({
    required final String feedId,
    required final String ownerId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanComment>, PeamanError>> getCommentsByParentId({
    required final String feedId,
    required final String parentId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<Either<List<PeamanComment>, PeamanError>> getCommentsByParentIdStream({
    required final String feedId,
    required final String parentId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<PeamanReaction, PeamanError>> getSingleReaction({
    required final String feedId,
    required final String reactionId,
  });

  Stream<Either<PeamanReaction, PeamanError>> getSingleReactionStream({
    required final String feedId,
    required final String reactionId,
  });

  Future<Either<PeamanReaction, PeamanError>> getSingleReactionByOwnerId({
    required final String feedId,
    required final String ownerId,
    required final PeamanReactionParent parent,
    required final String parentId,
  });

  Stream<Either<PeamanReaction, PeamanError>> getSingleReactionByOwnerIdStream({
    required final String feedId,
    required final String ownerId,
    required final PeamanReactionParent parent,
    required final String parentId,
  });

  Future<Either<PeamanComment, PeamanError>> getSingleComment({
    required final String feedId,
    required final String commentId,
  });

  Stream<Either<PeamanComment, PeamanError>> getSingleCommentStream({
    required final String feedId,
    required final String commentId,
  });
}

class PeamanFeedRepositoryImpl extends PeamanFeedRepository {
  @override
  Future<Either<bool, PeamanError>> addFeedToHashtags({
    required String feedId,
    required List<String> hashtags,
  }) {
    // TODO: implement addFeedToHashtags
    throw UnimplementedError();
  }

  @override
  Future<Either<PeamanComment, PeamanError>> createComment({
    required PeamanComment comment,
  }) {
    // TODO: implement createComment
    throw UnimplementedError();
  }

  @override
  Future<Either<PeamanFeed, PeamanError>> createFeed({
    required PeamanFeed feed,
  }) {
    // TODO: implement createFeed
    throw UnimplementedError();
  }

  @override
  Future<Either<PeamanReaction, PeamanError>> createReaction({
    required PeamanReaction reaction,
    bool updateParentReactionsCount = true,
    bool updateUserReactionsCount = true,
  }) {
    // TODO: implement createReaction
    throw UnimplementedError();
  }

  @override
  Future<Either<PeamanComment, PeamanError>> deleteComment({
    required PeamanComment comment,
  }) {
    // TODO: implement deleteComment
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> deleteFeed({
    required String feedId,
  }) {
    // TODO: implement deleteFeed
    throw UnimplementedError();
  }

  @override
  Future<Either<PeamanReaction, PeamanError>> deleteReaction({
    required String feedId,
    required String reactionId,
    required String ownerId,
    required String parentId,
    required String parentOwnerId,
    bool updateParentReactionsCount = true,
    bool updateUserReactionsCount = true,
  }) {
    // TODO: implement deleteReaction
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> followFeed({
    required String feedId,
    required String uid,
  }) {
    // TODO: implement followFeed
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanComment>, PeamanError>> getComments({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getComments
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanComment>, PeamanError>> getCommentsByOwnerId({
    required String feedId,
    required String ownerId,
    required PeamanCommentParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getCommentsByOwnerId
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanComment>, PeamanError>> getCommentsByOwnerIdStream({
    required String feedId,
    required String ownerId,
    required PeamanCommentParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getCommentsByOwnerIdStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanComment>, PeamanError>> getCommentsByParentId({
    required String feedId,
    required String parentId,
    required PeamanCommentParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getCommentsByParentId
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanComment>, PeamanError>> getCommentsByParentIdStream({
    required String feedId,
    required String parentId,
    required PeamanCommentParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getCommentsByParentIdStream
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanComment>, PeamanError>> getCommentsStream({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getCommentsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedCommenters({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFeedCommenters
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanSubUser>, PeamanError>> getFeedCommentersStream({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFeedCommentersStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedFollowers({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFeedFollowers
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanSubUser>, PeamanError>> getFeedFollowersStream({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFeedFollowersStream
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanSubUser>, PeamanError>> getFeedReactors({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFeedReactors
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanSubUser>, PeamanError>> getFeedReactorsStream({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFeedReactorsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedRepliers({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFeedRepliers
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanSubUser>, PeamanError>> getFeedRepliersStream({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFeedRepliersStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedSavers({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFeedSavers
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanSubUser>, PeamanError>> getFeedSaversStream({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFeedSaversStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedViewers({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFeedViewers
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanSubUser>, PeamanError>> getFeedViewersStream({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFeedViewersStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanFeed>, PeamanError>> getFeeds({
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFeeds
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanFeed>, PeamanError>> getFeedsStream({
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getFeedsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanReaction>, PeamanError>> getReactions({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getReactions
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanReaction>, PeamanError>> getReactionsByOwnerId({
    required String feedId,
    required String ownerId,
    required PeamanCommentParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getReactionsByOwnerId
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanReaction>, PeamanError>>
      getReactionsByOwnerIdStream({
    required String feedId,
    required String ownerId,
    required PeamanCommentParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getReactionsByOwnerIdStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanReaction>, PeamanError>> getReactionsByParentId({
    required String feedId,
    required String parentId,
    required PeamanCommentParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getReactionsByParentId
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanReaction>, PeamanError>>
      getReactionsByParentIdStream({
    required String feedId,
    required String parentId,
    required PeamanCommentParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getReactionsByParentIdStream
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanReaction>, PeamanError>> getReactionsStream({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getReactionsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<PeamanComment, PeamanError>> getSingleComment({
    required String feedId,
    required String commentId,
  }) {
    // TODO: implement getSingleComment
    throw UnimplementedError();
  }

  @override
  Stream<Either<PeamanComment, PeamanError>> getSingleCommentStream({
    required String feedId,
    required String commentId,
  }) {
    // TODO: implement getSingleCommentStream
    throw UnimplementedError();
  }

  @override
  Future<Either<PeamanReaction, PeamanError>> getSingleReaction({
    required String feedId,
    required String reactionId,
  }) {
    // TODO: implement getSingleReaction
    throw UnimplementedError();
  }

  @override
  Future<Either<PeamanReaction, PeamanError>> getSingleReactionByOwnerId({
    required String feedId,
    required String ownerId,
    required PeamanReactionParent parent,
    required String parentId,
  }) {
    // TODO: implement getSingleReactionByOwnerId
    throw UnimplementedError();
  }

  @override
  Stream<Either<PeamanReaction, PeamanError>> getSingleReactionByOwnerIdStream({
    required String feedId,
    required String ownerId,
    required PeamanReactionParent parent,
    required String parentId,
  }) {
    // TODO: implement getSingleReactionByOwnerIdStream
    throw UnimplementedError();
  }

  @override
  Stream<Either<PeamanReaction, PeamanError>> getSingleReactionStream({
    required String feedId,
    required String reactionId,
  }) {
    // TODO: implement getSingleReactionStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserCommentedFeeds({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUserCommentedFeeds
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanSubFeed>, PeamanError>> getUserCommentedFeedsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUserCommentedFeedsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanFeed>, PeamanError>> getUserFeeds({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUserFeeds
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanFeed>, PeamanError>> getUserFeedsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUserFeedsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserFollowedFeeds({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUserFollowedFeeds
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanSubFeed>, PeamanError>> getUserFollowedFeedsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUserFollowedFeedsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserReactedFeeds({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUserReactedFeeds
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanSubFeed>, PeamanError>> getUserReactedFeedsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUserReactedFeedsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserRepliedFeeds({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUserRepliedFeeds
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanSubFeed>, PeamanError>> getUserRepliedFeedsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUserRepliedFeedsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserSavedFeeds({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUserSavedFeeds
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanSubFeed>, PeamanError>> getUserSavedFeedsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUserSavedFeedsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserViewedFeeds({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUserViewedFeeds
    throw UnimplementedError();
  }

  @override
  Stream<Either<List<PeamanSubFeed>, PeamanError>> getUserViewedFeedsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    // TODO: implement getUserViewedFeedsStream
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> removeFeedFromHashtags({
    required String feedId,
    required List<String> hashtags,
  }) {
    // TODO: implement removeFeedFromHashtags
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> saveFeed({
    required String feedId,
    required String uid,
  }) {
    // TODO: implement saveFeed
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> unfollowFeed({
    required String feedId,
    required String uid,
  }) {
    // TODO: implement unfollowFeed
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> unsaveFeed({
    required String feedId,
    required String uid,
  }) {
    // TODO: implement unsaveFeed
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> unviewFeed({
    required String feedId,
    required String uid,
  }) {
    // TODO: implement unviewFeed
    throw UnimplementedError();
  }

  @override
  Future<Either<PeamanComment, PeamanError>> updateComment({
    required String commentId,
    required List<PeamanField> fields,
  }) {
    // TODO: implement updateComment
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> updateFeed({
    required String feedId,
    required List<PeamanField> fields,
  }) {
    // TODO: implement updateFeed
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, PeamanError>> viewFeed({
    required String feedId,
    required String uid,
  }) {
    // TODO: implement viewFeed
    throw UnimplementedError();
  }
}
