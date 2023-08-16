import 'package:e_commerce_app/components/custom_buttons/custom_button.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/components/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
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
              child: const Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "BMW Store",
                    color: Colors.white,
                    fontSize: 30,
                  ),
                  CustomText(
                    text: "Create new user account",
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
                      CutomTextField(
                        prefixIcon: Icons.password,
                        label: "Confirm Password",
                        controller: _confirmPasswordController,
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        size: size,
                        text: "Create Account",
                        colors: [Colors.amber.shade600, Colors.amber.shade800],
                        onTap: () {},
                      ),
                      CustomButton(
                        size: size,
                        text: "Sign In",
                        colors: [Colors.grey.shade600, Colors.grey.shade800],
                        onTap: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
            const BackButton(
              color: Colors.white,
            )
          ],
        ),
      )),
    );
  }
}
