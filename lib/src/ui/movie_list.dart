import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'movie_image.dart';
import 'movie_detail.dart';
import '../utils/styles.dart';
import '../utils/numeric_constants.dart';
import '../model/movie.dart';
import '../utils/string_constants.dart';
import '../bloc/movies_bloc.dart';

class MovieList extends StatefulWidget {
  final MoviesBloc movieBloc;

  MovieList({
    required this.movieBloc,
  });

  @override
  State<StatefulWidget> createState() {
    return _MovieListState();
  }
}

class _MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    widget.movieBloc.fetchAllMovies();
  }

  @override
  void dispose() {
    widget.movieBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text(
          StringConstants.mainMovieTitle,
        ),
        bottom: PreferredSize(
          preferredSize: Size(
            NumericConstants.searchBarHeight,
            AppBar().preferredSize.height,
          ),
          child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.grey.withOpacity(
                NumericConstants.opacityColorInputSearch,
              ),
              filled: true,
              suffixIcon: Icon(
                Icons.search,
              ),
              hintText: StringConstants.labelSearchBar,
            ),
            onSubmitted: (query) {
              widget.movieBloc.fetchMoviesBySearch(query);
            },
          ),
        ),
      ),
      body: StreamBuilder<Movie>(
        stream: widget.movieBloc.allMovies,
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
    );
  }

  Widget buildList(Movie data) {
    return GridView.builder(
      itemCount: data.results.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: NumericConstants.crossAxisCount,
      ),
      itemBuilder: (BuildContext context, int index) {
        return OpenContainer(
          closedColor: Colors.black,
          transitionType: ContainerTransitionType.fadeThrough,
          transitionDuration: Duration(
            seconds: NumericConstants.animationDuration,
          ),
          openBuilder: (context, _) => MovieDetailScreen(
            overview: data.results[index].overview,
            originalLanguage: StringConstants.languageText +
                data.results[index].originalLanguage,
            posterPath: data.results[index].posterPath!,
            releaseDate: StringConstants.releaseDateText +
                data.results[index].releaseDate,
            originalTitle: data.results[index].originalTitle,
            voteAverage: StringConstants.ratingText +
                data.results[index].voteAverage.toString(),
          ),
          closedBuilder: (context, VoidCallback openContainer) => InkWell(
            onTap: () {
              openContainer();
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
          ),
        );
      },
    );
  }
}
