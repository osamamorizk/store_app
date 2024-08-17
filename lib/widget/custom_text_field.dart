import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.onPressed,
    this.suffixIcon,
    required this.obscureText,
  });

  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final void Function()? onPressed;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        }
      },
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        fillColor: const Color(0xfff4f4f4),
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(.1),
          ),
        ),
      ),
    );
  }
}
