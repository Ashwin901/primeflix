import 'package:flutter/material.dart';
import 'data_title.dart';
import 'data_listview.dart';

class CompleteData extends StatefulWidget {
  final data, title;
  CompleteData({this.data, this.title});
  @override
  _CompleteDataState createState() => _CompleteDataState();
}

class _CompleteDataState extends State<CompleteData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DataTitle(
          title: widget.title,
        ),
        SizedBox(
          height: 5.0,
        ),
        DataListView(topMovieData: widget.data)
      ],
    );
  }
}