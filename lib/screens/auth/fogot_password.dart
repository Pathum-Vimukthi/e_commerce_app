import 'package:e_commerce_app/components/custom_buttons/custom_button.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/components/custom_text_field/custom_text_field.dart';
import 'package:e_commerce_app/providers/signin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  // final TextEditingController _emailController = TextEditingController();
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
                    text: "Reset your password",
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
                        controller: Provider.of<SignInProvider>(context)
                            .recoveryEmailController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        size: size,
                        text: "Reset Password",
                        colors: [Colors.amber.shade600, Colors.amber.shade800],
                        onTap: () {
                          Provider.of<SignInProvider>(context, listen: false)
                              .sendResetEmail(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const BackButton(color: Colors.white)
          ],
        ),
      )),
    );
  }
}
