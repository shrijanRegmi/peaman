import 'package:freezed_annotation/freezed_annotation.dart';

part 'poll_option_model.freezed.dart';
part 'poll_option_model.g.dart';

@freezed
class PeamanPollOption with _$PeamanPollOption {
  const factory PeamanPollOption({
    final String? id,
    final String? option,
    @Default(0) final int popularity,
  }) = _PeamanPollOption;

  factory PeamanPollOption.fromJson(Map<String, dynamic> json) =>
      _$PeamanPollOptionFromJson(json);
}
