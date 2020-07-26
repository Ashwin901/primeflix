import 'package:flutter/material.dart';
import 'package:topmovies/screens/movie_info_screen.dart';
import 'data.dart';

class DataListView extends StatefulWidget {
  final topMovieData;
  DataListView({this.topMovieData});

  @override
  _DataListViewState createState() => _DataListViewState();
}

class _DataListViewState extends State<DataListView> {
  var topMovieData;
  
  @override
  void initState() {
    // TODO: implement initState
    topMovieData = widget.topMovieData;
    super.initState();
  }
  
  void movieInfo(String title) async{
    var searchData = await MovieData().getData("https://imdb-api.com/en/API/SearchMovie/k_7z0y9h8b/$title");
    var id = searchData["results"][0]["id"];
    var castData = await MovieData().getData("https://imdb-api.com/en/API/FullCast/k_7z0y9h8b/$id");
    var ratingsData = await MovieData().getData("https://imdb-api.com/en/API/Ratings/k_7z0y9h8b/$id");
    Navigator.push(context, MaterialPageRoute(
      builder: (context){
        return SearchResult(searchData: searchData,castData: castData,ratingsData: ratingsData);
      }
    ));
  }
  
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
                    GestureDetector(
                      onTap: (){
                        movieInfo(topMovieData["items"][index]["title"]);
                      },
                      child: Image.network(
                        topMovieData["items"][index]["image"],
                        fit: BoxFit.fill,
                        height: 120,
                        width: 130,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}