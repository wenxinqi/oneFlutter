import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:githubdemo/app/sq_color.dart';
import 'package:githubdemo/model/novel.dart';
import 'package:githubdemo/app/request.dart';
import 'package:githubdemo/utility/toast.dart';
import 'package:githubdemo/bookshelf/bookShelf_header.dart';
import 'package:githubdemo/bookshelf/bookshelf_item_view.dart';
import 'package:githubdemo/public.dart';
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

  Widget buildFavoriteView(){
    if (favoriteNovels.length <= 1){
      return Container();
    }
    List<Widget> children = [];
    var novels = favoriteNovels.sublist(1);
    novels.forEach((element) { 
      children.add(BookshelfItemView(element));
    });

    var width = (Screen.width - 15*2 - 24*2)/3;
    children.add(GestureDetector(
      onTap: (){
        // eventBus.emit(Eve);
      },
      child: Container(
        color: SQColor.paper,
        width: width,
        height: width/0.75,
        child: Image.asset("img/bookshelf_add.png"),
      ),
    ));
    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
      child: Wrap(
        spacing: 23,
        children: children,
      ),
    );
  }
  Widget buildActions(Color iconColor) {
    return Row(children: <Widget>[
      Container(
        height: kToolbarHeight,
        width: 44,
        child: Image.asset('img/actionbar_checkin.png', color: iconColor),
      ),
      Container(
        height: kToolbarHeight,
        width: 44,
        child: Image.asset('img/actionbar_search.png', color: iconColor),
      ),
      SizedBox(width: 15)
    ]);
  }
  
  Widget buildNavigationBar(){
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          child: Container(
            margin: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
            child: buildActions(SQColor.white),
          ),
        ),
        Opacity(
            opacity: navAlpha,
            child: Container(
              padding: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0 , 0),
              height: Screen.navigationBarHeight,
              color: SQColor.white,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 103),
                  Expanded(
                      child: Text(
                    '书架',
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    ),
                  ),
                  buildActions(SQColor.darkGray),
                ],
              ),
            ),
        ),
      ],
    );
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
                    buildFavoriteView(),
                  ],
              ),
                onRefresh: fetchData
            ),
            buildNavigationBar(),
          ],
        ),
      ),
    );
  }

  Future<void> fetchData() async{
    try{
      List<Novel> favoriteNovels = [];
      List<dynamic> favoriteResponse = await Request.get(action:'bookshelf');

      favoriteResponse.forEach((element) {
        favoriteNovels.add(Novel.fromJson(element));
      });
      setState(() { //更改状态
        this.favoriteNovels = favoriteNovels;
      });
    }catch(e){
      Toast.show(e.toString());
    }
  }
}