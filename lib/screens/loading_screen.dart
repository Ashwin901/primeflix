import 'package:flutter/material.dart';
import 'package:topmovies/screens/movie_screen.dart';
import '../components/data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  MovieData movieData;

  @override
  void initState() {
    // TODO: implement initState
    getData();
    movieData = MovieData();
    super.initState();
  }

  void getData() async{
    var soonMovieData = await MovieData().getData("https://imdb-api.com/en/API/ComingSoon/k_7z0y9h8b");
    var topMoviesData = await movieData.getData("https://imdb-api.com/en/API/Top250Movies/k_7z0y9h8b");
    Navigator.push(context, MaterialPageRoute(
      builder: (context)=>MovieScreen(movieData: soonMovieData,topMovieData: topMoviesData),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d1b38),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("primeflix",
            style: TextStyle(
             letterSpacing: 2.0,
              color: Colors.white,
              fontSize: 20.0
            ),
            ),
          SizedBox(
            height: 5.0,
          ),
          SpinKitCircle(
            color: Colors.white,
          )
          ],
        ),
      ),
    );
  }
}
