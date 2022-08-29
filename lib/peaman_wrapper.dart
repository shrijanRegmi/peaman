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
    final _lazyLoadConfig = lazyLoadConfig ?? PeamanLazyLoadConfig();
    return PStateProvider.valueStream<PeamanUser?>(
      value: PAuthProvider.user,
      initialData: null,
      builder: (context, child) {
        final _appUser = context.pwatch<PeamanUser?>();

        if (_appUser == null) {
          return builder(context);
        }

        final _uid = _appUser.uid!;
        return PStateProvider.multi(
          providers: [
            PStateProvider.stream<PeamanUser>(
              create: (context) => PUserProvider.getUserById(
                uid: _uid,
              ),
              lazy: _lazyLoadConfig.lazyLoadUser,
              initialData: PeamanUser(),
            ),
            PStateProvider.stream<List<PeamanChat>?>(
              create: (context) => PChatProvider.getUserChats(
                uid: _uid,
              ),
              lazy: _lazyLoadConfig.lazyLoadUserChats,
              initialData: null,
            ),
            PStateProvider.stream<List<PeamanFollower>?>(
              create: (_) => PUserProvider.getUserFollowers(
                uid: _uid,
              ),
              lazy: _lazyLoadConfig.lazyLoadUserFollowers,
              initialData: null,
            ),
            PStateProvider.stream<List<PeamanFollowing>?>(
              create: (_) => PUserProvider.getUserFollowings(
                uid: _uid,
              ),
              lazy: _lazyLoadConfig.lazyLoadUserFollowings,
              initialData: null,
            ),
            PStateProvider.stream<List<PeamanBlockedUser>?>(
              create: (_) => PUserProvider.getUserBlockedUsers(
                uid: _uid,
              ),
              lazy: _lazyLoadConfig.lazyLoadUserBlockedUsers,
              initialData: null,
            ),
            PStateProvider.stream<List<PeamanBlockedByUser>?>(
              create: (_) => PUserProvider.getUserBlockedByUsers(
                uid: _uid,
              ),
              lazy: _lazyLoadConfig.lazyLoadUserBlockedByUsers,
              initialData: null,
            ),
            PStateProvider.stream<List<PeamanSavedFeed>?>(
              create: (_) => PFeedProvider.getUserSavedFeeds(
                uid: _uid,
              ),
              lazy: _lazyLoadConfig.lazyLoadUserSavedFeeds,
              initialData: null,
            ),
            PStateProvider.stream<List<PeamanNotification>?>(
              create: (_) => PNotificationProvider.getUserNotifications(
                uid: _uid,
              ),
              lazy: _lazyLoadConfig.lazyLoadUserNotifications,
              initialData: null,
            ),
            PStateProvider.stream<List<PeamanFeed>?>(
              create: (_) => PFeedProvider.getFeeds(),
              lazy: _lazyLoadConfig.lazyLoadFeeds,
              initialData: null,
            ),
            PStateProvider.stream<List<PeamanMoment>?>(
              create: (_) => PFeedProvider.getMoments(),
              lazy: _lazyLoadConfig.lazyLoadMoments,
              initialData: null,
            ),
            ...providers,
          ],
          builder: (context, child) {
            return builder(context);
          },
        );
      },
    );
  }
}
