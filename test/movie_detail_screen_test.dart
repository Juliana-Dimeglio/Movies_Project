import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_project/src/ui/movie_detail_screen.dart';
import 'package:movie_project/src/ui/movie_image.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group("Testing movie detail ", () {
    testWidgets("Testing if the movie detail is correctly created",
        (WidgetTester tester) async {
      final movieDetail = MaterialApp(
        home: MovieDetailScreen(
          overview: "Overview Test",
          originalLanguage: "English",
          posterPath: " ",
          releaseDate: "2/2/2022",
          originalTitle: "Test Title",
          voteAverage: "123",
        ),
      );
      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          Builder(builder: (BuildContext context) {
            return movieDetail;
          }),
        ),
      );
      expect(find.text("Overview Test"), findsOneWidget);
      expect(find.text("Test Title"), findsOneWidget);
      expect(find.text("123"), findsOneWidget);
      expect(find.text("2/2/2022"), findsOneWidget);
      expect(find.text("English"), findsOneWidget);
      expect(find.byType(MovieImage), findsOneWidget);
    });
  });
}
