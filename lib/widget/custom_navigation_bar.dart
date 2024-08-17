import 'package:flutter/material.dart';
import 'package:store_app/views/cart_view.dart';
import 'package:store_app/views/categories_view.dart';
import 'package:store_app/views/profile_view.dart';
import 'package:store_app/widget/home_body_widget.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});
  static String id = 'fjf';

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;
  List<Widget> views = [
    HomeBodyWidget(),
    CategoriesView(),
    CartView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.blue[800],
              elevation: 10,
              iconSize: 26,
              selectedFontSize: 16,
              unselectedFontSize: 15,
              // showUnselectedLabels: false,
              // showSelectedLabels: false,

              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              currentIndex: currentIndex,
              onTap: (newIndex) {
                currentIndex = newIndex;

                setState(() {});
              },
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.home_outlined),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined),
                  label: 'Categories',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.shopping_cart_outlined),
                //   label: 'Cart',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded),
                  label: 'Profile',
                ),
              ]),
        ),
      ),
      body: views.elementAt(currentIndex),
    );
  }
}
