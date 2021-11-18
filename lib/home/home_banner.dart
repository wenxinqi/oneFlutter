import 'package:flutter/material.dart';
import 'package:githubdemo/home/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:githubdemo/public.dart';

class HomeBanner extends StatelessWidget{
  final List<CarouselInfo> carouseInfos;
  HomeBanner(this.carouseInfos);
  @override
  Widget build(BuildContext context) {
    if (carouseInfos.length == 0){
          return  SizedBox();
    }
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: CarouselSlider(
        items: carouseInfos.map((info) {
          return Builder(
              builder: (BuildContext context){
                return Container(
                  width: Screen.width,
                  margin: EdgeInsets.symmetric(),
                  child: Image.network(
                    info.imageUrl,
                    fit: BoxFit.cover,
                  ),
                );
              },
          );
        }).toList(),
        options: CarouselOptions(
          aspectRatio: 2,
          autoPlay: true,
        ),
      ),
    );
  }
}