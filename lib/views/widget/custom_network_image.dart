import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget customNetworkImage(String? path, {BoxFit fit = BoxFit.cover}) {
  return CachedNetworkImage(
    fit: fit,
    imageUrl: path!,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: fit,
        ),
      ),
    ),
    placeholderFadeInDuration: Duration(milliseconds: 500),
    placeholder: (context, url) => Container(
      color: Color(0xffeeeeee),
    ),
    errorWidget: (context, url, error) => Image.network(
      'http://edenchristianacademy.co.nz/wp-content/uploads/2013/11/dummy-image-portrait.jpg',
      fit: BoxFit.cover,
    ),
  );
}
