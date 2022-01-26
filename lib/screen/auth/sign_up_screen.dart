// ignore_for_file: unused_import

import 'package:ezcommerce/provider/auth_provider.dart';
import 'package:ezcommerce/shared/theme.dart';
import 'package:ezcommerce/widget/custom_widget/custom_button.dart';
import 'package:ezcommerce/widget/custom_widget/custom_tac_button.dart';
import 'package:ezcommerce/widget/custom_widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handlesignUp() async {
      bool? signUp = await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      if (signUp ?? false) {
        Get.toNamed('/home');
      } else {
        Get.snackbar(
          'Oopss!',
          'Failed to login',
          colorText: whiteColor,
          backgroundColor: redColor,
          icon: Icon(
            Icons.warning_amber,
            color: whiteColor,
          ),
          margin: const EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
          ),
        );
      }
    }

    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 112),
            child: Image.asset(
              'assets/logo.png',
              width: 72,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Welcome to EZcommerce',
            style: blackTextstyle.copyWith(
              fontSize: 18,
              fontWeight: bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Sign in to continue',
            style: greyTextstyle.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      );
    }

    Widget content() {
      Widget inputName() {
        return CustomTextField(
          imageUrl: 'assets/icon_user.png',
          hintText: 'Full Name',
          obscureText: false,
          controller: nameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Fill your name field';
            }
          },
        );
      }

      Widget inputUsername() {
        return CustomTextField(
          imageUrl: 'assets/icon_user.png',
          hintText: 'Username',
          obscureText: false,
          controller: usernameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Fill your username field';
            }
          },
        );
      }

      Widget inputEmail() {
        return CustomTextField(
          imageUrl: 'assets/icon_email.png',
          hintText: 'Your email',
          obscureText: false,
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Fill your email field';
            }
          },
        );
      }

      Widget inputPassword() {
        return CustomTextField(
          imageUrl: 'assets/icon_password.png',
          hintText: 'Password',
          obscureText: false,
          controller: passwordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Fill your password field';
            }
          },
        );
      }

      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            const SizedBox(height: 20),
            inputName(),
            const SizedBox(height: 20),
            inputUsername(),
            const SizedBox(height: 20),
            inputEmail(),
            const SizedBox(height: 20),
            inputPassword(),
            const SizedBox(height: 20),
          ],
        ),
      );
    }

    Widget buttonSignUp() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: CustomButton(
          text: 'Sign Up',
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              handlesignUp();
            }
          },
          color: primaryColor,
        ),
      );
    }

    Widget tacButton() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: CustomTacButton(
          text: 'Have an account? ',
          button: 'Sign In',
          onPressed: () {
            Get.toNamed('/signin');
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              header(),
              content(),
              buttonSignUp(),
              const SizedBox(height: 24),
              const Spacer(),
              tacButton(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
