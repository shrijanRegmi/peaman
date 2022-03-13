import 'package:firebase_auth/firebase_auth.dart';
import 'package:peaman/peaman.dart';
import 'package:peaman/services/database_services/feed_provider.dart';

class PFeedProvider {
  static final _auth = FirebaseAuth.instance;
  static Future<PeamanFeed?> createFeed({
    required final PeamanUser appUser,
    required final PeamanFeed feed,
  }) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(feed: feed, uid: _uid).createPost();
  }

  static Future deleteFeed({
    required final PeamanUser appUser,
    required final PeamanFeed feed,
  }) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(feed: feed, uid: _uid).deletePost();
  }

  static Future<PeamanMoment?> createMoment(
    final PeamanUser appUser,
    final PeamanMoment moment,
  ) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(moment: moment, uid: _uid).createMoment();
  }

  static Future viewMoment({
    required final PeamanUser appUser,
    required final PeamanMoment moment,
  }) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(moment: moment, uid: _uid).viewMoment(appUser);
  }

  static Future addReaction({
    required final String feedId,
    required final PeamanReaction reaction,
    final Function(PeamanReaction)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    return await FeedProvider().addReaction(
      feedId: feedId,
      reaction: reaction,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future removeReaction({
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

  static Future addComment({
    required final String feedId,
    required final PeamanComment comment,
    final Function(PeamanComment)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    return await FeedProvider().addComment(
      feedId: feedId,
      comment: comment,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future removeComment({
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

  static Future saveFeed({
    required final PeamanUser appUser,
    required final PeamanFeed feed,
  }) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(feed: feed, uid: _uid).savePost();
  }

  static Future unsaveFeed({
    required final PeamanUser appUser,
    required final PeamanFeed feed,
  }) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(feed: feed, uid: _uid).removeSavedPost();
  }

  static Future<PeamanFeed?> getSingleFeedByUser(
    final PeamanUser appUser,
    final String feedId,
  ) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(uid: _uid).getSinglePostById(feedId);
  }

  static Future<List<PeamanFeed>> getFeedsTimeline(
    final PeamanUser appUser,
  ) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(uid: _uid).getTimeline();
  }

  static Future<List<PeamanFeed>> getFeedsByUser(
    final PeamanUser appUser,
  ) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(uid: _uid).getPostsById();
  }

  static Future<List<PeamanFeed>> getFeaturedFeedsByUser(
    final PeamanUser appUser,
  ) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(uid: _uid).getFeaturedPostsById();
  }

  static Future<List<PeamanMoment>> getMomentsTimeline(
    final PeamanUser appUser,
  ) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(uid: _uid).getMoments();
  }

  static Future<List<PeamanMoment>> getMomentsByUser(
    final PeamanUser appUser,
  ) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(uid: _uid).getMyMoments();
  }

  static Future<List<PeamanFeed>> getOldFeedsTimeline(
    final PeamanUser appUser,
    final PeamanFeed lastFeed,
  ) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(uid: _uid, feed: lastFeed).getOldTimelinePosts();
  }

  static Future<List<PeamanFeed>> getOldFeedsByUser(
    final PeamanUser appUser,
    final PeamanFeed lastFeed,
  ) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(uid: _uid, feed: lastFeed).getOldPostsById();
  }

  static Future<List<PeamanFeed>> getOldFeaturedFeedsByUser(
    final PeamanUser appUser,
    final PeamanFeed lastFeed,
  ) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(uid: _uid, feed: lastFeed)
        .getOldFeaturedPostsById();
  }

  static Future<PeamanReaction?> getReactionById({
    required final PeamanFeed feed,
    required final String reactedById,
  }) async {
    return await FeedProvider(feed: feed).getReactionById(reactedById);
  }

  static Future<PeamanFeedSaves?> getFeedSavesById({
    required final PeamanFeed feed,
    required final String reactedById,
  }) async {
    return await FeedProvider(feed: feed).getFeedSavesById(reactedById);
  }

  static Stream<List<PeamanFeed>> getAllFeeds({final PeamanQuery? query}) {
    return FeedProvider().allFeeds(query: query);
  }

  static Stream<List<PeamanComment>> getComments({
    required final String feedId,
    required final PeamanCommentParent parent,
    required final String parentId,
  }) {
    return FeedProvider().comments(
      feedId: feedId,
      parent: parent,
      parentId: parentId,
    );
  }
}
