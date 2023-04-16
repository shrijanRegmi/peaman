import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/src/features/shared/extensions/string_extension.dart';
import 'package:peaman/src/features/shared/models/peaman_field_model.dart';

class PeamanCommonHelper {
  static void printListening({required final String text}) {
    log('Started getting $text');
  }

  static Map<String, dynamic> prepareDataToUpdate({
    required final List<PeamanField> fields,
  }) {
    final _data = <String, dynamic>{};

    for (final field in fields) {
      final key = field.useKeyAsItIs ? field.key : field.key.toJsonKey;

      switch (field.type) {
        case PeamanFieldType.delete:
          _data[key] = FieldValue.delete();
          break;
        case PeamanFieldType.positivePartial:
          if (field.value is num) {
            _data[key] = FieldValue.increment(field.value);
          } else if (field.value is List) {
            _data[key] = FieldValue.arrayUnion(field.value);
          } else {
            throw Exception(
              "value must be either a [num] type or a [List] type",
            );
          }
          break;
        case PeamanFieldType.negativePartial:
          if (field.value is num) {
            _data[key] = FieldValue.increment(-field.value);
          } else if (field.value is List) {
            _data[key] = FieldValue.arrayRemove(field.value);
          } else {
            throw Exception(
              "value must be either a [num] type or a [List] type",
            );
          }
          break;
        default:
          _data[key] = field.value;
      }
    }

    return _data;
  }

  static List<String> getHashtagsFromText({
    required final String text,
  }) {
    final result = <String>[];

    var thisText = text;

    while (thisText.contains('#')) {
      final hashIndex = thisText.indexOf('#');

      if (hashIndex != -1) {
        final newText = thisText.substring(hashIndex, thisText.length);

        final splittedText = newText.split(' ');
        if (splittedText.isNotEmpty) {
          final hashTagText = splittedText.first;

          result.add(hashTagText);
          thisText = thisText.replaceAll(hashTagText, '');
        }
      }
    }

    return result;
  }

  static List<String> getSearchKeys({
    required final String text,
  }) {
    final searchKeys = <String>[];

    var _text = text.length > 300 ? text.substring(0, 300) : text;
    final _texts = _text.split(' ');

    // split letters of text
    for (int i = 0; i < _text.length; i++) {
      final letter = _text.substring(0, i + 1);
      if (!searchKeys.contains(letter.toUpperCase())) {
        searchKeys.add(letter.toUpperCase());
      }
    }
    //

    // split letters of texts
    for (int i = 0; i < _texts.length; i++) {
      for (int j = 0; j < _texts[i].length; j++) {
        final letter = _texts[i].substring(0, j + 1);
        if (!searchKeys.contains(letter.toUpperCase())) {
          searchKeys.add(letter.toUpperCase());
        }
      }
    }
    //

    return searchKeys
        .where((element) =>
            element.trim() != '' &&
            element.trim() != ',' &&
            element.trim() != '.')
        .toList();
  }

  static List<String> getUrlsFromText({
    required final String text,
  }) {
    RegExp exp = RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    Iterable<RegExpMatch> matches = exp.allMatches(text);

    final urls = <String>[];
    matches.forEach((match) {
      final url = text.substring(match.start, match.end);
      urls.add(url);
    });

    return urls;
  }
}
