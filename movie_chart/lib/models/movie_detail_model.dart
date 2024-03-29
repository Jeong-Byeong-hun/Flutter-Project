class MovieDetailModel {
  final String backdrop_path,
      original_language,
      original_title,
      overview,
      poster_path,
      release_date,
      title;
  final double popularity, vote_average;
  final int vote_count, runtime, id;
  final List<dynamic> genres;
  final bool adult;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : backdrop_path = json['backdrop_path'],
        id = json['id'],
        original_language = json['original_language'],
        original_title = json['original_title'],
        overview = json['overview'],
        poster_path = json['poster_path'],
        release_date = json['release_date'],
        title = json['title'],
        popularity = json['popularity'],
        vote_average = json['vote_average'],
        vote_count = json['vote_count'],
        runtime = json['runtime'],
        adult = json['adult'],
        genres = json['genres'];
}

// {
// "adult": false,
// "backdrop_path": "/pWsD91G2R1Da3AKM3ymr3UoIfRb.jpg",
// "belongs_to_collection": {
// "id": 1196130,
// "name": "Concrete Utopia Collection",
// "poster_path": "/l4emA6jN9YQxhdpoZ4IThpMofc6.jpg",
// "backdrop_path": "/9iJi448p9cvnpnLN7C0jBFjSseX.jpg"
// },
// "budget": 20,
// "genres": [
// {
// "id": 878,
// "name": "Science Fiction"
// },
// {
// "id": 28,
// "name": "Action"
// },
// {
// "id": 18,
// "name": "Drama"
// }
// ],
// "homepage": "",
// "id": 933131,
// "imdb_id": "tt29722855",
// "original_language": "ko",
// "original_title": "황야",
// "overview": "After a deadly earthquake turns Seoul into a lawless badland, a fearless huntsman springs into action to rescue a teenager abducted by a mad doctor.",
// "popularity": 2214.237,
// "poster_path": "/zVMyvNowgbsBAL6O6esWfRpAcOb.jpg",
// "production_companies": [
// {
// "id": 127541,
// "logo_path": "/Aq35mXuZv7lhPm8a60YKRaB9Vek.png",
// "name": "Climax Studios",
// "origin_country": "KR"
// },
// {
// "id": 159339,
// "logo_path": null,
// "name": "Nova Film",
// "origin_country": "KR"
// },
// {
// "id": 129217,
// "logo_path": null,
// "name": "Big Punch Pictures",
// "origin_country": "KR"
// },
// {
// "id": 7819,
// "logo_path": "/ghFZAt4edln0M7BzDExyYMzUGX1.png",
// "name": "Lotte Entertainment",
// "origin_country": "KR"
// },
// {
// "id": 221095,
// "logo_path": null,
// "name": "에볼루 션카지노",
// "origin_country": ""
// }
// ],
// "production_countries": [
// {
// "iso_3166_1": "KR",
// "name": "South Korea"
// }
// ],
// "release_date": "2024-01-26",
// "revenue": 20,
// "runtime": 107,
// "spoken_languages": [
// {
// "english_name": "Korean",
// "iso_639_1": "ko",
// "name": "한국어/조선말"
// }
// ],
// "status": "Released",
// "tagline": "One last hunt to save us all.",
// "title": "Badland Hunters",
// "video": false,
// "vote_average": 6.726,
// "vote_count": 419
// }
