import 'package:flutter/material.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(.3),
            borderRadius: BorderRadius.circular(32)),
        height: 40,
        width: 90,
        child: Center(
            child: Text(
          "Add to cart",
          style: TextStyle(fontSize: 15),
        )),
      ),
    );
  }
}
