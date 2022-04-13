import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:owlnime/models/animedetails.dart';
import '../../models/anime.dart';

class HomeController extends GetxController {
  AnimeDetail? anime;

  // fetchDetailAnime() async {
  //   try {
  //     var header = {
  //       'x-mal-client-id': '5b15facf8d87c78750e38493150b484e',
  //     };
  //     await http
  //         .get(
  //             Uri.parse(
  //                 'https://api.myanimelist.net/v2/anime/24?fields=id,title,main_picture,start_date,end_date,synopsis,mean,rank,popularity,status,genres,num_episodes,source,pictures'),
  //             headers: header)
  //         .then((http.Response response) {
  //       if (response.statusCode == 200) {
  //         anime = AnimeDetail.fromJson(jsonDecode(response.body));
  //       }
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  RxList<Anime> listanime = <Anime>[].obs;

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
        listanime.value = listData.map((e) => Anime.fromJson(e)).toList();
        print(listanime.length);
        return listanime;
      } else {
        throw Exception('Failed to fetch Data Anime');
      }
    } catch (e, track) {
      print('Pesan Eror $e, dan Track $track');
    }
  }

  @override
  void onInit() {
    fetchAnime(http.Client());
    super.onInit();
  }
}
