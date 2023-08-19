import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SignUpProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  TextEditingController get nameController => _nameController;

  Future<void> signUpUser() async {
    if (_emailController.text.isEmpty) {
      Logger().e("Please insert your email");
    } else if (_passwordController.text.isEmpty) {
      Logger().e("Please insert your password");
    } else if (_passwordController.text != _confirmPasswordController.text) {
      Logger().e("Check your password");
    } else if (_nameController.text.isEmpty) {
      Logger().e("Please enter your name");
    } else {
      AuthController()
          .createUserAccount(
              email: _emailController.text,
              password: _passwordController.text,
              name: nameController.text)
          .then((value) {
        clearTextField();
      });
    }
  }

  void clearTextField() {
    _confirmPasswordController.text = "";
    _emailController.text = "";
    _passwordController.text = "";
  }
}
