// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Series seriesFromJson(String str) => Series.fromJson(json.decode(str));

String seriesToJson(Series data) => json.encode(data.toJson());

class Series {
    Series({
        this.result,
        this.page,
    });

    List<Result> result;
    int page;

    factory Series.fromJson(Map<String, dynamic> json) => Series(
        result: json["result"] == null ? null : List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        page: json["page"] == null ? null : json["page"],
    );

    Map<String, dynamic> toJson() => {
        "result": result == null ? null : List<dynamic>.from(result.map((x) => x.toJson())),
        "page": page == null ? null : page,
    };
}

class Result {
    Result({
        this.title,
        this.thumbnail,
        this.genre,
        this.rating,
        this.duration,
        this.quality,
        this.trailer,
        this.watch,
    });

    String title;
    String thumbnail;
    List<String> genre;
    String rating;
    String duration;
    String quality;
    String trailer;
    String watch;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"] == null ? null : json["title"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        genre: json["genre"] == null ? null : List<String>.from(json["genre"].map((x) => x)),
        rating: json["rating"] == null ? null : json["rating"],
        duration: json["duration"] == null ? null : json["duration"],
        quality: json["quality"] == null ? null : json["quality"],
        trailer: json["trailer"] == null ? null : json["trailer"],
        watch: json["watch"] == null ? null : json["watch"],
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "thumbnail": thumbnail == null ? null : thumbnail,
        "genre": genre == null ? null : List<dynamic>.from(genre.map((x) => x)),
        "rating": rating == null ? null : rating,
        "duration": duration == null ? null : duration,
        "quality": quality == null ? null : quality,
        "trailer": trailer == null ? null : trailer,
        "watch": watch == null ? null : watch,
    };
}
