import 'package:peaman/peaman.dart';
import 'package:peaman/services/database_services/feed_provider.dart';

import '../helpers/common_helper.dart';
import '../utils/firestore_constants.dart';

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

  static Future<void> viewFeed({
    required final String feedId,
    required final String uid,
    final Function(PeamanMoment)? onSuccess,
    final Function(dynamic)? onError,
  }) {
    return FeedProvider().viewFeed(
      feedId: feedId,
      uid: uid,
    );
  }

  static Future<void> createMoment({
    required final PeamanMoment moment,
    final Function(PeamanMoment)? onSuccess,
    final Function(dynamic)? onError,
  }) {
    return FeedProvider().createMoment(
      moment: moment,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> deletMomentPicture({
    required final String momentId,
    required final String pictureId,
    final Function(PeamanMoment)? onSuccess,
    final Function(dynamic)? onError,
  }) {
    return FeedProvider().deletMomentPicture(
      momentId: momentId,
      pictureId: pictureId,
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
    required final String ownerId,
    required final String feedId,
    required final String parentId,
    required final String reactionId,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    return await FeedProvider().removeReaction(
      ownerId: ownerId,
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
    required final String ownerId,
    required final String feedId,
    required final String parentId,
    required final String commentId,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    return await FeedProvider().removeComment(
      ownerId: ownerId,
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
    PeamanCommonHelper.printListening(text: 'reactionByOwnerId');
    return await FeedProvider().getReactionByOwnerId(
      feedId: feedId,
      ownerId: ownerId,
      parent: parent,
      parentId: parentId,
    );
  }

  static Future<PeamanFeedSaver?> getFeedSaverByUid({
    required final String feedId,
    required final String uid,
  }) async {
    PeamanCommonHelper.printListening(text: 'feedSaverByUid');
    return await FeedProvider().getFeedSaverByUid(
      feedId: feedId,
      uid: uid,
    );
  }

  static Future<PeamanFeedViewer?> getFeedViewerByUid({
    required final String feedId,
    required final String uid,
  }) async {
    PeamanCommonHelper.printListening(text: 'feedViewerByUid');
    return FeedProvider().getFeedViewerByUid(
      feedId: feedId,
      uid: uid,
    );
  }

  static Future<PeamanFeedFollower?> getFeedFollowerByUid({
    required final String feedId,
    required final String uid,
  }) {
    PeamanCommonHelper.printListening(text: 'feedFollowerByUid');
    return FeedProvider().getFeedFollowerByUid(
      feedId: feedId,
      uid: uid,
    );
  }

  static Stream<List<PeamanFeed>> getFeeds({
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feeds');
    return FeedProvider().getFeeds(query: query);
  }

  static Stream<List<PeamanFeed>> getUserFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userFeeds');
    return FeedProvider().getUserFeeds(uid: uid, query: query);
  }

  static Stream<List<PeamanMoment>> getMoments({
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'moments');
    return FeedProvider().getMoments(query: query);
  }

  static Stream<List<PeamanMoment>> getUserMoments({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userMoments');
    return FeedProvider().getUserMoments(uid: uid, query: query);
  }

  static Stream<List<PeamanMomentViewer>> getMomentViewers({
    required final String momentId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'momentViewers');
    return FeedProvider().getMomentViewers(
      momentId: momentId,
      query: query,
    );
  }

  static Stream<List<PeamanFeed>> getFeedsBySearchKeyword({
    required final String searchKeyword,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedsBySearchKeyword');
    return FeedProvider().getFeedsBySearchKeyword(
      searchKeyword: searchKeyword,
      query: query,
    );
  }

  static Stream<PeamanFeed> getSingleFeedById({
    required final String feedId,
  }) {
    PeamanCommonHelper.printListening(text: 'feedById');
    return FeedProvider().getSingleFeedById(feedId: feedId);
  }

  static Stream<List<PeamanSavedFeed>> getUserSavedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'savedFeeds');
    return FeedProvider().getUserSavedFeeds(
      uid: uid,
      query: query,
    );
  }

  static Stream<List<PeamanComment>> getComments({
    required final String feedId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'comments');
    return FeedProvider().getComments(
      feedId: feedId,
      parent: parent,
      query: query,
    );
  }

  static Stream<List<PeamanComment>> getCommentsByParentId({
    required final String feedId,
    required final PeamanCommentParent parent,
    required final String parentId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'comments');
    return FeedProvider().getCommentsByParentId(
      feedId: feedId,
      parent: parent,
      parentId: parentId,
      query: query,
    );
  }

  static Stream<List<PeamanComment>> getCommentsByOwnerId({
    required final String ownerId,
    required final String feedId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'commentsByOwnerId');
    return FeedProvider().getCommentsByOwnerId(
      ownerId: ownerId,
      feedId: feedId,
      parent: parent,
      query: query,
    );
  }

  static Stream<PeamanComment> getSingleCommentById({
    required final String feedId,
    required final String commentId,
  }) {
    PeamanCommonHelper.printListening(text: 'commentById');
    return FeedProvider().getSingleCommentById(
      feedId: feedId,
      commentId: commentId,
    );
  }

  static Stream<PeamanMoment> getSingleMomentById({
    required final String momentId,
  }) {
    PeamanCommonHelper.printListening(text: 'momentById');
    return FeedProvider().getSingleMomentById(
      momentId: momentId,
    );
  }
}
