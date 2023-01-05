import 'package:chat_app/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_status_controller.dart';

class UpdateStatusView extends GetView<UpdateStatusController> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    controller.statusController.text =
        authController.userModel.value.status ?? "";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back,color: Colors.white),
        ),
        backgroundColor: Colors.red[900],
        title: const Text('Update Status', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.statusController,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                authController.updateStatus(controller.statusController.text);
              },
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  labelText: "Status",
                  labelStyle: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {
                  authController.updateStatus(controller.statusController.text);
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    backgroundColor: Colors.red[900]),
                child: const Text(
                  "Update",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
