import 'package:http/http.dart';
import 'dart:convert';

class MovieData{
Future getData(String url) async{
  Response response = await get(url);
  var movieData = jsonDecode(response.body);
 return movieData;
}

Future trailer(String id) async{
  Response response = await get("https://imdb-api.com/en/API/YouTubeTrailer/k_7z0y9h8b/$id");
  var result = jsonDecode(response.body);
  return result;
}

}

