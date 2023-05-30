import 'dart:async';
import 'package:get/get.dart';
import 'package:testdemo/screens/home/home_screen.dart';
import 'package:testdemo/screens/login/login_screen.dart';
import 'package:testdemo/services/pref_service.dart';
import 'package:testdemo/utils/preffernce_res.dart';


class SpleshController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    bool isLogin = PrefServices.getBool(PrefRes.isSignUp);
    Timer(
        const Duration(seconds: 3), () =>
         Get.off(() => const LoginPage()),
      // () => Get.off(
      //   () => isLogin ? const HomePage() : const LoginPage(),
      // ),
    );
  }
}
