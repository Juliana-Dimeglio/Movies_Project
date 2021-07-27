import 'dart:async';

import '../model/movie.dart';

import '../resources/movie_repository.dart';

class MoviesBloc {
  late MovieRepository _movieRepository;
  final _moviesFetcher = StreamController<Movie>.broadcast();
  final _moviesSearchFetcher = StreamController<Movie>.broadcast();

  MoviesBloc([MovieRepository? movieRepository])
      : _movieRepository = movieRepository ?? MovieRepository();

  Stream<Movie> get allMovies => _moviesFetcher.stream;

  Stream<Movie> get searchMovies => _moviesSearchFetcher.stream;

  fetchAllMovies() async {
    Movie movieModel = await _movieRepository.fetchAllMovies();
    _moviesFetcher.sink.add(movieModel);
  }

  fetchMoviesBySearch(String query) async {
    if (query.isNotEmpty) {
      Movie movieModel = await _movieRepository.fetchMoviesBySearch(query);
      _moviesFetcher.sink.add(movieModel);
    } else {
      fetchAllMovies();
    }
  }

  dispose() {
    _moviesFetcher.close();
    _moviesSearchFetcher.close();
  }
}
