import '../utils/numeric_constants.dart';

import 'result.dart';

class Movie {
  int page;
  int totalResults;
  int totalPages;

  List<Result> results;

  Movie({
    this.totalResults = NumericConstants.zeroValue,
    this.page = NumericConstants.zeroValue,
    this.totalPages = NumericConstants.zeroValue,
    required this.results,
  });

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    var resultsJsonList = parsedJson['results'] as List;
    List<Result> resultList = [];
    for (int i = 0; i < resultsJsonList.length; i++) {
      resultList.add(Result.fromJson(resultsJsonList[i]));
    }

    return Movie(
      totalResults: parsedJson['total_results'],
      page: parsedJson['page'],
      totalPages: parsedJson['total_pages'],
      results: resultList,
    );
  }
}
