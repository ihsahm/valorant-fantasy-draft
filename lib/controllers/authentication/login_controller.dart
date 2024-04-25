import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valorant_fantasy/views/authentication_page/team_build_page/team_build_page.dart';
import 'package:valorant_fantasy/views/navigation.dart';

class LoginController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  void onLogin() {
    signIn(
      emailTextEditingController.text,
      passwordTextEditingController.text,
    );
  }

  Future<void> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Success", "Login success", backgroundColor: Colors.white);
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "user-not-found") {
        Get.snackbar("Error", "No user exists for the provided email!",
            backgroundColor: Colors.white);
      } else if (ex.code == "wrong-password") {
        Get.snackbar("Error", "Invalid password provided",
            backgroundColor: Colors.white);
      }
    } catch (ex) {
      debugPrint(ex.toString());
      Get.snackbar("Error", ex.toString());
    }
  }
}
