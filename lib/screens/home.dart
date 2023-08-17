import 'package:flutter/material.dart';
import '../constants/theme.dart';

import 'cartsPage.dart';
import 'categoryPage.dart';
import 'productsPage.dart';
import 'profilePage.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<Widget> screens = [
    ProductsPage(category: ''),
    CategoryPage(),
    const cartsPage(),
    const ProfilePage()
  ];
  int ind = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[ind],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() => ind = value),
        currentIndex: ind,
        unselectedItemColor: Colors.grey,
        selectedItemColor: initialColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
