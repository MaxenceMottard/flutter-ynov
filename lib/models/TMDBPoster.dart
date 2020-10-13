import 'package:flutter/foundation.dart';
import 'package:movie_app/services/TMDBService.dart';

abstract class TMDBPoster {
  String posterPath;

  TMDBPoster({Key key, this.posterPath});

  String posterUrl({String size = TMDBPosterSize.original}) {
    return "${TMDBService().imageBaseUrl}/$size$posterPath";
  }
}