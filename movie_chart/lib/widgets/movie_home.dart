import 'package:flutter/material.dart';
import 'package:movie_chart/models/movie_list_model.dart';
import 'package:movie_chart/service/services.dart';
import 'package:movie_chart/widgets/movie_detail.dart';
import 'package:movie_chart/widgets/title_text.dart';

class MovieHome extends StatelessWidget {
  static const imgBaseUrl = "https://image.tmdb.org/t/p/w500";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            _buildSection(
              title: 'Popular Movies',
              future: ApiService.getPopularMovieList(),
              itemBuilder: (movie) => _buildMovieItem(
                movie.id,
                movie.title,
                movie.backdrop_path,
                context,
              ),
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: 'Now in Cinemas',
              future: ApiService.getNowMovieList(),
              itemBuilder: (movie) => _buildPosterMovieItem(
                movie.id,
                movie.title,
                movie.backdrop_path,
                context,
              ),
            ),
            _buildSection(
              title: 'Coming Soon',
              future: ApiService.getComingMovieList(),
              itemBuilder: (movie) => _buildPosterMovieItem(
                movie.id,
                movie.title,
                movie.backdrop_path,
                context,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required Future<List<MovieSimpleModel>> future,
    required Widget Function(MovieSimpleModel) itemBuilder,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(title: title),
        const SizedBox(height: 16),
        FutureBuilder<List<MovieSimpleModel>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: snapshot.data!
                      .map((movie) => itemBuilder(movie))
                      .toList(),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }

  Widget _buildMovieItem(
      int id, String title, String imagePath, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailWidget(id: id, title: title),
            ),
          );
        },
        child: Container(
          width: 300,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.network(
            imgBaseUrl + imagePath,
            headers: const {
              "User-Agent":
                  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPosterMovieItem(
      int id, String title, String imagePath, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailWidget(id: id, title: title),
            ),
          );
        },
        child: Container(
          width: 80,
          height: 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(
                  imgBaseUrl + imagePath,
                  headers: const {
                    "User-Agent":
                        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                  },
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                title,
                maxLines: 3, // 최대 2줄까지 표시
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
