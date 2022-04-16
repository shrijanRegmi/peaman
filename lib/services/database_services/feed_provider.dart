import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/peaman.dart';
import '../../helpers/common_helper.dart';

class FeedProvider {
  final _ref = FirebaseFirestore.instance;

  // create feed
  Future<void> createFeed({
    required final PeamanFeed feed,
    final Function(PeamanFeed)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _feedRef = _ref.collection('feeds').doc(feed.id);
      final _feed = feed.copyWith(id: _feedRef.id);
      final _futures = <Future>[];

      final _createFeedFuture = _feedRef.set(_feed.toJson());
      _futures.add(_createFeedFuture);

      final _updatePhotosFuture = _updatePhotosCount(
        uid: feed.ownerId!,
        count: feed.photos.length,
      );
      _futures.add(_updatePhotosFuture);

      await Future.wait(_futures);
      print('Success: Creating feed ${_feed.id}');
      onSuccess?.call(_feed);
    } catch (e) {
      print(e);
      print('Error!!!: Creating feed');
      onError?.call(e);
    }
  }

  // update feed
  Future<void> updateFeed({
    required final String feedId,
    required final Map<String, dynamic> data,
    final bool partial = false,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _data = PeamanCommonHelper.prepareDataToUpdate(
        data: data,
        partial: partial,
      );

      final _feedRef = _ref.collection('feeds').doc(feedId);
      await _feedRef.update(_data);
      print('Success: Updating feed $feedId');
      onSuccess?.call(feedId);
    } catch (e) {
      print(e);
      print('Error!!!: Updating feed');
      onError?.call(e);
    }
  }

  // delete feed
  Future<void> deleteFeed({
    required final String feedId,
  }) async {
    try {
      final _feedRef = _ref.collection('feeds').doc(feedId);

      await _feedRef.delete();

      print("Success: Deleting feed $feedId");
    } catch (e) {
      print(e);
      print('Error!!!: Deleting feed');
    }
  }

  // follow feed
  Future<void> followFeed({
    required final String uid,
    required final String feedId,
  }) async {
    try {
      final _feedRef = _ref.collection('feeds').doc(feedId);
      final _feedFollowerRef = _feedRef.collection('followers').doc(uid);

      await _feedFollowerRef.set({
        'uid': uid,
        'created_at': DateTime.now().millisecondsSinceEpoch,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      });

      print("Success: Following feed $feedId");
    } catch (e) {
      print(e);
      print('Error!!!: Following feed');
    }
  }

  // unfollow feed
  Future<void> unfollowFeed({
    required final String uid,
    required final String feedId,
  }) async {
    try {
      final _feedRef = _ref.collection('feeds').doc(feedId);
      final _feedFollowerRef = _feedRef.collection('followers').doc(uid);

      await _feedFollowerRef.delete();

      print("Success: Unfollowing feed $feedId");
    } catch (e) {
      print(e);
      print('Error!!!: Unfollowing feed');
    }
  }

  // save feed
  Future<void> saveFeed({
    required final String feedId,
    required final String uid,
  }) async {
    try {
      final _savedFeedRef = _ref
          .collection('users')
          .doc(uid)
          .collection('saved_feeds')
          .doc(feedId);
      final _feedSaverRef = _ref
          .collection('feeds')
          .doc(feedId)
          .collection('feed_savers')
          .doc(uid);

      final _savedFeedData = {
        'id': feedId,
        'created_at': DateTime.now().millisecondsSinceEpoch,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      };
      final _feedSaverData = {
        'uid': uid,
        'created_at': DateTime.now().millisecondsSinceEpoch,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      };

      final _futures = <Future>[
        _feedSaverRef.set(_feedSaverData),
        _savedFeedRef.set(_savedFeedData),
        _updateFeedPropertiesCount(
          feedId: feedId,
          savesCount: 1,
        ),
      ];

      await Future.wait(_futures);
      print('Success: Saving feed $feedId');
    } catch (e) {
      print(e);
      print('Error!!!: Saving feed');
    }
  }

  // unsave feed
  Future<void> unSaveFeed({
    required final String feedId,
    required final String uid,
  }) async {
    try {
      final _savedFeedRef = _ref
          .collection('users')
          .doc(uid)
          .collection('saved_feeds')
          .doc(feedId);
      final _feedSaverRef = _ref
          .collection('feeds')
          .doc(feedId)
          .collection('feed_savers')
          .doc(uid);

      final _futures = <Future>[
        _feedSaverRef.delete(),
        _savedFeedRef.delete(),
        _updateFeedPropertiesCount(
          feedId: feedId,
          savesCount: -1,
        ),
      ];

      await Future.wait(_futures);
      print('Success: Unsaving feed $feedId');
    } catch (e) {
      print(e);
      print('Error!!!: Unsaving feed');
      return null;
    }
  }

  // create moments
  Future<void> createMoment({
    required final PeamanMoment moment,
    final Function(PeamanMoment)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      late PeamanMoment _moment;

      final _ownerMomentsRef = _ref
          .collection('moments')
          .where('owner_id', isEqualTo: moment.ownerId)
          .limit(1);
      final _ownerMomentsSnap = await _ownerMomentsRef.get();

      if (_ownerMomentsSnap.docs.isNotEmpty) {
        final _ownerMomentSnap = _ownerMomentsSnap.docs.first;

        if (_ownerMomentSnap.exists) {
          final _pictures = moment.pictures.map((e) {
            final _randomDocument = _ref.collection('random').doc();
            final _momentPicture = e.toJson();
            _momentPicture['id'] = e.id ?? _randomDocument.id;
            return _momentPicture;
          }).toList();

          await _ownerMomentSnap.reference.update({
            ...moment.toJson(),
            'pictures': FieldValue.arrayUnion(_pictures),
          });

          final _ownerMomentData = _ownerMomentSnap.data();
          _moment = PeamanMoment.fromJson(_ownerMomentData);
        }
      } else {
        final _momentRef = _ref.collection('moments').doc(moment.id);
        final _pictures = moment.pictures.map((e) {
          final _randomDocument = _ref.collection('random').doc();
          final _momentPicture = e.copyWith(id: e.id ?? _randomDocument.id);
          return _momentPicture;
        }).toList();

        _moment = moment.copyWith(
          id: _momentRef.id,
          pictures: _pictures,
        );

        await _momentRef.set(_moment.toJson());
      }

      print('Success: Creating moment ${_moment.id}');
      onSuccess?.call(_moment);
    } catch (e) {
      print(e);
      print('Error!!!: Creating moment');
      onError?.call(e);
    }
  }

  // delete moment
  Future<void> deletMomentPicture({
    required final String momentId,
    required final String pictureId,
  }) async {
    try {
      final _momentRef = _ref.collection('moments').doc(momentId);

      final _momentSnap = await _momentRef.get();
      if (!_momentSnap.exists)
        throw Future.error('Moment with id $momentId not found');

      final _momentData = _momentSnap.data();
      if (_momentData == null)
        throw Future.error('Moment with id $momentId not found');

      final _moment = PeamanMoment.fromJson(_momentData);

      final _newPictures =
          _moment.pictures.where((element) => element.id != pictureId).toList();

      if (_newPictures.isEmpty) {
        await _momentRef.delete();
      } else {
        await _momentRef.update({
          'pictures': _newPictures.map((e) => e.toJson()).toList(),
        });
      }
      print("Success: Deleting moment picture $pictureId");
    } catch (e) {
      print(e);
      print('Error!!!: Deleting moment picture');
    }
  }

  // view feed
  Future<void> viewFeed({
    required final String feedId,
    required final String uid,
  }) async {
    try {
      final _viewedFeedRef = _ref
          .collection('users')
          .doc(uid)
          .collection('viewed_feeds')
          .doc(feedId);
      final _feedViewerRef = _ref
          .collection('feeds')
          .doc(feedId)
          .collection('feed_viewers')
          .doc(uid);

      final _viewedFeedData = {
        'id': feedId,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      };
      final _feedViewerData = {
        'uid': uid,
        'created_at': DateTime.now().millisecondsSinceEpoch,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      };

      final _futures = <Future>[
        _feedViewerRef.set(_feedViewerData),
        _viewedFeedRef.set(_viewedFeedData),
        _updateFeedPropertiesCount(
          feedId: feedId,
          viewsCount: 1,
        ),
      ];

      await Future.wait(_futures);
      print('Success: Viewing feed $feedId');
    } catch (e) {
      print(e);
      print('Error!!!: Viewing feed');
    }
  }

  // see moment
  Future<void> viewMoment({
    required final String uid,
    required final String momentId,
  }) async {
    try {
      final _momentRef = _ref.collection('moments').doc(momentId);
      final _momentViewerRef = _momentRef.collection('moment_viewers').doc(uid);

      final _futures = <Future>[
        _momentViewerRef.set({
          'uid': uid,
          'created_at': DateTime.now().millisecondsSinceEpoch,
          'updated_at': DateTime.now().millisecondsSinceEpoch,
        }),
        _updateMomentViewsCount(momentId: momentId)
      ];
      await Future.wait(_futures);
      print('Success: Viewing moment $momentId');
    } catch (e) {
      print(e);
      print('Error!!!: Viewing moment');
    }
  }

  // add reaction to post or comment
  Future<void> addReaction({
    required final PeamanReaction reaction,
    final Function(PeamanReaction)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _feedRef = _ref.collection('feeds').doc(reaction.feedId);
      final _reactionsRef = _feedRef.collection('reactions').doc(reaction.id);

      final _reaction = reaction.copyWith(id: _reactionsRef.id);

      final _futures = <Future>[];

      _futures.add(_reactionsRef.set(_reaction.toJson()));

      if (_reaction.parent == PeamanReactionParent.feed) {
        final _feedPropertyFuture = _updateFeedPropertiesCount(
          feedId: reaction.feedId!,
          reactionsCount: 1,
        );
        _futures.add(_feedPropertyFuture);
        print('Success: Adding reaction to feed ${reaction.feedId}');
      } else if (_reaction.parentId != null) {
        final _future = _updateCommentPropertiesCount(
          feedId: reaction.feedId!,
          commentId: _reaction.parentId!,
          reactionsCount: 1,
        );
        _futures.add(_future);
        print('Success: Adding reaction to comment ${_reaction.parentId}');
      }

      await Future.wait(_futures);
      onSuccess?.call(_reaction);
    } catch (e) {
      print(e);
      print('Error!!!: Adding reaction');
      onError?.call(e);
    }
  }

  // remove reaction from post or comment
  Future<void> removeReaction({
    required final String feedId,
    required final String parentId,
    required final String reactionId,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _feedRef = _ref.collection('feeds').doc(feedId);
      final _reactionsRef = _feedRef.collection('reactions').doc(reactionId);

      final _futures = <Future>[];

      final _future = _reactionsRef.update({
        'unreacted': true,
      });
      _futures.add(_future);

      if (feedId == parentId) {
        final _future = _updateFeedPropertiesCount(
          feedId: feedId,
          reactionsCount: -1,
        );
        _futures.add(_future);

        print('Success: Removing reaction from feed $feedId');
      } else {
        final _future = _updateCommentPropertiesCount(
          feedId: feedId,
          commentId: parentId,
          reactionsCount: -1,
        );
        _futures.add(_future);

        print('Success: Removing reaction from comment $parentId');
      }

      await Future.wait(_futures);
      onSuccess?.call(_reactionsRef.id);
    } catch (e) {
      print(e);
      print('Error!!!: Removing reaction');
      onError?.call(e);
    }
  }

  // add comment in a post or comment
  Future<void> addComment({
    required final PeamanComment comment,
    final Function(PeamanComment)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _feedRef = _ref.collection('feeds').doc(comment.feedId);
      final _commentRef = _feedRef.collection('comments').doc(comment.id);
      final _comment = comment.copyWith(id: _commentRef.id);

      final _futures = <Future>[];

      final _future = _commentRef.set(_comment.toJson());
      _futures.add(_future);

      if (_comment.parent == PeamanCommentParent.feed) {
        final _future = _updateFeedPropertiesCount(
          feedId: comment.feedId!,
          commentsCount: 1,
        );
        _futures.add(_future);

        print('Success: Adding comment to feed ${comment.feedId}');
      } else if (_comment.parentId != null) {
        final _future = _updateCommentPropertiesCount(
          feedId: comment.feedId!,
          commentId: _comment.parentId!,
          repliesCount: 1,
        );
        _futures.add(_future);

        print('Success: Adding comment to comment ${_comment.parentId}');
      }

      await Future.wait(_futures);
      onSuccess?.call(_comment);
    } catch (e) {
      print(e);
      print('Error!!!: Adding comment');
      onError?.call(e);
    }
  }

  // update comment
  Future<void> updateComment({
    required final String feedId,
    required final String commentId,
    required final Map<String, dynamic> data,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _feedRef = _ref.collection('feeds').doc(feedId);
      final _commentRef = _feedRef.collection('comments').doc(commentId);
      await _commentRef.update(data);
      print('Success: Updating comment $commentId');
      onSuccess?.call(feedId);
    } catch (e) {
      print(e);
      print('Error!!!: Updating comment');
      onError?.call(e);
    }
  }

  // remove comment from post or comment
  Future<void> removeComment({
    required final String feedId,
    required final String parentId,
    required final String commentId,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _feedRef = _ref.collection('feeds').doc(feedId);
      final _commentsRef = _feedRef.collection('comments').doc(commentId);

      final _futures = <Future>[];

      final _future = _commentsRef.delete();
      _futures.add(_future);

      if (feedId == parentId) {
        final _future = _updateFeedPropertiesCount(
          feedId: feedId,
          commentsCount: -1,
        );
        _futures.add(_future);

        print('Success: Removing comment from feed $feedId');
      } else {
        final _future = _updateCommentPropertiesCount(
          feedId: feedId,
          commentId: parentId,
          repliesCount: -1,
        );
        _futures.add(_future);

        print('Success: Removing comment from comment $parentId');
      }

      await Future.wait(_futures);
      onSuccess?.call(commentId);
    } catch (e) {
      print(e);
      print('Error!!!: Removing comment');
      onError?.call(e);
    }
  }

  // update post properties count
  Future<void> _updateFeedPropertiesCount({
    required final String feedId,
    final int? reactionsCount,
    final int? commentsCount,
    final int? savesCount,
    final int? sharesCount,
    final int? viewsCount,
  }) async {
    try {
      final _feedRef = _ref.collection('feeds').doc(feedId);
      final _data = <String, dynamic>{};

      if (reactionsCount != null) {
        _data['reactions_count'] = FieldValue.increment(reactionsCount);
      }
      if (commentsCount != null) {
        _data['comments_count'] = FieldValue.increment(commentsCount);
      }
      if (savesCount != null) {
        _data['saves_count'] = FieldValue.increment(savesCount);
      }
      if (sharesCount != null) {
        _data['shares_count'] = FieldValue.increment(sharesCount);
      }
      if (viewsCount != null) {
        _data['views_count'] = FieldValue.increment(viewsCount);
      }

      if (_data.isNotEmpty) {
        await _feedRef.update(_data);
      }
      print('Success: Updating feed properties count of $feedId');
    } catch (e) {
      print(e);
      print('Error!!!: Updating feed properties count of $feedId');
      return null;
    }
  }

  // update comment properties count
  Future<void> _updateCommentPropertiesCount({
    required final String feedId,
    required final String commentId,
    final int? reactionsCount,
    final int? repliesCount,
  }) async {
    try {
      final _feedRef = _ref.collection('feeds').doc(feedId);
      final _parentCommentRef = _feedRef.collection('comments').doc(commentId);
      final _data = <String, dynamic>{};

      if (reactionsCount != null) {
        _data['reactions_count'] = FieldValue.increment(reactionsCount);
      }
      if (repliesCount != null) {
        _data['replies_count'] = FieldValue.increment(repliesCount);
      }

      if (_data.isNotEmpty) {
        await _parentCommentRef.update(_data);
      }
      print('Success: Updating comment properties count of $commentId');
    } catch (e) {
      print(e);
      print('Error!!!: Updating comment properties count of $commentId');
      return null;
    }
  }

  // update photos count
  Future<void> _updatePhotosCount({
    required final String uid,
    required final int count,
  }) async {
    try {
      final _userRef = _ref.collection('users').doc(uid);

      await _userRef.update({
        'photos': FieldValue.increment(count),
      });

      print('Success: Updating photos count of $uid');
    } catch (e) {
      print(e);
      print('Error!!!: Updating photos count $uid');
    }
  }

  // update moment views count
  Future<void> _updateMomentViewsCount({
    required final String momentId,
  }) async {
    try {
      final _momentRef = _ref.collection('moments').doc(momentId);
      await _momentRef.update({
        'views': FieldValue.increment(1),
      });
      print('Success: Updating moment view count $momentId');
    } catch (e) {
      print(e);
      print('Error!!!: Updating moment view count');
      return null;
    }
  }

  // get reaction by ownerId
  Future<PeamanReaction?> getReactionByOwnerId({
    required final String feedId,
    required final String ownerId,
    required final PeamanReactionParent parent,
    required final String parentId,
  }) async {
    PeamanReaction? _reaction;
    try {
      final _feedRef = _ref.collection('feeds').doc(feedId);
      final _reactionRef = _feedRef
          .collection('reactions')
          .where('owner_id', isEqualTo: ownerId)
          .where('parent', isEqualTo: parent.index)
          .where('parent_id', isEqualTo: parentId);
      final _reactionsSnap = await _reactionRef.get();

      if (_reactionsSnap.docs.isNotEmpty) {
        final _reactionSnap = _reactionsSnap.docs.first;
        if (_reactionSnap.exists) {
          final _reactionData = _reactionSnap.data();
          _reaction = PeamanReaction.fromJson(_reactionData);
        }
      }
    } catch (e) {
      print(e);
      print('Error!!!: Getting reaction by owner_id');
    }
    return _reaction;
  }

  // get feed saves by ownerId
  Future<PeamanFeedSaver?> getFeedSaverByUid({
    required final String feedId,
    required final String uid,
  }) async {
    PeamanFeedSaver? _feedSaver;
    try {
      final _feedRef = _ref.collection('feeds').doc(feedId);
      final _feedSaverRef = _feedRef.collection('feed_savers').doc(uid);
      final _feedSaverSnap = await _feedSaverRef.get();

      if (_feedSaverSnap.exists) {
        final _postSavesData = _feedSaverSnap.data() ?? {};
        _feedSaver = PeamanFeedSaver.fromJson(_postSavesData);
      }
    } catch (e) {
      print(e);
      print('Error!!!: Getting feed savers by uid');
    }
    return _feedSaver;
  }

  // get feed view by uid
  Future<PeamanFeedViewer?> getFeedViewerByUid({
    required final String feedId,
    required final String uid,
  }) async {
    PeamanFeedViewer? _feedViewer;
    try {
      final _feedRef = _ref.collection('feeds').doc(feedId);
      final _feedViewerRef = _feedRef.collection('feed_viewers').doc(uid);
      final _feedViewerSnap = await _feedViewerRef.get();

      if (_feedViewerSnap.exists) {
        final _postSavesData = _feedViewerSnap.data() ?? {};
        _feedViewer = PeamanFeedViewer.fromJson(_postSavesData);
      }
    } catch (e) {
      print(e);
      print('Error!!!: Getting feed viewer by uid');
    }
    return _feedViewer;
  }

  // get feed followers by id
  Future<PeamanFeedFollower?> getFeedFollowerByUid({
    required final String feedId,
    required final String uid,
  }) async {
    PeamanFeedFollower? _feedFollower;
    try {
      final _feedRef = _ref.collection('feeds').doc(feedId);
      final _feedFollowerRef = _feedRef.collection('followers').doc(uid);
      final _feedFollowerSnap = await _feedFollowerRef.get();

      if (_feedFollowerSnap.exists) {
        final _feedFollowerData = _feedFollowerSnap.data() ?? {};
        _feedFollower = PeamanFeedFollower.fromJson(_feedFollowerData);
      }
    } catch (e) {
      print(e);
      print('Error!!!: Getting feed follower by uid');
    }
    return _feedFollower;
  }

  // list of feeds from firestore
  List<PeamanFeed> _feedsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanFeed.fromJson(e.data())).toList();
  }

  // single feed from firestore
  PeamanFeed _feedFromFirebase(
    DocumentSnapshot<Map<String, dynamic>> snap,
  ) {
    return PeamanFeed.fromJson(snap.data() ?? {});
  }

  // list of moments from firestore
  List<PeamanMoment> _momentsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanMoment.fromJson(e.data())).toList();
  }

  // single moment from firestore
  PeamanMoment _momentFromFirebase(
    DocumentSnapshot<Map<String, dynamic>> snap,
  ) {
    return PeamanMoment.fromJson(snap.data() ?? {});
  }

  // list of moment viewers from firestore
  List<PeamanMomentViewer> _momentViewersFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanMomentViewer.fromJson(e.data())).toList();
  }

  // list of saved feeds from firestore
  List<PeamanSavedFeed> _savedFeedsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanSavedFeed.fromJson(e.data())).toList();
  }

  // list of comments from firestore
  List<PeamanComment> _commentsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanComment.fromJson(e.data())).toList();
  }

  // single comment from firestore
  PeamanComment _commentFromFirebase(
    DocumentSnapshot<Map<String, dynamic>> snap,
  ) {
    return PeamanComment.fromJson(snap.data() ?? {});
  }

  // stream of all feeds
  Stream<List<PeamanFeed>> allFeeds() {
    return _ref
        .collection('feeds')
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(_feedsFromFirebase);
  }

  // stream of all moments
  Stream<List<PeamanMoment>> allMoments() {
    return _ref
        .collection('moments')
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(_momentsFromFirebase);
  }

  // stream of single feed by id
  Stream<PeamanFeed> getSingleFeedById({
    required final String feedId,
  }) {
    return _ref
        .collection('feeds')
        .doc(feedId)
        .snapshots()
        .map(_feedFromFirebase);
  }

  // stream of single moment by id
  Stream<PeamanMoment> getSingleMomentById({
    required final String momentId,
  }) {
    return _ref
        .collection('moments')
        .doc(momentId)
        .snapshots()
        .map(_momentFromFirebase);
  }

  // stream of list of feeds by search keyword
  Stream<List<PeamanFeed>> getFeedsBySearchKeyword({
    required final String searchKeyword,
  }) {
    return _ref
        .collection('feeds')
        .where('search_keys', arrayContains: searchKeyword)
        .snapshots()
        .map(_feedsFromFirebase);
  }

  // stream of list of moment viewers
  Stream<List<PeamanMomentViewer>> getMomentViewers({
    required final String momentId,
  }) {
    return _ref
        .collection('moments')
        .doc(momentId)
        .collection('moment_viewers')
        .snapshots()
        .map(_momentViewersFromFirebase);
  }

  // stream of list of saved feeds
  Stream<List<PeamanSavedFeed>> getSavedFeeds({
    required final String uid,
  }) {
    return _ref
        .collection('users')
        .doc(uid)
        .collection('saved_feeds')
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(_savedFeedsFromFirebase);
  }

  // stream of list of comments
  Stream<List<PeamanComment>> getComments({
    required final String feedId,
    required final PeamanCommentParent parent,
    required final String parentId,
  }) {
    return _ref
        .collection('feeds')
        .doc(feedId)
        .collection('comments')
        .where('parent', isEqualTo: parent.index)
        .where('parent_id', isEqualTo: parentId)
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(_commentsFromFirebase);
  }

  // stream of single comment by id
  Stream<PeamanComment> getSingleCommentById({
    required final String feedId,
    required final String commentId,
  }) {
    return _ref
        .collection('feeds')
        .doc(feedId)
        .collection('comments')
        .doc(commentId)
        .snapshots()
        .map(_commentFromFirebase);
  }
}
