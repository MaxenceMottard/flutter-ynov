import 'package:movie_app/models/Movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TMDBMovieType {
  static const String POPULAR = 'popular';
  static const String LATEST = 'latest';
  static const String UPCOMING = 'upcoming';
  static const String TOP_RATED = 'top_rated';
}

class TMDBPosterSize {
  static const String w92 = "w92";
  static const String w154 = "w154";
  static const String w185 = "w185";
  static const String w342 = "w342";
  static const String w500 = "w500";
  static const String w780 = "w780";
  static const String original = "original";
}

class TMDBService {
  String _apiKey = "c5e559ac2b3964e6b8ddcc8b60df9bee";
  String _baseUrl = "https://api.themoviedb.org/3";
  String imageBaseUrl = "https://image.tmdb.org/t/p";

  String _constructUrl(String endpoint) => "$_baseUrl$endpoint?api_key=$_apiKey";

  Future<List<Movie>> getMovieList(String type) async {
    String url = _constructUrl("/movie/$type");
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> decodedData = json.decode(response.body);
      List<Movie> list = decodedData['results'].map<Movie>((json) => Movie.fromJson(json)).toList();

      return list;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Movies');
    }
  }

}