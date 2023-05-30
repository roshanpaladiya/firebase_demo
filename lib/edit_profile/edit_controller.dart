import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testdemo/screens/home/home_controller.dart';

class EditProfileController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();

  HomeScreenController homeScreenController = HomeScreenController();

  void onPressedEditProfile() {
    Get.find<HomeScreenController>().loginUser?.name = name.text;
    Get.find<HomeScreenController>().loginUser?.email = email.text;
    Get.find<HomeScreenController>().loginUser?.number = number.text;
    update();
    Get.back();
  }
}
