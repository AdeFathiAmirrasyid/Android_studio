import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:chat_app/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_profile_controller.dart';

class ChangeProfileView extends GetView<ChangeProfileController> {
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    controller.emailController.text = authController.userModel.value.email!;
    controller.nameController.text = authController.userModel.value.name!;
    controller.statusController.text =
        authController.userModel.value.status ?? "";

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: Colors.red[900],
        title:
            const Text('Change Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              authController.changeProfile(controller.nameController.text,
                  controller.statusController.text);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            AvatarGlow(
              endRadius: 75,
              glowColor: Colors.black,
              duration: const Duration(seconds: 2),
              child: Container(
                margin: const EdgeInsets.all(15),
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: authController.userModel.value.photoUrl == 'noimage'
                      ? Image.asset("assets/logo/noimage.png",
                          fit: BoxFit.cover)
                      : Image.network(
                          authController.userModel.value.photoUrl!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.emailController,
              readOnly: true,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.nameController,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.statusController,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                authController.changeProfile(controller.nameController.text,
                    controller.statusController.text);
              },
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  labelText: "Status",
                  labelStyle: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<ChangeProfileController>(
                      builder: (controller) => controller.pickedImage != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 110,
                                  height: 125,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            image: DecorationImage(
                                                image: FileImage(File(controller
                                                    .pickedImage!.path)),
                                                fit: BoxFit.cover)),
                                      ),
                                      Positioned(
                                        top: -10,
                                        right: -15,
                                        child: IconButton(
                                            onPressed: () =>
                                                controller.resetImage(),
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    TextButton(
                                        onPressed: () => controller
                                                .uploadImage(authController
                                                    .userModel.value.uid!)
                                                .then((hasilKembalian) {
                                              if (hasilKembalian != null) {
                                                authController.updatePhotoUrl(
                                                    hasilKembalian);
                                              }
                                            }),
                                        child: const Text(
                                          "upload",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                )
                              ],
                            )
                          : const Text("no image")),
                  TextButton(
                      onPressed: () => controller.selectImage(),
                      child: const Text(
                        "chosen",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {
                  authController.changeProfile(controller.nameController.text,
                      controller.statusController.text);
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
