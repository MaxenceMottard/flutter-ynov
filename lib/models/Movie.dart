import 'package:movie_app/models/TMDBItem.dart';

class Movie extends TMDBItem {
  Movie({
    title,
    posterPath,
    voteAverage,
    overview,
    releaseDate,
  }): super(
    title: title,
    posterPath: posterPath,
    voteAverage: voteAverage,
    overview: overview,
    releaseDate: releaseDate,
  );

  @override
  Movie fromJson(Map<String, dynamic> json) => Movie(
    title: json['title'],
    posterPath: json['poster_path'],
    voteAverage: double.parse(json['vote_average'].toString()),
    overview: json['overview'],
    releaseDate: json['release_date'],
  );
}