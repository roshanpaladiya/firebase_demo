
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testdemo/edit_profile/edit_controller.dart';
import 'package:testdemo/utils/string_res.dart';


PreferredSizeWidget editProfileAppbar() => AppBar(
  centerTitle: true,
  title: const Text(StringRes.editProfileText),
);



Widget textFieldName () => GetBuilder<EditProfileController>(
    builder: (controller) => TextField(
      controller: controller.name,
      decoration: InputDecoration(
        label: const Text('name'),
        prefixIcon: const Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ));

Widget textFieldUserName() => GetBuilder<EditProfileController>(
    builder: (controller) => TextField(
      controller: controller.email,
      decoration: InputDecoration(
        label: const Text('email'),
        prefixIcon: const Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ));

Widget textFieldMobileNo() => GetBuilder<EditProfileController>(
    builder: (controller) => TextField(
      controller: controller.number,
      decoration: InputDecoration(  label: const Text('mobile no'),
        prefixIcon: const Icon(Icons.dialer_sip),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ));

Widget editProfileButton() => GetBuilder<EditProfileController>(
  builder: (controller) => ElevatedButton(
    onPressed: controller.onPressedEditProfile,
    child: const Text(StringRes.signUpButtonext),
  ),
);
