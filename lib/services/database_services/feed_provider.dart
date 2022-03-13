import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/peaman.dart';
import 'package:peaman/services/database_services/user_provider.dart';

class FeedProvider {
  final String? uid;
  final PeamanUser? user;
  final PeamanFeed? feed;
  final PeamanMoment? moment;
  FeedProvider({
    this.uid,
    this.feed,
    this.moment,
    this.user,
  });

  final _ref = FirebaseFirestore.instance;

  // create post
  Future<PeamanFeed?> createPost() async {
    try {
      final _postref = _ref.collection('posts').doc();
      var _feed = feed;
      _feed = _feed?.copyWith(id: _postref.id, feedRef: _postref);
      await _postref.set(_feed?.toJson() ?? {});
      print('Success: Creating post');

      await _updatePhotosCount((feed?.photos ?? []).length);

      if (feed?.isFeatured ?? false) {
        await _saveFeatured(_feed);
      }

      return _feed;
    } catch (e) {
      print(e);
      print('Error!!!: Creating post');
      return null;
    }
  }

  // create moments
  Future<PeamanMoment?> createMoment() async {
    try {
      final _momentRef = _ref.collection('moments').doc();
      final _moment = moment?.copyWith(
        id: _momentRef.id,
      );

      await _momentRef.set(_moment?.toJson() ?? {});

      print('Success: Creating moment? ${_moment?.id}');
      return _moment;
    } catch (e) {
      print(e);
      print('Error!!!: Creating moment?');
      return null;
    }
  }

  // send feed? to friends timeline
  Future sendToTimelines() async {
    try {
      final _userRef = _ref.collection('users').doc(uid);
      final _followersRef = _userRef.collection('followers');
      final _followersSnap = await _followersRef.get();
      if (_followersSnap.docs.isNotEmpty) {
        for (final _docSnap in (_followersSnap.docs)) {
          if (_docSnap.exists) {
            final _data = _docSnap.data();
            final _uid = _data['id'];
            final _timelineRef = _ref
                .collection('users')
                .doc(_uid)
                .collection('timeline')
                .doc(feed?.id);

            await _timelineRef.set({
              'id': feed?.id,
              'post_ref': feed?.feedRef,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            });
            print('Success: Posting to $_uid timeline');
          }
        }
      }
      print('Success: Saving to followers timeline');
      return 'Success';
    } catch (e) {
      print(e);
      print('Error!!!: Saving to followers timeline');
      return null;
    }
  }

  // save featured post to users collection too
  Future _saveFeatured(final PeamanFeed? _feed) async {
    try {
      final _userRef = _ref.collection('users').doc(uid);
      final _featuredPostsRef =
          _userRef.collection('featured_posts').doc(_feed?.id);

      await _featuredPostsRef.set({
        'post_ref': _feed?.feedRef,
        'updated_at': _feed?.updatedAt,
      });

      print('Success: Saving featured post ${feed?.id}');
      return 'Success';
    } catch (e) {
      print(e);
      print('Success: Saving featured post ${feed?.id}');
      return null;
    }
  }

  // react to post
  Future reactPost(final PeamanUser appUser) async {
    try {
      final _postRef = _ref.collection('posts').doc(feed?.id);
      final _reactionsRef = _postRef.collection('reactions').doc(appUser.uid);

      final _reactionData = {
        'uid': appUser.uid,
        'unreacted': false,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      };

      await _reactionsRef.set(_reactionData);

      final _data = {
        'reaction_count': FieldValue.increment(1),
        'init_reactor': appUser.toFeedUser(),
        'reactors_photo': FieldValue.arrayUnion([appUser.photoUrl]),
      };

      if (feed?.initialReactor != null &&
          feed?.initialReactor?.uid != appUser.uid) {
        _data.removeWhere((key, value) => key == 'init_reactor');
      }

      if ((feed?.reactorsPhoto ?? []).length >= 3) {
        _data.removeWhere((key, value) => key == 'reactors_photo');
      }

      await _postRef.update(_data);

      print('Success: Reacting to post ${feed?.id}');
      return 'Success';
    } catch (e) {
      print(e);
      print('Error!!!: Reacting to post ${feed?.id}');
      return null;
    }
  }

  // unreact to post
  Future unReactPost(final PeamanUser appUser) async {
    try {
      final _postRef = _ref.collection('posts').doc(feed?.id);
      final _reactionsRef = _postRef.collection('reactions').doc(appUser.uid);

      await _reactionsRef.update({
        'unreacted': true,
      });

      Map<String, dynamic> _data = {
        'reaction_count': FieldValue.increment(-1),
        'init_reactor': appUser.toFeedUser(),
        'reactors_photo': FieldValue.arrayRemove([appUser.photoUrl]),
      };

      if (feed?.initialReactor?.uid == appUser.uid) {
        _data['init_reactor'] = null;
      } else {
        _data.removeWhere((key, value) => key == 'init_reactor');
      }

      await _postRef.update(_data);
      print('Success: Unreacting to post ${feed?.id}');
      return 'Success';
    } catch (e) {
      print(e);
      print('Error!!!: Unreacting to post ${feed?.id}');
      return null;
    }
  }

  // comment in a post
  Future commentPost({
    required final String feedId,
    required final PeamanComment comment,
  }) async {
    try {
      final _feedRef = _ref.collection('posts').doc(feedId);
      final _commentRef = _feedRef.collection('comments').doc();
      final _comment = comment.copyWith(id: _commentRef.id);

      await _commentRef.set(_comment.toJson());
      if (_comment.parent == PeamanCommentParent.feed) {
        await _updatePostPropertiesCount(
          feedId: feedId,
          commentsCount: 1,
        );
      } else {
        await _updateRepliesCount(
          feedId: feedId,
          commentId: _comment.parentId!,
          repliesCount: 1,
        );
      }
      print('Success: Commenting in post $feedId');
      return 'Success';
    } catch (e) {
      print(e);
      print('Error!!!: Commenting in post $feedId');
      return null;
    }
  }

  // update photos count
  Future _updatePhotosCount(final int count) async {
    try {
      final _userRef = _ref.collection('users').doc(uid);

      await _userRef.update({
        'photos': FieldValue.increment(count),
      });

      print('Success: Updating photos count');
      return 'Success';
    } catch (e) {
      print(e);
      print('Error!!!: Updating photos count');
    }
  }

  // delete my post
  Future deletePost() async {
    try {
      final _postRef = feed?.feedRef;
      final _featuredPostsRef = _ref
          .collection('users')
          .doc(uid)
          .collection('featured_posts')
          .doc(feed?.id);

      await _postRef?.delete();
      await _featuredPostsRef.delete();
      print("Success: Deleting my post ${feed?.id}");

      return _updatePhotosCount(-(feed?.photos ?? []).length);
    } catch (e) {
      print(e);
      print('Error!!!: Deleting my post ${feed?.id}');
      return null;
    }
  }

  // save post
  Future savePost() async {
    try {
      final _savedPostRef = _ref
          .collection('users')
          .doc(uid)
          .collection('saved_posts')
          .doc(feed?.id);
      final _feedSavesRef =
          _ref.collection('posts').doc(feed?.id).collection('saves').doc(uid);

      final _data = {
        'id': feed?.id,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      };
      final _feedSaveData = {
        'uid': uid,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      };

      await _feedSavesRef.set(_feedSaveData);
      await _savedPostRef.set(_data);
      await _updatePostPropertiesCount(feedId: feed?.id ?? '', savesCount: 1);
      print('Success: Saving feed? ${feed?.id}');
      return feed;
    } catch (e) {
      print(e);
      print('Error!!!: Saving feed? ${feed?.id}');
      return null;
    }
  }

  // remove saved post
  Future removeSavedPost() async {
    try {
      final _savedPostRef = _ref
          .collection('users')
          .doc(uid)
          .collection('saved_posts')
          .doc(feed?.id);
      final _feedSavesRef =
          _ref.collection('posts').doc(feed?.id).collection('saves').doc(uid);

      await _feedSavesRef.delete();
      await _savedPostRef.delete();
      await _updatePostPropertiesCount(feedId: feed?.id ?? '', savesCount: -1);
      print('Success: Deleting saved feed? ${feed?.id}');
      return feed;
    } catch (e) {
      print(e);
      print('Error!!!: Deleting saved feed? ${feed?.id}');
      return null;
    }
  }

  // see moment?
  Future viewMoment(final PeamanUser appUser) async {
    try {
      final _momentRef = _ref.collection('moments').doc(moment?.id);
      final _seenUsersRef =
          _momentRef.collection('seen_users').doc(appUser.uid);

      await _seenUsersRef.set({
        'user_data': appUser.toFeedUser(),
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      });
      await _updateMomentViewsCount();
      print('Success: Viewing moment? ${moment?.id}');
      return 'Success';
    } catch (e) {
      print(e);
      print('Error!!!: Viewing moment? ${moment?.id}');
      return null;
    }
  }

  // update post properties count
  Future _updatePostPropertiesCount({
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

  // update repliesCount of a comment
  Future _updateRepliesCount({
    required final String feedId,
    required final String commentId,
    required final int repliesCount,
  }) async {
    try {
      final _commentRef = _ref
          .collection('posts')
          .doc(feedId)
          .collection('comments')
          .doc(commentId);
      final _data = <String, dynamic>{
        'replies_count': FieldValue.increment(repliesCount),
      };

      if (_data.isNotEmpty) {
        await _commentRef.update(_data);
      }
      print(
        'Success: Updating replies count of Feed - $feedId, Comment - $commentId',
      );
    } catch (e) {
      print(e);
      print(
        'Error!!!: Updating replies count of Feed - $feedId, Comment - $commentId',
      );
      return null;
    }
  }

  // update moment views count
  Future _updateMomentViewsCount() async {
    try {
      final _momentRef = _ref.collection('moments').doc(moment?.id);
      await _momentRef.update({
        'views': FieldValue.increment(1),
      });
    } catch (e) {
      print(e);
      print('Error!!!: Updating moment? view count of ${moment?.id}');
      return null;
    }
  }

  // get list of feeds
  Future<List<PeamanFeed>> _getFeedsList(
    final QuerySnapshot<Map<String, dynamic>>? postsSnap, {
    bool isTimelinePosts = true,
  }) async {
    final _feeds = <PeamanFeed>[];

    try {
      if ((postsSnap?.docs ?? []).isNotEmpty) {
        for (final doc in (postsSnap?.docs ?? [])) {
          if (doc.exists) {
            final _data = doc.data();
            DocumentReference<Map<String, dynamic>> _postRef;
            DocumentSnapshot<Map<String, dynamic>> _postSnap;
            Map<String, dynamic>? _postData;

            if (isTimelinePosts) {
              _postRef = _data['post_ref'];
              _postSnap = await _postRef.get();
              _postData = _postSnap.data();
            } else {
              _postData = _data;
            }

            PeamanFeed _feed = PeamanFeed.fromJson(_postData ?? {});

            final _reactionsRef = _ref
                .collection('posts')
                .doc(_feed.id)
                .collection('reactions')
                .doc(uid);

            final _savedPostRef = _ref
                .collection('users')
                .doc(uid)
                .collection('saved_posts')
                .doc(_feed.id);

            final _reactionSnap = await _reactionsRef.get();
            final _savedPostSnap = await _savedPostRef.get();

            if (_reactionSnap.exists) {
              final _reactionData = _reactionSnap.data();
              final _isUnreacted = _reactionData?['unreacted'] ?? false;

              _feed = _feed.copyWith(isReacted: !_isUnreacted);
            } else {
              _feed = _feed.copyWith(isReacted: false);
            }

            _feed = _feed.copyWith(isSaved: _savedPostSnap.exists);

            // if (_feed.initialReactor != null &&
            //     _feed.initialReactor?.uid == uid &&
            //     (_feed.reactorsPhoto ?? []).contains(appUser?.photoUrl)) {
            //   _feed = _feed.copyWith(initialReactor: appUser);
            // }

            _feeds.add(_feed);
          }
        }
      }
    } catch (e) {
      print(e);
      print('Error!!!: Getting feeds list');
    }
    return _feeds;
  }

  // get my moments
  Future<List<PeamanMoment>> getMyMoments() async {
    final _moments = <PeamanMoment>[];
    try {
      final _momentsRef =
          _ref.collection('moments').where('owner_id', isEqualTo: uid);
      final _momentsSnap = await _momentsRef.get();
      if (_momentsSnap.docs.isNotEmpty) {
        for (var doc in _momentsSnap.docs) {
          if (doc.exists) {
            final _moment = PeamanMoment.fromJson(doc.data());
            _moments.add(_moment);
          }
        }
      }
      print('Success: Getting my moments');
    } catch (e) {
      print(e);
      print('Error!!!: Getting my moments');
    }

    return _moments;
  }

  // get moments
  Future<List<PeamanMoment>> getMoments() async {
    final _moments = <PeamanMoment>[];
    try {
      final _momentsRef =
          _ref.collection('users').doc(uid).collection('moments');
      final _momentsSnap = await _momentsRef.get();
      if (_momentsSnap.docs.isNotEmpty) {
        for (var doc in (_momentsSnap.docs)) {
          if (doc.exists) {
            final DocumentReference<Map<String, dynamic>> _momentRef =
                doc['moment_ref'];
            final _momentSnap = await _momentRef.get();
            if (_momentSnap.exists) {
              final _momentData = _momentSnap.data();
              PeamanMoment _moment = PeamanMoment.fromJson(_momentData ?? {});

              final _seenRef = _momentRef.collection('seen_users').doc(uid);
              final _seenSnap = await _seenRef.get();

              _moment = _moment.copyWith(
                isSeen: _seenSnap.exists,
              );
              _moments.add(_moment);
            }
          }
        }
      }
      print('Success: Getting moments');
    } catch (e) {
      print(e);
      print('Error!!!: Getting moments');
    }

    return _moments;
  }

  // get single post by id
  Future<PeamanFeed?> getSinglePostById(final String id) async {
    PeamanFeed? _feed;
    try {
      final _feedRef = _ref.collection('posts').doc(id);
      final _feedSnap = await _feedRef.get();

      if (_feedSnap.exists) {
        final _feedData = _feedSnap.data();

        _feed = PeamanFeed.fromJson(_feedData ?? {});

        final _reactionsRef = _ref
            .collection('posts')
            .doc(_feed.id)
            .collection('reactions')
            .doc(uid);

        final _savedPostRef = _ref
            .collection('users')
            .doc(uid)
            .collection('saved_posts')
            .doc(_feed.id);

        final _reactionSnap = await _reactionsRef.get();
        final _savedPostSnap = await _savedPostRef.get();

        if (_reactionSnap.exists) {
          final _reactionData = _reactionSnap.data();
          final _isUnreacted = _reactionData?['unreacted'] ?? false;

          _feed = _feed.copyWith(isReacted: !_isUnreacted);
        } else {
          _feed = _feed.copyWith(isReacted: false);
        }

        _feed = _feed.copyWith(isSaved: _savedPostSnap.exists);

        // if (_feed.initialReactor != null &&
        //     _feed.initialReactor?.uid == uid &&
        //     (_feed.reactorsPhoto ?? []).contains(appUser?.photoUrl)) {
        //   _feed = _feed.copyWith(initialReactor: appUser);
        // }
        print('Success: Getting single post by id $id');
      }
    } catch (e) {
      print(e);
      print('Error!!!: Getting single post by id $id');
    }

    return _feed;
  }

  // get posts by id
  Future<List<PeamanFeed>> getPostsById() async {
    List<PeamanFeed> _feeds = [];
    try {
      final _postsRef = _ref
          .collection('posts')
          .where('owner_id', isEqualTo: user?.uid)
          .orderBy('updated_at', descending: true)
          .limit(6);

      final _postSnap = await _postsRef.get();

      _feeds = await _getFeedsList(_postSnap, isTimelinePosts: false);

      print('Success: Getting my posts');
    } catch (e) {
      print(e);
      print('Error!!!: Getting my posts');
    }
    return _feeds;
  }

  // get featured posts by id
  Future<List<PeamanFeed>> getFeaturedPostsById() async {
    List<PeamanFeed> _feeds = [];
    try {
      final _featuredPosts = user?.appUserRef
          ?.collection('featured_posts')
          .orderBy('updated_at', descending: true)
          .limit(6);
      final _featuredPostsSnap = await _featuredPosts?.get();

      _feeds = await _getFeedsList(_featuredPostsSnap);

      print('Success: Getting featured posts');
    } catch (e) {
      print(e);
      print('Error!!!: Getting featured posts');
    }
    return _feeds;
  }

  // get my timeline
  Future<List<PeamanFeed>> getTimeline() async {
    List<PeamanFeed> _feeds = [];
    try {
      AppUserProvider(uid: uid).updateUserDetail(data: {
        'new_posts': false,
      });

      final _userRef = _ref.collection('users').doc(uid);
      final _timelineRef = _userRef
          .collection('timeline')
          .orderBy('updated_at', descending: true)
          .limit(6);

      final _timelineSnap = await _timelineRef.get();

      _feeds = await _getFeedsList(_timelineSnap);

      print('Success: Getting my posts');
    } catch (e) {
      print(e);
      print('Error!!!: Getting my posts');
    }
    return _feeds;
  }

  // get old featured posts by id
  Future<List<PeamanFeed>> getOldFeaturedPostsById() async {
    List<PeamanFeed> _feeds = [];
    try {
      final _userRef = user?.appUserRef;

      final _featuredPostsRef = _userRef
          ?.collection('featured_posts')
          .orderBy('updated_at', descending: true)
          .startAfter([feed?.updatedAt]).limit(5);
      final _featuredPostsSnap = await _featuredPostsRef?.get();

      _feeds = await _getFeedsList(_featuredPostsSnap);

      print('Success: Getting old featured posts');
    } catch (e) {
      print(e);
      print('Error!!!: Getting old featured posts');
    }
    return _feeds;
  }

  // get old posts by id
  Future<List<PeamanFeed>> getOldPostsById() async {
    List<PeamanFeed> _feeds = [];
    try {
      final _postsRef = _ref
          .collection('posts')
          .where('owner_id', isEqualTo: user?.uid)
          .orderBy('updated_at', descending: true)
          .startAfter([feed?.updatedAt]).limit(5);

      final _postSnap = await _postsRef.get();

      _feeds = await _getFeedsList(_postSnap, isTimelinePosts: false);

      print('Success: Getting old posts by id');
    } catch (e) {
      print(e);
      print('Error!!!: Getting old posts by id');
    }
    return _feeds;
  }

  // get old posts of timeline
  Future<List<PeamanFeed>> getOldTimelinePosts() async {
    List<PeamanFeed> _feeds = [];
    try {
      final _userRef = _ref.collection('users').doc(uid);

      final _timelineRef = _userRef
          .collection('timeline')
          .orderBy('updated_at', descending: true)
          .startAfter([feed?.updatedAt]).limit(5);
      final _timelineSnap = await _timelineRef.get();

      _feeds = await _getFeedsList(_timelineSnap);

      print('Success: Getting old timeline posts');
    } catch (e) {
      print(e);
      print('Error!!!: Getting old timeline posts');
    }
    return _feeds;
  }

  // get new posts of timeline
  Future<List<PeamanFeed>> getNewTimelinePosts() async {
    List<PeamanFeed> _feeds = [];
    try {
      final _userRef = _ref.collection('users').doc(uid);

      final _timelineRef = _userRef
          .collection('timeline')
          .orderBy('updated_at', descending: true)
          .endBefore([feed?.updatedAt]).limit(5);
      final _timelineSnap = await _timelineRef.get();

      _feeds = await _getFeedsList(_timelineSnap, isTimelinePosts: true);

      print('Success: Getting new timeline posts');
    } catch (e) {
      print(e);
      print('Error!!!: Getting new timeline posts');
    }
    return _feeds;
  }

  // get saved feeds
  Future<List<PeamanFeed>> getSavedPosts() async {
    List<PeamanFeed> _feeds = [];
    try {
      final _savedPostsRef =
          _ref.collection('users').doc(uid).collection('saved_posts');
      final _savedPostsSnap = await _savedPostsRef.get();

      _feeds = await _getFeedsList(_savedPostsSnap);

      print('Success: Getting saved posts');
    } catch (e) {
      print(e);
      print('Error!!!: Getting saved posts');
    }

    return _feeds;
  }

  // get comment
  Future<List<PeamanComment>?> getComments() async {
    try {
      List<PeamanComment> _comments = [];

      final _commentRef = feed?.feedRef
          ?.collection('comments')
          .orderBy('updated_at', descending: true)
          .limit(10);
      final _commentSnap = await _commentRef?.get();

      if ((_commentSnap?.docs ?? []).isNotEmpty) {
        for (final commentDoc in (_commentSnap?.docs ?? [])) {
          final _commentData = commentDoc.data();
          final DocumentReference<Map<String, dynamic>> _userRef =
              _commentData['user_ref'];
          final _userSnap = await _userRef.get();
          if (_userSnap.exists) {
            final _userData = _userSnap.data();
            final _user = PeamanUser.fromJson(_userData ?? {});
            final _comment = PeamanComment.fromJson(_commentData, _user);

            _comments.add(_comment);
          }
        }
      }

      print('Success: Getting all comments');
      return _comments;
    } catch (e) {
      print(e);
      print('Error!!!: Getting all comments');
      return null;
    }
  }

  // get reaction by id
  Future<PeamanReaction?> getReactionById(final String reactedById) async {
    PeamanReaction? _reaction;
    try {
      final _postRef = _ref.collection('posts').doc(feed?.id);
      final _reactionRef = _postRef.collection('reactions').doc(reactedById);
      final _reactionSnap = await _reactionRef.get();

      if (_reactionSnap.exists) {
        final _reactionData = _reactionSnap.data() ?? {};
        _reaction = PeamanReaction.fromJson(_reactionData);
      }
    } catch (e) {
      print(e);
      print('Error!!!: Getting reaction by id');
    }
    return _reaction;
  }

  // get saved by id
  Future<PeamanFeedSaves?> getFeedSavesById(final String savedById) async {
    PeamanFeedSaves? _postSaves;
    try {
      final _postRef = _ref.collection('posts').doc(feed?.id);
      final _postSavesRef = _postRef.collection('saves').doc(savedById);
      final _postSavesSnap = await _postSavesRef.get();

      if (_postSavesSnap.exists) {
        final _postSavesData = _postSavesSnap.data() ?? {};
        _postSaves = PeamanFeedSaves.fromJson(_postSavesData);
      }
    } catch (e) {
      print(e);
      print('Error!!!: Getting reaction by id');
    }
    return _postSaves;
  }

  // list of feeds from firestore
  List<PeamanFeed> _feedsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanFeed.fromJson(e.data())).toList();
  }

  // list of comments from firestore
  List<PeamanComment> _commentsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs
        .map(
          (e) => PeamanComment.fromJson(e.data(), PeamanUser()),
        )
        .toList();
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
  Stream<List<PeamanUser>> get momentViewers {
    return _ref
        .collection('moments')
        .doc(moment?.id)
        .collection('seen_users')
        .snapshots()
        .map(_usersFromFirebase);
  }

  // stream of all feeds
  Stream<List<PeamanFeed>> allFeeds({final PeamanQuery? query}) {
    final _query = query ??
        PeamanQuery(
          orderBy: 'updated_at',
          descending: true,
        );
    return _ref
        .collection('posts')
        .orderBy(_query.orderBy, descending: _query.descending)
        .snapshots()
        .map(_feedsFromFirebase);
  }

  // stream of comments
  Stream<List<PeamanComment>> comments({
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
}
