import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valorant_fantasy/constants/colors.dart';
import 'package:valorant_fantasy/constants/styles.dart';
import 'package:valorant_fantasy/controllers/authentication/register_controller.dart';
import 'package:valorant_fantasy/views/authentication_page/team_build_page/team_build_page.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 1, 38, 67),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: ColorsConst.white,
              ))),
      body: SingleChildScrollView(
        child: Column(
          children: [signupForm(context)],
        ),
      ),
    );
  }

  Widget signupForm(BuildContext context) {
    RegisterController registerController = Get.put(RegisterController());
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Center(
            child: Text(
              'Register Here',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Full name',
            style: kLabelStyle,
          ),
          const SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextField(
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              controller: registerController.fullNameTextEditingController,
              keyboardType: TextInputType.name,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: 'Enter your Full Name',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Username',
            style: kLabelStyle,
          ),
          const SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextField(
              textInputAction: TextInputAction.next,
              controller: registerController.userNameTextEditingController,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.gamepad_outlined,
                  color: Colors.white,
                ),
                hintText: 'Enter your desired username',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
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
              textInputAction: TextInputAction.next,
              controller: registerController.emailTextEditingController,
              keyboardType: TextInputType.emailAddress,
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
              textInputAction: TextInputAction.next,
              obscureText: true,
              controller: registerController.passwordTextEditingController,
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
            height: 10,
          ),
          const Text(
            'Confirm Password',
            style: kLabelStyle,
          ),
          const SizedBox(height: 10.0),
          Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child: TextField(
                obscureText: true,
                textInputAction: TextInputAction.done,
                controller:
                    registerController.confirmPasswordTextEditingContrller,
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
                  hintText: 'Confirm your Password',
                  hintStyle: kHintTextStyle,
                ),
              )),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 1.0,
                padding: const EdgeInsets.all(15.0),
                backgroundColor: const Color.fromARGB(255, 15, 14, 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                if (registerController.fullNameTextEditingController.text.isEmpty ||
                    registerController
                        .userNameTextEditingController.text.isEmpty ||
                    registerController
                        .emailTextEditingController.text.isEmpty ||
                    registerController
                        .passwordTextEditingController.text.isEmpty ||
                    registerController
                        .confirmPasswordTextEditingContrller.text.isEmpty) {
                  Get.snackbar("Error", "All fields are required",
                      backgroundColor: Colors.white);
                } else if (registerController
                        .passwordTextEditingController.text !=
                    registerController
                        .confirmPasswordTextEditingContrller.text) {
                  Get.snackbar(
                      "Error", "Password and Confirm Password do not match",
                      backgroundColor: Colors.white);
                } else {
                  registerController.onSignUp();
                }
                // Get.to(() => const TeamBuildPage());
              },
              child: const Text(
                'Register',
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
        ]),
      ),
    );
  }
}
