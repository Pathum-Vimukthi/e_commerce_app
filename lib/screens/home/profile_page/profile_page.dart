import 'package:e_commerce_app/components/custom_buttons/custom_button.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/components/custom_text_field/custom_text_field.dart';
import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/providers/profile_provider.dart';
import 'package:e_commerce_app/providers/user_provider.dart';
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
              Provider.of<UserProvider>(context).userData!.userImage,
              width: 100,
              height: 100,
            ),
            CustomText(
              text: Provider.of<UserProvider>(context).userData!.email,
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
                onTap: () {
                  Provider.of<UserProvider>(context, listen: false)
                      .updateProfileData(value.nameController.text);
                }),
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
