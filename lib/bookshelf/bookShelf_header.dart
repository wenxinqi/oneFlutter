import 'package:flutter/material.dart';
import 'package:githubdemo/bookshelf/bookshelf_cloud_widget.dart';
import 'package:githubdemo/public.dart';
import 'package:githubdemo/bookshelf/bookShelf_scene.dart';
import 'package:githubdemo/widget/novel_cover_image.dart';

class BookShelfHeader extends StatefulWidget{
  final Novel novel;
  BookShelfHeader(this.novel);

  @override
  _BookShelfHeaderState createState() => _BookShelfHeaderState();
}

class _BookShelfHeaderState extends State<BookShelfHeader> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    //设置动画
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed){
        controller.reverse();
      } else if (status == AnimationStatus.dismissed){
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var width = Screen.width;
    var bgHeight = width / 0.9;
    var height = Screen.topSafeHeight + 250;
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top:height - bgHeight,
              child: Image.asset("img/bookshelf_bg.png",fit: BoxFit.cover,width: width,height: bgHeight),
          ),
          Positioned(
              child: BookshelfCloudWidget(
                animation: animation,
                width: width,
              ),
          ),
          buildContent(context),
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context){
    Novel novel = this.widget.novel;
    var width = Screen.width;
    return Container(
      width: width,
      padding: EdgeInsets.fromLTRB(15, 54 + Screen.topSafeHeight, 10, 0),
      color:Colors.transparent,
      child: GestureDetector(
        onTap: (){
        // TODO： 跳转到详情
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(boxShadow: Styles.borderShadow),
              child: NovelCoverImage(novel.imgUrl,width: 120,height: 160),
            ),
            SizedBox(width: 20),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 40),
                    Text(novel.name,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text('读至0.2%     继续阅读 ', style: TextStyle(fontSize: 14, color: SQColor.paper)),
                        Image.asset('img/bookshelf_continue_read.png'),
                      ],
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}