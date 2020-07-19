import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:topmovies/constants.dart';
import 'package:topmovies/components/data.dart';
import 'package:topmovies/screens/movie_info_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textEditingController;
  MovieData movieData;

  @override
  void initState() {
    // TODO: implement initState
    textEditingController = TextEditingController();
    movieData = MovieData();
    super.initState();
  }

  void searchMovie(String title) async{
    var searchData = await movieData.searchMovie(title);
    var id = searchData["results"][0]["id"];
    var ratingsData = await movieData.ratings(id);
    var castData = await movieData.fullCast(id);
    Navigator.push(context, MaterialPageRoute(
      builder: (context)=>SearchResult(searchData: searchData, ratingsData: ratingsData, castData: castData,)
    ));
    textEditingController.clear();
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
            style: style.copyWith(
              fontSize: 25.0
            ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0)
              ),
              child: TextField(
                controller: textEditingController,
                style: style.copyWith(
                  color: Colors.black
                ),
                decoration: InputDecoration(
                  hoverColor: Colors.white,
                  hintText: "Enter the title",
                  border: InputBorder.none
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
           RaisedButton(
             disabledColor: Colors.white,
             child: Text("Search",
             style:style.copyWith(
               color: Colors.black
             )
             ),
           onPressed: () {
             SpinKitCircle(
               color: Colors.white,
             );
               searchMovie(textEditingController.text);
               },
           )
          ],
        )
      ),
    );
  }
}
