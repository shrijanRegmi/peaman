import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/peaman.dart';

class FeedProvider {
  final _ref = FirebaseFirestore.instance;

  // create feed
  Future<void> createFeed({
    required final PeamanFeed feed,
    required final Function(PeamanFeed)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _postref = _ref.collection('posts').doc(feed.id);
      final _feed = feed.copyWith(id: _postref.id);
      final _futures = <Future>[];

      final _createPostFuture = _postref.set(_feed.toJson());
      _futures.add(_createPostFuture);

      final _updatePhotosFuture = _updatePhotosCount(
        uid: feed.ownerId!,
        count: feed.photos.length,
      );
      _futures.add(_updatePhotosFuture);

      if (feed.featured) {
        final _saveFeedAsFeaturedFuture = _saveFeatured(feed: _feed);
        _futures.add(_saveFeedAsFeaturedFuture);
      }

      await Future.wait(_futures);
      print('Success: Creating post ${_feed.id}');
      onSuccess?.call(_feed);
    } catch (e) {
      print(e);
      print('Error!!!: Creating post');
      onError?.call(e);
    }
  }

  // create moments
  Future<void> createMoment({
    required final PeamanMoment moment,
    required final Function(PeamanMoment)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _momentRef = _ref.collection('moments').doc(moment.id);
      final _moment = moment.copyWith(id: _momentRef.id);

      await _momentRef.set(_moment.toJson());

      print('Success: Creating moment ${_moment.id}');
      onSuccess?.call(_moment);
    } catch (e) {
      print(e);
      print('Error!!!: Creating moment');
      onError?.call(e);
    }
  }

  // send feed to friends timeline
  Future<void> sendToTimelines({
    required final String uid,
    required final String feedId,
  }) async {
    try {
      final _userRef = _ref.collection('users').doc(uid);
      final _followersRef = _userRef.collection('followers');
      final _followersSnap = await _followersRef.get();
      if (_followersSnap.docs.isNotEmpty) {
        final _futures = <Future>[];
        for (final _docSnap in (_followersSnap.docs)) {
          if (_docSnap.exists) {
            final _data = _docSnap.data();
            final _uid = _data['id'];
            final _timelineRef = _ref
                .collection('users')
                .doc(_uid)
                .collection('timeline')
                .doc(feedId);

            final _future = _timelineRef.set({
              'id': feedId,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            }).then((value) => print("Success: Posting to $_uid's timeline"));
            _futures.add(_future);
          }
        }

        await Future.wait(_futures);
      }
      print('Success: Saving to followers timeline');
    } catch (e) {
      print(e);
      print('Error!!!: Saving to followers timeline');
    }
  }

  // save featured post to users collection too
  Future<void> _saveFeatured({
    required final PeamanFeed feed,
  }) async {
    try {
      final _userRef = _ref.collection('users').doc(feed.ownerId);
      final _featuredPostsRef =
          _userRef.collection('featured_posts').doc(feed.id);

      await _featuredPostsRef.set({
        'id': feed.id,
        'updated_at': feed.updatedAt,
      });

      print('Success: Saving featured post ${feed.id}');
    } catch (e) {
      print(e);
      print('Success: Saving featured post ${feed.id}');
    }
  }

  // add reaction to post or comment
  Future<void> addReaction({
    required final PeamanReaction reaction,
    final Function(PeamanReaction)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _postRef = _ref.collection('posts').doc(reaction.feedId);
      final _reactionsRef = _postRef.collection('reactions').doc(reaction.id);

      final _reaction = reaction.copyWith(id: _reactionsRef.id);

      final _futures = <Future>[];

      _futures.add(_reactionsRef.set(_reaction.toJson()));

      if (_reaction.parent == PeamanReactionParent.feed) {
        final _postPropertyFuture = _updatePostPropertiesCount(
          feedId: reaction.feedId!,
          reactionsCount: 1,
        );
        _futures.add(_postPropertyFuture);
        print('Success: Adding reaction to post ${reaction.feedId}');
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
      final _postRef = _ref.collection('posts').doc(feedId);
      final _reactionsRef = _postRef.collection('reactions').doc(reactionId);

      final _futures = <Future>[];

      final _future = _reactionsRef.update({
        'unreacted': true,
      });
      _futures.add(_future);

      if (feedId == parentId) {
        final _future = _updatePostPropertiesCount(
          feedId: feedId,
          reactionsCount: -1,
        );
        _futures.add(_future);

        print('Success: Removing reaction from post $feedId');
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
      final _feedRef = _ref.collection('posts').doc(comment.feedId);
      final _commentRef = _feedRef.collection('comments').doc(comment.id);
      final _comment = comment.copyWith(id: _commentRef.id);

      final _futures = <Future>[];

      final _future = _commentRef.set(_comment.toJson());
      _futures.add(_future);

      if (_comment.parent == PeamanCommentParent.feed) {
        final _future = _updatePostPropertiesCount(
          feedId: comment.feedId!,
          commentsCount: 1,
        );
        _futures.add(_future);

        print('Success: Adding comment to post ${comment.feedId}');
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

  // remove comment from post or comment
  Future<void> removeComment({
    required final String feedId,
    required final String parentId,
    required final String commentId,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _postRef = _ref.collection('posts').doc(feedId);
      final _commentsRef = _postRef.collection('comments').doc(commentId);

      final _futures = <Future>[];

      final _future = _commentsRef.delete();
      _futures.add(_future);

      if (feedId == parentId) {
        final _future = _updatePostPropertiesCount(
          feedId: feedId,
          commentsCount: -1,
        );
        _futures.add(_future);

        print('Success: Removing comment from post $feedId');
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
  Future<void> _updatePostPropertiesCount({
    required final String feedId,
    final int? reactionsCount,
    final int? commentsCount,
    final int? savesCount,
    final int? sharesCount,
    final int? viewsCount,
  }) async {
    try {
      final _postsRef = _ref.collection('posts').doc(feedId);
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
        await _postsRef.update(_data);
      }
      print('Success: Updating post properties count of $feedId');
    } catch (e) {
      print(e);
      print('Error!!!: Updating post properties count of $feedId');
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
      final _postsRef = _ref.collection('posts').doc(feedId);
      final _parentCommentRef = _postsRef.collection('comments').doc(commentId);
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
      print('Success: Updating post properties count of $feedId');
    } catch (e) {
      print(e);
      print('Error!!!: Updating post properties count of $feedId');
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

  // delete feed
  Future<void> deleteFeed({
    required final String feedId,
    required final String ownerId,
  }) async {
    try {
      final _postRef = _ref.collection('feeds').doc(feedId);
      final _featuredPostsRef = _ref
          .collection('users')
          .doc(ownerId)
          .collection('featured_posts')
          .doc(feedId);

      final _futures = <Future>[
        _postRef.delete(),
        _featuredPostsRef.delete(),
      ];

      await Future.wait(_futures);

      print("Success: Deleting post $feedId");
    } catch (e) {
      print(e);
      print('Error!!!: Deleting post $feedId');
    }
  }

  // save feed
  Future<void> saveFeed({
    required final String feedId,
    required final String uid,
  }) async {
    try {
      final _savedPostRef = _ref
          .collection('users')
          .doc(uid)
          .collection('saved_posts')
          .doc(feedId);
      final _feedSavesRef =
          _ref.collection('posts').doc(feedId).collection('saves').doc(uid);

      final _data = {
        'id': feedId,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      };
      final _feedSaveData = {
        'owner_id': uid,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      };

      final _futures = <Future>[
        _feedSavesRef.set(_feedSaveData),
        _savedPostRef.set(_data),
        _updatePostPropertiesCount(
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
      final _savedPostRef = _ref
          .collection('users')
          .doc(uid)
          .collection('saved_posts')
          .doc(feedId);
      final _feedSavesRef =
          _ref.collection('posts').doc(feedId).collection('saves').doc(uid);

      final _futures = <Future>[
        _feedSavesRef.delete(),
        _savedPostRef.delete(),
        _updatePostPropertiesCount(feedId: feedId, savesCount: -1),
      ];

      await Future.wait(_futures);
      print('Success: Unsaving feed $feedId');
    } catch (e) {
      print(e);
      print('Error!!!: Unsaving feed');
      return null;
    }
  }

  // see moment?
  Future<void> viewMoment({
    required final String uid,
    required final String momentId,
  }) async {
    try {
      final _momentRef = _ref.collection('moments').doc(momentId);
      final _seenUsersRef = _momentRef.collection('seen_users').doc(uid);

      final _futures = <Future>[
        _seenUsersRef.set({
          'uid': uid,
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

  // get reaction by id
  Future<PeamanReaction?> getReactionByOwnerId({
    required final String feedId,
    required final String ownerId,
    required final PeamanReactionParent parent,
    required final String parentId,
  }) async {
    PeamanReaction? _reaction;
    try {
      final _postRef = _ref.collection('posts').doc(feedId);
      final _reactionRef = _postRef
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

  // get saved by id
  Future<PeamanFeedSaves?> getFeedSavesByOwnerId({
    required final String feedId,
    required final String ownerId,
  }) async {
    PeamanFeedSaves? _postSaves;
    try {
      final _postRef = _ref.collection('posts').doc(feedId);
      final _postSavesRef = _postRef.collection('saves').doc(ownerId);
      final _postSavesSnap = await _postSavesRef.get();

      if (_postSavesSnap.exists) {
        final _postSavesData = _postSavesSnap.data() ?? {};
        _postSaves = PeamanFeedSaves.fromJson(_postSavesData);
      }
    } catch (e) {
      print(e);
      print('Error!!!: Getting post saves by uid');
    }
    return _postSaves;
  }

  // list of feeds from firestore
  List<PeamanFeed> _feedsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanFeed.fromJson(e.data())).toList();
  }

  // feed from firestore
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

  // comment from firestore
  PeamanComment _commentFromFirebase(
    DocumentSnapshot<Map<String, dynamic>> snap,
  ) {
    return PeamanComment.fromJson(snap.data() ?? {});
  }

  // list of app user from firebase
  List<PeamanUser> _usersFromFirebase(
    final QuerySnapshot<Map<String, dynamic>> colSnap,
  ) {
    return colSnap.docs.map((doc) {
      return PeamanUser.fromJson(doc.data()['user_data']);
    }).toList();
  }

  // stream of moment viewers
  Stream<List<PeamanUser>> momentViewers({
    required final String momentId,
  }) {
    return _ref
        .collection('moments')
        .doc(momentId)
        .collection('seen_users')
        .snapshots()
        .map(_usersFromFirebase);
  }

  // stream of all feeds
  Stream<List<PeamanFeed>> allFeeds() {
    return _ref
        .collection('posts')
        .orderBy('updated_at', descending: true)
        .snapshots()
        .map(_feedsFromFirebase);
  }

  // stream of all moments
  Stream<List<PeamanMoment>> allMoments() {
    return _ref
        .collection('moments')
        .orderBy('updated_at', descending: true)
        .snapshots()
        .map(_momentsFromFirebase);
  }

  // stream of all feeds
  Stream<List<PeamanFeed>> feedsBySearchKeyword({
    required final String searchKeyword,
  }) {
    return _ref
        .collection('posts')
        .where('search_keys', arrayContains: searchKeyword)
        .snapshots()
        .map(_feedsFromFirebase);
  }

  // stream of single feed
  Stream<PeamanFeed> singleFeedById({
    required final String feedId,
  }) {
    return _ref
        .collection('posts')
        .doc(feedId)
        .snapshots()
        .map(_feedFromFirebase);
  }

  // stream of saved feeds
  Stream<List<PeamanSavedFeed>> savedFeeds({
    required final String uid,
  }) {
    return _ref
        .collection('users')
        .doc(uid)
        .collection('saved_posts')
        .orderBy('updated_at', descending: true)
        .snapshots()
        .map(_savedFeedsFromFirebase);
  }

  // stream of comments
  Stream<List<PeamanComment>> getComments({
    required final String feedId,
    required final PeamanCommentParent parent,
    required final String parentId,
  }) {
    return _ref
        .collection('posts')
        .doc(feedId)
        .collection('comments')
        .where('parent', isEqualTo: parent.index)
        .where('parent_id', isEqualTo: parentId)
        .orderBy('updated_at', descending: true)
        .snapshots()
        .map(_commentsFromFirebase);
  }

  // stream of comment
  Stream<PeamanComment> getSingleCommentById({
    required final String feedId,
    required final String commentId,
  }) {
    return _ref
        .collection('posts')
        .doc(feedId)
        .collection('comments')
        .doc(commentId)
        .snapshots()
        .map(_commentFromFirebase);
  }
}
