import 'package:flutter_saving_data/helpers/database_helpers.dart';

class Word {
  int id;
  String word;
  int frequency;

  Word();

  Word.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    word = map[columnWord];
    frequency = map[columnFrequency];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnWord: word,
      columnFrequency: frequency,
    };

    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}
