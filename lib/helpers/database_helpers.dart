import 'dart:io';

import 'package:flutter_saving_data/models/word.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String tableWords = 'words';
final String columnId = '_id';
final String columnWord = 'word';
final String columnFrequency = 'frequency';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDatabase();
    return database;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    var sql = '''
    CREATE TABLE $tableWords (
    $columnId INTEGER PRIMARY KEY,
    $columnWord TEXT NOT NULL,
    $columnFrequency INTEGER NOT NULL
    )
    ''';

    await db.execute(sql);
  }

  Future<int> insert(Word word) async {
    Database db = await database;
    int id = await db.insert(tableWords, word.toMap());
    return id;
  }

  Future<Word> queryWord(int id) async {
    Database db = await database;

    List<Map> maps = await db.query(
      tableWords,
      columns: [columnId, columnWord, columnFrequency],
      where: '$columnId = ?',
      whereArgs: [id],
    );

    if (maps.length > 0) {
      return Word.fromMap(maps.first);
    }
    return null;
  }
}
