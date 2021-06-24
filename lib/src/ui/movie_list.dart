import 'package:flutter/material.dart';
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
    return Container();
  }
}
