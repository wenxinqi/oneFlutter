import 'package:flutter/material.dart';
import 'package:githubdemo/home/home_model.dart';
import 'package:githubdemo/home/home_section_view.dart';
import 'package:githubdemo/home/novel_cell.dart';
import 'package:githubdemo/home/novel_grid_item.dart';

class NovelFirsthybirdCard extends StatelessWidget{
  final HomeModule cardInfo;
  NovelFirsthybirdCard(this.cardInfo);

  @override
  Widget build(BuildContext context) {
    var novels = cardInfo.books;
    if (novels!.length < 3){
          return Container();
    }

    List<Widget> children = [];
    var bottomNovels = novels.sublist(1);
    bottomNovels.forEach((element) {
      children.add(NovelGridItem(element));
    });
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          HomeSectionView(cardInfo.name),
          NovelCell(novels[0]),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Wrap(spacing: 15,runSpacing: 15,children: children),
          ),
          Container(
            height: 10,
            color:Color(0xfff5f5f5),
          ),
        ],
      ),
    );
  }
}