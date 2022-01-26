import 'package:ezcommerce/provider/auth_provider.dart';
import 'package:ezcommerce/shared/theme.dart';
import 'package:ezcommerce/widget/custom_widget/custom_button.dart';
import 'package:ezcommerce/widget/custom_widget/custom_button_oauth.dart';
import 'package:ezcommerce/widget/custom_widget/custom_tac_button.dart';
import 'package:ezcommerce/widget/custom_widget/custom_text_button.dart';
import 'package:ezcommerce/widget/custom_widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      bool? signIn = await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      );
      if (signIn ?? false) {
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

    // Note : Header
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

    // Note: Content
    Widget content() {
      Widget inputEmail() {
        return CustomTextField(
          imageUrl: 'assets/icon_email.png',
          hintText: 'Your email',
          obscureText: false,
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Fill your email address';
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
            const SizedBox(height: 30),
            inputEmail(),
            const SizedBox(height: 20),
            inputPassword(),
          ],
        ),
      );
    }

    Widget buttonSignIn() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: CustomButton(
          text: 'Sign In',
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              handleSignIn();
            } else {}
          },
          color: primaryColor,
        ),
      );
    }

    Widget divider() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Row(children: [
          const Expanded(
            child: Divider(),
          ),
          const SizedBox(width: 20),
          Text(
            'OR',
            style: greyTextstyle.copyWith(
              fontSize: 12,
              fontWeight: bold,
            ),
          ),
          const SizedBox(width: 20),
          const Expanded(
            child: Divider(),
          ),
        ]),
      );
    }

    Widget buttonOauth() {
      Widget buttonGoogle() {
        return CustomButtonOauth(
          text: 'Login with google',
          onPressed: () {},
          imageUrl: 'assets/icon_google.png',
        );
      }

      Widget buttonFacebook() {
        return CustomButtonOauth(
          text: 'Login with google',
          onPressed: () {},
          imageUrl: 'assets/icon_facebook.png',
        );
      }

      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            buttonGoogle(),
            const SizedBox(height: 8),
            buttonFacebook(),
          ],
        ),
      );
    }

    Widget bottomContent() {
      Widget forgotPasswordButton() {
        return const CustomTextButton(
          text: 'Forgot Password',
        );
      }

      Widget tacButton() {
        return CustomTacButton(
          text: 'Don\'t have an account? ',
          button: 'Register',
          onPressed: () {
            Get.toNamed('/signup');
          },
        );
      }

      return Column(
        children: [
          const SizedBox(height: 16),
          forgotPasswordButton(),
          const SizedBox(height: 8),
          tacButton(),
        ],
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              header(),
              content(),
              const SizedBox(height: 20),
              buttonSignIn(),
              const SizedBox(height: 20),
              divider(),
              const SizedBox(height: 16),
              buttonOauth(),
              const Spacer(),
              bottomContent(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
