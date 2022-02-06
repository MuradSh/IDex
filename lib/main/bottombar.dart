// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:idexx/main/discover.dart';
import 'package:idexx/main/profile.dart';

class bottomNavBar extends StatefulWidget {
  const bottomNavBar({Key? key}) : super(key: key);

  @override
  _bottomNavBarState createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  List<Widget> _widgetOptions = <Widget>[
    Discover(),
    Profile(),
    Profile(),
  ];
  late Widget _page = Discover();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page,
      bottomNavigationBar: BottomNavigationBar(
            onTap: (int index){
              setState(() {
                _page = _widgetOptions[index];
              });
            },
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
        ),
    );
  }
}
