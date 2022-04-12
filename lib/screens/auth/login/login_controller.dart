import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  String email = "";
  String password = "";

  RxBool isObscured = true.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void obscureEvent() {
    if (isObscured.value == true) {
      isObscured(false);
    } else {
      isObscured(true);
    }
  }

  void login() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final data = GetStorage().read("auth") as Map<String, dynamic>;
      email = data['email'];
      password = data['password'];
      Get.offAllNamed("/home");
    }
  }
}
