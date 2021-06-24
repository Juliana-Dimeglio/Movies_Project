class Result {
  int _voteCount = 0;
  int _id = 0;
  late bool _video;
  String _voteAverage = "";
  String _title = "";
  double _popularity = 0;
  String _posterPath = "";
  String _originalLanguage = "";
  String _originalTitle = "";
  late List<int> _genreIds = [];
  String? _backdropPath = "";
  late bool _adult;
  String _overview = "";
  String? _releaseDate = "";

  Result(result) {
    _voteCount = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _voteAverage = result['vote_average'].toString();
    _title = result['title'];
    _popularity = result['popularity'];
    _posterPath = result['poster_path'];
    _originalLanguage = result['original_language'];
    _originalTitle = result['original_title'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genreIds.add(result['genre_ids'][i]);
    }
    _backdropPath = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _releaseDate = result['release_date'];
  }

  String? get releaseDate => _releaseDate;

  String get overview => _overview;

  bool get adult => _adult;

  String? get backdropPath => _backdropPath;

  List<int> get genreIds => _genreIds;

  String get originalTitle => _originalTitle;

  String get originalLanguage => _originalLanguage;

  String get posterPath => _posterPath;

  double get popularity => _popularity;

  String get title => _title;

  String get voteAverage => _voteAverage;

  bool get video => _video;

  int get id => _id;

  int get voteCount => _voteCount;
}
