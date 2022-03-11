import 'package:firebase_auth/firebase_auth.dart';
import 'package:peaman/models/comment_model.dart';
import 'package:peaman/models/feed_model.dart';
import 'package:peaman/models/moment_model.dart';
import 'package:peaman/models/user_model.dart';
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

  static Future reactToFeed({
    required final PeamanUser appUser,
    required final PeamanFeed feed,
  }) async {
    final _uid = _auth.currentUser?.uid;

    return await FeedProvider(feed: feed, uid: _uid).reactPost(appUser);
  }

  static Future unreactToFeed({
    required final PeamanUser appUser,
    required final PeamanFeed feed,
  }) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(feed: feed, uid: _uid).unReactPost(appUser);
  }

  static Future commentToFeed(
    final PeamanUser appUser,
    final PeamanFeed feed,
    final PeamanComment comment,
  ) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(feed: feed, uid: _uid).commentPost(comment);
  }

  static Future saveFeed(
    final PeamanUser appUser,
    final PeamanFeed feed,
  ) async {
    final _uid = _auth.currentUser?.uid;
    return await FeedProvider(feed: feed, uid: _uid).savePost();
  }

  static Future deleteSavedFeed(
    final PeamanUser appUser,
    final PeamanFeed feed,
  ) async {
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
      final PeamanUser appUser) async {
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
}
