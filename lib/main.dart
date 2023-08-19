import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/providers/home_page_provider.dart';
import 'package:e_commerce_app/providers/profile_provider.dart';
import 'package:e_commerce_app/providers/signin_provider.dart';
import 'package:e_commerce_app/providers/signup_provider.dart';
import 'package:e_commerce_app/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SignUpProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SignInProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => HomePageProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProfileProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Commerce App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true),
      home: const SplashScreen(),
    );
  }
}
