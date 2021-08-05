import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_project/src/utils/styles.dart';
import 'package:movie_widgets/movie_widgets.dart';
import '../utils/numeric_constants.dart';
import '../utils/string_constants.dart';

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
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              OriginalTitle(
                originalTitle: originalTitle,
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
                  imageUrl: posterPath,
                ),
              ),
              MoviesInformation(
                voteAverage: voteAverage,
                originalLanguage: originalLanguage,
              ),
              Overview(
                overview: overview,
              ),
            ],
          ),
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
