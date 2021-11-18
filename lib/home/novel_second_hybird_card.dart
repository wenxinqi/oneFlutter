import 'package:flutter/material.dart';
import 'package:githubdemo/home/home_model.dart';
import 'package:githubdemo/home/home_novel_cover_view.dart';
import 'package:githubdemo/home/home_section_view.dart';
import 'package:githubdemo/home/novel_grid_item.dart';

class NovelSecondHybirdCard extends StatelessWidget{
  final HomeModule cardInfo;
  NovelSecondHybirdCard(this.cardInfo);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var novels = cardInfo.books;
    if (novels!.length < 5){
          return Container();
    }
    
    var topNovels = novels.sublist(0,4);
    List<Widget> children = [];
    topNovels.forEach((element) { 
      children.add(HomeNovelCoverView(element));
    });
    
    var bottomNovels = novels.sublist(4);
    bottomNovels.forEach((element) { 
      children.add(NovelGridItem(element));
    });

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          HomeSectionView(cardInfo.name),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Wrap(spacing: 15,runSpacing: 15,children: children),
          ),
          Container(
            height: 10,
            color: Color(0xfff5f5f5),
          ),
        ],
      ),
    );
  }
}