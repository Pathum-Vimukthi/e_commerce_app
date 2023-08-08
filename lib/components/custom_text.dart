import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextOverflow textOverFlow;
  const CustomText({
    required this.text,
    this.fontSize = 24,
    this.fontWeight = FontWeight.w500,
    this.color = Colors.black,
    this.textOverFlow = TextOverflow.visible,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
