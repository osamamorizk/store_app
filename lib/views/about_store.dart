import 'package:flutter/material.dart';
import 'package:store_app/consts.dart';

class AboutStore extends StatelessWidget {
  const AboutStore({super.key});
  static String id = 'about';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Text(
              'Our Store  ',
              style: TextStyle(
                  color: kcolor, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.handshake_outlined)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Our Store!',
              style: TextStyle(
                  fontSize: 28, color: kcolor, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Dive into a world of exclusive products and unbeatable deals. Whether you're searching for the latest trends, unique finds, or everyday essentials, we have something just for you. ",
              style: TextStyle(fontSize: 22, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
