import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/features/auth/view/screen/register_screen.dart';
import 'package:graduation_app/features/nav_bar/view/screen/main_hom_navbar.dart';

import '../../../../core/styles/text_style.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widget/text_filed_custom_widget.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: Text('Log In'),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              final response = state.userData;

              final userData = jsonDecode(response.toString());

              if (userData['status'] == 'error') {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(userData['message'])));
              }
              if (userData['status'] == 'success') {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(userData['message'])));
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainHomNavbar(
                              token: userData['user']['token'],
                            )));
              }
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('images/train icon.jpg'),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    height: 400,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300],
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        CustomTextField(
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) =>
                              MyValidators.emailValidator(value),
                          label: 'Email',
                          hintText: 'Enter email address',
                        ),
                        CustomTextField(
                          controller: passwordController,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) =>
                              MyValidators.passwordValidator(value),
                          label: 'Password',
                          hintText: 'Enter password',
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[200],
                          ),
                          onPressed: () {
                            AuthCubit.get(context).loginCubit(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          },
                          child: Text('Login', style: mySecondStyle),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()),
                            );
                          },
                          child: Text(
                            'i don\'t have an account',
                            style: myStyle.copyWith(
                                color: Colors.blue, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
