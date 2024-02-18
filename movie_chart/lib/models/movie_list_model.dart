class MovieSimpleModel {
  final String backdrop_path,
      original_language,
      original_title,
      overview,
      poster_path,
      release_date,
      title;
  // final double vote_average;
  final int id;
  final List<dynamic> genre_ids;
  final bool adult;

  MovieSimpleModel.fromJson(Map<String, dynamic> json)
      : backdrop_path = json['backdrop_path'],
        id = json['id'],
        original_language = json['original_language'],
        original_title = json['original_title'],
        overview = json['overview'],
        poster_path = json['poster_path'],
        release_date = json['release_date'],
        title = json['title'],
        // vote_average = json['vote_average'],
        adult = json['adult'],
        genre_ids = json['genre_ids'];
}

// {
// "adult": false,
// "backdrop_path": "/pWsD91G2R1Da3AKM3ymr3UoIfRb.jpg",
// "genre_ids": [
// 878,
// 28,
// 18
// ],
// "id": 933131,
// "original_language": "ko",
// "original_title": "황야",
// "overview": "After a deadly earthquake turns Seoul into a lawless badland, a fearless huntsman springs into action to rescue a teenager abducted by a mad doctor.",
// "popularity": 1924.206,
// "poster_path": "/zVMyvNowgbsBAL6O6esWfRpAcOb.jpg",
// "release_date": "2024-01-26",
// "title": "Badland Hunters",
// "video": false,
// "vote_average": 6.732,
// "vote_count": 414
// },

// {
// "adult": false,
// "backdrop_path": "/bQS43HSLZzMjZkcHJz4fGc7fNdz.jpg",
// "genre_ids": [
// 878,
// 10749,
// 35
// ],
// "id": 792307,
// "original_language": "en",
// "original_title": "Poor Things",
// "overview": "Brought back to life by an unorthodox scientist, a young woman runs off with a debauched lawyer on a whirlwind adventure across the continents. Free from the prejudices of her times, she grows steadfast in her purpose to stand for equality and liberation.",
// "popularity": 636.204,
// "poster_path": "/kCGlIMHnOm8JPXq3rXM6c5wMxcT.jpg",
// "release_date": "2023-12-07",
// "title": "Poor Things",
// "video": false,
// "vote_average": 8.119,
// "vote_count": 1221
// },
