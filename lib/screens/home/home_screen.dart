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
    //print(controller.anime!.title);
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
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // image: DecorationImage(
                  //     image: NetworkImage(controller.anime!.mainPicture),
                  //     fit: BoxFit.cover),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        // Text(
                        //   (controller.anime != null)
                        //       ? controller.anime!.title
                        //       : 'Loading..',
                        //   style: title.copyWith(color: Colors.white),
                        // ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
