import 'package:cloud_firestore/cloud_firestore.dart';

typedef MyQuery = Query<Map<String, dynamic>>;

// main collections
const usersColName = 'users';
const chatsColName = 'chats';
const feedsColName = 'feeds';
const momentsColName = 'moments';
//

// users subcollections
const followRequestsColName = 'follow_requests';
const userFollowersColName = 'followers';
const userFollowingsColName = 'followings';
const notificationsColName = 'notifications';
const reactedFeedsColName = 'reacted_feeds';
const commentedFeedsColName = 'commented_feeds';
const repliedFeedsColName = 'replied_feeds';
const savedFeedsColName = 'saved_feeds';
const viewedFeedsColName = 'viewed_feeds';
const followedFeedsColName = 'followed_feeds';
const blockedUsersColName = 'blocked_users';
const blockedByUsersColName = 'blocked_by_users';
const devicesColName = 'devices';
//

// feeds subcollections
const reactionsColName = 'reactions';
const commentsColName = 'comments';
const feedFollwersColName = 'followers';
const feedSaversColName = 'feed_savers';
const feedViewersColName = 'feed_viewers';
//

// moments subcollections
const momentViewersColName = 'moment_viewers';
//

// chats subcollections
const messagesColName = 'messages';
//
