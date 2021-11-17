import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:githubdemo/app/sq_color.dart';

class NovelCoverImage extends StatelessWidget {
  final String imgUrl;
  final double width;
  final double height;

  NovelCoverImage(this.imgUrl,{required this.width,required this.height});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Image(
        image: CachedNetworkImageProvider(imgUrl),
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
      decoration: BoxDecoration(border: Border.all(color: SQColor.paper)),
    );
  }
}