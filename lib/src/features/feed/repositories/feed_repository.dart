import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';

import '../../shared/helpers/async_call_helper.dart';
import '../../shared/helpers/reference_helper.dart';
import '../../shared/helpers/common_helper.dart';
import '../../../utils/query_type_def.dart';
import '../../shared/enums/file_type.dart';
import '../../shared/models/peaman_error.dart';
import '../../shared/models/peaman_field.dart';
import '../../user/models/sub_user_model.dart';
import '../../user/repositories/user_repository.dart';
import '../enums/comment_parent_type.dart';
import '../enums/reaction_parent_type.dart';
import '../models/comment_model.dart';
import '../models/feed_model.dart';
import '../models/hashtag_model.dart';
import '../models/reaction_model.dart';
import '../models/sub_feed_model.dart';

abstract class PeamanFeedRepository {
  Future<Either<PeamanFeed, PeamanError>> createFeed({
    required final PeamanFeed feed,
  });

  Future<Either<bool, PeamanError>> updateFeed({
    required final String feedId,
    required final List<PeamanField> fields,
  });

  Future<Either<bool, PeamanError>> deleteFeed({
    required final String feedId,
    required final String ownerId,
  });

  Future<Either<bool, PeamanError>> addFeedToHashtags({
    required final String feedId,
    required final List<String> hashtags,
  });

  Future<Either<bool, PeamanError>> removeFeedFromHashtags({
    required final String feedId,
    required final List<String> hashtags,
  });

  Future<Either<bool, PeamanError>> followFeed({
    required final String feedId,
    required final String uid,
  });

  Future<Either<bool, PeamanError>> unfollowFeed({
    required final String feedId,
    required final String uid,
  });

  Future<Either<bool, PeamanError>> saveFeed({
    required final String feedId,
    required final String uid,
  });

  Future<Either<bool, PeamanError>> unsaveFeed({
    required final String feedId,
    required final String uid,
  });

  Future<Either<bool, PeamanError>> viewFeed({
    required final String feedId,
    required final String uid,
  });

  Future<Either<bool, PeamanError>> unviewFeed({
    required final String feedId,
    required final String uid,
  });

  Future<Either<PeamanReaction, PeamanError>> createReaction({
    required final PeamanReaction reaction,
    final bool updateParentReactionsCount = true,
    final bool updateUserReactionsCount = true,
  });

  Future<Either<bool, PeamanError>> deleteReaction({
    required final String feedId,
    required final String reactionId,
    required final String ownerId,
    required final String parentId,
    required final String parentOwnerId,
    final bool updateParentReactionsCount = true,
    final bool updateUserReactionsCount = true,
  });

  Future<Either<PeamanComment, PeamanError>> createComment({
    required final PeamanComment comment,
  });

  Future<Either<bool, PeamanError>> updateComment({
    required String feedId,
    required final String commentId,
    required final List<PeamanField> fields,
  });

  Future<Either<bool, PeamanError>> deleteComment({
    required final String feedId,
    required final String commentId,
    required final String ownerId,
    required final String parentId,
    required final String parentOwnerId,
  });

  Future<Either<List<PeamanFeed>, PeamanError>> getFeeds({
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanFeed>> getFeedsStream({
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanFeed>, PeamanError>> getUserFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanFeed>> getUserFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserReactedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanSubFeed>> getUserReactedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserCommentedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanSubFeed>> getUserCommentedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserRepliedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanSubFeed>> getUserRepliedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserFollowedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanSubFeed>> getUserFollowedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserSavedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanSubFeed>> getUserSavedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserViewedFeeds({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanSubFeed>> getUserViewedFeedsStream({
    required final String uid,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedReactors({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanSubUser>> getFeedReactorsStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedCommenters({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanSubUser>> getFeedCommentersStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedRepliers({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanSubUser>> getFeedRepliersStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedFollowers({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanSubUser>> getFeedFollowersStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedSavers({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanSubUser>> getFeedSaversStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedViewers({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanSubUser>> getFeedViewersStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanReaction>, PeamanError>> getReactions({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanReaction>> getReactionsStream({
    required final String feedId,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanReaction>, PeamanError>> getReactionsByOwnerId({
    required final String feedId,
    required final String ownerId,
    required final PeamanReactionParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanReaction>> getReactionsByOwnerIdStream({
    required final String feedId,
    required final String ownerId,
    required final PeamanReactionParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanReaction>, PeamanError>> getReactionsByParentId({
    required final String feedId,
    required final String parentId,
    required final PeamanReactionParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanReaction>> getReactionsByParentIdStream({
    required final String feedId,
    required final String parentId,
    required final PeamanReactionParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanComment>, PeamanError>> getComments({
    required final String feedId,
    required PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanComment>> getCommentsStream({
    required final String feedId,
    required PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanComment>, PeamanError>> getCommentsByOwnerId({
    required final String feedId,
    required final String ownerId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanComment>> getCommentsByOwnerIdStream({
    required final String feedId,
    required final String ownerId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<List<PeamanComment>, PeamanError>> getCommentsByParentId({
    required final String feedId,
    required final String parentId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanComment>> getCommentsByParentIdStream({
    required final String feedId,
    required final String parentId,
    required final PeamanCommentParent parent,
    final MyQuery Function(MyQuery)? query,
  });

  Future<Either<PeamanReaction, PeamanError>> getSingleReaction({
    required final String feedId,
    required final String reactionId,
  });

  Stream<PeamanReaction> getSingleReactionStream({
    required final String feedId,
    required final String reactionId,
  });

  Future<Either<PeamanReaction, PeamanError>> getSingleReactionByOwnerId({
    required final String feedId,
    required final String ownerId,
    required final PeamanReactionParent parent,
    required final String parentId,
  });

  Future<Either<PeamanComment, PeamanError>> getSingleComment({
    required final String feedId,
    required final String commentId,
  });

  Stream<PeamanComment> getSingleCommentStream({
    required final String feedId,
    required final String commentId,
  });

  Future<Either<PeamanComment, PeamanError>> getSingleCommentByOwnerId({
    required final String feedId,
    required final String ownerId,
    required final PeamanCommentParent parent,
    required final String parentId,
  });
}

class PeamanFeedRepositoryImpl extends PeamanFeedRepository {
  PeamanFeedRepositoryImpl({
    required final PeamanUserRepository peamanUserRepository,
  }) : _peamanUserRepository = peamanUserRepository;

  final PeamanUserRepository _peamanUserRepository;

  @override
  Future<Either<bool, PeamanError>> addFeedToHashtags({
    required String feedId,
    required List<String> hashtags,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        for (final hashtag in hashtags) {
          final splittedHashtag = hashtag.split(' ');
          if (splittedHashtag.length != 1) {
            throw Exception('Invalid hashtag - $hashtag');
          }
        }

        final futures = <Future>[];

        for (var hashtag in hashtags) {
          hashtag = hashtag.replaceAll('#', '');

          final hashtagRef = PeamanReferenceHelper.hashtagDoc(
            hashtag: hashtag,
          );
          final hashtagModel = PeamanHashtag(
            id: hashtag,
            title: hashtag,
            searchKeys: PeamanCommonHelper.getSearchKeys(text: hashtag),
            createdAt: _millis,
          );

          final future = hashtagRef.set({
            ...hashtagModel.toJson(),
            'feeds': FieldValue.increment(1),
          }, SetOptions(merge: true)).then((value) {
            final hashtagFeedRef = PeamanReferenceHelper.hashtagFeedsCol(
              hashtag: hashtag,
            ).doc(feedId);

            final hashtagFeed = PeamanSubFeed(
              id: feedId,
              createdAt: _millis,
            );

            return hashtagFeedRef.set(hashtagFeed.toJson());
          });

          futures.add(future);
        }

        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<PeamanComment, PeamanError>> createComment({
    required PeamanComment comment,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        if (comment.feedId == null) throw Exception("feedId can't be null");
        if (comment.ownerId == null) throw Exception("ownerId can't be null");
        if (comment.parentId == null) throw Exception("parentId can't be null");
        if (comment.parentOwnerId == null)
          throw Exception("parentOwner can't be null");

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
          createdAt: comment.createdAt ?? _millis,
          updatedAt: comment.updatedAt,
        );
        final _commentedFeed = PeamanSubFeed(
          id: _comment.feedId,
          createdAt: _millis,
        );
        final _repliedFeed = PeamanSubFeed(
          id: _comment.feedId,
          createdAt: _millis,
        );
        final _feedCommenter = PeamanSubUser(
          uid: _comment.ownerId,
          createdAt: _millis,
        );
        final _feedReplier = PeamanSubUser(
          uid: _comment.ownerId,
          createdAt: _millis,
        );

        final _futures = <Future>[];

        final _future = _commentRef.set(_comment.toJson());
        _futures.add(_future);

        if (_comment.parent == PeamanCommentParent.feed) {
          final _feedPropertiesFuture = _updateFeedPropertiesCount(
            feedId: _comment.feedId!,
            commentsCount: 1,
          );

          final _userPropertyFuture = _updateUserPropertiesCount(
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
          final _commentPropertiesFuture = _updateCommentPropertiesCount(
            feedId: _comment.feedId!,
            commentId: _comment.parentId!,
            repliesCount: 1,
          );

          final _feedPropertiesFuture = _updateFeedPropertiesCount(
            feedId: _comment.feedId!,
            repliesCount: 1,
          );

          final _userPropertyFuture = _updateUserPropertiesCount(
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
        return Left(_comment);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<PeamanFeed, PeamanError>> createFeed({
    required PeamanFeed feed,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final _feedRef = PeamanReferenceHelper.feedsCol.doc(feed.id);
        final _myFeedRef = PeamanReferenceHelper.myFeedsCol(
          uid: feed.ownerId!,
        ).doc(_feedRef.id);

        final hashtags = PeamanCommonHelper.getHashtagsFromText(
          text: feed.caption ?? '',
        );

        final _feed = feed.copyWith(
          id: _feedRef.id,
          createdAt: feed.createdAt ?? _millis,
          updatedAt: feed.updatedAt,
          searchKeys: [...hashtags, ...feed.searchKeys],
        );
        final _myFeed = PeamanSubFeed(
          id: _feedRef.id,
          createdAt: _millis,
        );

        final _futures = <Future>[];

        final _createFeedFuture = _feedRef.set(_feed.toJson());
        _futures.add(_createFeedFuture);

        final _myFeedFuture = _myFeedRef.set(_myFeed.toJson());
        _futures.add(_myFeedFuture);

        final _hashTagFuture = addFeedToHashtags(
          feedId: _feed.id!,
          hashtags: hashtags,
        );
        _futures.add(_hashTagFuture);

        final _updatePhotosFuture = _updateUserPropertiesCount(
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
        return Left(_feed);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<PeamanReaction, PeamanError>> createReaction({
    required PeamanReaction reaction,
    bool updateParentReactionsCount = true,
    bool updateUserReactionsCount = true,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        if (reaction.feedId == null) throw Exception("feedId can't be null");
        if (reaction.ownerId == null) throw Exception("feedId can't be null");
        if (reaction.parentId == null)
          throw Exception("parentId can't be null");
        if (reaction.parentOwnerId == null)
          throw Exception("parentOwnerId can't be null");

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
          createdAt: reaction.createdAt ?? _millis,
          updatedAt: reaction.updatedAt,
        );
        final _reactedFeed = PeamanSubFeed(
          id: reaction.feedId,
          createdAt: _millis,
        );
        final _feedReactor = PeamanSubUser(
          uid: reaction.ownerId,
          createdAt: _millis,
        );

        final _futures = <Future>[];

        _futures.add(_reactionsRef.set(_reaction.toJson()));

        if (_reaction.parent == PeamanReactionParent.feed) {
          if (updateParentReactionsCount) {
            final _feedPropertyFuture = _updateFeedPropertiesCount(
              feedId: _reaction.feedId!,
              reactionsCount: 1,
            );
            _futures.add(_feedPropertyFuture);
          }

          if (updateUserReactionsCount) {
            final _userPropertyFuture = _updateUserPropertiesCount(
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
            final _commentPropertyFuture = _updateCommentPropertiesCount(
              feedId: _reaction.feedId!,
              commentId: _reaction.parentId!,
              reactionsCount: 1,
            );
            _futures.add(_commentPropertyFuture);
          }

          if (updateUserReactionsCount) {
            final _userPropertyFuture = _updateUserPropertiesCount(
              uid: _reaction.parentOwnerId!,
              reactionsReceivedFromFeeds: 1,
            );
            _futures.add(_userPropertyFuture);
          }
          print('Success: Adding reaction to comment ${_reaction.parentId}');
        }

        await Future.wait(_futures);
        return Left(_reaction);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> deleteComment({
    required final String feedId,
    required final String commentId,
    required final String ownerId,
    required final String parentId,
    required final String parentOwnerId,
  }) {
    return runAsyncCall(
      future: () async {
        final _commentRef =
            PeamanReferenceHelper.commentsCol(feedId: feedId).doc(commentId);
        final _commentedFeedRef =
            PeamanReferenceHelper.commentedFeedsCol(uid: ownerId).doc(feedId);
        final _repliedFeedRef =
            PeamanReferenceHelper.repliedFeedsCol(uid: ownerId).doc(feedId);
        final _feedCommenterRef =
            PeamanReferenceHelper.feedCommentersCol(feedId: feedId)
                .doc(ownerId);
        final _feedReplierRef =
            PeamanReferenceHelper.feedRepliersCol(feedId: feedId).doc(ownerId);

        final _futures = <Future>[];

        await _commentRef.delete();

        if (feedId == parentId) {
          final _feedPropertiesFuture = _updateFeedPropertiesCount(
            feedId: feedId,
            commentsCount: -1,
          );

          final _userPropertyFuture = _updateUserPropertiesCount(
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
          );

          if (_commentsSnap.isLeft && _commentsSnap.left.isEmpty) {
            final _commentedFeedFuture = _commentedFeedRef.delete();
            final _feedCommenterFuture = _feedCommenterRef.delete();
            _futures.add(_commentedFeedFuture);
            _futures.add(_feedCommenterFuture);
          }
        } else {
          final _commentPropertiesFuture = _updateCommentPropertiesCount(
            feedId: feedId,
            commentId: parentId,
            repliesCount: -1,
          );

          final _feedPropertiesFuture = _updateFeedPropertiesCount(
            feedId: feedId,
            repliesCount: -1,
          );

          final _userPropertyFuture = _updateUserPropertiesCount(
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
          );

          if (_repliesSnap.isLeft && _repliesSnap.left.isEmpty) {
            final _repliedFeedFuture = _repliedFeedRef.delete();
            final _feedReplierFuture = _feedReplierRef.delete();
            _futures.add(_repliedFeedFuture);
            _futures.add(_feedReplierFuture);
          }
        }

        await Future.wait(_futures);
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> deleteFeed({
    required final String feedId,
    required final String ownerId,
  }) {
    return runAsyncCall(
      future: () async {
        final _feedRef = PeamanReferenceHelper.feedsCol.doc(feedId);
        final _myFeedRef = PeamanReferenceHelper.myFeedsCol(
          uid: ownerId,
        ).doc(_feedRef.id);

        final _feedFuture = _feedRef.delete().catchError((e) {
          log(e);
          log("Error!!!: Deleting feed");
        });
        final _myFeedFuture = _myFeedRef.delete().catchError((e) {
          log(e);
          log("Error!!!: Deleting my feed");
        });
        final _userUpdateFuture = _updateUserPropertiesCount(
          uid: ownerId,
          feeds: -1,
        ).catchError((e) {
          log(e);
          log("Error!!!: Decreasing feeds count");
        });

        await Future.wait([
          _feedFuture,
          _myFeedFuture,
          _userUpdateFuture,
        ]);
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> deleteReaction({
    required String feedId,
    required String reactionId,
    required String ownerId,
    required String parentId,
    required String parentOwnerId,
    bool updateParentReactionsCount = true,
    bool updateUserReactionsCount = true,
  }) {
    return runAsyncCall(
      future: () async {
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
            final _feedPropertiesFuture = _updateFeedPropertiesCount(
              feedId: feedId,
              reactionsCount: -1,
            );
            _futures.add(_feedPropertiesFuture);
          }

          if (updateUserReactionsCount) {
            final _userPropertyFuture = _updateUserPropertiesCount(
              uid: parentOwnerId,
              reactionsReceivedFromFeeds: -1,
            );
            _futures.add(_userPropertyFuture);
          }

          final _reactedFeedFuture = _reactedFeedRef.delete();
          final _feedReactorFuture = _feedReactorRef.delete();

          _futures.add(_reactedFeedFuture);
          _futures.add(_feedReactorFuture);
        } else {
          if (updateParentReactionsCount) {
            final _commentPropertyFuture = _updateCommentPropertiesCount(
              feedId: feedId,
              commentId: parentId,
              reactionsCount: -1,
            );
            _futures.add(_commentPropertyFuture);
          }

          if (updateUserReactionsCount) {
            final _userPropertyFuture = _updateUserPropertiesCount(
              uid: parentOwnerId,
              reactionsReceivedFromFeeds: -1,
            );
            _futures.add(_userPropertyFuture);
          }
        }

        await Future.wait(_futures);
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> followFeed({
    required String feedId,
    required String uid,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final _feedFollowerRef =
            PeamanReferenceHelper.feedFollowersCol(feedId: feedId).doc(uid);
        final _followedFeedRef =
            PeamanReferenceHelper.followedFeedsCol(uid: uid).doc(feedId);

        final _feedFollower = PeamanSubUser(
          uid: uid,
          createdAt: _millis,
        );
        final _followedFeed = PeamanSubFeed(
          id: feedId,
          createdAt: _millis,
        );

        final _feedFollowerFuture =
            _feedFollowerRef.set(_feedFollower.toJson());
        final _followedFeedFuture =
            _followedFeedRef.set(_followedFeed.toJson());

        await Future.wait([
          _feedFollowerFuture,
          _followedFeedFuture,
        ]);
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<List<PeamanComment>, PeamanError>> getComments({
    required String feedId,
    required PeamanCommentParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.commentsCol(feedId: feedId)
            .where('visibility', isEqualTo: true)
            .where('parent', isEqualTo: ksPeamanCommentParent[parent])
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_commentsFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<List<PeamanComment>, PeamanError>> getCommentsByOwnerId({
    required String feedId,
    required String ownerId,
    required PeamanCommentParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.commentsCol(feedId: feedId)
            .where('visibility', isEqualTo: true)
            .where('owner_id', isEqualTo: ownerId)
            .where('parent', isEqualTo: ksPeamanCommentParent[parent])
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_commentsFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanComment>> getCommentsByOwnerIdStream({
    required String feedId,
    required String ownerId,
    required PeamanCommentParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.commentsCol(feedId: feedId)
        .where('visibility', isEqualTo: true)
        .where('owner_id', isEqualTo: ownerId)
        .where('parent', isEqualTo: ksPeamanCommentParent[parent])
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_commentsFromFirestore);
  }

  @override
  Future<Either<List<PeamanComment>, PeamanError>> getCommentsByParentId({
    required String feedId,
    required String parentId,
    required PeamanCommentParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.commentsCol(feedId: feedId)
            .where('visibility', isEqualTo: true)
            .where('parent', isEqualTo: ksPeamanCommentParent[parent])
            .where('parent_id', isEqualTo: parentId)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_commentsFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanComment>> getCommentsByParentIdStream({
    required String feedId,
    required String parentId,
    required PeamanCommentParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.commentsCol(feedId: feedId)
        .where('visibility', isEqualTo: true)
        .where('parent', isEqualTo: ksPeamanCommentParent[parent])
        .where('parent_id', isEqualTo: parentId)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_commentsFromFirestore);
  }

  @override
  Stream<List<PeamanComment>> getCommentsStream({
    required String feedId,
    required PeamanCommentParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.commentsCol(feedId: feedId)
        .where('visibility', isEqualTo: true)
        .where('parent', isEqualTo: ksPeamanCommentParent[parent])
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_commentsFromFirestore);
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedCommenters({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.feedCommentersCol(feedId: feedId)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_subUsersFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanSubUser>> getFeedCommentersStream({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.feedCommentersCol(feedId: feedId)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_subUsersFromFirestore);
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedFollowers({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.feedFollowersCol(feedId: feedId)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_subUsersFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanSubUser>> getFeedFollowersStream({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.feedFollowersCol(feedId: feedId)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_subUsersFromFirestore);
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedReactors({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.feedReactorsCol(feedId: feedId)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_subUsersFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanSubUser>> getFeedReactorsStream({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.feedReactorsCol(feedId: feedId)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_subUsersFromFirestore);
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedRepliers({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.feedRepliersCol(feedId: feedId)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_subUsersFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanSubUser>> getFeedRepliersStream({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.feedRepliersCol(feedId: feedId)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_subUsersFromFirestore);
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedSavers({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.feedSaversCol(feedId: feedId)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_subUsersFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanSubUser>> getFeedSaversStream({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.feedSaversCol(feedId: feedId)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_subUsersFromFirestore);
  }

  @override
  Future<Either<List<PeamanSubUser>, PeamanError>> getFeedViewers({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.feedViewersCol(feedId: feedId)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_subUsersFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanSubUser>> getFeedViewersStream({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.feedViewersCol(feedId: feedId)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_subUsersFromFirestore);
  }

  @override
  Future<Either<List<PeamanFeed>, PeamanError>> getFeeds({
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.feedsCol
            .where('visibility', isEqualTo: true)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_feedsFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanFeed>> getFeedsStream({
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.feedsCol
        .where('visibility', isEqualTo: true)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_feedsFromFirestore);
  }

  @override
  Future<Either<List<PeamanReaction>, PeamanError>> getReactions({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.reactionsCol(feedId: feedId)
            .where('visibility', isEqualTo: true)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_reactionsFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<List<PeamanReaction>, PeamanError>> getReactionsByOwnerId({
    required String feedId,
    required String ownerId,
    required PeamanReactionParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.reactionsCol(feedId: feedId)
            .where('visibility', isEqualTo: true)
            .where('owner_id', isEqualTo: ownerId)
            .where('parent', isEqualTo: ksPeamanReactionParent[parent])
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_reactionsFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanReaction>> getReactionsByOwnerIdStream({
    required String feedId,
    required String ownerId,
    required PeamanReactionParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.reactionsCol(feedId: feedId)
        .where('visibility', isEqualTo: true)
        .where('owner_id', isEqualTo: ownerId)
        .where('parent', isEqualTo: ksPeamanReactionParent[parent])
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_reactionsFromFirestore);
  }

  @override
  Future<Either<List<PeamanReaction>, PeamanError>> getReactionsByParentId({
    required String feedId,
    required String parentId,
    required PeamanReactionParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.reactionsCol(feedId: feedId)
            .where('visibility', isEqualTo: true)
            .where('parent', isEqualTo: ksPeamanReactionParent[parent])
            .where('parent_id', isEqualTo: parentId)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_reactionsFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanReaction>> getReactionsByParentIdStream({
    required String feedId,
    required String parentId,
    required PeamanReactionParent parent,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.reactionsCol(feedId: feedId)
        .where('visibility', isEqualTo: true)
        .where('parent', isEqualTo: ksPeamanReactionParent[parent])
        .where('parent_id', isEqualTo: parentId)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_reactionsFromFirestore);
  }

  @override
  Stream<List<PeamanReaction>> getReactionsStream({
    required String feedId,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.reactionsCol(feedId: feedId)
        .where('visibility', isEqualTo: true)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_reactionsFromFirestore);
  }

  @override
  Future<Either<PeamanComment, PeamanError>> getSingleComment({
    required String feedId,
    required String commentId,
  }) {
    return runAsyncCall(
      future: () async {
        final _commentRef = PeamanReferenceHelper.commentsCol(
          feedId: feedId,
        ).doc(commentId);

        final _commentSnap = await _commentRef.get();
        if (!_commentSnap.exists) throw Exception('Comment not found!');

        final _commentData = _commentSnap.data();
        if (_commentData == null) throw Exception('Comment not found!');

        final _comment = PeamanComment.fromJson(_commentData);
        return Left(_comment);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<PeamanComment> getSingleCommentStream({
    required String feedId,
    required String commentId,
  }) {
    return PeamanReferenceHelper.commentsCol(
      feedId: feedId,
    ).doc(commentId).snapshots().map(_commentFromFirestore);
  }

  @override
  Future<Either<PeamanComment, PeamanError>> getSingleCommentByOwnerId({
    required String feedId,
    required String ownerId,
    required PeamanCommentParent parent,
    required String parentId,
  }) {
    return runAsyncCall(
      future: () async {
        final _commentsEither = await getCommentsByOwnerId(
          feedId: feedId,
          ownerId: ownerId,
          parent: parent,
          query: (ref) => ref.where('parent_id', isEqualTo: parentId).limit(1),
        );
        if (_commentsEither.isRight) throw _commentsEither.right;

        final _comments = _commentsEither.left;
        if (_comments.isEmpty) throw Exception('Reaction not found!');

        return Left(_comments.first);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<PeamanReaction, PeamanError>> getSingleReaction({
    required String feedId,
    required String reactionId,
  }) {
    return runAsyncCall(
      future: () async {
        final _reactionRef = PeamanReferenceHelper.reactionsCol(
          feedId: feedId,
        ).doc(reactionId);

        final _reactionSnap = await _reactionRef.get();
        if (!_reactionSnap.exists) throw Exception('Reaction not found!');

        final _reactionData = _reactionSnap.data();
        if (_reactionData == null) throw Exception('Reaction not found!');

        final _reaction = PeamanReaction.fromJson(_reactionData);
        return Left(_reaction);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<PeamanReaction, PeamanError>> getSingleReactionByOwnerId({
    required String feedId,
    required String ownerId,
    required PeamanReactionParent parent,
    required String parentId,
  }) {
    return runAsyncCall(
      future: () async {
        final _reactionsEither = await getReactionsByOwnerId(
          feedId: feedId,
          ownerId: ownerId,
          parent: parent,
          query: (ref) => ref.where('parent_id', isEqualTo: parentId).limit(1),
        );
        if (_reactionsEither.isRight) throw _reactionsEither.right;

        final _reactions = _reactionsEither.left;
        if (_reactions.isEmpty) throw Exception('Reaction not found!');

        return Left(_reactions.first);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<PeamanReaction> getSingleReactionStream({
    required String feedId,
    required String reactionId,
  }) {
    return PeamanReferenceHelper.reactionsCol(
      feedId: feedId,
    ).doc(reactionId).snapshots().map(_reactionFromFirestore);
  }

  @override
  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserCommentedFeeds({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.commentedFeedsCol(uid: uid)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_subFeedsFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanSubFeed>> getUserCommentedFeedsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.commentedFeedsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_subFeedsFromFirestore);
  }

  @override
  Future<Either<List<PeamanFeed>, PeamanError>> getUserFeeds({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return getFeeds(
      query: (ref) => ref.where('owner_id', isEqualTo: uid),
    );
  }

  @override
  Stream<List<PeamanFeed>> getUserFeedsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return getFeedsStream(
      query: (ref) => ref.where('owner_id', isEqualTo: uid),
    );
  }

  @override
  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserFollowedFeeds({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.followedFeedsCol(uid: uid)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_subFeedsFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanSubFeed>> getUserFollowedFeedsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.followedFeedsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_subFeedsFromFirestore);
  }

  @override
  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserReactedFeeds({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.reactedFeedsCol(uid: uid)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_subFeedsFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanSubFeed>> getUserReactedFeedsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.reactedFeedsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_subFeedsFromFirestore);
  }

  @override
  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserRepliedFeeds({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.repliedFeedsCol(uid: uid)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_subFeedsFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanSubFeed>> getUserRepliedFeedsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.repliedFeedsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_subFeedsFromFirestore);
  }

  @override
  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserSavedFeeds({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.savedFeedsCol(uid: uid)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_subFeedsFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanSubFeed>> getUserSavedFeedsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.savedFeedsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_subFeedsFromFirestore);
  }

  @override
  Future<Either<List<PeamanSubFeed>, PeamanError>> getUserViewedFeeds({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final _ref = PeamanReferenceHelper.viewedFeedsCol(uid: uid)
            .orderBy('created_at', descending: true);
        final _query = query?.call(_ref) ?? _ref;
        final _result = await _query.get().then(_subFeedsFromFirestore);
        return Left(_result);
      },
      onError: Right.new,
    );
  }

  @override
  Stream<List<PeamanSubFeed>> getUserViewedFeedsStream({
    required String uid,
    MyQuery Function(MyQuery p1)? query,
  }) {
    final _ref = PeamanReferenceHelper.viewedFeedsCol(uid: uid)
        .orderBy('created_at', descending: true);
    final _query = query?.call(_ref) ?? _ref;
    return _query.snapshots().map(_subFeedsFromFirestore);
  }

  @override
  Future<Either<bool, PeamanError>> removeFeedFromHashtags({
    required String feedId,
    required List<String> hashtags,
  }) {
    return runAsyncCall(
      future: () async {
        for (final hashtag in hashtags) {
          final splittedHashtag = hashtag.split(' ');
          if (splittedHashtag.length <= 1) {
            throw Exception('Invalid hashtag - $hashtag');
          }
        }

        final futures = <Future>[];

        for (var hashtag in hashtags) {
          hashtag = hashtag.replaceAll('#', '');

          final hashtagFeedRef = PeamanReferenceHelper.hashtagFeedsCol(
            hashtag: hashtag,
          ).doc(feedId);

          final future = hashtagFeedRef.delete().catchError((e) {
            log(e);
            log('Error!!!: Deleting feed - $feedId from hashtag - $hashtag');
          });

          futures.add(future);
        }

        await Future.wait(futures);
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> saveFeed({
    required String feedId,
    required String uid,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final _feedSaverRef =
            PeamanReferenceHelper.feedSaversCol(feedId: feedId).doc(uid);
        final _savedFeedRef =
            PeamanReferenceHelper.savedFeedsCol(uid: uid).doc(feedId);

        final _feedSaver = PeamanSubUser(
          uid: uid,
          createdAt: _millis,
        );
        final _savedFeed = PeamanSubFeed(
          id: feedId,
          createdAt: _millis,
        );

        final _futures = <Future>[
          _feedSaverRef.set(_feedSaver.toJson()),
          _savedFeedRef.set(_savedFeed.toJson()),
          _updateFeedPropertiesCount(
            feedId: feedId,
            savesCount: 1,
          ),
        ];

        await Future.wait(_futures);
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> unfollowFeed({
    required String feedId,
    required String uid,
  }) {
    return runAsyncCall(
      future: () async {
        final _feedFollowerRef =
            PeamanReferenceHelper.feedFollowersCol(feedId: feedId).doc(uid);
        final _followedFeedRef =
            PeamanReferenceHelper.followedFeedsCol(uid: uid).doc(feedId);

        await Future.wait([
          _feedFollowerRef.delete(),
          _followedFeedRef.delete(),
        ]);
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> unsaveFeed({
    required String feedId,
    required String uid,
  }) {
    return runAsyncCall(
      future: () async {
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
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> unviewFeed({
    required String feedId,
    required String uid,
  }) {
    return runAsyncCall(
      future: () async {
        final _savedFeedRef =
            PeamanReferenceHelper.viewedFeedsCol(uid: uid).doc(feedId);
        final _feedSaverRef =
            PeamanReferenceHelper.feedViewersCol(feedId: feedId).doc(uid);

        final _futures = <Future>[
          _feedSaverRef.delete(),
          _savedFeedRef.delete(),
          _updateFeedPropertiesCount(
            feedId: feedId,
            viewsCount: -1,
          ),
        ];

        await Future.wait(_futures);
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> updateComment({
    required String feedId,
    required String commentId,
    required List<PeamanField> fields,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final _commentRef = PeamanReferenceHelper.commentsCol(
          feedId: feedId,
        ).doc(commentId);
        final _data = PeamanCommonHelper.prepareDataToUpdate(fields: fields);
        if (_data.isNotEmpty) {
          await _commentRef.update({
            ..._data,
            'updated_at': _millis,
          });
        }
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> updateFeed({
    required String feedId,
    required List<PeamanField> fields,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final _feedRef = PeamanReferenceHelper.feedDoc(feedId: feedId);
        final _data = PeamanCommonHelper.prepareDataToUpdate(fields: fields);
        if (_data.isNotEmpty) {
          await _feedRef.update({
            ..._data,
            'updated_at': _millis,
          });
        }
        return Left(true);
      },
      onError: Right.new,
    );
  }

  @override
  Future<Either<bool, PeamanError>> viewFeed({
    required String feedId,
    required String uid,
  }) {
    return runAsyncCall(
      future: () async {
        return Left(true);
      },
      onError: Right.new,
    );
  }

  Future<Either<bool, PeamanError>> _updateFeedPropertiesCount({
    required final String feedId,
    final int reactionsCount = 0,
    final int commentsCount = 0,
    final int repliesCount = 0,
    final int savesCount = 0,
    final int sharesCount = 0,
    final int viewsCount = 0,
  }) {
    return updateFeed(
      feedId: feedId,
      fields: [
        PeamanField.positivePartial(
          key: 'reactions_count',
          value: reactionsCount,
        ),
        PeamanField.positivePartial(
          key: 'comments_count',
          value: commentsCount,
        ),
        PeamanField.positivePartial(
          key: 'replies_count',
          value: repliesCount,
        ),
        PeamanField.positivePartial(
          key: 'saves_count',
          value: savesCount,
        ),
        PeamanField.positivePartial(
          key: 'shares_count',
          value: sharesCount,
        ),
        PeamanField.positivePartial(
          key: 'views_count',
          value: viewsCount,
        ),
      ],
    );
  }

  Future<Either<bool, PeamanError>> _updateCommentPropertiesCount({
    required final String feedId,
    required final String commentId,
    final int reactionsCount = 0,
    final int repliesCount = 0,
  }) {
    return updateComment(
      feedId: feedId,
      commentId: commentId,
      fields: [
        PeamanField.positivePartial(
          key: 'reactions_count',
          value: reactionsCount,
        ),
        PeamanField.positivePartial(
          key: 'replies_count',
          value: repliesCount,
        ),
      ],
    );
  }

  Future<Either<bool, PeamanError>> _updateUserPropertiesCount({
    required final String uid,
    final int onboardingStep = 0,
    final int feeds = 0,
    final int photos = 0,
    final int videos = 0,
    final int followers = 0,
    final int following = 0,
    final int reactionsReceivedFromFeeds = 0,
    final int commentsReceivedFromFeeds = 0,
    final int repliesReceivedFromFeeds = 0,
    final int sharesReceivedFromFeeds = 0,
    final int viewsReceivedFromFeeds = 0,
  }) {
    return _peamanUserRepository.updateUser(
      uid: uid,
      fields: [
        PeamanField.positivePartial(
          key: 'onboarding_step',
          value: onboardingStep,
        ),
        PeamanField.positivePartial(
          key: 'feeds_count',
          value: feeds,
        ),
        PeamanField.positivePartial(
          key: 'photos_count',
          value: photos,
        ),
        PeamanField.positivePartial(
          key: 'videos_count',
          value: videos,
        ),
        PeamanField.positivePartial(
          key: 'followers_count',
          value: followers,
        ),
        PeamanField.positivePartial(
          key: 'following_count',
          value: following,
        ),
        PeamanField.positivePartial(
          key: 'reactions_received_from_feeds_count',
          value: reactionsReceivedFromFeeds,
        ),
        PeamanField.positivePartial(
          key: 'comments_received_from_feeds_count',
          value: commentsReceivedFromFeeds,
        ),
        PeamanField.positivePartial(
          key: 'replies_received_from_feeds_count',
          value: repliesReceivedFromFeeds,
        ),
        PeamanField.positivePartial(
          key: 'shares_received_from_feeds_count',
          value: sharesReceivedFromFeeds,
        ),
        PeamanField.positivePartial(
          key: 'views_received_from_feeds_count',
          value: viewsReceivedFromFeeds,
        ),
      ],
    );
  }

  PeamanReaction _reactionFromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
  ) {
    return PeamanReaction.fromJson(snap.data() ?? {});
  }

  PeamanComment _commentFromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
  ) {
    return PeamanComment.fromJson(snap.data() ?? {});
  }

  List<PeamanComment> _commentsFromFirestore(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanComment.fromJson(e.data())).toList();
  }

  List<PeamanReaction> _reactionsFromFirestore(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanReaction.fromJson(e.data())).toList();
  }

  List<PeamanSubUser> _subUsersFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanSubUser.fromJson(e.data())).toList();
  }

  List<PeamanSubFeed> _subFeedsFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanSubFeed.fromJson(e.data())).toList();
  }

  List<PeamanFeed> _feedsFromFirestore(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanFeed.fromJson(e.data())).toList();
  }
}
