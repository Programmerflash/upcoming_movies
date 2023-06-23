class Movie {
  final String name;
  final String posterImgUrl;
  final String movieId;
  final String overview;
  final List<dynamic> genres;
  final DateTime releaseDate;
  final String imageURL;

  Movie({
    required this.name,
    required this.movieId,
    required this.posterImgUrl,
    required this.overview,
    required this.genres,
    required this.releaseDate,
    required this.imageURL,
  });

  factory Movie.fromMap(Map<String, dynamic> movie) {
    return Movie(
      name: movie['title'],
      movieId: movie['id'].toString(),
      posterImgUrl: movie['poster_path'],
      overview: movie['overview'],
      releaseDate: DateTime.parse(movie['release_date']),
      genres: movie['genre_ids'],
      imageURL: 'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
    );
  }
}
