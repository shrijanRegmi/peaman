import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/peaman.dart';
import '../../helpers/common_helper.dart';
import '../../utils/query_type_def.dart';

class FeedProvider {
  // create feed
  Future<void> createFeed({
    required final PeamanFeed feed,
    final Function(PeamanFeed)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _currentMillis = DateTime.now().millisecondsSinceEpoch;

      final _feedRef = PeamanReferenceHelper.feedsCol.doc(feed.id);
      final _myFeedRef = PeamanReferenceHelper.myFeedsCol(
        uid: feed.ownerId!,
      ).doc(_feedRef.id);

      final _feed = feed.copyWith(
        id: _feedRef.id,
        createdAt: feed.createdAt ?? _currentMillis,
        updatedAt: feed.updatedAt ?? _currentMillis,
      );
      final _myFeed = PeamanMyFeed(
        id: _feedRef.id,
        createdAt: _currentMillis,
        updatedAt: _currentMillis,
      );

      final _futures = <Future>[];

      final _createFeedFuture = _feedRef.set(_feed.toJson());
      _futures.add(_createFeedFuture);

      final _myFeedFuture = _myFeedRef.set(_myFeed.toJson());
      _futures.add(_myFeedFuture);

      final _updatePhotosFuture = _updateUserStatusCount(
        uid: feed.ownerId!,
        feeds: 1,
        photos: feed.files
            .where((element) => element.type == PeamanFileType.image)
            .length,
        videos: feed.files
            .where((element) => element.type == PeamanFileType.video)
            .length,
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

      final _feedRef = PeamanReferenceHelper.feedsCol.doc(feedId);
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
      final _feedRef = PeamanReferenceHelper.feedsCol.doc(feedId);

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
      final _currentMillis = DateTime.now().millisecondsSinceEpoch;

      final _feedFollowerRef =
          PeamanReferenceHelper.feedFollowersCol(feedId: feedId).doc(uid);
      final _followedFeedRef =
          PeamanReferenceHelper.followedFeedsCol(uid: uid).doc(feedId);

      final _feedFollower = PeamanFeedFollower(
        uid: uid,
        createdAt: _currentMillis,
        updatedAt: _currentMillis,
      );
      final _followedFeed = PeamanFollowedFeed(
        id: feedId,
        createdAt: _currentMillis,
        updatedAt: _currentMillis,
      );

      final _feedFollowerFuture = _feedFollowerRef.set(_feedFollower.toJson());
      final _followedFeedFuture = _followedFeedRef.set(_followedFeed.toJson());

      await Future.wait([
        _feedFollowerFuture,
        _followedFeedFuture,
      ]);

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
      final _feedFollowerRef =
          PeamanReferenceHelper.feedFollowersCol(feedId: feedId).doc(uid);
      final _followedFeedRef =
          PeamanReferenceHelper.followedFeedsCol(uid: uid).doc(feedId);

      await Future.wait([
        _feedFollowerRef.delete(),
        _followedFeedRef.delete(),
      ]);

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
      final _currentMillis = DateTime.now().millisecondsSinceEpoch;

      final _feedSaverRef =
          PeamanReferenceHelper.feedSaversCol(feedId: feedId).doc(uid);
      final _savedFeedRef =
          PeamanReferenceHelper.savedFeedsCol(uid: uid).doc(feedId);

      final _feedSaver = PeamanFeedSaver(
        uid: uid,
        createdAt: _currentMillis,
        updatedAt: _currentMillis,
      );
      final _savedFeed = PeamanSavedFeed(
        id: feedId,
        createdAt: _currentMillis,
        updatedAt: _currentMillis,
      );

      final _futures = <Future>[
        _feedSaverRef.set(_feedSaver.toJson()),
        _savedFeedRef.set(_savedFeed.toJson()),
        updateFeedPropertiesCount(
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
      final _savedFeedRef =
          PeamanReferenceHelper.savedFeedsCol(uid: uid).doc(feedId);
      final _feedSaverRef =
          PeamanReferenceHelper.feedSaversCol(feedId: feedId).doc(uid);

      final _futures = <Future>[
        _feedSaverRef.delete(),
        _savedFeedRef.delete(),
        updateFeedPropertiesCount(
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
      final _currentMillis = DateTime.now().millisecondsSinceEpoch;

      late PeamanMoment _moment;

      final _ownerMomentsRef = PeamanReferenceHelper.momentsCol
          .where('owner_id', isEqualTo: moment.ownerId)
          .limit(1);
      final _ownerMomentsSnap = await _ownerMomentsRef.get();

      if (_ownerMomentsSnap.docs.isNotEmpty) {
        final _ownerMomentSnap = _ownerMomentsSnap.docs.first;

        if (_ownerMomentSnap.exists) {
          final _pictures = moment.pictures.map((e) {
            final _randomDocument =
                FirebaseFirestore.instance.collection('random').doc();
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
        final _momentRef = PeamanReferenceHelper.momentsCol.doc(moment.id);
        final _pictures = moment.pictures.map((e) {
          final _randomDocument =
              FirebaseFirestore.instance.collection('random').doc();
          final _momentPicture = e.copyWith(id: e.id ?? _randomDocument.id);
          return _momentPicture;
        }).toList();

        _moment = moment.copyWith(
          id: _momentRef.id,
          pictures: _pictures,
          createdAt: moment.createdAt ?? _currentMillis,
          updatedAt: moment.updatedAt ?? _currentMillis,
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
      final _momentRef = PeamanReferenceHelper.momentsCol.doc(momentId);

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
      final _currentMillis = DateTime.now().millisecondsSinceEpoch;

      final _viewedFeedRef =
          PeamanReferenceHelper.viewedFeedsCol(uid: uid).doc(feedId);
      final _feedViewerRef =
          PeamanReferenceHelper.feedViewersCol(feedId: feedId).doc(uid);

      final _feedViewer = PeamanFeedViewer(
        uid: uid,
        createdAt: _currentMillis,
        updatedAt: _currentMillis,
      );
      final _viewedFeed = PeamanViewedFeed(
        id: feedId,
        createdAt: _currentMillis,
        updatedAt: _currentMillis,
      );

      final _futures = <Future>[
        _feedViewerRef.set(_feedViewer.toJson()),
        _viewedFeedRef.set(_viewedFeed.toJson()),
        updateFeedPropertiesCount(
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
      final _currentMillis = DateTime.now().millisecondsSinceEpoch;

      final _momentViewerRef =
          PeamanReferenceHelper.momentViewersCol(momentId: momentId).doc(uid);

      final _momentViewer = PeamanMomentViewer(
        uid: uid,
        createdAt: _currentMillis,
        updatedAt: _currentMillis,
      );

      final _momentViewerFuture = _momentViewerRef.set(_momentViewer.toJson());

      await Future.wait([
        _momentViewerFuture,
        _updateMomentViewsCount(momentId: momentId),
      ]);
      print('Success: Viewing moment $momentId');
    } catch (e) {
      print(e);
      print('Error!!!: Viewing moment');
    }
  }

  // add reaction to post or comment
  Future<void> addReaction({
    required final PeamanReaction reaction,
    final bool updateParentReactionsCount = true,
    final bool updateUserReactionsCount = true,
    final Function(PeamanReaction)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      if (reaction.feedId == null) throw Exception("feedId can't be null");
      if (reaction.ownerId == null) throw Exception("feedId can't be null");
      if (reaction.parentId == null) throw Exception("parentId can't be null");
      if (reaction.parentOwnerId == null)
        throw Exception("parentOwnerId can't be null");

      final _currentMillis = DateTime.now().millisecondsSinceEpoch;

      final _reactionsRef =
          PeamanReferenceHelper.reactionsCol(feedId: reaction.feedId!)
              .doc(reaction.id);
      final _reactedFeedRef =
          PeamanReferenceHelper.reactedFeedsCol(uid: reaction.ownerId!)
              .doc(reaction.feedId);
      final _feedReactorRef =
          PeamanReferenceHelper.feedReactorsCol(feedId: reaction.feedId!)
              .doc(reaction.ownerId);

      final _reaction = reaction.copyWith(
        id: _reactionsRef.id,
        createdAt: reaction.createdAt ?? _currentMillis,
        updatedAt: reaction.updatedAt ?? _currentMillis,
      );
      final _reactedFeed = PeamanReactedFeed(
        id: reaction.feedId,
        createdAt: _currentMillis,
        updatedAt: _currentMillis,
      );
      final _feedReactor = PeamanFeedReactor(
        uid: reaction.ownerId,
        createdAt: _currentMillis,
        updatedAt: _currentMillis,
      );

      final _futures = <Future>[];

      _futures.add(_reactionsRef.set(_reaction.toJson()));

      if (_reaction.parent == PeamanReactionParent.feed) {
        if (updateParentReactionsCount) {
          final _feedPropertyFuture = updateFeedPropertiesCount(
            feedId: _reaction.feedId!,
            reactionsCount: 1,
          );
          _futures.add(_feedPropertyFuture);
        }

        if (updateUserReactionsCount) {
          final _userPropertyFuture = PUserProvider.updateUserPropertiesCount(
            uid: _reaction.parentOwnerId!,
            reactionsReceivedFromFeeds: 1,
          );
          _futures.add(_userPropertyFuture);
        }

        final _reactedFeedFuture = _reactedFeedRef.set(_reactedFeed.toJson());
        final _feedReactorFuture = _feedReactorRef.set(_feedReactor.toJson());

        _futures.add(_reactedFeedFuture);
        _futures.add(_feedReactorFuture);
        print('Success: Adding reaction to feed ${reaction.feedId}');
      } else {
        if (updateParentReactionsCount) {
          final _commentPropertyFuture = updateCommentPropertiesCount(
            feedId: _reaction.feedId!,
            commentId: _reaction.parentId!,
            reactionsCount: 1,
          );
          _futures.add(_commentPropertyFuture);
        }

        if (updateUserReactionsCount) {
          final _userPropertyFuture = PUserProvider.updateUserPropertiesCount(
            uid: _reaction.parentOwnerId!,
            reactionsReceivedFromFeeds: 1,
          );
          _futures.add(_userPropertyFuture);
        }
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
    required final String reactionId,
    required final String ownerId,
    required final String parentId,
    required final String parentOwnerId,
    final bool updateParentReactionsCount = true,
    final bool updateUserReactionsCount = true,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _reactionsRef =
          PeamanReferenceHelper.reactionsCol(feedId: feedId).doc(reactionId);
      final _reactedFeedRef =
          PeamanReferenceHelper.reactedFeedsCol(uid: ownerId).doc(feedId);
      final _feedReactorRef =
          PeamanReferenceHelper.feedReactorsCol(feedId: feedId).doc(ownerId);

      final _futures = <Future>[];

      final _future = _reactionsRef.update({
        'unreacted': true,
      });
      _futures.add(_future);

      if (feedId == parentId) {
        if (updateParentReactionsCount) {
          final _feedPropertiesFuture = updateFeedPropertiesCount(
            feedId: feedId,
            reactionsCount: -1,
          );
          _futures.add(_feedPropertiesFuture);
        }

        if (updateUserReactionsCount) {
          final _userPropertyFuture = PUserProvider.updateUserPropertiesCount(
            uid: parentOwnerId,
            reactionsReceivedFromFeeds: -1,
          );
          _futures.add(_userPropertyFuture);
        }

        final _reactedFeedFuture = _reactedFeedRef.delete();
        final _feedReactorFuture = _feedReactorRef.delete();

        _futures.add(_reactedFeedFuture);
        _futures.add(_feedReactorFuture);
        print('Success: Removing reaction from feed $feedId');
      } else {
        if (updateParentReactionsCount) {
          final _commentPropertyFuture = updateCommentPropertiesCount(
            feedId: feedId,
            commentId: parentId,
            reactionsCount: -1,
          );
          _futures.add(_commentPropertyFuture);
        }

        if (updateUserReactionsCount) {
          final _userPropertyFuture = PUserProvider.updateUserPropertiesCount(
            uid: parentOwnerId,
            reactionsReceivedFromFeeds: -1,
          );
          _futures.add(_userPropertyFuture);
        }
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
      if (comment.feedId == null) throw Exception("feedId can't be null");
      if (comment.ownerId == null) throw Exception("feedId can't be null");
      if (comment.parentId == null) throw Exception("parentId can't be null");
      if (comment.parentOwnerId == null)
        throw Exception("parentOwner can't be null");

      final _currentMillis = DateTime.now().millisecondsSinceEpoch;

      final _commentRef =
          PeamanReferenceHelper.commentsCol(feedId: comment.feedId!)
              .doc(comment.id);
      final _commentedFeedRef =
          PeamanReferenceHelper.commentedFeedsCol(uid: comment.ownerId!)
              .doc(comment.feedId);
      final _repliedFeedRef =
          PeamanReferenceHelper.repliedFeedsCol(uid: comment.ownerId!)
              .doc(comment.feedId);
      final _feedCommenterRef =
          PeamanReferenceHelper.feedCommentersCol(feedId: comment.feedId!)
              .doc(comment.ownerId);
      final _feedReplierRef =
          PeamanReferenceHelper.feedRepliersCol(feedId: comment.feedId!)
              .doc(comment.ownerId);

      final _comment = comment.copyWith(
        id: _commentRef.id,
        createdAt: comment.createdAt ?? _currentMillis,
        updatedAt: comment.updatedAt ?? _currentMillis,
      );
      final _commentedFeed = PeamanSavedFeed(
        id: _comment.feedId,
        createdAt: _currentMillis,
        updatedAt: _currentMillis,
      );
      final _repliedFeed = PeamanSavedFeed(
        id: _comment.feedId,
        createdAt: _currentMillis,
        updatedAt: _currentMillis,
      );
      final _feedCommenter = PeamanFeedCommenter(
        uid: _comment.ownerId,
        createdAt: _currentMillis,
        updatedAt: _currentMillis,
      );
      final _feedReplier = PeamanFeedReplier(
        uid: _comment.ownerId,
        createdAt: _currentMillis,
        updatedAt: _currentMillis,
      );

      final _futures = <Future>[];

      final _future = _commentRef.set(_comment.toJson());
      _futures.add(_future);

      if (_comment.parent == PeamanCommentParent.feed) {
        final _feedPropertiesFuture = updateFeedPropertiesCount(
          feedId: _comment.feedId!,
          commentsCount: 1,
        );

        final _userPropertyFuture = PUserProvider.updateUserPropertiesCount(
          uid: _comment.parentOwnerId!,
          commentsReceivedFromFeeds: 1,
        );

        final _commentedFeedFuture = _commentedFeedRef.set(
          _commentedFeed.toJson(),
        );

        final _feedCommenterFuture = _feedCommenterRef.set(
          _feedCommenter.toJson(),
        );

        _futures.add(_feedPropertiesFuture);
        _futures.add(_userPropertyFuture);
        _futures.add(_commentedFeedFuture);
        _futures.add(_feedCommenterFuture);
        print('Success: Adding comment to feed ${comment.feedId}');
      } else {
        final _commentPropertiesFuture = updateCommentPropertiesCount(
          feedId: _comment.feedId!,
          commentId: _comment.parentId!,
          repliesCount: 1,
        );

        final _feedPropertiesFuture = updateFeedPropertiesCount(
          feedId: _comment.feedId!,
          repliesCount: 1,
        );

        final _userPropertyFuture = PUserProvider.updateUserPropertiesCount(
          uid: _comment.parentOwnerId!,
          repliesReceivedFromFeeds: 1,
        );

        final _repliedFeedFuture = _repliedFeedRef.set(
          _repliedFeed.toJson(),
        );

        final _feedReplierFuture = _feedReplierRef.set(
          _feedReplier.toJson(),
        );

        _futures.add(_feedPropertiesFuture);
        _futures.add(_commentPropertiesFuture);
        _futures.add(_userPropertyFuture);
        _futures.add(_repliedFeedFuture);
        _futures.add(_feedReplierFuture);
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
      final _commentRef =
          PeamanReferenceHelper.commentsCol(feedId: feedId).doc(commentId);
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
    required final String commentId,
    required final String ownerId,
    required final String parentId,
    required final String parentOwnerId,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _commentRef =
          PeamanReferenceHelper.commentsCol(feedId: feedId).doc(commentId);
      final _commentedFeedRef =
          PeamanReferenceHelper.commentedFeedsCol(uid: ownerId).doc(feedId);
      final _repliedFeedRef =
          PeamanReferenceHelper.repliedFeedsCol(uid: ownerId).doc(feedId);
      final _feedCommenterRef =
          PeamanReferenceHelper.feedCommentersCol(feedId: feedId).doc(ownerId);
      final _feedReplierRef =
          PeamanReferenceHelper.feedRepliersCol(feedId: feedId).doc(ownerId);

      final _futures = <Future>[];

      await _commentRef.delete();

      if (feedId == parentId) {
        final _feedPropertiesFuture = updateFeedPropertiesCount(
          feedId: feedId,
          commentsCount: -1,
        );

        final _userPropertyFuture = PUserProvider.updateUserPropertiesCount(
          uid: parentOwnerId,
          commentsReceivedFromFeeds: -1,
        );

        _futures.add(_feedPropertiesFuture);
        _futures.add(_userPropertyFuture);

        final _commentsSnap = await getCommentsByOwnerId(
          ownerId: ownerId,
          feedId: feedId,
          parent: PeamanCommentParent.feed,
          query: (ref) => ref.limit(1),
        ).first;

        if (_commentsSnap.isEmpty) {
          final _commentedFeedFuture = _commentedFeedRef.delete();
          final _feedCommenterFuture = _feedCommenterRef.delete();
          _futures.add(_commentedFeedFuture);
          _futures.add(_feedCommenterFuture);
        }

        print('Success: Removing comment from feed $feedId');
      } else {
        final _commentPropertiesFuture = updateCommentPropertiesCount(
          feedId: feedId,
          commentId: parentId,
          repliesCount: -1,
        );

        final _feedPropertiesFuture = updateFeedPropertiesCount(
          feedId: feedId,
          repliesCount: -1,
        );

        final _userPropertyFuture = PUserProvider.updateUserPropertiesCount(
          uid: parentOwnerId,
          repliesReceivedFromFeeds: -1,
        );

        _futures.add(_commentPropertiesFuture);
        _futures.add(_userPropertyFuture);
        _futures.add(_feedPropertiesFuture);

        final _repliesSnap = await getCommentsByOwnerId(
          ownerId: ownerId,
          feedId: feedId,
          parent: PeamanCommentParent.comment,
          query: (ref) => ref.limit(1),
        ).first;

        if (_repliesSnap.isEmpty) {
          final _repliedFeedFuture = _repliedFeedRef.delete();
          final _feedReplierFuture = _feedReplierRef.delete();
          _futures.add(_repliedFeedFuture);
          _futures.add(_feedReplierFuture);
        }

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
  Future<void> updateFeedPropertiesCount({
    required final String feedId,
    final int reactionsCount = 0,
    final int commentsCount = 0,
    final int repliesCount = 0,
    final int savesCount = 0,
    final int sharesCount = 0,
    final int viewsCount = 0,
  }) async {
    try {
      final _feedRef = PeamanReferenceHelper.feedsCol.doc(feedId);
      final _data = <String, dynamic>{
        'reactions_count': FieldValue.increment(reactionsCount),
        'comments_count': FieldValue.increment(commentsCount),
        'replies_count': FieldValue.increment(repliesCount),
        'saves_count': FieldValue.increment(savesCount),
        'shares_count': FieldValue.increment(sharesCount),
        'views_count': FieldValue.increment(viewsCount),
      };

      await _feedRef.update(_data);
      print('Success: Updating feed properties count of $feedId');
    } catch (e) {
      print(e);
      print('Error!!!: Updating feed properties count of $feedId');
      return null;
    }
  }

  // update comment properties count
  Future<void> updateCommentPropertiesCount({
    required final String feedId,
    required final String commentId,
    final int reactionsCount = 0,
    final int repliesCount = 0,
  }) async {
    try {
      final _feedRef = PeamanReferenceHelper.feedsCol.doc(feedId);
      final _parentCommentRef = _feedRef.collection('comments').doc(commentId);
      final _data = <String, dynamic>{
        'reactions_count': FieldValue.increment(reactionsCount),
        'replies_count': FieldValue.increment(repliesCount),
      };

      await _parentCommentRef.update(_data);
      print('Success: Updating comment properties count of $commentId');
    } catch (e) {
      print(e);
      print('Error!!!: Updating comment properties count of $commentId');
      return null;
    }
  }

  // update photos count
  Future<void> _updateUserStatusCount({
    required final String uid,
    required final int feeds,
    required final int photos,
    required final int videos,
  }) async {
    try {
      final _userRef = PeamanReferenceHelper.usersCol.doc(uid);

      await _userRef.update({
        'feeds': FieldValue.increment(feeds),
        'photos': FieldValue.increment(photos),
        'videos': FieldValue.increment(videos),
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
      final _momentRef = PeamanReferenceHelper.momentsCol.doc(momentId);
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
      final _reactionRef = PeamanReferenceHelper.reactionsCol(feedId: feedId)
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
      final _feedSaverRef =
          PeamanReferenceHelper.feedSaversCol(feedId: feedId).doc(uid);
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
      final _feedViewerRef =
          PeamanReferenceHelper.feedViewersCol(feedId: feedId).doc(uid);
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
      final _feedFollowerRef =
          PeamanReferenceHelper.feedFollowersCol(feedId: feedId).doc(uid);
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

  // list of feed reactors from firestore
  List<PeamanFeedReactor> _feedReactorsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanFeedReactor.fromJson(e.data())).toList();
  }

  // list of feed commenters from firestore
  List<PeamanFeedCommenter> _feedCommentersFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs
        .map((e) => PeamanFeedCommenter.fromJson(e.data()))
        .toList();
  }

  // list of feed repliers from firestore
  List<PeamanFeedReplier> _feedRepliersFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanFeedReplier.fromJson(e.data())).toList();
  }

  // list of feed savers from firestore
  List<PeamanFeedSaver> _feedSaversFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanFeedSaver.fromJson(e.data())).toList();
  }

  // list of feed viewers from firestore
  List<PeamanFeedViewer> _feedViewersFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanFeedViewer.fromJson(e.data())).toList();
  }

  // list of feed followers from firestore
  List<PeamanFeedFollower> _feedFollowersFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanFeedFollower.fromJson(e.data())).toList();
  }

  // list of moment viewers from firestore
  List<PeamanMomentViewer> _momentViewersFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanMomentViewer.fromJson(e.data())).toList();
  }

  // list of my feeds from firestore
  List<PeamanMyFeed> _myFeedsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanMyFeed.fromJson(e.data())).toList();
  }

  // list of reacted feeds from firestore
  List<PeamanReactedFeed> _reactedFeedsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanReactedFeed.fromJson(e.data())).toList();
  }

  // list of commented feeds from firestore
  List<PeamanCommentedFeed> _commentedFeedsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs
        .map((e) => PeamanCommentedFeed.fromJson(e.data()))
        .toList();
  }

  // list of replied feeds from firestore
  List<PeamanRepliedFeed> _repliedFeedsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanRepliedFeed.fromJson(e.data())).toList();
  }

  // list of saved feeds from firestore
  List<PeamanSavedFeed> _savedFeedsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanSavedFeed.fromJson(e.data())).toList();
  }

  // list of viewed feeds from firestore
  List<PeamanViewedFeed> _viewedFeedsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanViewedFeed.fromJson(e.data())).toList();
  }

  // list of followed feeds from firestore
  List<PeamanFollowedFeed> _followedFeedsFromFirebase(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanFollowedFeed.fromJson(e.data())).toList();
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
  Stream<List<PeamanFeed>> getFeeds({
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref =
        PeamanReferenceHelper.feedsCol.orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_feedsFromFirebase);
  }

  // stream of all feeds
  Stream<List<PeamanFeed>> getUserFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.feedsCol
        .where('owner_id', isEqualTo: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_feedsFromFirebase);
  }

  // stream of all moments
  Stream<List<PeamanMoment>> getMoments({
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.momentsCol
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_momentsFromFirebase);
  }

  // stream of all moments
  Stream<List<PeamanMoment>> getUserMoments({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.momentsCol
        .where('owner_id', isEqualTo: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_momentsFromFirebase);
  }

  // stream of single feed by id
  Stream<PeamanFeed> getSingleFeedById({
    required final String feedId,
  }) {
    return PeamanReferenceHelper.feedsCol
        .doc(feedId)
        .snapshots()
        .map(_feedFromFirebase);
  }

  // stream of single moment by id
  Stream<PeamanMoment> getSingleMomentById({
    required final String momentId,
  }) {
    return PeamanReferenceHelper.momentsCol
        .doc(momentId)
        .snapshots()
        .map(_momentFromFirebase);
  }

  // stream of list of feeds by search keyword
  Stream<List<PeamanFeed>> getFeedsBySearchKeyword({
    required final String searchKeyword,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.feedsCol
        .where('search_keys', arrayContains: searchKeyword);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_feedsFromFirebase);
  }

  // stream of list of feed reactors
  Stream<List<PeamanFeedReactor>> getFeedReactors({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.feedReactorsCol(feedId: feedId)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_feedReactorsFromFirebase);
  }

  // stream of list of feed commenters
  Stream<List<PeamanFeedCommenter>> getFeedCommenters({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.feedCommentersCol(feedId: feedId)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_feedCommentersFromFirebase);
  }

  // stream of list of feed repliers
  Stream<List<PeamanFeedReplier>> getFeedRepliers({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.feedRepliersCol(feedId: feedId)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_feedRepliersFromFirebase);
  }

  // stream of list of feed savers
  Stream<List<PeamanFeedSaver>> getFeedSavers({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.feedSaversCol(feedId: feedId)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_feedSaversFromFirebase);
  }

  // stream of list of feed viewers
  Stream<List<PeamanFeedViewer>> getFeedViewers({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.feedViewersCol(feedId: feedId)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_feedViewersFromFirebase);
  }

  // stream of list of feed followers
  Stream<List<PeamanFeedFollower>> getFeedFollowers({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.feedFollowersCol(feedId: feedId)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_feedFollowersFromFirebase);
  }

  // stream of list of moment viewers
  Stream<List<PeamanMomentViewer>> getMomentViewers({
    required final String momentId,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.momentsCol
        .doc(momentId)
        .collection('moment_viewers')
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_momentViewersFromFirebase);
  }

  // stream of list of reacted feeds
  Stream<List<PeamanReactedFeed>> getUserReactedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.reactedFeedsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_reactedFeedsFromFirebase);
  }

  // stream of list of commented feeds
  Stream<List<PeamanCommentedFeed>> getUserCommentedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.commentedFeedsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_commentedFeedsFromFirebase);
  }

  // stream of list of replied feeds
  Stream<List<PeamanRepliedFeed>> getUserRepliedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.repliedFeedsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_repliedFeedsFromFirebase);
  }

  // stream of list of saved feeds
  Stream<List<PeamanSavedFeed>> getUserSavedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.savedFeedsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_savedFeedsFromFirebase);
  }

  // stream of list of viewed feeds
  Stream<List<PeamanViewedFeed>> getUserViewedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.viewedFeedsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_viewedFeedsFromFirebase);
  }

  // stream of list of followed feeds
  Stream<List<PeamanFollowedFeed>> getUserFollowedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.followedFeedsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_followedFeedsFromFirebase);
  }

  // stream of list of my feeds
  Stream<List<PeamanMyFeed>> getUserMyFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.myFeedsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_myFeedsFromFirebase);
  }

  // stream of list of replies
  Stream<List<PeamanComment>> getComments({
    required final String feedId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.commentsCol(feedId: feedId)
        .where('parent', isEqualTo: parent.index)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_commentsFromFirebase);
  }

  // stream of list of comments
  Stream<List<PeamanComment>> getCommentsByParentId({
    required final String feedId,
    required final PeamanCommentParent parent,
    required final String parentId,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.commentsCol(feedId: feedId)
        .where('parent', isEqualTo: parent.index)
        .where('parent_id', isEqualTo: parentId)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_commentsFromFirebase);
  }

  // stream of list of comments by ownerId
  Stream<List<PeamanComment>> getCommentsByOwnerId({
    required final String ownerId,
    required final String feedId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  }) {
    final _ref = PeamanReferenceHelper.commentsCol(feedId: feedId)
        .where('owner_id', isEqualTo: ownerId)
        .where('parent', isEqualTo: parent.index)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_commentsFromFirebase);
  }

  // stream of single comment by id
  Stream<PeamanComment> getSingleCommentById({
    required final String feedId,
    required final String commentId,
  }) {
    return PeamanReferenceHelper.commentsCol(feedId: feedId)
        .doc(commentId)
        .snapshots()
        .map(_commentFromFirebase);
  }
}
