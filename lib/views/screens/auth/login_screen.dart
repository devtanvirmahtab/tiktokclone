import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/utilies/constants/app_constants.dart';
import 'package:tiktokclone/utilies/constants/controller_constants.dart';
import 'package:tiktokclone/utilies/constants/style_constants.dart';
import 'package:tiktokclone/views/screens/auth/signup_screen.dart';
import 'package:tiktokclone/views/widgets/text_input_field.dart';

import '../../../utilies/constants/constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
              "Login",
              style: subHeaderTextStyle(),
            ),
            appHeight(scale: 0.5),
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
                onTap: () => authController.loginUser(
                  emailController.text,
                  passwordController.text,
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style:
                        subHeaderTextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
            ),
            appHeight(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: normalTextStyle(),
                ),
                InkWell(
                  onTap: () {
                    Get.to(SignupScreen());
                  },
                  child: Text(
                    "Register",
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
