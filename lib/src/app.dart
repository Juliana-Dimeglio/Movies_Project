import 'package:flutter/material.dart';
import 'bloc/movies_bloc.dart';
import 'ui/movie_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: MovieList(
          movieBloc: MoviesBloc(),
        ),
      ),
    );
  }
}
