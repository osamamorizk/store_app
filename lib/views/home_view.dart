import 'package:flutter/material.dart';
import 'package:store_app/widget/category_listview.dart';
import 'package:store_app/widget/product_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            Text(
              'Find all what you need now',
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            CategoryListView(),
            SizedBox(
              height: 13,
            ),
            ProductItem(),
          ],
        ),
      ),
    );
  }
}
