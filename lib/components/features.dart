import 'package:flutter/material.dart';
import 'package:topmovies/constants.dart';

class Features extends StatefulWidget {
  final Icon icon;
  final feature;
  final  func;
  Features({this.icon,this.feature, this.func});

  @override
  _FeaturesState createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: widget.icon,
          iconSize: 22.0,
          onPressed:widget.func,
        ),

        Text(widget.feature,
          style: style,
        )
      ],
    );
  }
}