import 'package:peaman/peaman.dart';
import 'package:peaman/services/database_services/feed_provider.dart';

class PFeedProvider {
  static Future<void> createFeed({
    required final PeamanFeed feed,
    final Function(PeamanFeed)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    return await FeedProvider().createFeed(
      feed: feed,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> deleteFeed({
    required final String feedId,
    required final String ownerId,
  }) async {
    return await FeedProvider().deleteFeed(
      feedId: feedId,
      ownerId: ownerId,
    );
  }

  static Future<void> createMoment({
    required final PeamanMoment moment,
    required final Function(PeamanMoment)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    return await FeedProvider().createMoment(
      moment: moment,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> viewMoment({
    required final String momentId,
    required final String uid,
  }) async {
    return await FeedProvider().viewMoment(
      uid: uid,
      momentId: momentId,
    );
  }

  static Future<void> addReaction({
    required final PeamanReaction reaction,
    final Function(PeamanReaction)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    return await FeedProvider().addReaction(
      reaction: reaction,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> removeReaction({
    required final String feedId,
    required final String parentId,
    required final String reactionId,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    return await FeedProvider().removeReaction(
      feedId: feedId,
      parentId: parentId,
      reactionId: reactionId,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> addComment({
    required final PeamanComment comment,
    final Function(PeamanComment)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    return await FeedProvider().addComment(
      comment: comment,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> removeComment({
    required final String feedId,
    required final String parentId,
    required final String commentId,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    return await FeedProvider().removeComment(
      feedId: feedId,
      parentId: parentId,
      commentId: commentId,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> saveFeed({
    required final String feedId,
    required final String uid,
  }) async {
    return await FeedProvider().saveFeed(
      feedId: feedId,
      uid: uid,
    );
  }

  static Future<void> unSaveFeed({
    required final String feedId,
    required final String uid,
  }) async {
    return await FeedProvider().unSaveFeed(
      feedId: feedId,
      uid: uid,
    );
  }

  static Future<PeamanReaction?> getReactionByOwnerId({
    required final String feedId,
    required final String ownerId,
    required final PeamanReactionParent parent,
    required final String parentId,
  }) async {
    return await FeedProvider().getReactionByOwnerId(
      feedId: feedId,
      ownerId: ownerId,
      parent: parent,
      parentId: parentId,
    );
  }

  static Future<PeamanFeedSaves?> getFeedSavesByOwnerId({
    required final String feedId,
    required final String ownerId,
  }) async {
    return await FeedProvider().getFeedSavesByOwnerId(
      feedId: feedId,
      ownerId: ownerId,
    );
  }

  static Stream<List<PeamanFeed>> getAllFeeds() {
    return FeedProvider().allFeeds();
  }

  static Stream<List<PeamanMoment>> getAllMoments() {
    return FeedProvider().allMoments();
  }

  static Stream<List<PeamanFeed>> getFeedsBySearchKeyword({
    required final String searchKeyword,
  }) {
    return FeedProvider().feedsBySearchKeyword(
      searchKeyword: searchKeyword,
    );
  }

  static Stream<PeamanFeed> getSingleFeedById({
    required final String feedId,
  }) {
    return FeedProvider().singleFeedById(feedId: feedId);
  }

  static Stream<List<PeamanSavedFeed>> getSavedFeeds({
    required final String uid,
  }) {
    return FeedProvider().savedFeeds(uid: uid);
  }

  static Stream<List<PeamanComment>> getComments({
    required final String feedId,
    required final PeamanCommentParent parent,
    required final String parentId,
  }) {
    return FeedProvider().getComments(
      feedId: feedId,
      parent: parent,
      parentId: parentId,
    );
  }

  static Stream<PeamanComment> getSingleCommentById({
    required final String feedId,
    required final String commentId,
  }) {
    return FeedProvider().getSingleCommentById(
      feedId: feedId,
      commentId: commentId,
    );
  }
}
