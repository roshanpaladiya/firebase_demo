import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testdemo/screens/home/home_controller.dart';
import 'package:testdemo/utils/string_res.dart';

AppBar homeAppbar() => AppBar(
      leading: TextButton(
        onPressed: () =>
            Get.find<HomeScreenController>().onPressedEditProfile(),
        child: const Text(
          StringRes.editProfileText,
          style: TextStyle(
            fontSize: 10,
            color: Colors.white,
          ),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.orange.shade700,
      title: const Text(StringRes.homeAppbarText),
      actions: [
        GetBuilder<HomeScreenController>(
          builder: (controller) => IconButton(
            onPressed: controller.onPressedAddAccountButton,
            icon: const Icon(Icons.account_circle),
          ),
        ),
        GetBuilder<HomeScreenController>(
          builder: (controller) => IconButton(
            onPressed: () => controller.onPressedLogOutButton(),
            icon: const Icon(Icons.logout),
          ),
        ),
      ],
    );

Widget profile() {
  return GetBuilder<HomeScreenController>(
    builder: (controller) => Card(
      color: Colors.orange.shade200,
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: SizedBox(
        height: 160,
        width: 330,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            controller.profileImage != null
                ? Container(
                    height: 80,
                    width: Get.width / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(
                          controller.profileImage!,
                        ),
                      ),
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    ),
                    child: GestureDetector(
                      onTap: () => controller.onTapSelectImage(),
                    ),
                  )
                : GestureDetector(
                    onTap: () => controller.onTapSelectImage(),
                    child: CircleAvatar(
                      radius: 50,
                      child: Center(
                        child: Text(
                          controller.loginUser!.name![0].capitalize.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
            Text(controller.loginUser!.name.toString()),
            Text(controller.loginUser!.email.toString()),
          ],
        ),
      ),
    ),
  );
}

Widget showData() {
  return Expanded(
    child: GetBuilder<HomeScreenController>(
      builder: (controller) => ListView.builder(
        itemCount: controller.allUserList!.length,
        itemBuilder: (context, index) => GestureDetector(
          onHorizontalDragEnd: (details) =>
              controller.onHorizontalDragEnd(details),
          child: Card(
            elevation: 10,
            color: Colors.orange.shade200,
            shape: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(controller.allUserList![index].name![0].capitalize
                    .toString()),
              ),
              title: Text(controller.allUserList![index].name.toString()),
              subtitle: Text(controller.allUserList![index].email.toString()),
            ),
          ),
        ),
      ),
    ),
  );
}
