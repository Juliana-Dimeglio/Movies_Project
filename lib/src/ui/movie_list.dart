import 'package:flutter/material.dart';
import 'movie_image.dart';
import 'movie_detail.dart';
import '../utils/styles.dart';
import '../utils/numeric_constants.dart';
import '../model/movie.dart';
import '../utils/string_constants.dart';
import '../bloc/movies_bloc.dart';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MovieListState();
  }
}

class _MovieListState extends State<MovieList> {
  final movieBloc = MoviesBloc();

  @override
  void initState() {
    super.initState();
    movieBloc.fetchAllMovies();
  }

  @override
  void dispose() {
    movieBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringConstants.mainMovieTitle,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundColor,
        ),
        child: StreamBuilder(
          stream: movieBloc.allMovies,
          builder: (context, AsyncSnapshot<Movie> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(
                snapshot.error.toString(),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget buildList(Movie data) {
    return GridView.builder(
        itemCount: data.results.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: NumericConstants.crossAxisCount,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailScreen(
                    voteAverage: StringConstants.ratingText +
                        data.results[index].voteAverage.toString(),
                    posterPath: data.results[index].posterPath!,
                    releaseDate: StringConstants.releaseDateText +
                        data.results[index].releaseDate,
                    originalTitle: data.results[index].originalTitle,
                    originalLanguage: StringConstants.languageText +
                        data.results[index].originalLanguage,
                    overview: data.results[index].overview,
                  ),
                ),
              );
            },
            child: GridTile(
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: NumericConstants.marginImages,
                ),
                child: MovieImage(
                  posterPath: data.results[index].posterPath!,
                ),
              ),
            ),
          );
        });
  }
}
