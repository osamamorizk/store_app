import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:store_app/consts.dart';
import 'package:store_app/cubit/login_cubit/login_cubit.dart';
import 'package:store_app/views/register_view.dart';
import 'package:store_app/widget/custom_button.dart';
import 'package:store_app/widget/custom_navigation_bar.dart';
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

  var formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => CustomBottomNavigationBar()),
              (Route<dynamic> route) => false,
            );
            Fluttertoast.showToast(
                msg: state.authModel.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.SNACKBAR,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(content: Text('Login Success')),
            // );
          } else if (state is LoginFailure) {
            Fluttertoast.showToast(
                msg: 'Invalid creditionals',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(content: Text(state.erroMessage)),
            // );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 90,
                    ),
                    const Image(
                      height: 100,
                      width: 100,
                      image: const AssetImage('assets/login_image.webp'),
                    ),
                    const SizedBox(
                      height: 40,
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
                      obscureText: false,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hint: 'Email',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      obscureText: obscureText,
                      suffixIcon: IconButton(
                        onPressed: () {
                          obscureText = !obscureText;
                          setState(() {});
                        },
                        icon: Icon(obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      controller: passController,
                      keyboardType: TextInputType.visiblePassword,
                      hint: 'Password',
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ConditionalBuilder(
                      condition: state is! LoginLoading,
                      builder: (context) => CustomButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).userLogin(
                              email: emailController.text,
                              password: passController.text,
                            );
                          }
                        },
                        text: 'Sign in',
                      ),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
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
            ),
          );
        },
      ),
    );
  }
}
