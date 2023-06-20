import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.015),
      child: GNav(
        color: Colors.grey.shade400,
        activeColor: Colors.grey.shade800,
        tabActiveBorder: Border.all(color: Colors.grey.shade400),
        tabBackgroundColor: Colors.grey.shade200,
        tabBorderRadius: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        gap: MediaQuery.of(context).size.width * 0.025,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopping_cart_rounded,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}
