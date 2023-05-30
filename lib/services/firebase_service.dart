import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:testdemo/services/internet_connection.dart';

class FirebaseServices {
  static FirebaseDatabase database = FirebaseDatabase.instance;

  ///---------------------------------- Set Value ---------------------------------///

  static Future<bool> addDataInFireBase(String add, dynamic value) async {
    bool isAddData = false;
    bool connection = await InternetConnection.checkUserConnection();
    if (connection) {
      try {
        String? key = database.ref(add).push().key;
        add = "${add}/${key}";
        DatabaseReference _dataRef = database.ref(add);
        await _dataRef.set(value).then((value) {
          isAddData = true;
        });
      } on PlatformException catch (error, stackTrace) {
        if (kDebugMode) {
          print(stackTrace);
        }
        isAddData = false;
        Get.snackbar("SignUp error", error.message!);
      } catch (e) {
        Get.snackbar("SignUp error", "$e");
        isAddData = false;
      }
    }
    return isAddData;
  }

///--------------------------------- Get Data -----------------------------------///

  static Future<Map?> getAllData(String key) async {
    Map? allData;
    bool connection = await InternetConnection.checkUserConnection();
    if (connection) {
      try {
        DatabaseReference reference = database.ref(key);
        await reference.get().then((value) {
          allData = value.value as Map<String, dynamic>;
        });
      } on PlatformException catch (error, stackTrace) {
        if (kDebugMode) {
          print(stackTrace);
        }
        Get.snackbar("Data error", error.message!);
      } catch (e) {
        Get.snackbar("Data error", "$e");
      }
    }
    return allData;
  }
}
