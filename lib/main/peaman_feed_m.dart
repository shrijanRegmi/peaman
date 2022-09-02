import 'package:peaman/peaman.dart';
import 'package:peaman/services/database_services/feed_provider.dart';

import '../helpers/common_helper.dart';
import '../utils/firestore_constants.dart';

class PFeedProvider {
  static Future<void> createFeed({
    required final PeamanFeed feed,
    final Function(PeamanFeed)? onSuccess,
    final Function(dynamic)? onError,
  }) {
    return FeedProvider().createFeed(
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
  }) {
    return FeedProvider().updateFeed(
      feedId: feedId,
      data: data,
      partial: partial,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> updateFeedPropertiesCount({
    required final String feedId,
    final int reactionsCount = 0,
    final int commentsCount = 0,
    final int repliesCount = 0,
    final int savesCount = 0,
    final int sharesCount = 0,
    final int viewsCount = 0,
  }) {
    return FeedProvider().updateFeedPropertiesCount(
      feedId: feedId,
      reactionsCount: reactionsCount,
      commentsCount: commentsCount,
      repliesCount: repliesCount,
      savesCount: savesCount,
      sharesCount: sharesCount,
      viewsCount: viewsCount,
    );
  }

  static Future<void> deleteFeed({
    required final String feedId,
  }) {
    return FeedProvider().deleteFeed(
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
  }) {
    return FeedProvider().saveFeed(
      feedId: feedId,
      uid: uid,
    );
  }

  static Future<void> unsaveFeed({
    required final String feedId,
    required final String uid,
  }) {
    return FeedProvider().unSaveFeed(
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
  }) {
    return FeedProvider().viewMoment(
      uid: uid,
      momentId: momentId,
    );
  }

  static Future<void> addReaction({
    required final PeamanReaction reaction,
    final Function(PeamanReaction)? onSuccess,
    final Function(dynamic)? onError,
  }) {
    return FeedProvider().addReaction(
      reaction: reaction,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> removeReaction({
    required final String feedId,
    required final String reactionId,
    required final String ownerId,
    required final String parentId,
    required final String parentOwnerId,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) {
    return FeedProvider().removeReaction(
      feedId: feedId,
      reactionId: reactionId,
      ownerId: ownerId,
      parentId: parentId,
      parentOwnerId: parentOwnerId,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> addComment({
    required final PeamanComment comment,
    final Function(PeamanComment)? onSuccess,
    final Function(dynamic)? onError,
  }) {
    return FeedProvider().addComment(
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
  }) {
    return FeedProvider().updateComment(
      feedId: feedId,
      commentId: commentId,
      data: data,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<void> updateCommentPropertiesCount({
    required final String feedId,
    required final String commentId,
    final int reactionsCount = 0,
    final int repliesCount = 0,
  }) {
    return FeedProvider().updateCommentPropertiesCount(
      feedId: feedId,
      commentId: commentId,
      reactionsCount: reactionsCount,
      repliesCount: repliesCount,
    );
  }

  static Future<void> removeComment({
    required final String feedId,
    required final String commentId,
    required final String ownerId,
    required final String parentId,
    required final String parentOwnerId,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) {
    return FeedProvider().removeComment(
      feedId: feedId,
      commentId: commentId,
      ownerId: ownerId,
      parentId: parentId,
      parentOwnerId: parentOwnerId,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Future<PeamanReaction?> getReactionByOwnerId({
    required final String feedId,
    required final String ownerId,
    required final PeamanReactionParent parent,
    required final String parentId,
  }) {
    PeamanCommonHelper.printListening(text: 'reactionByOwnerId');
    return FeedProvider().getReactionByOwnerId(
      feedId: feedId,
      ownerId: ownerId,
      parent: parent,
      parentId: parentId,
    );
  }

  static Future<PeamanFeedSaver?> getFeedSaverByUid({
    required final String feedId,
    required final String uid,
  }) {
    PeamanCommonHelper.printListening(text: 'feedSaverByUid');
    return FeedProvider().getFeedSaverByUid(
      feedId: feedId,
      uid: uid,
    );
  }

  static Future<PeamanFeedViewer?> getFeedViewerByUid({
    required final String feedId,
    required final String uid,
  }) {
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
