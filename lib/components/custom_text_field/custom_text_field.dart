import 'package:flutter/material.dart';

class CutomTextField extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  final bool isPassword;
  final String label;
  final IconData prefixIcon;
  CutomTextField({
    required this.controller,
    this.isPassword = false,
    required this.label,
    required this.prefixIcon,
    super.key,
  });

  @override
  State<CutomTextField> createState() => _CutomTextFieldState();
}

class _CutomTextFieldState extends State<CutomTextField> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.controller,
        obscureText: isObscure,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: Text(widget.label),
            prefixIcon: Icon(widget.prefixIcon),
            suffixIcon: widget.isPassword == true
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off))
                : null),
      ),
    );
  }
}
