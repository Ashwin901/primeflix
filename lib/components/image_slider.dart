import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:topmovies/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatefulWidget {
  final movieData;
  final topMovieData;
  ImageSlider({this.movieData,this.topMovieData});
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  var movieData;
  var topMovieData;

  @override
  void initState() {
    // TODO: implement initState
    movieData = widget.movieData;
    topMovieData = widget.topMovieData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          image: NetworkImage(movieData["items"][index]["image"]),
                          fit: BoxFit.fill
                        )
                      ),
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
        Padding(
          padding: EdgeInsets.only(top: 7.0, left: 15.0, bottom: 7.0),
          child: Row(
            children: <Widget>[
              Text(
                "top 250 movies",
                style: style.copyWith(fontSize: 18.0),
              ),
              Icon(
                Icons.play_arrow,
                color: Colors.white,
              )
            ],
          ),
        ),
      SizedBox(
        height: 5.0,
      ),
        Container(
          height: 200.0,
          child: ListView.builder(itemCount: topMovieData["items"].length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index){
            return Container(
              margin: EdgeInsets.all(6.0),
              height:20,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Image.network(topMovieData["items"][index]["image"],
                      fit: BoxFit.fill,
                      height: 120,
                      width: 130,
                    ),
                  ],
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}