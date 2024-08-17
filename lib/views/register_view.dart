import 'package:flutter/material.dart';
import 'package:store_app/consts%20copy.dart';
import 'package:store_app/widget/custom_button.dart';
import 'package:store_app/widget/custom_text_field.dart';
import 'package:store_app/widget/qusetion_inauth.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static String id = 'RegisterPage';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
              ),
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
      ),
    );
  }
}
