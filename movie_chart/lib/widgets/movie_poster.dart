import 'package:flutter/material.dart';
import 'package:movie_chart/models/movie_list_model.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.imgBaseUrl,
    required this.movie,
  });

  final String imgBaseUrl;
  final MovieSimpleModel movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.network(
        imgBaseUrl + movie.backdrop_path,
        headers: const {
          "User-Agent":
              "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
        },
      ),
    );
  }
}
