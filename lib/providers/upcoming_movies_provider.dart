import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/models/genre.dart';
import '/services/movies_data_api.dart';
import '/utilities/shared_prefrences_keys.dart';

import '../models/movie.dart';

class UpcomingMoviesProvider extends ChangeNotifier {
  List<Movie> _movies = <Movie>[];
  final List<Genre> _genres = <Genre>[];

  List<Movie> get movies => _movies;
  List<Genre> get genres => _genres;

  getMovies() async {
    _movies = await MoviesDataAPI.getUpcomingMoviesList();
    notifyListeners();
  }

  getGenresName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? genresNameJson =
        preferences.getString(SharedPrefrencesKey.genresNamesKey);
    if (genresNameJson == null) {
      genresNameJson = await MoviesDataAPI.getGenresNames();
      preferences.setString(
          SharedPrefrencesKey.genresNamesKey, genresNameJson ?? '');
    }
    List<dynamic> genresNameList =
        (json.decode(genresNameJson ?? ''))['genres'];
    for (var genreName in genresNameList) {
      _genres.add(Genre.fromMap(genreName));
    }
    notifyListeners();
  }

  String? searchGenreName(int id) {
    for (var genre in _genres) {
      if (genre.id == id) return genre.name;
    }
    return null;
  }
}
