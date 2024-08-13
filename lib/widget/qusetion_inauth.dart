import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.question,
    required this.action,
    this.onPressed,
  });

  final String question;
  final String action;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: const TextStyle(
            fontSize: 17,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(action),
        )
      ],
    );
  }
}
