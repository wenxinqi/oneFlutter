import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:githubdemo/app/sq_color.dart';

class BookShelf extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => BookShelfState(); //创建一个state，进行控件操作
}

class BookShelfState extends State<BookShelf> with RouteAware {

  double navAlpha = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: SQColor.white,
      body: AnnotatedRegion(
        value: navAlpha > 0.5 ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            RefreshIndicator(child: ListView(), onRefresh: fetchData,)
          ],
        ),
      ),
    );
  }

  Future<void> fetchData() async{
    try{

    }catch(e){

    }
  }
}