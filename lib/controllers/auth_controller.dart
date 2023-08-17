import 'package:e_commerce_app/screens/auth/sign_up_page.dart';
import 'package:e_commerce_app/screens/home/home_page.dart';
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
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpPage(),
                ));
            Logger().e("User us currently sign out!");
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
            Logger().i('User is signed in!');
          }
        });
      },
    );
  }
}
