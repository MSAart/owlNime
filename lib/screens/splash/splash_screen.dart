import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owlnime/screens/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  late SplashController controller;

  SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller = Get.find<SplashController>();
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Opacity(
                opacity: 0.9,
                child: Image.asset(
                  "assets/images/logo_screen.png",
                ),
              ),
            ),
            const Text(
              "Streaming Anime Online",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'Poppins'),
            )
          ]),
        ),
      ),
    );
  }
}
