import 'package:e_commerce_app/components/custom_buttons/custom_button.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/components/custom_text_field/custom_text_field.dart';
import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Consumer<ProfileProvider>(builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
              width: 100,
              height: 100,
            ),
            const CustomText(
              text: "user@gmail.com",
              fontSize: 20,
            ),
            CutomTextField(
                label: "Name",
                controller: value.nameController,
                prefixIcon: Icons.person),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
                size: size,
                text: "Update",
                colors: [Colors.amber.shade600, Colors.amber.shade900],
                onTap: () {}),
            const SizedBox(
              height: 8,
            ),
            CustomButton(
                size: size,
                text: "Sign Out",
                colors: [Colors.grey.shade600, Colors.grey.shade900],
                onTap: () {
                  AuthController.signOutUser();
                })
          ],
        );
      }),
    );
  }
}
