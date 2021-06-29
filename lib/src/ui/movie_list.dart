import 'package:flutter/material.dart';
import '../utils/numeric_constants.dart';
import '../model/movie.dart';
import '../utils/string_constants.dart';
import '../bloc/movies_bloc.dart';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieListState();
  }
}

class MovieListState extends State<MovieList> {
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
          'Popular Movies',
        ),
      ),
      body: StreamBuilder(
        stream: movieBloc.allMovies,
        builder: (context, AsyncSnapshot<Movie> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot.data);
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

  Widget buildList(Movie? data) {
    return GridView.builder(
        itemCount: data?.results.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: NumericConstants.crossAxisCount,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: NumericConstants.marginImages,
              ),
              child: Image.network(
                StringConstants.imageUrl + '${data?.results[index].posterPath}',
                fit: BoxFit.contain,
              ),
            ),
          );
        });
  }
}
