import 'package:flutter/material.dart';
import 'package:tutor/services/local_storage/local_database.dart';
import 'pages/homepage.dart';

// globally accessable database source
DatabaseService database;

void main() {
  database = DatabaseService();
  Future.delayed(Duration(seconds: 1), () {
    // database.removeall();
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Breaking Bad',
      // todo switch to dark/ligth theme
      // todo app ko lagi aafnai color scheme define garne

      home: Homepage(),
    );
  }
}

// first thing visible
