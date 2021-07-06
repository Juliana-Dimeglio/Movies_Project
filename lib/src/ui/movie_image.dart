import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../utils/numeric_constants.dart';
import '../utils/string_constants.dart';

class MovieImage extends StatelessWidget {
  final String posterPath;

  const MovieImage({
    Key? key,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => Image.asset(
        StringConstants.defaultImage,
        fit: BoxFit.cover,
      ),
      imageUrl: posterPath,
      errorWidget: (context, url, error) => Container(
        margin: EdgeInsets.symmetric(
          vertical: NumericConstants.marginPoster,
        ),
        height: NumericConstants.heightPosterDetail,
        child: Image.asset(
          StringConstants.errorImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
