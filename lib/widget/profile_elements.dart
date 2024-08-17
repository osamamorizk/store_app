import 'package:flutter/material.dart';
import 'package:store_app/consts.dart';

class ProfileElement extends StatelessWidget {
  const ProfileElement({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(.05))),
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              color: kcolor,
            ),
          ),
          trailing: IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
      ),
    );
  }
}
