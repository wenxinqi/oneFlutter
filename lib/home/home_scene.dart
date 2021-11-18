import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:githubdemo/app/sq_color.dart';
import 'package:githubdemo/home/home_list_view.dart';

class HomeScene extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomeSceneState(); //创建一个state，进行控件操作
}

class HomeSceneState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            title: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TabBar(
                labelColor: SQColor.darkGray,
                labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                unselectedLabelColor: SQColor.gray,
                indicatorColor: SQColor.secondary,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                indicatorPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
                tabs: [
                  Tab(text: '精选'),
                  Tab(text: '女生'),
                  Tab(text: '男生'),
                  Tab(text: '漫画'),
                ],
              ),
            ),
            backgroundColor: SQColor.white,
            elevation: 0,
          ),
          body: TabBarView(children: [
            HomeListView(HomeListType.excellent),
            HomeListView(HomeListType.female),
            HomeListView(HomeListType.male),
            HomeListView(HomeListType.cartoon),
          ]),
        ),
    );
  }
}