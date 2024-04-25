import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valorant_fantasy/constants/colors.dart';
import 'package:valorant_fantasy/constants/styles.dart';
import 'package:valorant_fantasy/controllers/authentication/login_controller.dart';
import 'package:valorant_fantasy/controllers/authentication/register_controller.dart';
import 'package:valorant_fantasy/views/authentication_page/team_build_page/team_build_page.dart';
import 'package:valorant_fantasy/views/navigation.dart';

import '../signup_page/signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 1, 38, 67),
              Color.fromARGB(255, 1, 38, 67)
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loginForm(context),
            const SizedBox(
              height: 20,
            ),
            forgotPasswordPrompt(),
            signupPrompt()
          ],
        ),
      ),
    );
  }

  Widget loginForm(BuildContext context) {
    // LoginController loginController = Get.put(LoginController());
    final formKey = GlobalKey<FormState>();
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Email',
                style: kLabelStyle,
              ),
              const SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerLeft,
                decoration: kBoxDecorationStyle,
                height: 60.0,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  // controller: loginController.emailTextEditingController,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintText: 'Enter your Email',
                    hintStyle: kHintTextStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Password',
                style: kLabelStyle,
              ),
              const SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerLeft,
                decoration: kBoxDecorationStyle,
                height: 60.0,
                child: TextField(
                  // controller: loginController.passwordTextEditingController,
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    hintText: 'Enter your Password',
                    hintStyle: kHintTextStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2.0,
                    padding: const EdgeInsets.all(15.0),
                    backgroundColor: const Color.fromARGB(255, 15, 14, 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TeamBuildPage()));
                    // if (loginController
                    //         .emailTextEditingController.text.isEmpty ||
                    //     loginController
                    //         .passwordTextEditingController.text.isEmpty) {
                    //   Get.snackbar(
                    //       "Error", "Please insert all necessary fields",
                    //       backgroundColor: Colors.white);
                    // } else {

                    //   //loginController.onLogin(context);
                    // }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget signupPrompt() {
    return RichText(
        text: TextSpan(children: <TextSpan>[
      const TextSpan(
          text: "Dont have an account? ",
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: ColorsConst.white)),
      TextSpan(
          text: "Sign Up",
          recognizer: TapGestureRecognizer()
            ..onTap = () => Get.to(() => const SignUpScreen()),
          style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              color: Colors.lightBlue)),
    ]));
  }

  Widget forgotPasswordPrompt() {
    return GestureDetector(
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          color: ColorsConst.blue,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => Get.to(() => const NavigationBarPage()),
    );
  }
}
