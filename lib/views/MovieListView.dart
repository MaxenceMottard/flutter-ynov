import 'package:flutter/material.dart';
import 'package:movie_app/components/MovieCard.dart';
import 'package:movie_app/components/VerticalList.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/services/TMDBService.dart';
import 'package:movie_app/shared/SizeConfig.dart';

class MovieListView extends StatelessWidget{

  final List<Movie> items = [];
  final TMDBService tmdbService = TMDBService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
        child: Column(
          children: [
            VerticalCardList(
              title: "Popular Movies",
              future: tmdbService.getMovieList(TMDBMovieType.POPULAR),
              itemBuilder: (BuildContext context, Movie movie) => MovieCard(movie: movie),
            ),
            VerticalCardList(
              title: "Popular TV Show",
              future: tmdbService.getMovieList(TMDBMovieType.POPULAR),
              itemBuilder: (BuildContext context, Movie movie) => MovieCard(movie: movie),
            ),
            VerticalCardList(
              title: "Best Movies",
              future: tmdbService.getMovieList(TMDBMovieType.TOP_RATED),
              itemBuilder: (BuildContext context, Movie movie) => MovieCard(movie: movie),
            ),
          ],
        ),
      ),
    );
  }
}