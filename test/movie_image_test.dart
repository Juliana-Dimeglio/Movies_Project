import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_project/src/ui/movie_image.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group("Testing movie image", () {
    testWidgets("Testing if the movie image works correctly",
        (WidgetTester tester) async {
      final movieImage = MaterialApp(
        home: MovieImage(
          posterPath: "image test",
        ),
      );
      await mockNetworkImagesFor(
        () => tester.pumpWidget(movieImage),
      );
      expect(find.byType(MovieImage), findsOneWidget);
    });
  });
}
