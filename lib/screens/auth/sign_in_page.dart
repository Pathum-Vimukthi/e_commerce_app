import 'package:e_commerce_app/components/custom_buttons/custom_button.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/components/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.34,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const NetworkImage(
                          "https://c4.wallpaperflare.com/wallpaper/683/201/69/bmw-bmw-m4-bmw-m4-gts-yellow-cars-wallpaper-preview.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken))),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CustomText(
                    text: "BMW Store",
                    color: Colors.white,
                    fontSize: 30,
                  ),
                  CustomText(
                    text: "Sign in to your account",
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ],
              )),
            ),
            Positioned(
              top: size.height * 0.26,
              child: Container(
                width: size.width,
                height: size.height,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      CutomTextField(
                        prefixIcon: Icons.email,
                        label: "Email",
                        controller: _emailController,
                      ),
                      CutomTextField(
                        prefixIcon: Icons.password,
                        label: "Password",
                        controller: _passwordController,
                        isPassword: true,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CustomText(
                          text: "Fogot Password?",
                          color: Colors.amber.shade800,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        size: size,
                        text: "Sign In",
                        colors: [Colors.amber.shade600, Colors.amber.shade800],
                      ),
                      CustomButton(
                        size: size,
                        text: "Create New Account",
                        colors: [Colors.grey.shade600, Colors.grey.shade800],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
