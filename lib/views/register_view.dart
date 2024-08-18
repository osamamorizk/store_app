import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:store_app/consts.dart';
import 'package:store_app/cubit/register_cubit/register_cubit.dart';
import 'package:store_app/views/login_view.dart';
import 'package:store_app/widget/custom_button.dart';
import 'package:store_app/widget/custom_navigation_bar.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginView()),
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
          } else if (state is RegisterFailure) {
            Fluttertoast.showToast(
                msg: state.authModel.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.SNACKBAR,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
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
                          obscureText: false,
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          hint: 'Name',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          obscureText: false,
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          hint: 'Phone',
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
                          condition: state is! RegisterLoading,
                          builder: (context) => CustomButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<RegisterCubit>(context)
                                    .userRegister(
                                  phone: phoneController.text,
                                  email: emailController.text,
                                  password: passController.text,
                                  name: nameController.text,
                                );
                              }
                            },
                            text: 'Register',
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),

                        // CustomButton(
                        //   onTap: () {
                        //     BlocProvider.of<RegisterCubit>(context).userRegister(
                        //       email: emailController.text,
                        //       password: passController.text,
                        //       name: nameController.text,
                        //     );
                        //   },
                        //   text: 'Register',
                        // ),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
