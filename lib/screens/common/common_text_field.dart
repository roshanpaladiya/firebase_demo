import 'package:flutter/material.dart';

Widget commonTextField(String hintText, String labeltext, Widget preffixIcon,
    bool obSecureText, TextEditingController controller,TextInputType keyboardType) {
  return SizedBox(
    height: 55,
    child: TextField(
      cursorHeight: 30,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obSecureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: preffixIcon,
        hintText: hintText,
        labelText: labeltext,
        // prefixIcon: preffixIcon,
      ),
    ),
  );
}
