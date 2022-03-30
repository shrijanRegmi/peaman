import 'package:peaman/peaman.dart';
import 'package:peaman/services/database_services/feed_provider.dart';

import '../helpers/common_helper.dart';

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

  static Future<void> updateFeed({
    required final String feedId,
    required final Map<String, dynamic> data,
    final bool partial = false,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    return await FeedProvider().updateFeed(
      feedId: feedId,
      data: data,
      partial: partial,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> deleteFeed({
    required final String feedId,
  }) async {
    return await FeedProvider().deleteFeed(
      feedId: feedId,
    );
  }

  static Future<void> followFeed({
    required final String uid,
    required final String feedId,
  }) {
    return FeedProvider().followFeed(uid: uid, feedId: feedId);
  }

  static Future<void> unFollowFeed({
    required final String uid,
    required final String feedId,
  }) {
    return FeedProvider().unfollowFeed(uid: uid, feedId: feedId);
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

  static Future<void> unsaveFeed({
    required final String feedId,
    required final String uid,
  }) async {
    return await FeedProvider().unSaveFeed(
      feedId: feedId,
      uid: uid,
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

  static Future<void> updateComment({
    required final String feedId,
    required final String commentId,
    required final Map<String, dynamic> data,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    return await FeedProvider().updateComment(
      feedId: feedId,
      commentId: commentId,
      data: data,
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

  static Future<PeamanReaction?> getReactionByOwnerId({
    required final String feedId,
    required final String ownerId,
    required final PeamanReactionParent parent,
    required final String parentId,
  }) async {
    CommonHelper.printListening(text: 'reactionByOwnerId');
    return await FeedProvider().getReactionByOwnerId(
      feedId: feedId,
      ownerId: ownerId,
      parent: parent,
      parentId: parentId,
    );
  }

  static Future<PeamanFeedSaves?> getFeedSavesByUid({
    required final String feedId,
    required final String uid,
  }) async {
    CommonHelper.printListening(text: 'feedSavesByUid');
    return await FeedProvider().getFeedSavesByUid(
      feedId: feedId,
      uid: uid,
    );
  }

  static Future<PeamanFeedFollower?> getFeedFollowerByUid({
    required final String feedId,
    required final String uid,
  }) {
    CommonHelper.printListening(text: 'feedFollowerByUid');
    return FeedProvider().getFeedFollowerByUid(
      feedId: feedId,
      uid: uid,
    );
  }

  static Stream<List<PeamanFeed>> getAllFeeds() {
    CommonHelper.printListening(text: 'allFeeds');
    return FeedProvider().allFeeds();
  }

  static Stream<List<PeamanMoment>> getAllMoments() {
    CommonHelper.printListening(text: 'allMoments');
    return FeedProvider().allMoments();
  }

  static Stream<List<PeamanMomentViewer>> getMomentViewers({
    required final String momentId,
  }) {
    CommonHelper.printListening(text: 'momentViewers');
    return FeedProvider().getMomentViewers(momentId: momentId);
  }

  static Stream<List<PeamanFeed>> getFeedsBySearchKeyword({
    required final String searchKeyword,
  }) {
    CommonHelper.printListening(text: 'feedsBySearchKeyword');
    return FeedProvider().feedsBySearchKeyword(
      searchKeyword: searchKeyword,
    );
  }

  static Stream<PeamanFeed> getSingleFeedById({
    required final String feedId,
  }) {
    CommonHelper.printListening(text: 'feedById');
    return FeedProvider().singleFeedById(feedId: feedId);
  }

  static Stream<List<PeamanSavedFeed>> getSavedFeeds({
    required final String uid,
  }) {
    CommonHelper.printListening(text: 'savedFeeds');
    return FeedProvider().savedFeeds(uid: uid);
  }

  static Stream<List<PeamanComment>> getComments({
    required final String feedId,
    required final PeamanCommentParent parent,
    required final String parentId,
  }) {
    CommonHelper.printListening(text: 'comments');
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
    CommonHelper.printListening(text: 'commentById');
    return FeedProvider().getSingleCommentById(
      feedId: feedId,
      commentId: commentId,
    );
  }

  static Stream<PeamanMoment> getSingleMomentById({
    required final String momentId,
  }) {
    CommonHelper.printListening(text: 'momentById');
    return FeedProvider().getSingleMomentById(
      momentId: momentId,
    );
  }
}
