import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cinema_app/color.dart';
import 'package:cinema_app/models/series_movie.dart';
import 'package:cinema_app/services/movieApi.dart';

MovieApi _api = MovieApi();

class Tv extends StatefulWidget {
  @override
  _TvState createState() => _TvState();
}

class _TvState extends State<Tv> {
  Future<Series> series;

  @override
  void initState() {
    super.initState();
    series = _api.getSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
                child: Text(
                  "Tv Series",
                  style: TextStyle(
                    fontSize: 44,
                    color: textColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32, bottom: 24),
                child: Text(
                  "Find your favorite Tv Series",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    color: textColor.withOpacity(0.5),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 18),
                      height: 600,
                      child: FutureBuilder<Series>(
                          future: series,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>
                                (redColor),
                            ));
                            } else if (snapshot.hasError) {
                              return Text("Error");
                            } else {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.result.length,
                                itemBuilder: (context, index) {
                                  var series = snapshot.data.result[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 500,
                                          width: 350,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      series.thumbnail),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child:
                                              null /* add child content here */,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 300,
                                            child: Text(
                                              series.title,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: textColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
