import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/utils/firestore_constants.dart';

typedef ColRef = CollectionReference<Map<String, dynamic>>;

class PeamanReferenceHelper {
  static final _ref = FirebaseFirestore.instance;

  // main collections
  static ColRef get usersCol => _ref.collection(usersColName);
  static ColRef get feedsCol => _ref.collection(feedsColName);
  static ColRef get chatsCol => _ref.collection(chatsColName);
  static ColRef get momentsCol => _ref.collection(momentsColName);
  //

  // users subcollections
  static ColRef followRequestsCol({
    required final String uid,
  }) =>
      _ref.collection(usersColName).doc(uid).collection(followRequestsColName);

  static ColRef userFollowersCol({
    required final String uid,
  }) =>
      _ref.collection(usersColName).doc(uid).collection(userFollowersColName);

  static ColRef userFollowingsCol({
    required final String uid,
  }) =>
      _ref.collection(usersColName).doc(uid).collection(userFollowingsColName);

  static ColRef notificationsCol({
    required final String uid,
  }) =>
      _ref.collection(usersColName).doc(uid).collection(notificationsColName);

  static ColRef reactedFeedsCol({
    required final String uid,
  }) =>
      _ref.collection(usersColName).doc(uid).collection(reactedFeedsColName);

  static ColRef commentedFeedsCol({
    required final String uid,
  }) =>
      _ref.collection(usersColName).doc(uid).collection(commentedFeedsColName);

  static ColRef repliedFeedsCol({
    required final String uid,
  }) =>
      _ref.collection(usersColName).doc(uid).collection(repliedFeedsColName);

  static ColRef savedFeedsCol({
    required final String uid,
  }) =>
      _ref.collection(usersColName).doc(uid).collection(savedFeedsColName);

  static ColRef viewedFeedsCol({
    required final String uid,
  }) =>
      _ref.collection(usersColName).doc(uid).collection(viewedFeedsColName);

  static ColRef followedFeedsCol({
    required final String uid,
  }) =>
      _ref.collection(usersColName).doc(uid).collection(followedFeedsColName);

  static ColRef blockedUsersCol({
    required final String uid,
  }) =>
      _ref.collection(usersColName).doc(uid).collection(blockedUsersColName);

  static ColRef blockedByUsersCol({
    required final String uid,
  }) =>
      _ref.collection(usersColName).doc(uid).collection(blockedByUsersColName);

  static ColRef devicesCol({
    required final String uid,
  }) =>
      _ref.collection(usersColName).doc(uid).collection(devicesColName);
  //

  // feed subcollections
  static ColRef reactionsCol({
    required final String feedId,
  }) =>
      _ref.collection(feedsColName).doc(feedId).collection(reactionsColName);

  static ColRef commentsCol({
    required final String feedId,
  }) =>
      _ref.collection(feedsColName).doc(feedId).collection(commentsColName);

  static ColRef feedFollowersCol({
    required final String feedId,
  }) =>
      _ref.collection(feedsColName).doc(feedId).collection(feedFollwersColName);

  static ColRef feedSaversCol({
    required final String feedId,
  }) =>
      _ref.collection(feedsColName).doc(feedId).collection(feedSaversColName);

  static ColRef feedViewersCol({
    required final String feedId,
  }) =>
      _ref.collection(feedsColName).doc(feedId).collection(feedViewersColName);
  //

  // moments subcollections
  static ColRef momentViewersCol({
    required final String momentId,
  }) =>
      _ref
          .collection(momentsColName)
          .doc(momentId)
          .collection(momentViewersColName);
  //

  // chats subcollections
  static ColRef messagesCol({
    required final String chatId,
  }) =>
      _ref.collection(chatsColName).doc(chatId).collection(messagesColName);
  //
}
