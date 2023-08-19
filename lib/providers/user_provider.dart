import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/models/uder_models.dart';
import 'package:e_commerce_app/providers/profile_provider.dart';
import 'package:e_commerce_app/screens/auth/sign_up_page.dart';
import 'package:e_commerce_app/screens/home/main_screen.dart';
import 'package:e_commerce_app/utils/navigator_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel? get userData => _user;

  //Check Current User State
  Future<void> checkAuthState(BuildContext context) async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        FirebaseAuth.instance.authStateChanges().listen((User? user) async {
          if (user == null) {
            CustomNavigator.goTo(context, const SignUpPage());
            Logger().i("User us currently sign out!");
          } else {
            fetchData(user.uid, context).then((value) {
              CustomNavigator.goTo(context, const MainScreen());
              Logger().i('User is signed in!');
            });
          }
        });
      },
    );
  }

  Future<void> fetchData(uid, context) async {
    _user = await AuthController().getUserData(uid);
    Provider.of<ProfileProvider>(context, listen: false)
        .setUserName(_user!.name);
    notifyListeners();
  }

  Future<void> updateProfileData(name) async {
    AuthController().updateProfile(_user!.uid, name).then((value) {
      Logger().i("User name updated");
    });
  }
}
