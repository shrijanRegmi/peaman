import 'package:peaman/models/user_model.dart';

class PeamanCall {
  final String? id;
  final PeamanUser? caller;
  final PeamanUser? receiver;
  final bool? hasExpired;
  final int? updatedAt;
  final bool? isPicked;

  PeamanCall({
    this.id,
    this.caller,
    this.receiver,
    this.hasExpired,
    this.updatedAt,
    this.isPicked,
  });

  PeamanCall copyWith({
    final String? id,
    final PeamanUser? caller,
    final PeamanUser? receiver,
    final bool? hasExpired,
    final int? updatedAt,
    final bool? isPicked,
  }) {
    return PeamanCall(
      id: id ?? this.id,
      caller: caller ?? this.caller,
      receiver: receiver ?? this.receiver,
      hasExpired: hasExpired ?? this.hasExpired,
      updatedAt: updatedAt ?? this.updatedAt,
      isPicked: isPicked ?? this.isPicked,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'caller': caller?.toFeedUser(),
      'receiver': receiver?.toFeedUser(),
      'has_expired': hasExpired,
      'updated_at': updatedAt,
      'is_picked': isPicked,
    };
  }

  static PeamanCall fromJson(final Map<String, dynamic> data) {
    return PeamanCall(
      id: data['id'],
      caller: PeamanUser.fromJson(data['caller']),
      receiver: PeamanUser.fromJson(data['receiver']),
      hasExpired: data['has_expired'] ?? false,
      updatedAt: data['updated_at'],
      isPicked: data['is_picked'] ?? false,
    );
  }
}
