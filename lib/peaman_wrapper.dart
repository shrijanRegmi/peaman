import 'package:flutter/material.dart';
import 'package:peaman/peaman.dart';
import 'package:provider/single_child_widget.dart';

class PeamanWrapper extends StatelessWidget {
  final Widget Function(BuildContext) builder;
  final List<SingleChildWidget> providers;
  final PeamanLazyLoadConfig? lazyLoadConfig;
  const PeamanWrapper({
    Key? key,
    required this.builder,
    this.providers = const [],
    this.lazyLoadConfig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PStateProvider.stream<PeamanUser?>(
      create: (context) => PAuthProvider.user,
      initialData: null,
      builder: (context, child) {
        final _appUser = context.pwatch<PeamanUser?>();

        final uid = _appUser?.uid;
        return PStateProvider.multi(
          providers: [
            if (uid != null) ..._getFirebaseProviders(uid: uid),
            ...providers,
          ],
          builder: (context, child) {
            return builder(context);
          },
        );
      },
    );
  }

  List<SingleChildWidget> _getFirebaseProviders({
    required final String uid,
  }) {
    final _lazyLoadConfig = lazyLoadConfig ?? PeamanLazyLoadConfig();

    return <SingleChildWidget>[
      PStateProvider.stream<PeamanUser>(
        create: (context) => PUserProvider.getUserById(
          uid: uid,
        ),
        lazy: _lazyLoadConfig.lazyLoadUser,
        initialData: PeamanUser(),
      ),
      PStateProvider.stream<List<PeamanChat>?>(
        create: (context) => PChatProvider.getUserChats(
          uid: uid,
        ),
        lazy: _lazyLoadConfig.lazyLoadUserChats,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanFollower>?>(
        create: (_) => PUserProvider.getUserFollowers(
          uid: uid,
        ),
        lazy: _lazyLoadConfig.lazyLoadUserFollowers,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanFollowing>?>(
        create: (_) => PUserProvider.getUserFollowings(
          uid: uid,
        ),
        lazy: _lazyLoadConfig.lazyLoadUserFollowings,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanReceivedFollowRequest>?>(
        create: (_) => PUserProvider.getUserReceivedFollowRequests(
          uid: uid,
        ),
        lazy: _lazyLoadConfig.lazyLoadUserReceivedFollowRequests,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanSentFollowRequest>?>(
        create: (_) => PUserProvider.getUserSentFollowRequests(
          uid: uid,
        ),
        lazy: _lazyLoadConfig.lazyLoadUserSentFollowRequests,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanBlockedUser>?>(
        create: (_) => PUserProvider.getUserBlockedUsers(
          uid: uid,
        ),
        lazy: _lazyLoadConfig.lazyLoadUserBlockedUsers,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanBlockedByUser>?>(
        create: (_) => PUserProvider.getUserBlockedByUsers(
          uid: uid,
        ),
        lazy: _lazyLoadConfig.lazyLoadUserBlockedByUsers,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanNotification>?>(
        create: (_) => PNotificationProvider.getUserNotifications(
          uid: uid,
        ),
        lazy: _lazyLoadConfig.lazyLoadUserNotifications,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanFeed>?>(
        create: (_) => PFeedProvider.getFeeds(),
        lazy: _lazyLoadConfig.lazyLoadFeeds,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanMyFeed>?>(
        create: (_) => PFeedProvider.getUserMyFeeds(
          uid: uid,
        ),
        lazy: _lazyLoadConfig.lazyLoadUserMyFeeds,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanReactedFeed>?>(
        create: (_) => PFeedProvider.getUserReactedFeeds(
          uid: uid,
        ),
        lazy: _lazyLoadConfig.lazyLoadUserReactedFeeds,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanCommentedFeed>?>(
        create: (_) => PFeedProvider.getUserCommentedFeeds(
          uid: uid,
        ),
        lazy: _lazyLoadConfig.lazyLoadUserCommentedFeeds,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanRepliedFeed>?>(
        create: (_) => PFeedProvider.getUserRepliedFeeds(
          uid: uid,
        ),
        lazy: _lazyLoadConfig.lazyLoadUserRepliedFeeds,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanSavedFeed>?>(
        create: (_) => PFeedProvider.getUserSavedFeeds(
          uid: uid,
        ),
        lazy: _lazyLoadConfig.lazyLoadUserSavedFeeds,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanViewedFeed>?>(
        create: (_) => PFeedProvider.getUserViewedFeeds(
          uid: uid,
        ),
        lazy: _lazyLoadConfig.lazyLoadUserViewedFeeds,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanFollowedFeed>?>(
        create: (_) => PFeedProvider.getUserFollowedFeeds(
          uid: uid,
        ),
        lazy: _lazyLoadConfig.lazyLoadUserFollowedFeeds,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanMoment>?>(
        create: (_) => PFeedProvider.getMoments(),
        lazy: _lazyLoadConfig.lazyLoadMoments,
        initialData: null,
      ),
    ];
  }
}
