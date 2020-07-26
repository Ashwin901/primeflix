import 'package:flutter/material.dart';
import 'package:topmovies/constants.dart';
class DataTitle extends StatelessWidget {
  final title;
  DataTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 7.0, left: 15.0, bottom: 7.0),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: style.copyWith(fontSize: 18.0),
          ),
          Icon(
            Icons.play_arrow,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}