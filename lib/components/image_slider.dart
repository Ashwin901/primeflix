import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:topmovies/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatefulWidget {
  final movieData;
  final topMovieData;
  final theatreData;
  final popularMoviesData;
  ImageSlider(
      {this.movieData,
      this.topMovieData,
      this.theatreData,
      this.popularMoviesData});
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  var movieData;
  var topMovieData;
  var theatreData;
  var popularMoviesData;
  @override
  void initState() {
    // TODO: implement initState
    movieData = widget.movieData;
    topMovieData = widget.topMovieData;
    theatreData = widget.theatreData;
    popularMoviesData = widget.popularMoviesData;
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
          theatreData == null ? Container:
          CompleteData(title: "in theatres", data: theatreData),
        ],
      ),
    );
  }
}

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
