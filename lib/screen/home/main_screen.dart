import 'package:ezcommerce/screen/home/account_screen.dart';
import 'package:ezcommerce/screen/home/cart_screen.dart';
import 'package:ezcommerce/screen/home/home_screen.dart';
import 'package:ezcommerce/screen/home/product_screen.dart';
import 'package:ezcommerce/shared/theme.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget bottomNavbar() {
      return BottomAppBar(
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_home.png',
                  width: 24,
                  color: currentIndex == 0 ? primaryColor : greyColor,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_search.png',
                  width: 24,
                  color: currentIndex == 1 ? primaryColor : greyColor,
                ),
                label: 'Explore'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_cart.png',
                  width: 24,
                  color: currentIndex == 2 ? primaryColor : greyColor,
                ),
                label: 'Cart'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_user.png',
                  width: 24,
                  color: currentIndex == 3 ? primaryColor : greyColor,
                ),
                label: 'Account'),
          ],
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return const HomeScreen();
        case 1:
          return const ProductScreen();
        case 2:
          return const CartScreen();
        case 3:
          return const AboutScreen();
        default:
          return const HomeScreen();
      }
    }

    return Scaffold(
      bottomNavigationBar: bottomNavbar(),
      body: body(),
    );
  }
}
