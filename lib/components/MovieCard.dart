import 'package:flutter/material.dart';
import 'package:movie_app/models/TMDBItem.dart';
import 'package:movie_app/services/TMDBService.dart';
import 'package:movie_app/views/DetailView.dart';

class MovieCard extends StatelessWidget {
  final TMDBItem tmdbItem;

  MovieCard({this.tmdbItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => DetailView(tmdbItem: tmdbItem)
        ));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image(
                image: NetworkImage(tmdbItem.posterUrl(size: TMDBPosterSize.w185)),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}