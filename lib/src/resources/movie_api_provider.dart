import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import '../utils/numeric_constants.dart';
import '../utils/string_constants.dart';
import '../model/movie.dart';

class MovieApiProvider {
  Client client = Client();

  Future<Movie> fetchMovieList() async {
    final response = await client.get(Uri.parse(StringConstants.uriPath));

    if (response.statusCode == NumericConstants.statusResponse) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Movie> fetchMoviesBySearch(String query) async {
    final response = await client.get(
      Uri.parse(
        StringConstants.uriPathSearch +
            query +
            StringConstants.uriPathSearchQuery,
      ),
    );
    if (response.statusCode == NumericConstants.statusResponse) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
