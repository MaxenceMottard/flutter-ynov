import 'package:flutter/material.dart';
import 'package:movie_app/components/MovieCard.dart';
import 'package:movie_app/components/VerticalList.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/services/TMDBService.dart';
import 'package:movie_app/shared/SizeConfig.dart';

class MovieListView extends StatelessWidget{

  final List<Movie> items = [];

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
              items: items,
              itemBuilder: (BuildContext context, Movie movie) => MovieCard(movie: movie),
            ),
            VerticalCardList(
              title: "Popular TV Show",
              items: items,
              itemBuilder: (BuildContext context, Movie movie) => MovieCard(movie: movie),
            ),
            VerticalCardList(
              title: "Best Movies",
              items: items,
              itemBuilder: (BuildContext context, Movie movie) => MovieCard(movie: movie),
            ),
          ],
        ),
      ),
    );
  }
}