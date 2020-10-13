import 'package:flutter/material.dart';
import 'package:movie_app/components/MovieCard.dart';
import 'package:movie_app/components/VerticalList.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/shared/SizeConfig.dart';

class MovieListView extends StatelessWidget{

  final List<Movie> items = [
    Movie(title: "Enola Holmes", url: 'https://fr.web.img6.acsta.net/pictures/20/09/23/11/08/4358352.jpg'),
    Movie(title: "Enola Holmes", url: 'https://fr.web.img6.acsta.net/pictures/20/09/23/11/08/4358352.jpg'),
    Movie(title: "Enola Holmes", url: 'https://fr.web.img6.acsta.net/pictures/20/09/23/11/08/4358352.jpg'),
    Movie(title: "Enola Holmes", url: 'https://fr.web.img6.acsta.net/pictures/20/09/23/11/08/4358352.jpg'),
    Movie(title: "Enola Holmes", url: 'https://fr.web.img6.acsta.net/pictures/20/09/23/11/08/4358352.jpg'),
    Movie(title: "Enola Holmes", url: 'https://fr.web.img6.acsta.net/pictures/20/09/23/11/08/4358352.jpg'),
    Movie(title: "Interstellar", url: 'https://fr.web.img6.acsta.net/pictures/14/09/24/12/08/158828.jpg')
  ];

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