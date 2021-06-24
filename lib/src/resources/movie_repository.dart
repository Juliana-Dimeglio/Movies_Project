import 'dart:async';
import 'i_movie_repository.dart';

import 'movie_api_provider.dart';
import '../model/movie.dart';

class MovieRepository extends IMovieRepository {
  final moviesApiProvider = MovieApiProvider();

  Future<Movie> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}
