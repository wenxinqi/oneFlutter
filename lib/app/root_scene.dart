import 'package:flutter/material.dart';
import 'package:githubdemo/me/me_scene.dart';
import 'package:flutter/cupertino.dart';
import 'package:githubdemo/home/home_scene.dart';
import 'package:githubdemo/bookshelf/bookShelf_scene.dart';

class RootScene extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => RootSceneState();
}

class RootSceneState extends State<RootScene>{
  int _tabIndex = 1;
  //设置image
  List<Image> _tabImages = [
    Image.asset('img/tab_bookstore_n.png'),
    Image.asset('img/tab_me_n.png'),
  ];
  List<Image> _tabSelectedImages = [
    Image.asset('img/tab_bookstore_p.png'),
    Image.asset('img/tab_me_p.png'),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //设置内容
      body: IndexedStack(
        children:<Widget> [
          MeScene(),
          HomeScene(),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white, 
        items: [
          BottomNavigationBarItem(icon: getTabIcon(0),label: "我的"),
          BottomNavigationBarItem(icon: getTabIcon(1),label: "书架"),
        ],
        currentIndex: _tabIndex,
        onTap: (index){
          setState(() { //修改状态
            _tabIndex = index;
          });
        },
      ),
    );
  }
  Image getTabIcon(int index){
    if (index == _tabIndex){
      return _tabSelectedImages[index];
    }else{
      return _tabImages[index];
    }
  }
}