import 'package:flutter/material.dart';

class DataListView extends StatelessWidget {
  final topMovieData;
  DataListView({this.topMovieData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView.builder(
          itemCount: topMovieData["items"].length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin:
              EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0, bottom: 2.0),
              height: 20,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Image.network(
                      topMovieData["items"][index]["image"],
                      fit: BoxFit.fill,
                      height: 120,
                      width: 130,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}