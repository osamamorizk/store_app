import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: 200,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            height: 300,
            width: 200,
            image: NetworkImage(
              'https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcGYtbXUxNC10ZWQ2MTM1LWpqLWFldy1sLmpwZw.jpg',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Shampo',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Text(
            r'$250',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
