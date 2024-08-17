import 'package:flutter/material.dart';
import 'package:store_app/consts%20copy.dart';
import 'package:store_app/views/register_view.dart';
import 'package:store_app/widget/custom_button.dart';
import 'package:store_app/widget/custom_text_field.dart';
import 'package:store_app/widget/qusetion_inauth.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = 'loginPage';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Sign in',
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
            CustomTextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              hint: 'Email',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.visibility),
              ),
              controller: passController,
              keyboardType: TextInputType.visiblePassword,
              hint: 'Password',
            ),
            const SizedBox(
              height: 32,
            ),
            const CustomButton(
              text: 'Sign in',
            ),
            const SizedBox(
              height: 16,
            ),
            QuestionWidget(
              onPressed: () {
                Navigator.pushNamed(context, RegisterView.id);
              },
              action: 'Register',
              question: 'Dont have an account?',
            )
          ],
        ),
      ),
    );
  }
}
