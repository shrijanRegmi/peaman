class PeamanLazyLoadConfig {
  final bool lazyLoadUser;
  final bool lazyLoadUserChats;
  final bool lazyLoadUserFollowers;
  final bool lazyLoadUserFollowings;
  final bool lazyLoadUserBlockedUsers;
  final bool lazyLoadUserBlockedByUsers;
  final bool lazyLoadUserSavedFeeds;
  final bool lazyLoadUserNotifications;
  final bool lazyLoadFeeds;
  final bool lazyLoadMoments;

  PeamanLazyLoadConfig({
    this.lazyLoadUser = true,
    this.lazyLoadUserChats = true,
    this.lazyLoadUserFollowers = true,
    this.lazyLoadUserFollowings = true,
    this.lazyLoadUserBlockedUsers = true,
    this.lazyLoadUserBlockedByUsers = true,
    this.lazyLoadUserSavedFeeds = true,
    this.lazyLoadUserNotifications = true,
    this.lazyLoadFeeds = true,
    this.lazyLoadMoments = true,
  });
}
