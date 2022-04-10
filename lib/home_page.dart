import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:owlnime/animedetails.dart';
import 'package:owlnime/genres.dart';
import 'package:owlnime/home_controller.dart';
import 'package:http/http.dart' as http;
import 'package:owlnime/utils.dart';
import 'anime.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AnimeDetail? anime;
  bool isLoading = true;

  fetchAnime() async {
    try {
      var header = {
        'x-mal-client-id': '5b15facf8d87c78750e38493150b484e',
      };

      await http
          .get(
              Uri.parse(
                  'https://api.myanimelist.net/v2/anime/25?fields=id,title,main_picture,start_date,end_date,synopsis,mean,rank,popularity,status,genres,num_episodes,source,pictures'),
              headers: header)
          .then((http.Response response) {
        if (response.statusCode == 200) {
          setState(() {
            anime = AnimeDetail.fromJson(jsonDecode(response.body));
            isLoading = false;
          });
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAnime();
  }

  @override
  Widget build(BuildContext context) {
    print(anime);
    return Scaffold(
      backgroundColor: Color(0xff17181C),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.all(2),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            const CircleAvatar(),
                            Column(children: [
                              Text(
                                'Welcome back',
                                style: regular.copyWith(color: Colors.white),
                              ),
                              Text(
                                'Syarif Hidayat',
                                style: account.copyWith(color: Colors.white),
                              ),
                            ]),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset(
                                'assets/images/icons_search_wh.png',
                                height: 25,
                                width: 25,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset(
                                'assets/images/icons_notification_wh.png',
                                height: 25,
                                width: 25,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                'Top Airing Anime!',
                style: header.copyWith(color: Colors.white),
              ),
              Text(
                'Watch the latest anime recomendations',
                style: desc.copyWith(color: Colors.white),
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          (anime != null) ? anime!.title : 'Loading..',
                          style: title.copyWith(color: Colors.white),
                        ),
                        //Text((anime != null) ? anime!.genres : 'Loading')
                      ],
                    )
                  ],
                ),
              ),

              Text(
                'Popular Anime',
                style: header.copyWith(color: Colors.white),
              ),
              Text(
                'Best anime poplar recomendations',
                style: desc.copyWith(color: Colors.white),
              )
              // TextFormField(
              //   cursorColor: const Color(0xff00B2C7),
              //   decoration: InputDecoration(
              //     hintText: 'Search anime',
              //     prefixIcon: const Icon(Icons.search_outlined,
              //         color: Color(0xff00B2C7)),
              //     suffixIcon: IconButton(
              //       icon: Icon(Icons.mic_outlined),
              //       onPressed: () {},
              //     ),
              //     contentPadding:
              //         const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 5.0),
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: const Color(0xffA9BCCF).withOpacity(0.2),
              //       ),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: const Color(0xffA9BCCF).withOpacity(0.2),
              //       ),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     errorBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.red.withOpacity(0.4),
              //       ),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     focusedErrorBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.red.withOpacity(0.4),
              //       ),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
