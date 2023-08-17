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
            Logger().e("User us currently sign out!");
          } else {
            CustomNavigator.goTo(context, const HomePage());
            Logger().i('User is signed in!');
          }
        });
      },
    );
  }
}
