import '../model/movie.dart';

abstract class IMovieRepository {
  Future<Movie> fetchAllMovies();
}
