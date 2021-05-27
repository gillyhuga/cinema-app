import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cinema_app/widgets/color.dart';
import 'package:cinema_app/services/movieApi.dart';
import 'package:cinema_app/models/new_movie.dart';
import 'package:cinema_app/models/indonesia_movie.dart';
import 'package:cinema_app/models/upcoming_movie.dart';


MovieApi _api = MovieApi();

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<NewUpload> newUpload;
  Future<Indonesia> indonesiaMovie;
  Future<Upcoming> upcomingMovie;

  @override
  void initState() {
    super.initState();
    newUpload = _api.getNewUpload();
    indonesiaMovie = _api.getIndonesia();
    upcomingMovie = _api.getUpcoming();
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
                    height: 325,
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
                                return Container(
                                  child: Container(
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Image.network(
                                            upcomingMovie.thumbnail,
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
                                                    upcomingMovie.title,
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
                                              
                                              
                                              ]),
                                          )],
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
                                return Container(
                                  child: Container(
                                    child: Card(
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
                                var newUpload = snapshot.data.result[index];
                                return Container(
                                  child: Container(
                                    child: Card(
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
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
                child: Text(
                  "Film Action",
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
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                var newUpload = snapshot.data.result[index];
                                return Container(
                                  child: Container(
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Image.network(
                                            newUpload.thumbnail,
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            newUpload.title,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 20.0,
                                              ),
                                              Text(
                                                newUpload.rating,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
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
