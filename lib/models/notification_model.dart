import 'package:peaman/enums/notification_type.dart';
import 'package:peaman/models/feed_model.dart';
import 'package:peaman/models/user_model.dart';

class PeamanNotification {
  final String? id;
  final PeamanUser? sender;
  final List<PeamanUser>? reactedBy;
  final List<PeamanUser>? commentedBy;
  final PeamanFeed? feed;
  final PeamanNotificationType? type;
  final int? updatedAt;
  final bool? isAccepted;
  final bool? isRead;

  PeamanNotification({
    this.id,
    this.sender,
    this.type,
    this.updatedAt,
    this.isAccepted,
    this.reactedBy,
    this.commentedBy,
    this.feed,
    this.isRead,
  });

  static PeamanNotification fromJson(
      final Map<String, dynamic> data, final String id) {
    final _type = data['type'];
    if (_type == 1) {
      final _reactedBy = List<PeamanUser>.from(
        List<Map<String, dynamic>>.from(data['reacted_by'])
            .map((e) => PeamanUser.fromJson(e)),
      );
      return ReactNotification(
        id: id,
        reactedBy: List<PeamanUser>.from(_reactedBy.reversed),
        feed: PeamanFeed.fromJson(data['post_data']),
        updatedAt: data['updated_at'],
        isRead: data['is_read'] ?? false,
      );
    }
    final _commentedBy = List<PeamanUser>.from(
      List<Map<String, dynamic>>.from(data['commented_by'])
          .map((e) => PeamanUser.fromJson(e)),
    );

    return CommentNotification(
      id: id,
      commentedBy: List<PeamanUser>.from(_commentedBy.reversed),
      feed: PeamanFeed.fromJson(data['post_data']),
      updatedAt: data['updated_at'],
      isRead: data['is_read'] ?? false,
    );
  }
}

class ReactNotification extends PeamanNotification {
  final String? id;
  final List<PeamanUser>? reactedBy;
  final PeamanFeed? feed;
  final int? updatedAt;
  final bool? isRead;

  ReactNotification({
    this.id,
    this.reactedBy,
    this.updatedAt,
    this.feed,
    this.isRead,
  }) : super(
          id: id,
          reactedBy: reactedBy,
          type: PeamanNotificationType.reaction,
          updatedAt: updatedAt,
          feed: feed,
          isRead: isRead,
        );
}

class CommentNotification extends PeamanNotification {
  final String? id;
  final List<PeamanUser>? commentedBy;
  final PeamanFeed? feed;
  final int? updatedAt;
  final bool? isRead;

  CommentNotification({
    this.id,
    this.commentedBy,
    this.feed,
    this.updatedAt,
    this.isRead,
  }) : super(
          id: id,
          commentedBy: commentedBy,
          type: PeamanNotificationType.comment,
          updatedAt: updatedAt,
          feed: feed,
          isRead: isRead,
        );
}
