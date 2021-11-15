import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubdemo/app/root_scene.dart';
import 'package:githubdemo/app/sq_color.dart';

class AppScene extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "书旗小说",
      theme: ThemeData(
        primaryColor:Colors.white, //主题色
        dividerColor: Color(0xffeeeeee), //分割线颜色
          backgroundColor: SQColor.paper,
        textTheme: TextTheme(bodyText1: TextStyle(color:SQColor.darkGray)) //字体主题色
      ),
      home:RootScene(),
    );
  }
}
