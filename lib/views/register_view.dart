import 'package:flutter/material.dart';
import 'package:store_app/consts%20copy.dart';
import 'package:store_app/widget/custom_button.dart';
import 'package:store_app/widget/custom_text_field.dart';
import 'package:store_app/widget/qusetion_inauth.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = 'RegisterPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    color: kcolor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              hint: 'Email',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              hint: 'Password',
            ),
            const SizedBox(
              height: 32,
            ),
            const CustomButton(
              text: 'Register',
            ),
            const SizedBox(
              height: 16,
            ),
            QuestionWidget(
              onPressed: () {
                Navigator.pop(context);
              },
              action: 'Login',
              question: 'Have an account?',
            )
          ],
        ),
      ),
    );
  }
}
