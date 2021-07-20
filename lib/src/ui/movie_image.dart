import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../utils/numeric_constants.dart';
import '../utils/string_constants.dart';

class MovieImage extends StatelessWidget {
  final String posterPath;
  final BoxFit imageFit;

  const MovieImage({
    Key? key,
    required this.posterPath,
    this.imageFit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: imageFit,
      child: CachedNetworkImage(
        placeholder: (context, url) => Image.asset(
          StringConstants.defaultImage,
        ),
        imageUrl: posterPath,
        errorWidget: (context, url, error) => Image.asset(
          StringConstants.errorImage,
        ),
      ),
    );
  }
}
