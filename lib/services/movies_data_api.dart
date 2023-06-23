import 'dart:convert';

import 'package:http/http.dart' as http;
import '/models/movie.dart';

class MoviesDataAPI {
  static const String _apiKey = '8befe1879fb304dc43a3871111476012';

  static getUpcomingMoviesList() async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$_apiKey');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = json.decode(response.body);
    List<dynamic> moviesData = data['results'];
    List<Movie> movies = <Movie>[];
    for (Map<String, dynamic> movie in moviesData) {
      movies.add(Movie.fromMap(movie));
    }
    return movies;
  }

  static getGenresNames() async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=$_apiKey');
    http.Response response = await http.get(url);
    return response.body;
  }
}
