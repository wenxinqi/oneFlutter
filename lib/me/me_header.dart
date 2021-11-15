import 'package:flutter/material.dart';
import 'package:githubdemo/app/sq_color.dart';

class MeHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
    //TODO: 点击事件处理
      },
      child: Container(
        color:SQColor.white,
        padding: EdgeInsets.fromLTRB(20, 30, 15, 15), //设置四周的边距
        child: Row(
          children:<Widget>[
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('img/placeholder_avatar.png'),
              ),
            SizedBox(width: 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '登录',
                    style:TextStyle(fontSize:10),
                  ),
                  SizedBox(height: 10),
                  buildItems(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItems(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        buildItem('0.0', '书豆余额'),
        buildItem('0', '书券（张）'),
        buildItem('0', '月票'),
      ],
    );
  }

  Widget buildItem(String title,String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget>[
        Text(
          title,
          style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          subtitle,
          style: TextStyle(fontSize: 12,color: SQColor.gray),
        ),
      ],
    );
  }
}