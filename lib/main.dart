import 'package:flutter/material.dart';
import 'package:store_app/views/login_view.dart';
import 'package:store_app/views/register_view.dart';

void main() {
  runApp(StoreApp());
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
      },
      home: LoginView(),
    );
  }
}
