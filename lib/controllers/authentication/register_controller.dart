import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:valorant_fantasy/views/authentication_page/team_build_page/team_build_page.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController fullNameTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingContrller =
      TextEditingController();

  void onSignUp() {
    debugPrint(
        "signupRegister ${emailTextEditingController.text} ${passwordTextEditingController.text} ${userNameTextEditingController.text} ${fullNameTextEditingController.text} ${confirmPasswordTextEditingContrller.text}");
    createAccount();
  }

  Future<String> createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextEditingController.text,
          password: passwordTextEditingController.text);

      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'userName': userNameTextEditingController.text,
        'fullName': fullNameTextEditingController.text,
        'email': emailTextEditingController.text,
        'uid': uid
      });

      Fluttertoast.showToast(msg: "Account created successfully");
      Get.offAll(() => const TeamBuildPage());
      return "Account created successfully";
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "weak-password") {
        Get.snackbar("Error", "The password provided is too weak!",
            backgroundColor: Colors.white);
        return "The password provided is too weak.";
      } else if (ex.code == "email-already-in-use") {
        Get.snackbar("Error", "An account already exists for that email!",
            backgroundColor: Colors.white);
        return "The account already exists for that email.";
      }
      return "";
    } catch (e) {
      debugPrint(e.toString());
      return "";
    }
  }
}
