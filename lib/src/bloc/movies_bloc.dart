import 'dart:async';

import '../model/movie.dart';

import '../resources/movie_repository.dart';

class MoviesBloc {
  final _movieRepository = MovieRepository();
  final _moviesFetcher = StreamController<Movie>.broadcast();

  Stream<Movie> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    Movie movieModel = await _movieRepository.fetchAllMovies();
    _moviesFetcher.sink.add(movieModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}
