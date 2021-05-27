import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cinema_app/models/new_movie.dart';
import 'package:cinema_app/models/indonesia_movie.dart';
import 'package:cinema_app/models/upcoming_movie.dart';
import 'package:cinema_app/models/series_movie.dart';

class MovieApi {
  Future<NewUpload> getNewUpload() async {
    final response = await http
        .get(Uri.parse('https://api-lk21.herokuapp.com/newupload?page=9'));
    if (response.statusCode == 200) {
      NewUpload data = new NewUpload.fromJson(json.decode(response.body));
      return data;
    } else {
      throw Exception('error');
    }
  }

  Future<Indonesia> getIndonesia() async {
    final response = await http.get(
        Uri.parse('https://api-lk21.herokuapp.com/country?country=indonesia'));
    if (response.statusCode == 200) {
      Indonesia data = new Indonesia.fromJson(json.decode(response.body));
      return data;
    } else {
      throw Exception('error');
    }
  }

  Future<Upcoming> getUpcoming() async {
    final response =
        await http.get(Uri.parse('https://api-lk21.herokuapp.com/comingsoon'));
    if (response.statusCode == 200) {
      Upcoming data = new Upcoming.fromJson(json.decode(response.body));
      return data;
    } else {
      throw Exception('error');
    }
  }

  Future<Series> getSeries() async {
    final response =
        await http.get(Uri.parse('https://api-lk21.herokuapp.com/tv'));
    if (response.statusCode == 200) {
      Series data = new Series.fromJson(json.decode(response.body));
      return data;
    } else {
      throw Exception('error');
    }
  }
}
