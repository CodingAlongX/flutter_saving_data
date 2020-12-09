import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_saving_data/helpers/database_helpers.dart';
import 'package:flutter_saving_data/models/word.dart';

class SQLiteHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Home'),
      ),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text('Read'),
              onPressed: () {
                _read();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                _save();
              },
            ),
          ),
        ],
      ),
    );
  }

  _read() async {
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    int rowId = 1;
    Word word = await databaseHelper.queryWord(rowId);

    if (word == null) {
      print('Read: row $rowId: empty');
    } else {
      print('Read: row $rowId: ${word.word} ${word.frequency}');
    }
  }

  _save() async {
    Word word = Word();
    word.word = 'hello';
    word.frequency = 15;
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    int id = await databaseHelper.insert(word);
    print('Save: inserted row: $id');
  }
}
