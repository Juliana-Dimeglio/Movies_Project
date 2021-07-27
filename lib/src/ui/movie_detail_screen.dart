import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'movie_image.dart';
import '../utils/numeric_constants.dart';
import '../utils/string_constants.dart';
import '../utils/styles.dart';

class MovieDetailScreen extends StatelessWidget {
  final String originalTitle;
  final String releaseDate;
  final String posterPath;
  final String voteAverage;
  final String originalLanguage;
  final String overview;

  MovieDetailScreen({
    required this.overview,
    required this.originalLanguage,
    required this.posterPath,
    required this.releaseDate,
    required this.originalTitle,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: NumericConstants.paddingEdit,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      NumericConstants.borderRadiusTitle,
                    ),
                  ),
                  color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(
                  NumericConstants.paddingTitleDetail,
                ),
                child: Text(
                  originalTitle,
                  style: TextStyle(
                    fontSize: NumericConstants.fontSizeTitleDetail,
                    fontFamily: StringConstants.fontFamilyTitleDetail,
                  ),
                ),
              ),
            ),
            Text(
              releaseDate,
              style: TextStyle(
                color: Colors.pink.shade100,
                fontSize: NumericConstants.fontSizeReleaseDate,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: NumericConstants.marginPoster,
              ),
              height: NumericConstants.heightPosterDetail,
              child: MovieImage(
                posterPath: posterPath,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  voteAverage,
                  style: TextStyle(
                    fontSize: NumericConstants.fontSizeInfoDetail,
                    color: Colors.pink.shade100,
                  ),
                ),
                Text(
                  originalLanguage,
                  style: TextStyle(
                    color: Colors.pink.shade100,
                    fontSize: NumericConstants.fontSizeInfoDetail,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: NumericConstants.paddingOverviewVertical,
                horizontal: NumericConstants.paddingOverviewHorizontal,
              ),
              child: Text(
                overview,
                style: TextStyle(
                  fontSize: NumericConstants.fontSizeOverview,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: NumericConstants.paddingButton,
              ),
              child: Text(
                StringConstants.buttonText,
                style: TextStyle(
                  fontSize: NumericConstants.textButtonSize,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
