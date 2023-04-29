import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/common/common.dart';
import 'package:flutter_twitter_clone/constants/constants.dart';
import 'package:flutter_twitter_clone/theme/theme.dart';

import '../widgets/auth_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                //textfield username/email
                AuthField(
                    controller: emailController, hintText: "Email Address"),
                const SizedBox(height: 25),
                //textfield password
                AuthField(controller: passwordController, hintText: "Password"),
                const SizedBox(height: 40),
                //button login
                Align(
                  alignment: Alignment.topRight,
                  child: RoundedButton(
                    onTap: () {},
                    label: "Login",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                //textspan
                RichText(
                    text: TextSpan(
                        text: "Already have an account?",
                        style: const TextStyle(fontSize: 16),
                        children: [
                      TextSpan(
                          text: "Login",
                          style: const TextStyle(
                              color: Pallete.blueColor, fontSize: 16),
                          recognizer: TapGestureRecognizer()..onTap = () {})
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
