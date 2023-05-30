import 'dart:io';

import 'package:get/get.dart';

class InternetConnection {
  static checkUserConnection() async {
    bool activeConnection = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        activeConnection = true;
      }
    } on SocketException catch (error) {
      activeConnection = false;
      Get.snackbar("Connection Error", "Turn on Internet Data");
    }
  }
}
