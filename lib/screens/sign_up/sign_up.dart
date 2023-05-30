import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testdemo/screens/sign_up/sign_up_controller.dart';
import 'package:testdemo/screens/sign_up/sign_up_widget.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpPageController signUpPageController = Get.put(SignUpPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  imagePick(),
              signUpPageNameTextField(),
              signUpPageNumberTextField(),
              signUpPageEmailTextField(),
              signUpPagePasswordTextField(),
              signUpPageConfirmPasswordTextField(),
              signUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}
