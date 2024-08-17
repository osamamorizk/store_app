import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});
  static String id = 'contact';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Text(
              'Contact us  ',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.contact_support_outlined)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 75,
            ),
            Text(
              'Contact Us ',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "We’re here to help! If you have any questions,or need assistance with our app, please don’t hesitate to reach out.",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Email',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold),
            ),
            const Row(
              children: [
                Icon(Icons.email),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "osamarizk262@gmail.com",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Phone',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold),
            ),
            const Row(
              children: [
                Icon(Icons.phone),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "+20 1063198136",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
