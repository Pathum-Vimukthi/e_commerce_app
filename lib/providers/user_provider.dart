import 'package:e_commerce_app/models/uder_models.dart';
import 'package:e_commerce_app/screens/auth/sign_up_page.dart';
import 'package:e_commerce_app/screens/home/main_screen.dart';
import 'package:e_commerce_app/utils/navigator_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel? get userData => _user;

  //Check Current User State
  Future<void> checkAuthState(BuildContext context) async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user == null) {
            CustomNavigator.goTo(context, const SignUpPage());
            Logger().i("User us currently sign out!");
          } else {
            _user = UserModel(
                email: user.email.toString(),
                name: "Null",
                uid: user.uid,
                userImage: "Null");
            CustomNavigator.goTo(context, const MainScreen());
            Logger().i('User is signed in!');
          }
        });
      },
    );
  }
}
