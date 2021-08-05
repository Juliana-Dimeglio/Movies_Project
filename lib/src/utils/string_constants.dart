abstract class StringConstants {
  static const String apiKey = "1124adc80a8b854f1da261e38d081ce3";
  static const String uriPath =
      "http://api.themoviedb.org/3/movie/popular?api_key=" +
          apiKey +
          "&language=en-US&page=1";
  static const String uriPathSearch =
      "https://api.themoviedb.org/3/search/movie?api_key=" +
          apiKey +
          "&language=en-US&query=";
  static const String uriPathSearchQuery = "&page=1&include_adult=false";
  static const String imageUrl = "https://image.tmdb.org/t/p/original";
  static const String releaseDateText = "Release date: ";
  static const String ratingText = "Rating: ";
  static const String languageText = "Language: ";
  static const String mainMovieTitle = "Popular Movies";
  static const String buttonText = "Back";
  static const String emptyString = "";
  static const String imageNotFound =
      "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAJFBMVEX4+vvb4OTx9PXl6ezf4+f19/nt8PLz9vfq7fDi5unc4eTs7/GWhAgrAAACGUlEQVR4nO3b23KqMBiAUQEtsn3/961OtydIJEUmaXCtS7n5v5FTEHc7AAAAAAAAAAAAAAAAAAAAAAAAzvr2PX3pgNf6oXnf8Icjjyv0XZxKh8R8rRTYNF+lU8IOqwU2zaF0TNBa++jFsXRM0H7Fwn3pmKAVA5umdEzQhxXuT/3h0B7/bbbwdrpfevopGRIVnq/dZOHT1WzZfUCpiJdu040uZovuVcskzIhNt2g/LVIw5zrcENuwmcLJHdeS3bREwKzrcJO1z+YKJ99h/IZ138bOtCUCZl2HSz8OL/fXkTVXgfnnxaaLnkt/FhDhxPzjJ7hNNzoQY4fhdYUUTMw+fYr7eEn3NPclYCgx+/QpwvPF9tHHNW4gMffwSR4HbK8fxtYWz4v4aWL26VM8F5z68/cXXTuNn1JMEosUzInVJAROEwvMP++dwEli9ulTvBU4Tsw8e5r3AkeJWSdPFaoZ+lNq4HNixrnTBQK73eSC+OpZ7+H+aC7X0L8SDhwlvn6Y3VVW2P3f0KYG1lbY3ba0iYGVFXYPm9q0wLoKu6dtbVJgVYXdaGOb9ItZRYXjwPMyMeUnwXoKp4FpqilcGlhN4eRhW7JaChd/hQpLU5hAYWEfVDgsfrl0qKRwDaVjghTWX7j9dxO3/37pmrtp6ZSIzb/nvdtNnm8v9Gff1f+A/1tcbPw/MwAAAAAAAAAAAAAAAAAAAAAAALl8A7+jEA62Pbx2AAAAAElFTkSuQmCC";
  static const String labelSearchBar = "Search";
  static const String releaseDateNull = "XX/XX/XXXX";
  static const String fontFamilyTitleDetail = "cursive";
  static const String defaultImage = "assets/movie_poster.png";
  static const String errorImage = "assets/error_image.png";
}
