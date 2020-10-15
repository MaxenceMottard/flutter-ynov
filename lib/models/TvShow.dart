import 'package:movie_app/models/TMDBItem.dart';

class TvShow extends TMDBItem {
  TvShow({
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
  TvShow fromJson(Map<String, dynamic> json) => TvShow(
    title: json['name'],
    posterPath: json['poster_path'],
    voteAverage: double.parse(json['vote_average'].toString()),
    overview: json['overview'],
    releaseDate: json['first_air_date'],
  );
}