import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/views/screens/auth/login_screen.dart';

import '../../../utilies/constants/app_constants.dart';
import '../../../utilies/constants/constants.dart';
import '../../../utilies/constants/controller_constants.dart';
import '../../../utilies/constants/style_constants.dart';
import '../../../utilies/helpers.dart';
import '../../widgets/text_input_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tiktok Clone",
              style: headerTextStyle(),
            ),
            appHeight(),
            Text(
              "Sign Up",
              style: subHeaderTextStyle(),
            ),
            appHeight(scale: 0.5),
            Stack(
              children: [
                Obx(<AuthController>() {
                  return CircleAvatar(
                    radius: 55,
                    backgroundImage:
                        getProfileImage(authController.imagePath.value, ""),
                  );
                }),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: GestureDetector(
                      onTap: () {
                        authController.pickImage();
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        padding: mainPaddingAll(scale: 0.3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: whiteColor,
                        ),
                        child: const Icon(
                          size: 20,
                          Icons.camera_alt,
                          color: grayColor,
                        ),
                      )),
                )
              ],
            ),
            Container(
              width: double.infinity,
              margin: mainPaddingAll(scale: 0.5),
              child: TextInputField(
                inputController: userNameController,
                labelText: "Enter Name",
                icon: Icons.person,
              ),
            ),
            Container(
              width: double.infinity,
              margin: mainPaddingAll(scale: 0.5),
              child: TextInputField(
                inputController: emailController,
                labelText: "Enter Email",
                icon: Icons.email_rounded,
              ),
            ),
            Container(
              width: double.infinity,
              margin: mainPaddingAll(scale: 0.5),
              child: TextInputField(
                inputController: passwordController,
                labelText: "Enter Password",
                icon: Icons.lock,
                isObscure: true,
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: mainPaddingAll(scale: 0.5),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: InkWell(
                onTap: () {
                  authController.registerUser(
                    userNameController.text,
                    emailController.text,
                    passwordController.text,
                    File(authController.imagePath.value),
                  );
                },
                child: Center(
                  child: Text(
                    "Register",
                    style: subHeaderTextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
            appHeight(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: normalTextStyle(),
                ),
                InkWell(
                  onTap: () {
                    Get.offAll(LoginScreen());
                  },
                  child: Text(
                    "Login",
                    style: normalTextStyle(color: buttonColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
