import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:owlnime/screens/auth/login/login_binding.dart';
import 'package:owlnime/screens/auth/login/login_screen.dart';
import 'package:owlnime/screens/details/detail_binding.dart';
import 'package:owlnime/screens/details/detail_screen.dart';
import 'package:owlnime/screens/home/home_binding.dart';
import 'package:owlnime/screens/home/home_screen.dart';

import 'screens/auth/register/register_binding.dart';
import 'screens/auth/register/register_screen.dart';
import 'screens/splash/splash_binding.dart';
import 'screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      getPages: [
        GetPage(
          name: "/home",
          page: () => HomeScreen(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: "/detail",
          page: () => DetailScreen(),
          binding: DetailBinding(),
        ),
        GetPage(
          name: "/login",
          page: () => LoginScreen(),
          binding: LoginBinding(),
        ),
        GetPage(
            name: "/sign",
            page: () => RegisterScreen(),
            binding: RegisterBinding()),
        GetPage(
            name: "/splash",
            page: () => SplashScreen(),
            binding: SplashBinding()),
      ],
    );
  }
}
