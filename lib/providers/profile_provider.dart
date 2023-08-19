import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;
}
