import 'package:flutter/material.dart';

class HomeSectionView extends StatelessWidget{
  final String title;
  HomeSectionView(this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
      child: Row(
        children: [
          Image.asset('img/home_tip.png'),
          SizedBox(width: 10),
          Text(
            '$title',
            style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}