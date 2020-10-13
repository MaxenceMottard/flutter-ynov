import 'package:flutter/material.dart';
import 'package:movie_app/models/TMDBPoster.dart';

class Movie extends TMDBPoster {
  String title;
  String posterPath;

  Movie({Key key, this.title, this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    title: json['title'],
    posterPath: json['poster_path'],
  );
}