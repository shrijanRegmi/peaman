import 'package:peaman/models/comment_model.dart';
import 'package:peaman/models/feed_model.dart';
import 'package:peaman/models/moment_model.dart';
import 'package:peaman/models/user_model.dart';
import 'package:peaman/services/database_services/feed_provider.dart';

class PFeedProvider {
  static Future<PeamanFeed?> createFeed(
    final PeamanUser appUser,
    final PeamanFeed feed,
  ) async {
    return await FeedProvider(feed: feed, appUser: appUser).createPost();
  }

  static Future deleteFeed(
    final PeamanUser appUser,
    final PeamanFeed feed,
  ) async {
    return await FeedProvider(feed: feed, appUser: appUser).deletePost();
  }

  static Future<PeamanMoment?> createMoment(
    final PeamanUser appUser,
    final PeamanMoment moment,
  ) async {
    return await FeedProvider(moment: moment, appUser: appUser).createMoment();
  }

  static Future viewMoment(
    final PeamanUser appUser,
    final PeamanMoment moment,
  ) async {
    return await FeedProvider(moment: moment, appUser: appUser).viewMoment();
  }

  static Future reactToFeed(
    final PeamanUser appUser,
    final PeamanFeed feed,
  ) async {
    return await FeedProvider(feed: feed, appUser: appUser).reactPost();
  }

  static Future unreactToFeed(
    final PeamanUser appUser,
    final PeamanFeed feed,
  ) async {
    return await FeedProvider(feed: feed, appUser: appUser).unReactPost();
  }

  static Future commentToFeed(
    final PeamanUser appUser,
    final PeamanFeed feed,
    final PeamanComment comment,
  ) async {
    return await FeedProvider(feed: feed, appUser: appUser)
        .commentPost(comment);
  }

  static Future saveFeed(
    final PeamanUser appUser,
    final PeamanFeed feed,
  ) async {
    return await FeedProvider(feed: feed, appUser: appUser).savePost();
  }

  static Future deleteSavedFeed(
    final PeamanUser appUser,
    final PeamanFeed feed,
  ) async {
    return await FeedProvider(feed: feed, appUser: appUser).removeSavedPost();
  }

  static Future<PeamanFeed?> getSingleFeedByUser(
    final PeamanUser appUser,
    final String feedId,
  ) async {
    return await FeedProvider(appUser: appUser).getSinglePostById(feedId);
  }

  static Future<List<PeamanFeed>> getFeedsTimeline(
      final PeamanUser appUser) async {
    return await FeedProvider(appUser: appUser).getTimeline();
  }

  static Future<List<PeamanFeed>> getFeedsByUser(
    final PeamanUser appUser,
  ) async {
    return await FeedProvider(appUser: appUser).getPostsById();
  }

  static Future<List<PeamanFeed>> getFeaturedFeedsByUser(
    final PeamanUser appUser,
  ) async {
    return await FeedProvider(appUser: appUser).getFeaturedPostsById();
  }

  static Future<List<PeamanMoment>> getMomentsTimeline(
    final PeamanUser appUser,
  ) async {
    return await FeedProvider(appUser: appUser).getMoments();
  }

  static Future<List<PeamanMoment>> getMomentsByUser(
    final PeamanUser appUser,
  ) async {
    return await FeedProvider(appUser: appUser).getMyMoments();
  }

  static Future<List<PeamanFeed>> getOldFeedsTimeline(
    final PeamanUser appUser,
    final PeamanFeed lastFeed,
  ) async {
    return await FeedProvider(appUser: appUser, feed: lastFeed)
        .getOldTimelinePosts();
  }

  static Future<List<PeamanFeed>> getOldFeedsByUser(
    final PeamanUser appUser,
    final PeamanFeed lastFeed,
  ) async {
    return await FeedProvider(appUser: appUser, feed: lastFeed)
        .getOldPostsById();
  }

  static Future<List<PeamanFeed>> getOldFeaturedFeedsByUser(
    final PeamanUser appUser,
    final PeamanFeed lastFeed,
  ) async {
    return await FeedProvider(appUser: appUser, feed: lastFeed)
        .getOldFeaturedPostsById();
  }
}
