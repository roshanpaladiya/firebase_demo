import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testdemo/json_model/model_class.dart';
import 'package:testdemo/services/firebase_service.dart';
import 'package:testdemo/utils/firebase_res.dart';

class SignUpPageController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  // File? image;

  signUpButton() async {
    Map<String, dynamic> user = {
      'name': name.text,
      'number': number.text,
      'email': email.text,
      'password': password.text,
    };
    User userModel = User.fromJson(user);
    bool isAddData = await FirebaseServices.addDataInFireBase(
        FirebaseRes.addUser, userModel.toJson());
    if (isAddData) {
      Get.back();
    } else {
      Get.snackbar("SignUp error", "Please Check Again");
    }
    // String userString = PrefServices.getString(PrefRes.userList);
    // List<User> userList = [];

    // PrefServices.setValue(PrefRes.userList, userString);
    Get.back(); // if (userString != '') {
    //   userList = userFromJson(userString);
    //   userList.add(userModel);
    // } else {
    //   userList.add(userModel);
    // }
    // userString = userToJson(userList);
  }

// imagePicker() async {
//   ImagePicker picker = ImagePicker();
//   XFile? images = await picker.pickImage(source: ImageSource.gallery);
//   image = File(images!.path);
//   update(['image']);
// }
}
