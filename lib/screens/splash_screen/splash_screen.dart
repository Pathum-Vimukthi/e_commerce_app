import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(color: Colors.amber),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CupertinoActivityIndicator(
                radius: 25,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Loading...",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        )
      ]),
    ));
  }
}
