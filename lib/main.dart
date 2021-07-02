import 'package:flutter/material.dart';
import 'package:tutor/ui/homepage/homepage.dart';

//  https://www.pinterest.com/pin/76490893660383367/
void main() {
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
