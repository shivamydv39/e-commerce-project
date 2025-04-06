import 'package:flutter/material.dart' show BottomNavigationBar, BottomNavigationBarType, BuildContext, Color, Colors, Icon, State, StatefulWidget, Widget;

import 'app_data.dart';



class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: AppData.bottomNavBarItems,
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xFFEC6813),
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
    );
  }
}
