import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:topmovies/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'complete_Data.dart';

class ImageSlider extends StatefulWidget {
  final movieData;
  final topMovieData;
  final theatreData;
  final popularMoviesData;
  final topTvData;
  final popularTvData;
  ImageSlider(
      {this.movieData,
      this.topMovieData,
      this.theatreData,
      this.popularMoviesData,
      this.topTvData,
      this.popularTvData});
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  var movieData;
  var topMovieData;
  var theatreData;
  var popularMoviesData;
  var topTvData;
  var popularTvData;
  @override
  void initState() {
    // TODO: implement initState
    movieData = widget.movieData;
    topMovieData = widget.topMovieData;
    theatreData = widget.theatreData;
    popularMoviesData = widget.popularMoviesData;
    topTvData = widget.topTvData;
    popularTvData = widget.popularTvData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 4.0, left: 15.0, bottom: 7.0),
            child: Row(
              children: <Widget>[
                Text(
                  "coming soon",
                  style: style.copyWith(fontSize: 18.0),
                ),
                Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Container(
              child: CarouselSlider.builder(
                  itemCount: movieData["items"].length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    movieData["items"][index]["image"]),
                                fit: BoxFit.fill)),
                        width: 2000,
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        child: Container(),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 2000),
                    pauseAutoPlayOnTouch: true,
                  ))),
          CompleteData(
            title: "top 250 movies",
            data: topMovieData,
          ),
          popularMoviesData == null
              ? Container
              : CompleteData(title: "popular movies", data: popularMoviesData),
          CompleteData(title: "top Tv", data : topTvData),
          CompleteData(title: "popular Tv", data :popularTvData),
          theatreData == null
              ? Container
              : CompleteData(title: "in theatres", data: theatreData),
        ],
      ),
    );
  }
}








