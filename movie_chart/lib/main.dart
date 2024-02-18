import 'package:flutter/material.dart';
import 'package:movie_chart/service/services.dart';
import 'package:movie_chart/widgets/movie_home.dart';

void main() {
  ApiService.getNowMovieList();

  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieHome(),
    );
  }
}
