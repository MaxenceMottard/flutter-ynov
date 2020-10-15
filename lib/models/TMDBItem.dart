import 'package:movie_app/services/TMDBService.dart';

abstract class TMDBItem {
  String title;
  String posterPath;
  double voteAverage;
  String overview;
  String releaseDate;

  TMDBItem({
    this.title,
    this.posterPath,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  fromJson(Map<String, dynamic> json);

  String posterUrl({String size = TMDBPosterSize.original}) => "${TMDBService().imageBaseUrl}/$size$posterPath";

  String getYear() => DateTime.parse(releaseDate).year.toString();
}