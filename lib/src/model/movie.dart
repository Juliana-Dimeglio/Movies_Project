import 'result.dart';

class Movie {
  int _page = 0;
  int _totalResults = 0;
  int _totalPages = 0;
  List<Result> _results = [];

  Movie.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];
    List<Result> temporalList = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      Result result = Result(parsedJson['results'][i]);
      temporalList.add(result);
    }
    _results = temporalList;
  }

  List<Result> get results => _results;

  int get totalPages => _totalPages;

  int get totalResults => _totalResults;

  int get page => _page;
}
