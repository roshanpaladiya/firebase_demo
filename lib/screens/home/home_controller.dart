import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testdemo/edit_profile/edit_controller.dart';
import 'package:testdemo/edit_profile/edit_screen.dart';
import 'package:testdemo/json_model/model_class.dart';
import 'package:testdemo/screens/login/login_screen.dart';
import 'package:testdemo/screens/sign_up/sign_up.dart';
import 'package:testdemo/services/pref_service.dart';
import 'package:testdemo/utils/preffernce_res.dart';
import 'package:testdemo/utils/string_res.dart';


class HomeScreenController extends GetxController {
  File? profileImage;

  User? loginUser;
  List<User>? allUserList;

  @override
  void onInit() {
    getLoginUser();
    getAllSignUpUsers();
    // TODO: implement onInit
    super.onInit();
  }

  void getLoginUser() {
    String loginUserString = PrefServices.getString(PrefRes.loginUser);
    loginUser = User.fromJson(json.decode(loginUserString));
    update();
  }

  void getAllSignUpUsers() {
    String allUserListString = PrefServices.getString(PrefRes.userList);
    allUserList = userFromJson(allUserListString);
    update();
  }

  void onPressedLogOutButton() {
    Get.dialog(
      SimpleDialog(
        title: const Text(StringRes.logoutText),
        children: [
          TextButton(
            onPressed: onPressedLogOut,
            child: const Text(
              StringRes.logoutText,
              // style: TextStyle(color: ColorResources.redColor),
            ),
          ),
          TextButton(
            onPressed: onPressedCancel,
            child: const Text(StringRes.cancelText),
          ),
        ],
      ),
    );
  }

  void onPressedAddAccountButton() {
    Get.dialog(
      SimpleDialog(
        title: const Text(StringRes.addAccountText),
        children: [
          TextButton(
            onPressed: onPressedAddAccount,
            child: const Text(
              StringRes.addAccountText,
              // style: TextStyle(color: ColorResources.greenColor),
            ),
          ),
          TextButton(
            onPressed: onPressedCancel,
            child: const Text(StringRes.cancelText),
          ),
        ],
      ),
    );
  }

  void onPressedEditProfile() {
    Get.find<EditProfileController>().name.text = loginUser!.name ?? '';
    Get.find<EditProfileController>().email.text = loginUser!.email ?? '';
    Get.find<EditProfileController>().number.text = loginUser!.number ?? '';

    Get.to(const EditProfileScreen())!.then((value) {
      if (value != null) {
        loginUser = value;
        PrefServices.setValue(
          PrefRes.loginUser,
          json.encode(
            loginUser!.toJson(),
          ),
        );
        int loginUserIndex =
            allUserList!.indexWhere((element) => element == loginUser);
        allUserList![loginUserIndex] = loginUser!;
        String allUserString = userToJson(allUserList!);
        PrefServices.setValue(PrefRes.userList, allUserString);
      }
    });
  }

  Future<void> onTapSelectImage() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    profileImage = File(pickedImage!.path);
    update();
  }

  void onHorizontalDragEnd(DragEndDetails details) {
    --allUserList!.length;
    update();
  }

  void onPressedLogOut() {
    Get.offAll(const LoginPage());
  }

  void onPressedAddAccount() {
    Get.offAll(const SignUpPage());
  }

  void onPressedCancel() {
    Get.back();
  }
}
