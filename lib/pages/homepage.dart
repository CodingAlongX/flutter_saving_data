import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sharedPreferences');
              },
              child: Text('SharedPreferences'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sqlite');
              },
              child: Text('SQLite'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/textFile');
              },
              child: Text('Text File'),
            ),
          ],
        ),
      ),
    );
  }
}
