import 'package:flutter/material.dart';
import 'package:cinema_app/screen/dashboard.dart';
import 'package:cinema_app/screen/page_view.dart';
import 'package:cinema_app/widgets/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cinema App',
      theme: ThemeData(
        backgroundColor: backgroundColor,
        fontFamily: "Avenir",
      ),
      home: page(),
    );
  }
}
