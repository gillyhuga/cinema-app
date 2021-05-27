// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Upcoming upcomingFromJson(String str) => Upcoming.fromJson(json.decode(str));

String upcomingToJson(Upcoming data) => json.encode(data.toJson());

class Upcoming {
    Upcoming({
        this.result,
        this.page,
    });

    List<Result> result;
    int page;

    factory Upcoming.fromJson(Map<String, dynamic> json) => Upcoming(
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
    Rating rating;
    Duration duration;
    Quality quality;
    String trailer;
    String watch;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"] == null ? null : json["title"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        genre: json["genre"] == null ? null : List<String>.from(json["genre"].map((x) => x)),
        rating: json["rating"] == null ? null : ratingValues.map[json["rating"]],
        duration: json["duration"] == null ? null : durationValues.map[json["duration"]],
        quality: json["quality"] == null ? null : qualityValues.map[json["quality"]],
        trailer: json["trailer"] == null ? null : json["trailer"],
        watch: json["watch"] == null ? null : json["watch"],
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "thumbnail": thumbnail == null ? null : thumbnail,
        "genre": genre == null ? null : List<dynamic>.from(genre.map((x) => x)),
        "rating": rating == null ? null : ratingValues.reverse[rating],
        "duration": duration == null ? null : durationValues.reverse[duration],
        "quality": quality == null ? null : qualityValues.reverse[quality],
        "trailer": trailer == null ? null : trailer,
        "watch": watch == null ? null : watch,
    };
}

enum Duration { EMPTY, NULL_MIN, THE_123_MIN }

final durationValues = EnumValues({
    "": Duration.EMPTY,
    " null min": Duration.NULL_MIN,
    " 123 min": Duration.THE_123_MIN
});

enum Quality { HD }

final qualityValues = EnumValues({
    "HD": Quality.HD
});

enum Rating { EMPTY, THE_9 }

final ratingValues = EnumValues({
    "": Rating.EMPTY,
    " 9": Rating.THE_9
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
