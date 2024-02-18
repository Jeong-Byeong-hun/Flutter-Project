import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_chart/models/movie_detail_model.dart';
import 'package:movie_chart/models/movie_list_model.dart';

class ApiService {
  static const baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const popularMovie = "/popular";
  static const nowMovie = "/now-playing";
  static const comingMovie = "/coming-soon";
  static const detailMovie = "/movie";

  static Future<List<MovieSimpleModel>> getPopularMovieList() async {
    List<MovieSimpleModel> movieListInstances = [];

    final url = Uri.parse('$baseUrl$popularMovie');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var results = jsonDecode(response.body);
      final List<dynamic> moives = results['results'];
      movieListInstances =
          moives.map((it) => MovieSimpleModel.fromJson(it)).toList();
      return movieListInstances;
    }
    throw Error();
  }

  static Future<List<MovieSimpleModel>> getNowMovieList() async {
    List<MovieSimpleModel> movieListInstances = [];

    final url = Uri.parse('$baseUrl$nowMovie');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var results = jsonDecode(response.body);
      final List<dynamic> moives = results['results'];
      movieListInstances =
          moives.map((it) => MovieSimpleModel.fromJson(it)).toList();
      return movieListInstances;
    }
    throw Error();
  }

  static Future<List<MovieSimpleModel>> getComingMovieList() async {
    List<MovieSimpleModel> movieListInstances = [];

    final url = Uri.parse('$baseUrl$comingMovie');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var results = jsonDecode(response.body);
      final List<dynamic> moives = results['results'];
      movieListInstances =
          moives.map((it) => MovieSimpleModel.fromJson(it)).toList();
      return movieListInstances;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getDetailMovie(int id) async {
    final url = Uri.parse('$baseUrl$detailMovie?id=$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(movie);
    }
    throw Error();
  }
}

// 가장 인기 있는 영화를 보려면 이 엔드포인트를 방문하세요: https://movies-api.nomadcoders.workers.dev/popular
// 극장에서 상영 중인 영화를 보려면 이 엔드포인트를 방문하세요: https://movies-api.nomadcoders.workers.dev/now-playing
// 곧 개봉하는 영화를 보려면 이 엔드포인트를 방문하세요: https://movies-api.nomadcoders.workers.dev/coming-soon
// 영화에 대한 세부 정보를 보려면 이 엔드포인트를 방문하세요: https://movies-api.nomadcoders.workers.dev/movie?id=1 (아이디를 세부 정보를 보려는 영화의 아이디로 바꾸세요).
