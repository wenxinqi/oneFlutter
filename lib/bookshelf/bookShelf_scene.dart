import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:githubdemo/app/sq_color.dart';
import 'package:githubdemo/model/novel.dart';
import 'package:githubdemo/app/request.dart';
import 'package:githubdemo/utility/toast.dart';
import 'package:githubdemo/bookshelf/bookShelf_header.dart';
class BookShelf extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => BookShelfState(); //创建一个state，进行控件操作
}

class BookShelfState extends State<BookShelf> with RouteAware {

  double navAlpha = 0;
  List<Novel> favoriteNovels = [];
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("buguo");
    fetchData();
    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0;
          });
        }
      } else if (offset < 50) {
        setState(() {
          navAlpha = 1 - (50 - offset) / 50;
        });
      } else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: SQColor.white,
      body: AnnotatedRegion(
        value: navAlpha > 0.5 ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            RefreshIndicator(
                child: ListView(
                  padding: EdgeInsets.only(top: 0),
                  controller: scrollController,
                  children: <Widget>[
                    favoriteNovels.isNotEmpty ? BookShelfHeader(favoriteNovels[0]) : Container(),
                  ],
            ),
                onRefresh: fetchData),
          ],
        ),
      ),
    );
  }

  Future<void> fetchData() async{
    try{
      List<Novel> favoriteNovels = [];
      List<dynamic> favoriteResponse = await Request.ge(action:'bookshelf');

      favoriteResponse.forEach((element) {
        print("responseJson111${element}");
        favoriteNovels.add(Novel.fromJson(element));
      });
      setState(() { //更改状态
        print('我的名字叫${favoriteNovels}');
        this.favoriteNovels = favoriteNovels;
      });
    }catch(e){
      Toast.show(e.toString());
    }
  }
}