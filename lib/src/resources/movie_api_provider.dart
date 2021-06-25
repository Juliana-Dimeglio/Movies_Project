import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import '../utils/string_constants.dart';
import '../model/movie.dart';

class MovieApiProvider {
  Client client = Client();

  Future<Movie> fetchMovieList() async {
    final response = await client.get(Uri.parse(StringConstants.uriPath));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Movie.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
