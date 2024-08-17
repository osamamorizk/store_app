import 'package:flutter/material.dart';
import 'package:store_app/services/get_categories.dart';
import 'package:store_app/views/about_store.dart';
import 'package:store_app/views/cart_view.dart';
import 'package:store_app/views/contact_us.dart';
import 'package:store_app/views/home_view.dart';
import 'package:store_app/views/login_view.dart';
import 'package:store_app/views/products_from_category.dart';
import 'package:store_app/views/register_view.dart';

void main() {
  runApp(StoreApp());
  GetCategories().getCategories();
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginView.id: (context) => LoginView(),
        RegisterView.id: (context) => RegisterView(),
        CartView.id: (context) => CartView(),
        ProductsFromCategory.id: (context) => ProductsFromCategory(),
        AboutStore.id: (context) => AboutStore(),
        ContactUs.id: (context) => ContactUs(),
      },
      home: LoginView(),
    );
  }
}
