import 'package:peaman/peaman.dart';
import 'package:peaman/services/database_services/feed_provider.dart';

import '../helpers/common_helper.dart';
import '../utils/query_type_def.dart';

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
    required final String ownerId,
    required final String feedId,
  }) {
    return FeedProvider().deleteFeed(
      ownerId: ownerId,
      feedId: feedId,
    );
  }

  static Future<void> addFeedToHashtags({
    required final String feedId,
    required final List<String> hashtags,
  }) {
    return FeedProvider().addFeedToHashtags(
      feedId: feedId,
      hashtags: hashtags,
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
    final bool updateParentReactionsCount = true,
    final bool updateUserReactionsCount = true,
    final Function(dynamic)? onError,
  }) {
    return FeedProvider().addReaction(
      reaction: reaction,
      updateParentReactionsCount: updateParentReactionsCount,
      updateUserReactionsCount: updateUserReactionsCount,
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
    final bool updateParentReactionsCount = true,
    final bool updateUserReactionsCount = true,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) {
    return FeedProvider().removeReaction(
      feedId: feedId,
      reactionId: reactionId,
      ownerId: ownerId,
      parentId: parentId,
      parentOwnerId: parentOwnerId,
      updateParentReactionsCount: updateParentReactionsCount,
      updateUserReactionsCount: updateUserReactionsCount,
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

  static Future<List<PeamanFeed>> getFeeds({
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feeds');
    return FeedProvider().getFeeds(query: query);
  }

  static Stream<List<PeamanFeed>> getFeedsStream({
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feeds');
    return FeedProvider().getFeedsStream(query: query);
  }

  static Future<List<PeamanFeed>> getUserFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userFeeds');
    return FeedProvider().getUserFeeds(uid: uid, query: query);
  }

  static Stream<List<PeamanFeed>> getUserFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userFeeds');
    return FeedProvider().getUserFeedsStream(uid: uid, query: query);
  }

  static Future<List<PeamanMyFeed>> getUserMyFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userMyFeeds');
    return FeedProvider().getUserMyFeeds(uid: uid, query: query);
  }

  static Stream<List<PeamanMyFeed>> getUserMyFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userMyFeeds');
    return FeedProvider().getUserMyFeedsStream(uid: uid, query: query);
  }

  static Future<PeamanHashtag> getHashtagById({
    required final String hashtagId,
  }) {
    PeamanCommonHelper.printListening(text: 'hashtagById');
    return FeedProvider().getHashtagById(hashtagId: hashtagId);
  }

  static Stream<PeamanHashtag> getHashtagByIdStream({
    required final String hashtagId,
  }) {
    PeamanCommonHelper.printListening(text: 'hashtagById');
    return FeedProvider().getHashtagByIdStream(hashtagId: hashtagId);
  }

  static Future<List<PeamanHashtag>> getHashtags({
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'hashtags');
    return FeedProvider().getHashtags(query: query);
  }

  static Stream<List<PeamanHashtag>> getHashtagsStream({
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'hashtags');
    return FeedProvider().getHashtagsStream(query: query);
  }

  static Future<List<PeamanHashtag>> getHashtagsBySearchKeyword({
    required final String searchKeyword,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'hashtagsBySearchKeyword');
    return FeedProvider().getHashtagsBySearchKeyword(
      searchKeyword: searchKeyword,
      query: query,
    );
  }

  static Stream<List<PeamanHashtag>> getHashtagsBySearchKeywordStream({
    required final String searchKeyword,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'hashtagsBySearchKeyword');
    return FeedProvider().getHashtagsBySearchKeywordStream(
      searchKeyword: searchKeyword,
      query: query,
    );
  }

  static Future<List<PeamanReaction>> getFeedReactions({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedReactions');
    return FeedProvider().getFeedReactions(feedId: feedId, query: query);
  }

  static Stream<List<PeamanReaction>> getFeedReactionsStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedReactions');
    return FeedProvider().getFeedReactionsStream(feedId: feedId, query: query);
  }

  static Future<List<PeamanReactedFeed>> getUserReactedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userReactedFeeds');
    return FeedProvider().getUserReactedFeeds(uid: uid, query: query);
  }

  static Stream<List<PeamanReactedFeed>> getUserReactedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userReactedFeeds');
    return FeedProvider().getUserReactedFeedsStream(uid: uid, query: query);
  }

  static Future<List<PeamanCommentedFeed>> getUserCommentedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userCommentedFeeds');
    return FeedProvider().getUserCommentedFeeds(uid: uid, query: query);
  }

  static Stream<List<PeamanCommentedFeed>> getUserCommentedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userCommentedFeeds');
    return FeedProvider().getUserCommentedFeedsStream(uid: uid, query: query);
  }

  static Future<List<PeamanRepliedFeed>> getUserRepliedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userRepliedFeeds');
    return FeedProvider().getUserRepliedFeeds(uid: uid, query: query);
  }

  static Stream<List<PeamanRepliedFeed>> getUserRepliedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userRepliedFeeds');
    return FeedProvider().getUserRepliedFeedsStream(uid: uid, query: query);
  }

  static Future<List<PeamanSavedFeed>> getUserSavedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userSavedFeeds');
    return FeedProvider().getUserSavedFeeds(uid: uid, query: query);
  }

  static Stream<List<PeamanSavedFeed>> getUserSavedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userSavedFeeds');
    return FeedProvider().getUserSavedFeedsStream(uid: uid, query: query);
  }

  static Future<List<PeamanViewedFeed>> getUserViewedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userViewedFeeds');
    return FeedProvider().getUserViewedFeeds(uid: uid, query: query);
  }

  static Stream<List<PeamanViewedFeed>> getUserViewedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userViewedFeeds');
    return FeedProvider().getUserViewedFeedsStream(uid: uid, query: query);
  }

  static Future<List<PeamanFollowedFeed>> getUserFollowedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userFollowedFeeds');
    return FeedProvider().getUserFollowedFeeds(uid: uid, query: query);
  }

  static Stream<List<PeamanFollowedFeed>> getUserFollowedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userFollowedFeeds');
    return FeedProvider().getUserFollowedFeedsStream(uid: uid, query: query);
  }

  static Future<List<PeamanFeedReactor>> getFeedReactors({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedReactors');
    return FeedProvider().getFeedReactors(
      feedId: feedId,
      query: query,
    );
  }

  static Stream<List<PeamanFeedReactor>> getFeedReactorsStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedReactors');
    return FeedProvider().getFeedReactorsStream(
      feedId: feedId,
      query: query,
    );
  }

  static Future<List<PeamanFeedCommenter>> getFeedCommenters({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedCommenters');
    return FeedProvider().getFeedCommenters(
      feedId: feedId,
      query: query,
    );
  }

  static Stream<List<PeamanFeedCommenter>> getFeedCommentersStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedCommenters');
    return FeedProvider().getFeedCommentersStream(
      feedId: feedId,
      query: query,
    );
  }

  static Future<List<PeamanFeedReplier>> getFeedRepliers({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedRepliers');
    return FeedProvider().getFeedRepliers(
      feedId: feedId,
      query: query,
    );
  }

  static Stream<List<PeamanFeedReplier>> getFeedRepliersStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedRepliers');
    return FeedProvider().getFeedRepliersStream(
      feedId: feedId,
      query: query,
    );
  }

  static Future<List<PeamanFeedSaver>> getFeedSavers({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedSavers');
    return FeedProvider().getFeedSavers(
      feedId: feedId,
      query: query,
    );
  }

  static Stream<List<PeamanFeedSaver>> getFeedSaversStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedSavers');
    return FeedProvider().getFeedSaversStream(
      feedId: feedId,
      query: query,
    );
  }

  static Future<List<PeamanFeedViewer>> getFeedViewer({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedViewers');
    return FeedProvider().getFeedViewers(
      feedId: feedId,
      query: query,
    );
  }

  static Stream<List<PeamanFeedViewer>> getFeedViewerStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedViewers');
    return FeedProvider().getFeedViewersStream(
      feedId: feedId,
      query: query,
    );
  }

  static Future<List<PeamanFeedFollower>> getFeedFollowers({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedFollowers');
    return FeedProvider().getFeedFollowers(
      feedId: feedId,
      query: query,
    );
  }

  static Stream<List<PeamanFeedFollower>> getFeedFollowersStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedFollowers');
    return FeedProvider().getFeedFollowersStream(
      feedId: feedId,
      query: query,
    );
  }

  static Future<List<PeamanMoment>> getMoments({
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'moments');
    return FeedProvider().getMoments(query: query);
  }

  static Stream<List<PeamanMoment>> getMomentsStream({
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'moments');
    return FeedProvider().getMomentsStream(query: query);
  }

  static Future<List<PeamanMoment>> getUserMoments({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userMoments');
    return FeedProvider().getUserMoments(uid: uid, query: query);
  }

  static Stream<List<PeamanMoment>> getUserMomentsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'userMoments');
    return FeedProvider().getUserMomentsStream(uid: uid, query: query);
  }

  static Future<List<PeamanMomentViewer>> getMomentViewers({
    required final String momentId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'momentViewers');
    return FeedProvider().getMomentViewers(
      momentId: momentId,
      query: query,
    );
  }

  static Stream<List<PeamanMomentViewer>> getMomentViewersStream({
    required final String momentId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'momentViewers');
    return FeedProvider().getMomentViewersStream(
      momentId: momentId,
      query: query,
    );
  }

  static Future<List<PeamanFeed>> getFeedsBySearchKeyword({
    required final String searchKeyword,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedsBySearchKeyword');
    return FeedProvider().getFeedsBySearchKeyword(
      searchKeyword: searchKeyword,
      query: query,
    );
  }

  static Stream<List<PeamanFeed>> getFeedsBySearchKeywordStream({
    required final String searchKeyword,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedsBySearchKeyword');
    return FeedProvider().getFeedsBySearchKeywordStream(
      searchKeyword: searchKeyword,
      query: query,
    );
  }

  static Future<List<PeamanHashtagFeed>> getFeedsByHashtag({
    required final String hashtag,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedsByHashtag');
    return FeedProvider().getFeedsByHashtag(
      hashtag: hashtag,
      query: query,
    );
  }

  static Stream<List<PeamanHashtagFeed>> getFeedsByHashtagStream({
    required final String hashtag,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'feedsByHashtag');
    return FeedProvider().getFeedsByHashtagStream(
      hashtag: hashtag,
      query: query,
    );
  }

  static Future<PeamanFeed> getSingleFeedById({
    required final String feedId,
  }) {
    PeamanCommonHelper.printListening(text: 'feedById');
    return FeedProvider().getSingleFeedById(feedId: feedId);
  }

  static Stream<PeamanFeed> getSingleFeedByIdStream({
    required final String feedId,
  }) {
    PeamanCommonHelper.printListening(text: 'feedById');
    return FeedProvider().getSingleFeedByIdStream(feedId: feedId);
  }

  static Future<List<PeamanComment>> getComments({
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

  static Stream<List<PeamanComment>> getCommentsStream({
    required final String feedId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'comments');
    return FeedProvider().getCommentsStream(
      feedId: feedId,
      parent: parent,
      query: query,
    );
  }

  static Future<List<PeamanComment>> getCommentsByParentId({
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

  static Stream<List<PeamanComment>> getCommentsByParentIdStream({
    required final String feedId,
    required final PeamanCommentParent parent,
    required final String parentId,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'comments');
    return FeedProvider().getCommentsByParentIdStream(
      feedId: feedId,
      parent: parent,
      parentId: parentId,
      query: query,
    );
  }

  static Future<List<PeamanComment>> getCommentsByOwnerId({
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

  static Stream<List<PeamanComment>> getCommentsByOwnerIdStream({
    required final String ownerId,
    required final String feedId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  }) {
    PeamanCommonHelper.printListening(text: 'commentsByOwnerId');
    return FeedProvider().getCommentsByOwnerIdStream(
      ownerId: ownerId,
      feedId: feedId,
      parent: parent,
      query: query,
    );
  }

  static Future<PeamanComment> getSingleCommentById({
    required final String feedId,
    required final String commentId,
  }) {
    PeamanCommonHelper.printListening(text: 'commentById');
    return FeedProvider().getSingleCommentById(
      feedId: feedId,
      commentId: commentId,
    );
  }

  static Stream<PeamanComment> getSingleCommentByIdStream({
    required final String feedId,
    required final String commentId,
  }) {
    PeamanCommonHelper.printListening(text: 'commentById');
    return FeedProvider().getSingleCommentByIdStream(
      feedId: feedId,
      commentId: commentId,
    );
  }

  static Future<PeamanMoment> getSingleMomentById({
    required final String momentId,
  }) {
    PeamanCommonHelper.printListening(text: 'momentById');
    return FeedProvider().getSingleMomentById(
      momentId: momentId,
    );
  }

  static Stream<PeamanMoment> getSingleMomentByIdStream({
    required final String momentId,
  }) {
    PeamanCommonHelper.printListening(text: 'momentById');
    return FeedProvider().getSingleMomentByIdStream(
      momentId: momentId,
    );
  }
}
