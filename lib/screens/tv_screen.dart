import 'package:flutter/material.dart';
import 'package:topmovies/components/image_slider.dart';
import 'package:topmovies/constants.dart';

class TvScreen extends StatefulWidget {
  final topTvData, popularTvData;
  TvScreen({this.popularTvData,this.topTvData});
  @override
  _TvScreenState createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  var topTvData, popularTvData;

  @override
  void initState() {
    // TODO: implement initState
    topTvData = widget.topTvData;
    popularTvData = widget.popularTvData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,
        color: Colors.white,
        ),
        centerTitle: true,
        elevation: 8,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("primeflix",
        style: style,
        ),
      ),
    body: SingleChildScrollView(child: ImageSlider(movieData: topTvData,topMovieData: popularTvData,theatreData: null,popularMoviesData: null,))

    );
  }
}
