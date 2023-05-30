import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testdemo/screens/common/common_text_field.dart';
import 'package:testdemo/screens/login/login_controller.dart';

Widget loginPageTextField() {
  return GetBuilder<LoginPageController>(
    builder: (controller) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: commonTextField(
          "e-mail",
          "e-mail",
          const Icon(Icons.mail_lock_outlined),
          false,
          controller.email,
          TextInputType.emailAddress),
    ),
  );
}

Widget loginPagePasswordTextField() {
  return GetBuilder<LoginPageController>(
    builder: (controller) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: commonTextField("Password", "Password", const Icon(Icons.password),
          true, controller.password, TextInputType.text),
    ),
  );
}

Widget loginButton() {
  return GetBuilder<LoginPageController>(
    builder: (controller) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 50,
        width: 200,
        child: ElevatedButton(
          onPressed: () => controller.check(),
          child: const Text('Login'),
        ),
      ),
    ),
  );
}

Widget textSignUpButton() {
  return GetBuilder<LoginPageController>(
    builder: (controller) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?"),
        TextButton(
          onPressed: () => controller.textSignUpButton(),
          child: const Text('Sign Up'),
        ),
      ],
    ),
  );
}
