import 'package:e_commerce_app/components/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final List<Color> colors;
  VoidCallback onTap;
  CustomButton(
      {super.key,
      required this.size,
      required this.text,
      required this.colors,
      required this.onTap});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: size.width * 0.8,
          height: 60,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: colors),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: CustomText(
              text: text,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
