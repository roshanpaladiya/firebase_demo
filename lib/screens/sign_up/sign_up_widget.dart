import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testdemo/screens/common/common_text_field.dart';
import 'package:testdemo/screens/sign_up/sign_up_controller.dart';
import 'package:testdemo/services/pref_service.dart';
import 'package:testdemo/utils/preffernce_res.dart';


Widget signUpPageNameTextField() {
  return GetBuilder<SignUpPageController>(
    builder: (controller) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: commonTextField(
          "Name",
          "Name",
          const Icon(Icons.account_box_rounded),
          false,
          controller.name,
          TextInputType.text),
    ),
  );
}

Widget signUpPageNumberTextField() {
  return GetBuilder<SignUpPageController>(
    builder: (controller) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: commonTextField("Number", "Number", const Icon(Icons.dialer_sip),
          false, controller.number, TextInputType.number),
    ),
  );
}

Widget signUpPageEmailTextField() {
  return GetBuilder<SignUpPageController>(
    builder: (controller) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: commonTextField(
          "E-mail",
          "e-mail",
          const Icon(Icons.mail_lock_outlined),
          false,
          controller.email,
          TextInputType.emailAddress),
    ),
  );
}

Widget signUpPagePasswordTextField() {
  return GetBuilder<SignUpPageController>(
    builder: (controller) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: commonTextField("Password", "Password", const Icon(Icons.password),
          true, controller.password, TextInputType.text),
    ),
  );
}

Widget signUpPageConfirmPasswordTextField() {
  return GetBuilder<SignUpPageController>(
    builder: (controller) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: commonTextField(
          "Confirm Password",
          "Confirm Password",
          const Icon(Icons.password),
          true,
          controller.confirmPassword,
          TextInputType.text),
    ),
  );
}

Widget signUpButton() {
  return GetBuilder<SignUpPageController>(
    builder: (controller) => Padding(
      padding: const EdgeInsets.only(bottom: 50, top: 30),
      child: SizedBox(
        height: 50,
        width: 200,
        child: ElevatedButton(
          onPressed: (){
            PrefServices.setValue(PrefRes.isSignUp, true);
            controller.signUpButton();
          },
          // onPressed: () => controller.signUpButton(),
          child: const Text('Sign Up'),
        ),
      ),
    ),
  );
}
