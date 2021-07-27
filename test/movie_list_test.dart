import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_project/src/bloc/movies_bloc.dart';
import 'package:movie_project/src/model/movie.dart';
import 'package:movie_project/src/resources/movie_repository.dart';
import 'package:movie_project/src/ui/movie_list.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'movie_list_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late Movie movie;
  late MoviesBloc bloc;
  late MockMovieRepository repository;
  setUp(() {
    movie = Movie(
      results: [],
    );
    repository = MockMovieRepository();
    bloc = MoviesBloc(repository);
    when(repository.fetchAllMovies()).thenAnswer((_) async => movie);
  });
  group("Testing movie list", () {
    testWidgets(
        "Testing if the grid view is build correctly with empty movie list",
        (WidgetTester tester) async {
      final homePage = MaterialApp(
        home: MovieList(movieBloc: bloc),
      );
      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          Builder(builder: (BuildContext context) {
            return homePage;
          }),
        ),
      );
      await tester.pump();
      expect(find.byType(GridView), findsOneWidget);
    });
  });
}
