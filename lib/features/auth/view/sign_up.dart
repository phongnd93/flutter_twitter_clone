import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_twitter_clone/common/common.dart';
import 'package:flutter_twitter_clone/constants/constants.dart';
import 'package:flutter_twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:flutter_twitter_clone/features/auth/view/login.dart';
import 'package:flutter_twitter_clone/theme/theme.dart';

import '../widgets/auth_field.dart';

class SignUp extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => SignUp());
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void onSignUp() {
    ref.read(authControllerProvider.notifier).signUp(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO:Add loading progress
    final isLoading = ref.watch(authControllerProvider);

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
                    onTap: onSignUp,
                    label: "Signup",
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
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, LoginView.route());
                            })
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
