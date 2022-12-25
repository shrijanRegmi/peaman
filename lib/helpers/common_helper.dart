import 'package:cloud_firestore/cloud_firestore.dart';

class PeamanCommonHelper {
  // print listening to
  static void printListening({required final String text}) {
    print('Started getting $text');
  }

  // prepare data to update on firestore
  static Map<String, dynamic> prepareDataToUpdate({
    required final Map<String, dynamic> data,
    final bool partial = false,
  }) {
    var _data = data;

    if (partial) {
      data.forEach((key, value) {
        if (value is int || value is double) {
          _data[key] = FieldValue.increment(value);
        } else if (value is List) {
          _data[key] = FieldValue.arrayUnion(value);
        }
      });
    }

    return _data;
  }

  // get hashtags from text
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

  // get search keys
  static List<String> getSearchKeys({required final String text}) {
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
}
