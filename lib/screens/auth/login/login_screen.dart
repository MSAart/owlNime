import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owlnime/constant/utils.dart';
import 'package:owlnime/screens/auth/login/login_controller.dart';
import 'package:owlnime/widgets/buttons_widget.dart';
import 'package:owlnime/widgets/textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginController controller = Get.find<LoginController>();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff161023),
      body: Form(
        key: controller.formKey,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/bg_login.jpg',
                  ),
                  fit: BoxFit.fill)),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withOpacity(0.8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Owl',
                          style: big.copyWith(color: const Color(0xffEE1C25))),
                      const TextSpan(text: 'Nime', style: big),
                    ])),
                    Text(
                      'Please login first before using the owlnime application',
                      style: desc.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      preffixIcon: const Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                      hintext: 'Email',
                      hintstyle: textfield.copyWith(color: Colors.grey),
                      obscureText: false,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "please fill your name";
                        }
                        return null;
                      },
                      onsaved: (String? value) {
                        controller.email = value!;
                      },
                      style: textfield.copyWith(color: Colors.white),
                      suffixIcon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => CustomTextField(
                        preffixIcon: const Icon(
                          Icons.password,
                          color: Colors.grey,
                        ),
                        hintext: 'Password',
                        hintstyle: textfield.copyWith(color: Colors.grey),
                        obscureText: controller.isObscured.value,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "please fill your Password";
                          }
                          return null;
                        },
                        onsaved: (String? value) {
                          controller.password = value!;
                        },
                        style: textfield.copyWith(color: Colors.white),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.obscureEvent();
                          },
                          icon: controller.isObscured.isTrue
                              ? const Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.grey,
                                )
                              : const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.grey,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtons(
                      colorButton: const Color(0xffEE1C25),
                      textButton: 'Login',
                      textStyle: textButtons.copyWith(color: Colors.white),
                      onTap: () {
                        controller.login();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account ? ',
                              style: desc.copyWith(color: Colors.white),
                            ),
                            InkWell(
                              child: Text(
                                'Sign In',
                                style: textButtons.copyWith(
                                  color: const Color(0xffF40000),
                                ),
                              ),
                              onTap: () {
                                Get.offAllNamed('/sign');
                              },
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
