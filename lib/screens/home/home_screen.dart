import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owlnime/constant/utils.dart';
import 'package:owlnime/screens/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeController controller = Get.find<HomeController>();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161023),
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
              const SizedBox(
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
              Obx(
                () => Expanded(
                    child: ListView.builder(
                        itemCount: controller.listanime.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.2)),
                            child: ListTile(
                                title: Row(
                              children: [
                                SizedBox(
                                    width: 100,
                                    child: ClipRRect(
                                      child: Image.network(controller
                                          .listanime[index].mainPicture),
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.listanime[index].title,
                                          style: title.copyWith(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          controller.listanime[index].synopsis,
                                          style: desc.copyWith(
                                              color: Colors.white70),
                                          maxLines: 3,
                                        ),
                                        //  Text(movie.year)
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                          );
                        })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
