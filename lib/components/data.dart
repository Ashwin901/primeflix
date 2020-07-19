import 'package:http/http.dart';
import 'dart:convert';

class MovieData{
Future getData(String url) async{
  Response response = await get(url);
  var movieData = jsonDecode(response.body);
 return movieData;
}

Future top250() async{
  Response response = await get("https://imdb-api.com/en/API/Top250Movies/k_7z0y9h8b");
  var topMoviesData = jsonDecode(response.body);
  return topMoviesData;
}

Future searchMovie(String title) async{
  Response response = await get("https://imdb-api.com/en/API/SearchMovie/k_7z0y9h8b/$title");
  var searchData = jsonDecode(response.body);
  return searchData;
}

Future ratings(String id) async {
  Response response = await get("https://imdb-api.com/en/API/Ratings/k_7z0y9h8b/$id");
  var ratingsData = jsonDecode(response.body);
  return ratingsData;
}

Future fullCast(String id) async{
  Response response = await get("https://imdb-api.com/en/API/FullCast/k_7z0y9h8b/$id");
  var castData = jsonDecode(response.body);
  return castData;
}

Future trailer(String id) async{
  Response response = await get("https://imdb-api.com/en/API/YouTubeTrailer/k_7z0y9h8b/$id");
  var result = jsonDecode(response.body);
  return result;
}

}

