import 'package:e_commerce_app/providers/home_page_provider.dart';
import 'package:e_commerce_app/screens/home/Favorite/favorite.dart';
import 'package:e_commerce_app/screens/home/cart/cart.dart';
import 'package:e_commerce_app/screens/home/home_page.dart';
import 'package:e_commerce_app/screens/home/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _mainPages = [
    const HomePage(),
    const FavoritePage(),
    const MyCart(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(builder: (context, value, child) {
      return Scaffold(
        body: _mainPages[value.currentIndex],
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavigationBarItem(
              icon: Icons.home,
              isActive: value.currentIndex == 0,
              onTap: () {
                value.changeIndex(0);
              },
              text: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icons.favorite,
                isActive: value.currentIndex == 1,
                onTap: () {
                  value.changeIndex(1);
                },
                text: "Favorite"),
            BottomNavigationBarItem(
                icon: Icons.shopping_cart,
                isActive: value.currentIndex == 2,
                onTap: () {
                  value.changeIndex(2);
                },
                text: "My Cart"),
            BottomNavigationBarItem(
                icon: Icons.person,
                isActive: value.currentIndex == 3,
                onTap: () {
                  value.changeIndex(3);
                },
                text: "Profile"),
          ],
        ),
      );
    });
  }
}

class BottomNavigationBarItem extends StatelessWidget {
  const BottomNavigationBarItem(
      {super.key,
      required this.icon,
      required this.isActive,
      required this.onTap,
      required this.text});

  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Column(
        children: [
          IconButton(
              onPressed: onTap,
              icon: Icon(icon,
                  color: isActive ? Colors.amber.shade800 : Colors.grey)),
          Text(text)
        ],
      ),
    );
  }
}
