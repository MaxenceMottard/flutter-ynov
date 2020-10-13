import 'package:flutter/material.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/services/TMDBService.dart';
import 'package:movie_app/views/DetailView.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => DetailView(movie: movie)
        ));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image(
                image: NetworkImage(movie.posterUrl(size: TMDBPosterSize.w185)),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}