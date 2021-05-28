import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cinema_app/widgets/color.dart';
import 'package:cinema_app/services/movieApi.dart';
import 'package:cinema_app/models/new_movie.dart';
import 'package:cinema_app/models/indonesia_movie.dart';
import 'package:cinema_app/models/upcoming_movie.dart';
import 'package:cinema_app/models/action_movie.dart';

MovieApi _api = MovieApi();

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<NewUpload> newUpload;
  Future<Indonesia> indonesiaMovie;
  Future<Upcoming> upcomingMovie;
  Future<ActionMovie> actionMovie;

  @override
  void initState() {
    super.initState();
    newUpload = _api.getNewUpload();
    indonesiaMovie = _api.getIndonesia();
    upcomingMovie = _api.getUpcoming();
    actionMovie = _api.getAction();
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
                  "Explore",
                  style: TextStyle(
                    fontSize: 44,
                    color: textColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: Text(
                  "Find your favorite movie",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    color: textColor.withOpacity(0.5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
                child: Text(
                  "Upcoming Movie",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: textColor.withOpacity(0.5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 18),
                    height: 320,
                    child: FutureBuilder<Upcoming>(
                        future: upcomingMovie,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: mainColor,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text("Error");
                          } else {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                var upcomingMovie = snapshot.data.result[index];
                                return Column(
                                  children: [
                                    Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.network(
                                        upcomingMovie.thumbnail,
                                        fit: BoxFit.cover,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      elevation: 5,
                                      margin: EdgeInsets.all(10),
                                    ),
                                    Container(
                                      width: 150,
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 45,
                                            child: Text(
                                              upcomingMovie.title,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
                child: Text(
                  "New",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: textColor.withOpacity(0.5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 18),
                    height: 350,
                    child: FutureBuilder<NewUpload>(
                        future: newUpload,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: mainColor,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text("Error");
                          } else {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                var newUpload = snapshot.data.result[index];
                                return Card(
                                  child: Column(
                                    children: [
                                      Image.network(
                                        newUpload.thumbnail,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        width: 150,
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 45,
                                              child: Text(
                                                newUpload.title,
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      child: Icon(
                                                        Icons.star,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      newUpload.rating,
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Row(
                                                  children: [
                                                    Container(
                                                      child: Icon(
                                                        Icons.timelapse,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      newUpload.duration,
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.all(10),
                                );
                              },
                            );
                          }
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
                child: Text(
                  "Indonesia Banget",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: textColor.withOpacity(0.5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 18),
                    height: 350,
                    child: FutureBuilder<Indonesia>(
                        future: indonesiaMovie,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: mainColor,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text("Error");
                          } else {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.result.length,
                              itemBuilder: (context, index) {
                                var indonesiaMovie =
                                    snapshot.data.result[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 250,
                                        width: 150,
                                        alignment: Alignment.bottomCenter,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    indonesiaMovie.thumbnail),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Container(
                                          width: 250,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius: new BorderRadius.only(
                                              bottomLeft:
                                                  const Radius.circular(20),
                                              bottomRight:
                                                  const Radius.circular(20),
                                            ),
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  Colors.black
                                                      .withOpacity(0.60),
                                                  Colors.transparent,
                                                ]),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      child: Icon(
                                                        Icons.star,
                                                        color: Colors.white,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      indonesiaMovie.rating,
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Row(
                                                  children: [
                                                    Container(
                                                      child: Icon(
                                                        Icons.timelapse,
                                                        color: Colors.white,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      indonesiaMovie.duration,
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 125,
                                          child: Text(
                                            indonesiaMovie.title,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: 12,
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
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
                child: Text(
                  "Action Movie",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: textColor.withOpacity(0.5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 18),
                    height: 350,
                    child: FutureBuilder<ActionMovie>(
                        future: actionMovie,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: mainColor,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text("Error");
                          } else {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.result.length,
                              itemBuilder: (context, index) {
                                var actionMovie = snapshot.data.result[index];
                                return Container(
                                  child: Container(
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Image.network(
                                            actionMovie.thumbnail,
                                            fit: BoxFit.cover,
                                          ),
                                          Container(
                                            width: 150,
                                            margin: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 45,
                                                  child: Text(
                                                    actionMovie.title,
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          child: Icon(
                                                            Icons.star,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          actionMovie.rating,
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Spacer(),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          child: Icon(
                                                            Icons.timelapse,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          actionMovie.duration,
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      elevation: 5,
                                      margin: EdgeInsets.all(10),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        }),
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
