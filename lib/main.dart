import 'package:e_commerce_app/screens/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Commerce App',
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber)),
      home: const HomePage(),
    );
  }
}
