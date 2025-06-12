import 'product_cart_screen/cart_screen.dart';
import 'product_favorite_screen/favorite_screen.dart';
import 'product_list_screen/product_list_screen.dart';
import 'profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import '../../../utility/app_data.dart';
import '../../../widget/page_wrapper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const List<Widget> screens = [
    ProductListScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int newIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: AppData.bottomNavBarItems,
          // Use the updated list
          currentIndex: newIndex,
          selectedItemColor: const Color(0xFFEC6813),
          // Set your active color
          unselectedItemColor: Colors.grey,
          // Set your inactive color
          showSelectedLabels: false,
          // We are showing labels in the custom icon
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          // Adjust if you have fewer/more items
          onTap: (currentIndex) {
            setState(() {
              newIndex = currentIndex;
            });
          },
        ),
        body: PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: HomeScreen.screens[newIndex],
        ),
      ),
    );
  }
}
