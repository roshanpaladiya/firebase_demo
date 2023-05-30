import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testdemo/screens/home/home_controller.dart';
import 'package:testdemo/screens/home/home_screen_widget.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return Scaffold(
      appBar: homeAppbar(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            profile(),
            const SizedBox(height: 20),
            showData(),
          ],
        ),
      ),
    );
  }
}
