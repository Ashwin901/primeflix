import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:topmovies/constants.dart';
import 'package:topmovies/screens/tv_screen.dart';
import 'package:topmovies/screens/search_screen.dart';
import 'package:topmovies/components/image_slider.dart';

class MovieScreen extends StatefulWidget {
  final movieData;
  final topMovieData;
  MovieScreen({this.movieData,this.topMovieData});
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  int selectedIndex ;
  List<BottomNavigationBarItem> items;

  @override
  void initState() {
    // TODO: implement initState
    selectedIndex= 1;
    items =[
      BottomNavigationBarItem(
          icon: Icon(Icons.search),
          backgroundColor: Colors.white,
          title: Text("Search")),
      BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          backgroundColor: Colors.white,
          title: Text("Movies")),
      BottomNavigationBarItem(
          icon: Icon(Icons.live_tv),
          backgroundColor: Colors.white,
          title: Text("Tv"))
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d1b38),
      appBar: AppBar(
        centerTitle: true,
        elevation: 8.0,
        backgroundColor: Color(0xff1d1b38),
        title: Text(
          "primeflix",
          style: style
        ),
        actions: <Widget>[Icon(Icons.perm_identity)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff76ead7),
        unselectedItemColor: Colors.grey,
        elevation: 8.0,
        backgroundColor: Color(0xff1d1b38),
        currentIndex: selectedIndex,
        items: items,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SearchScreen();
            }));
          setState(() {
            selectedIndex =1;
          });
          }
           else if(index==2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TvScreen();
            }));
          setState(() {
            selectedIndex=1;
          });
           }
        },
      ),
      body: SingleChildScrollView(child: ImageSlider(movieData: widget.movieData,topMovieData: widget.topMovieData,)),
    );
  }
}

