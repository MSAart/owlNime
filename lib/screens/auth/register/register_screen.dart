import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owlnime/constant/utils.dart';
import 'package:owlnime/screens/auth/register/register_controller.dart';
import 'package:owlnime/widgets/buttons_widget.dart';
import 'package:owlnime/widgets/textfield_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterController controller = Get.find<RegisterController>();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff161023),
      body: Center(
        child: Stack(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/bg_image3.jpg',
              fit: BoxFit.fill,
            ),
          ),
          ListView(
            children: [
              const SizedBox(
                height: 80,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(0.6)),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'Owl',
                          style: big.copyWith(
                            color: const Color(0xffEE1C25),
                          ),
                        ),
                        const TextSpan(text: 'Nime', style: big),
                      ])),
                      Text(
                        'Please create your application account, only here that gives you the pleasure of watching free and updated',
                        style: desc.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        preffixIcon: const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        hintext: 'Full Name',
                        hintstyle: textfield.copyWith(color: Colors.grey),
                        obscureText: false,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "please fill your name";
                          }
                          return null;
                        },
                        onsaved: (String? value) {
                          controller.name = value!;
                        },
                        style: textfield.copyWith(color: Colors.white),
                        suffixIcon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        hintext: 'Email',
                        preffixIcon: const Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        obscureText: false,
                        style: textfield.copyWith(color: Colors.white),
                        hintstyle: textfield.copyWith(color: Colors.grey),
                        suffixIcon: const Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "please fill your email";
                          }
                          return null;
                        },
                        onsaved: (String? value) {
                          controller.email = value!;
                        },
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => CustomTextField(
                            hintext: 'Password',
                            preffixIcon: const Icon(
                              Icons.password,
                              color: Colors.grey,
                            ),
                            hintstyle: textfield.copyWith(color: Colors.grey),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "please fill your name";
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
                            obscureText: controller.isObscured.value),
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButtons(
                        colorButton: const Color(0xffEE1C25),
                        textButton: 'Register',
                        textStyle: textButtons.copyWith(color: Colors.white),
                        onTap: () {
                          controller.submit();
                        },
                      ),
                      const SizedBox(
                        height: 10,
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
                                  Get.offAllNamed('/login');
                                },
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
