import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/components/MovieCard.dart';
import 'package:movie_app/components/VerticalList.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/models/TvShow.dart';
import 'package:movie_app/services/TMDBService.dart';
import 'package:movie_app/views/LoginView.dart';
import 'package:toast/toast.dart';

class MovieListView extends StatelessWidget{
  final TMDBService tmdbService = TMDBService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle_rounded),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => LoginView()
              ));
            },
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
        child: Column(
          children: [
            VerticalCardList(
              title: "Popular Movies",
              future: tmdbService.getMovieList(TMDBMovieType.POPULAR),
              itemBuilder: (BuildContext context, Movie movie) => MovieCard(tmdbItem: movie),
            ),
            VerticalCardList(
              title: "Popular TV Show",
              future: tmdbService.getTvShowList(TMDBMovieType.POPULAR),
              itemBuilder: (BuildContext context, TvShow show) => MovieCard(tmdbItem: show),
            ),
            VerticalCardList(
              title: "Best Movies",
              future: tmdbService.getMovieList(TMDBMovieType.TOP_RATED),
              itemBuilder: (BuildContext context, Movie movie) => MovieCard(tmdbItem: movie),
            ),
          ],
        ),
      ),
    );
  }
}