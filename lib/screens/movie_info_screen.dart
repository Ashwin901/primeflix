import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:topmovies/components/data.dart';
import 'package:topmovies/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:topmovies/components/features.dart';

class SearchResult extends StatefulWidget {
  final searchData, ratingsData, castData;
  SearchResult({this.searchData,this.ratingsData,this.castData});
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

  void playTrailer(String youtubeUrl)async{
    var url = youtubeUrl;
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    var searchData = widget.searchData;
    var ratingsData = widget.ratingsData;
    var castData = widget.castData;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("results",
      style: style,
      ),),
      backgroundColor: Color(0xff1d1b38),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.network(searchData['results'][0]["image"], fit: BoxFit.fill, height: 280, width: double.infinity,),
            ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 12.0),
            child: Text(searchData["results"][0]["title"],
            style: style.copyWith(
              fontSize: 28.0
            ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: SizedBox(
              width: 270,
              height: 50.0,
              child: FlatButton(
                color: Color(0xff1b6ca8),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.play_arrow,
                    color: Colors.white,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text("Watch trailer",
                    style: style,
                    )
                  ],
                ),
              onPressed: ()async{
                  String id = searchData["results"][0]["id"];
                  var result =  await MovieData().trailer(id);
                  playTrailer(result["videoUrl"]);
              },
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Features(icon: Icon(MdiIcons.wikipedia,
                color: Colors.white,
              ), feature: "wiki",
              func: () async{
                var title = searchData["results"][0]["title"];
                var url ="https://en.wikipedia.org/wiki/$title";
                if (await canLaunch(url)) {
                  await launch(url, forceWebView: true);
                } else {
                  throw 'Could not launch $url';
                }
              },
              ),
              Features(icon: Icon(MdiIcons.plus,  color: Colors.white,), feature: "wishlist",),
              Features(icon: Icon(MdiIcons.share, color: Colors.white,), feature: "share",)
            ],
          ),
           SizedBox(
             height: 12.0,
           ),
            Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("cast : " + castData["actors"][0]["name"] + ", " + castData["actors"][1]["name"] +
                    ", " + castData["actors"][2]["name"] + ", " + castData["actors"][3]["name"],
                  style: style,
                ),
                SizedBox(
                  height: 3.0,
                ),
                Text("director : " + castData["directors"]["items"][0]["name"],
                style: style,
                )
              ],
            )
          ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("year : "+ratingsData["year"],
                  style: style.copyWith(color: Colors.grey),
                ),
                Text("imDb : "+ratingsData["imDb"],
                  style: style.copyWith(
                      color: Colors.grey
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.0,
            ),
            Center(
              child: Text("rotten tomatoes : "+ ratingsData["rottenTomatoes"],
                style: style.copyWith(
                    color: Colors.grey
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}


