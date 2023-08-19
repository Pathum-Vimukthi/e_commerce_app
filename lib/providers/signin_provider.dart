import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

class SignInProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _recoveryEmailController =
      TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get recoveryEmailController => _recoveryEmailController;

  Future<void> signInUser() async {
    if (_emailController.text.isEmpty) {
      Logger().i("Chech your email");
    } else if (_passwordController.text.isEmpty) {
      Logger().i("Check your password");
    } else {
      AuthController.signIntoAccount(
              emailAddress: _emailController.text,
              password: _passwordController.text)
          .then((value) {
        _emailController.text = "";
        _passwordController.text = "";
      });
    }
  }

  Future<void> sendResetEmail(BuildContext context) async {
    if (_recoveryEmailController.text.isEmpty) {
      Logger().i("Chech your email");
    } else {
      AuthController.sendPasswordResetEmail(_recoveryEmailController.text).then(
        (value) {
          Fluttertoast.showToast(
            msg: "Email sent to ${_recoveryEmailController.text}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          _recoveryEmailController.text = "";
          Navigator.pop(context);
        },
      );
    }
  }
}
