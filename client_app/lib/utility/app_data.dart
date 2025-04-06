import 'package:flutter/material.dart';



class AppData {
  const AppData._();


  static List<Color> randomColors = [
    const Color(0xFFFCE4EC),
    const Color(0xFFF3E5F5),
    const Color(0xFFEDE7F6),
    const Color(0xFFE3F2FD),
    const Color(0xFFE0F2F1),
    const Color(0xFFF1F8E9),
    const Color(0xFFFFF8E1),
    const Color(0xFFECEFF1),
  ];


  static List<Color> randomPosterBgColors = [
    const Color(0xFFE70D56),
    const Color(0xFF9006A4),
    const Color(0xFF137C0B),
    const Color(0xFF0F2EDE),
    const Color(0xFFECBE23),
    const Color(0xFFA60FF1),
    const Color(0xFF0AE5CF),
    const Color(0xFFE518D1),
  ];

  static List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home), // Using outlined icon
          SizedBox(height: 4),
          Text("Home", style: TextStyle(fontSize: 12)),
        ],
      ),
      label: '', // Label is handled in the custom icon
    ),
    const BottomNavigationBarItem(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite), // Using outlined icon
          SizedBox(height: 4),
          Text("Favorite", style: TextStyle(fontSize: 12)),
        ],
      ),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_bag), // Using outlined icon
          SizedBox(height: 4),
          Text("Cart", style: TextStyle(fontSize: 12)),
        ],
      ),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_circle), // Using outlined icon
          SizedBox(height: 4),
          Text("Profile", style: TextStyle(fontSize: 12)),
        ],
      ),
      label: '',
    ),
  ];
}


