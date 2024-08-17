import 'package:flutter/material.dart';

class CustomPlusButton extends StatelessWidget {
  const CustomPlusButton({
    super.key,
    required this.icon,
  });
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(.3),
          borderRadius: BorderRadius.circular(32)),
      child: IconButton(
        iconSize: 24,
        onPressed: () {},
        icon: icon,
      ),
    );
  }
}
