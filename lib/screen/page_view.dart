import 'package:flutter/material.dart';
import 'package:cinema_app/screen/dashboard.dart';
import 'package:cinema_app/screen/tv_page.dart';


class Slide extends StatefulWidget {
 
  @override
  _SlideState createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: PageView(
  children: <Widget>[
    Dashboard(),
    Tv(),
  ],
),
    );
  }
}