import 'dart:convert';
import 'package:http/http.dart' as http;
import 'anime.dart';

class Repository {
  Future fetchAnime(http.Client client) async {
    try {
      var header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'x-mal-client-id': '5b15facf8d87c78750e38493150b484e',
      };

      final response = await client.get(
          Uri.parse(
              'https://api.myanimelist.net/v2/anime/ranking?limit=50&ranking_type=all&fields=id,title,main_picture,start_date,end_date,synopsis,mean,rank,popularity,status,genres,num_episodes'),
          headers: header);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonObject = json.decode(response.body);
        List listData = jsonObject['data'];
        List<Anime> listAnime = listData.map((e) => Anime.fromJson(e)).toList();
        return listAnime;
      } else {
        throw Exception('Failed to fetch Data Anime');
      }
    } catch (e) {
      null;
    }
  }
}
