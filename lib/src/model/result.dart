import '../utils/numeric_constants.dart';
import '../utils/string_constants.dart';

class Result {
  int voteCount;
  int id;
  late bool video;
  var voteAverage;
  String title;
  double popularity;
  String? posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String? backdropPath;

  bool adult;
  String overview;
  String releaseDate;

  Result({
    this.voteCount = NumericConstants.zeroValue,
    this.id = NumericConstants.zeroValue,
    this.video = false,
    this.voteAverage = NumericConstants.zeroDoubleValue,
    this.title = StringConstants.emptyString,
    this.popularity = NumericConstants.zeroDoubleValue,
    this.posterPath,
    this.originalLanguage = StringConstants.emptyString,
    this.originalTitle = StringConstants.emptyString,
    required this.genreIds,
    this.backdropPath,
    this.adult = false,
    this.overview = StringConstants.emptyString,
    this.releaseDate = StringConstants.emptyString,
  });

  factory Result.fromJson(Map<String, dynamic> parsedJson) {
    var genresJsonList = parsedJson['genre_ids'] as List;
    List<int> genresList = [];
    for (int i = 0; i < genresJsonList.length; i++) {
      genresList.add(genresJsonList[i]);
    }

    return Result(
      voteCount: parsedJson['vote_count'],
      id: parsedJson['id'],
      video: parsedJson['video'],
      voteAverage: double.tryParse(parsedJson['vote_average'].toString()),
      title: parsedJson['title'],
      popularity: parsedJson['popularity'],
      posterPath: parsedJson['poster_path'] != null
          ? StringConstants.imageUrl + parsedJson['poster_path']
          : StringConstants.imageNotFound,
      originalLanguage: parsedJson['original_language'],
      originalTitle: parsedJson['original_title'],
      backdropPath: parsedJson['backdrop_path'] != null
          ? StringConstants.imageUrl + parsedJson['backdrop_path']
          : StringConstants.imageNotFound,
      adult: parsedJson['adult'],
      overview: parsedJson['overview'],
      releaseDate:
          parsedJson['release_date'] ?? StringConstants.releaseDateNull,
      genreIds: genresList,
    );
  }
}
