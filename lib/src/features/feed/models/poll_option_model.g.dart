// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanPollOption _$$_PeamanPollOptionFromJson(Map<String, dynamic> json) =>
    _$_PeamanPollOption(
      id: json['id'] as String?,
      option: json['option'] as String?,
      popularity: json['popularity'] as int? ?? 0,
    );

Map<String, dynamic> _$$_PeamanPollOptionToJson(_$_PeamanPollOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('option', instance.option);
  val['popularity'] = instance.popularity;
  return val;
}
