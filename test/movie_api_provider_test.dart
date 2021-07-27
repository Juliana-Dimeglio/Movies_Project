import 'package:flutter_test/flutter_test.dart';
import 'package:movie_project/src/model/movie.dart';
import 'package:movie_project/src/resources/movie_api_provider.dart';

void main() {
  late MovieApiProvider movieApiProvider;

  setUp(() {
    movieApiProvider = MovieApiProvider();
  });
  group("Testing movie api provider", () {
    test("Testing fetch movie list", () async {
      Movie fetchResult = await movieApiProvider.fetchMovieList();
      expect(fetchResult, isA<Movie>());
    });
    test("Testing fetch search", () async {
      Movie fetchSearchResult =
          await movieApiProvider.fetchMoviesBySearch("test");
      expect(fetchSearchResult, isA<Movie>());
    });
  });
}
