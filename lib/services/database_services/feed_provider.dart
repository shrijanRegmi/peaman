import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/peaman.dart';
import '../../helpers/common_helper.dart';
import '../../utils/firestore_constants.dart';

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
      final _feed = feed.copyWith(
        id: _feedRef.id,
        createdAt: feed.createdAt ?? _currentMillis,
        updatedAt: feed.updatedAt ?? _currentMillis,
      );
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

      final _feedFollowerFuture = _feedFollowerRef.set({
        'uid': uid,
        'created_at': _currentMillis,
        'updated_at': _currentMillis,
      });

      final _followedFeedFuture = _followedFeedRef.set({
        'id': feedId,
        'created_at': _currentMillis,
        'updated_at': _currentMillis,
      });

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

      final _feedSaverData = {
        'uid': uid,
        'created_at': _currentMillis,
        'updated_at': _currentMillis,
      };

      final _savedFeedData = {
        'id': feedId,
        'created_at': _currentMillis,
        'updated_at': _currentMillis,
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
      final _savedFeedRef =
          PeamanReferenceHelper.savedFeedsCol(uid: uid).doc(feedId);
      final _feedSaverRef =
          PeamanReferenceHelper.feedSaversCol(feedId: feedId).doc(uid);

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

      final _viewedFeedData = {
        'id': feedId,
        'created_at': _currentMillis,
        'updated_at': _currentMillis,
      };
      final _feedViewerData = {
        'uid': uid,
        'created_at': _currentMillis,
        'updated_at': _currentMillis,
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
      final _currentMillis = DateTime.now().millisecondsSinceEpoch;

      final _momentViewerRef =
          PeamanReferenceHelper.momentViewersCol(momentId: momentId).doc(uid);
      final _momentViewerFuture = _momentViewerRef.set({
        'uid': uid,
        'created_at': _currentMillis,
        'updated_at': _currentMillis,
      });

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
    final Function(PeamanReaction)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _currentMillis = DateTime.now().millisecondsSinceEpoch;

      final _reactionsRef =
          PeamanReferenceHelper.reactionsCol(feedId: reaction.feedId!)
              .doc(reaction.id);
      final _reactedFeedRef =
          PeamanReferenceHelper.reactedFeedsCol(uid: reaction.ownerId!)
              .doc(reaction.feedId);

      final _reaction = reaction.copyWith(
        id: _reactionsRef.id,
        createdAt: reaction.createdAt ?? _currentMillis,
        updatedAt: reaction.updatedAt ?? _currentMillis,
      );

      final _futures = <Future>[];

      _futures.add(_reactionsRef.set(_reaction.toJson()));

      if (_reaction.parent == PeamanReactionParent.feed) {
        final _feedPropertyFuture = _updateFeedPropertiesCount(
          feedId: reaction.feedId!,
          reactionsCount: 1,
        );

        final _reactedFeedFuture = _reactedFeedRef.set({
          'id': _reaction.feedId,
          'created_at': _currentMillis,
          'updated_at': _currentMillis,
        });

        _futures.add(_feedPropertyFuture);
        _futures.add(_reactedFeedFuture);
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
    required final String ownerId,
    required final String feedId,
    required final String parentId,
    required final String reactionId,
    final Function(String)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _reactionsRef =
          PeamanReferenceHelper.reactionsCol(feedId: feedId).doc(reactionId);
      final _reactedFeedRef =
          PeamanReferenceHelper.reactedFeedsCol(uid: ownerId).doc(feedId);

      final _futures = <Future>[];

      final _future = _reactionsRef.update({
        'unreacted': true,
      });
      _futures.add(_future);

      if (feedId == parentId) {
        final _feedPropertiesFuture = _updateFeedPropertiesCount(
          feedId: feedId,
          reactionsCount: -1,
        );
        final _reactedFeedFuture = _reactedFeedRef.delete();

        _futures.add(_feedPropertiesFuture);
        _futures.add(_reactedFeedFuture);
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

      final _comment = comment.copyWith(
        id: _commentRef.id,
        createdAt: comment.createdAt ?? _currentMillis,
        updatedAt: comment.updatedAt ?? _currentMillis,
      );

      final _futures = <Future>[];

      final _future = _commentRef.set(_comment.toJson());
      _futures.add(_future);

      if (_comment.parent == PeamanCommentParent.feed) {
        final _feedPropertiesFuture = _updateFeedPropertiesCount(
          feedId: comment.feedId!,
          commentsCount: 1,
        );
        final _commentedFeedFuture = _commentedFeedRef.set({
          'id': _comment.feedId,
          'created_at': _currentMillis,
          'updated_at': _currentMillis,
        });

        _futures.add(_feedPropertiesFuture);
        _futures.add(_commentedFeedFuture);
        print('Success: Adding comment to feed ${comment.feedId}');
      } else if (_comment.parentId != null) {
        final _commentPropertiesFuture = _updateCommentPropertiesCount(
          feedId: comment.feedId!,
          commentId: _comment.parentId!,
          repliesCount: 1,
        );
        final _feedPropertiesFuture = _updateFeedPropertiesCount(
          feedId: comment.feedId!,
          commentsCount: 1,
        );
        final _repliedFeedFuture = _repliedFeedRef.set({
          'id': _comment.feedId,
          'created_at': _currentMillis,
          'updated_at': _currentMillis,
        });

        _futures.add(_feedPropertiesFuture);
        _futures.add(_commentPropertiesFuture);
        _futures.add(_repliedFeedFuture);
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
    required final String ownerId,
    required final String feedId,
    required final String parentId,
    required final String commentId,
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

      final _futures = <Future>[];

      await _commentRef.delete();

      if (feedId == parentId) {
        final _feedPropertiesFuture = _updateFeedPropertiesCount(
          feedId: feedId,
          commentsCount: -1,
        );
        _futures.add(_feedPropertiesFuture);

        final _commentsSnap = await getCommentsByOwnerId(
          ownerId: ownerId,
          feedId: feedId,
          parent: PeamanCommentParent.feed,
          query: (ref) => ref.limit(1),
        ).first;

        if (_commentsSnap.isEmpty) {
          final _commentedFeedFuture = _commentedFeedRef.delete();
          _futures.add(_commentedFeedFuture);
        }

        print('Success: Removing comment from feed $feedId');
      } else {
        final _commentPropertiesFuture = _updateCommentPropertiesCount(
          feedId: feedId,
          commentId: parentId,
          repliesCount: -1,
        );
        final _feedPropertiesFuture = _updateFeedPropertiesCount(
          feedId: feedId,
          commentsCount: -1,
        );
        _futures.add(_commentPropertiesFuture);
        _futures.add(_feedPropertiesFuture);

        final _repliesSnap = await getCommentsByOwnerId(
          ownerId: ownerId,
          feedId: feedId,
          parent: PeamanCommentParent.comment,
          query: (ref) => ref.limit(1),
        ).first;

        if (_repliesSnap.isEmpty) {
          final _repliedFeedFuture = _repliedFeedRef.delete();
          _futures.add(_repliedFeedFuture);
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
  Future<void> _updateFeedPropertiesCount({
    required final String feedId,
    final int? reactionsCount,
    final int? commentsCount,
    final int? savesCount,
    final int? sharesCount,
    final int? viewsCount,
  }) async {
    try {
      final _feedRef = PeamanReferenceHelper.feedsCol.doc(feedId);
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
      final _feedRef = PeamanReferenceHelper.feedsCol.doc(feedId);
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
      final _userRef = PeamanReferenceHelper.usersCol.doc(uid);

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
