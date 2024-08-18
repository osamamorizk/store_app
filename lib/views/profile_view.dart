import 'package:flutter/material.dart';
import 'package:store_app/helper/shared_pref.dart';
import 'package:store_app/views/about_store.dart';
import 'package:store_app/views/cart_view.dart';
import 'package:store_app/views/contact_us.dart';
import 'package:store_app/widget/profile_elements.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue.withOpacity(.2),
          radius: 55,
          child: Text(
            CahedStorge.getFromCache(key: 'name'),
            style: TextStyle(fontSize: 20, color: Colors.blue[900]),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          CahedStorge.getFromCache(key: 'email'),
          style: TextStyle(fontSize: 20, color: Colors.blue[900]),
        ),
        const SizedBox(
          height: 35,
        ),
        ProfileElement(
          title: 'About Our Store',
          onPressed: () {
            Navigator.pushNamed(context, AboutStore.id);
          },
        ),
        ProfileElement(
          title: 'Cart',
          onPressed: () {
            Navigator.pushNamed(context, CartView.id);
          },
        ),
        ProfileElement(
          title: 'Contact Us',
          onPressed: () {
            Navigator.pushNamed(context, ContactUs.id);
          },
        ),
      ],
    );
  }
}
