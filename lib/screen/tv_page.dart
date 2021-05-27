import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cinema_app/widgets/color.dart';
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
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 32),
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
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Text(
                  "Find your favorite movie",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    color: textColor.withOpacity(0.5),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 15.0),
              //   child: Center(
              //     child: ConstrainedBox(
              //       constraints: BoxConstraints.tightFor(width: 500, height: 50),
              //       child: ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //           primary: mainColor, // background
              //           onPrimary: Colors.white, // foreground
              //         ),
              //         onPressed: () {},
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: [
              //             Text(
              //               'Search a Movie',
              //               style: TextStyle(
              //                 fontSize: 19,
              //                 fontWeight: FontWeight.w400,
              //                 color: textColor,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
 Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 18),
                    height: 550,
                    child: FutureBuilder<Series>(
                        future: series,
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
                                var series = snapshot.data.result[index];
                                return Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.network(
                                    series.thumbnail,
                                    fit: BoxFit.cover,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
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
         
            ],
          ),
        ),
      ),
    );
  }
}
