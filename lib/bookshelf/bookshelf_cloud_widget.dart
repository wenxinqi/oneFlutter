// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:githubdemo/public.dart';

class BookshelfCloudWidget extends AnimatedWidget{
  final double width;
  BookshelfCloudWidget({required Animation<double> animation,required this.width}) : super(listenable: animation);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var width = Screen.width;
    final Animation<double> animation = listenable as Animation<double>;;
    return Container(
      width: width,
      height: width * 0.73,
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: <Widget>[
          Positioned(
            child: Image.asset("img/bookshelf_cloud_0.png",fit: BoxFit.cover,width: width),
            bottom: -30,
          ),
          Positioned(
            bottom: animation.value * -5,
            child: Opacity(
                opacity: animation.value,
                child: Image.asset("img/bookshelf_cloud_1.png",fit: BoxFit.cover,width: width),
              ),
          ),
          Positioned(
            bottom: (1 - animation.value) * -10,
            child: Opacity(
              opacity: animation.value,
              child: Image.asset("img/bookshelf_cloud_2.png",fit: BoxFit.cover,width: width),
            ),
          ),
          Positioned(
            bottom: (animation.value - 0.5).abs() * -15,
            child: Opacity(
              opacity: animation.value,
              child: Image.asset("img/bookshelf_cloud_3.png",fit: BoxFit.cover,width: width),
            ),
          ),
        ],
      ),
    );
  }
}