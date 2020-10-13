import 'package:flutter/material.dart';
import 'package:movie_app/models/TMDBPoster.dart';

class Movie extends TMDBPoster {
  String title;
  String posterPath;
  double voteAverage;
  String overview;
  String releaseDate;

  Movie({Key key, this.title, this.posterPath, this.voteAverage, this.overview, this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    title: json['title'],
    posterPath: json['poster_path'],
    voteAverage: double.parse(json['vote_average'].toString()),
    overview: json['overview'],
    releaseDate: json['release_date'],
  );

  String getYear() {
    DateTime date = DateTime.parse(releaseDate);

    return date.year.toString();
  }
}