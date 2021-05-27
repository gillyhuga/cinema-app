import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cinema_app/screen/dashboard.dart';
import 'package:cinema_app/screen/tv_page.dart';
class page extends StatefulWidget {
  page({Key key}) : super(key: key);

  @override
  _pageState createState() => _pageState();
}

class _pageState extends State<page> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: PageView(
  children: <Widget>[
    Dashboard(),
    Tv(),
    Container(
      color: Colors.cyan,
    ),
    Container(
      color: Colors.deepPurple,
    ),
  ],
),
    );
  }
}