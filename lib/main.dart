import 'package:flutter/material.dart';
import 'package:flutter_saving_data/pages/shared_preferences_home.dart';
import 'package:flutter_saving_data/pages/sqlite_home.dart';
import 'package:flutter_saving_data/pages/text_file_home.dart';
import 'pages/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/sharedPreferences': (context) => SharedPreferencesHome(),
        '/sqlite': (context) => SQLiteHome(),
        '/textFile': (context) => TextFileHome(),
      },
    );
  }
}
