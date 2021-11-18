import 'package:flutter/material.dart';
import 'package:githubdemo/home/home_model.dart';
import 'package:githubdemo/home/home_novel_cover_view.dart';

class NovelFourGridView extends StatelessWidget{
  final HomeModule cardInfo;
  NovelFourGridView(this.cardInfo);
  @override
  Widget build(BuildContext context) {
    var novels = cardInfo.books;
    if (novels!.length < 8){
        return Container();
    }
    var children = novels.map((novel) => HomeNovelCoverView(novel)).toList();
    // TODO: implement build
    return Container(
      color:Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

        ],
      ),
    );
  }
}