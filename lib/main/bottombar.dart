// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class bottomNavBar extends StatefulWidget {
  const bottomNavBar({Key? key}) : super(key: key);

  @override
  _bottomNavBarState createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.house_rounded),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Orders',
            ),
          ]
      );
  }
}
