import 'package:e_commerce_app/screens/auth/sign_up_page.dart';
import 'package:e_commerce_app/screens/home/home_page.dart';
import 'package:e_commerce_app/utils/navigator_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AuthController {
  //Check Current User State
  static Future<void> checkAuthState(BuildContext context) async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user == null) {
            CustomNavigator.goTo(context, const SignUpPage());
            Logger().i("User us currently sign out!");
          } else {
            CustomNavigator.goTo(context, const HomePage());
            Logger().i('User is signed in!');
          }
        });
      },
    );
  }

  //Sign Out User
  static Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  //Create User with Email and Paasword
  static Future<void> createUserAccount(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Logger().i(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Logger().e('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Logger().e('The account already exists for that email.');
      } else if (e.code == "invalid-email") {
        Logger().e("Invalid Email");
      } else if (e.code == "operation-not-allowed") {
        Logger().e("operation-not-allowed");
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}
