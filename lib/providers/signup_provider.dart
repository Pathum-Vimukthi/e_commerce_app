import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SignUpProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  Future<void> signUpUser() async {
    if (_emailController.text.isEmpty) {
      Logger().e("Please insert your email");
    } else if (_passwordController.text.isEmpty) {
      Logger().e("Please insert your password");
    } else if (_passwordController.text != _confirmPasswordController.text) {
      Logger().e("Check your password");
    } else {
      AuthController.createUserAccount(
          email: _emailController.text, password: _passwordController.text);
    }
  }
}
