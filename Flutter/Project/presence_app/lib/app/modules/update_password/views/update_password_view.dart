import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_password_controller.dart';

class UpdatePasswordView extends GetView<UpdatePasswordController> {
  const UpdatePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UPDATE PASSWORD'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: controller.currentController,
              autocorrect: false,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Current Password", border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.newController,
              autocorrect: false,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "New Password", border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.confirmController,
              autocorrect: false,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Confirm New Password",
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            Obx(() => ElevatedButton(
                onPressed: () {
                  if (controller.isLoading.isFalse) {
                    controller.updatePassword();
                  }
                },
                child: Text((controller.isLoading.isFalse)
                    ? "CHANGE PASSWORD"
                    : "LOADING...")))
          ],
        ));
  }
}
