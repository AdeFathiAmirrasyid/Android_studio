import 'package:flutter/material.dart';
import 'package:flutter_tutorial/getx/getx_getconnect/controllers/profile_controller.dart';
import 'package:flutter_tutorial/getx/getx_getconnect/models/user_connect.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class ProfilePageConnect extends StatelessWidget {
  final profileController = Get.find<ProfileController>();
  final userController = Get.find<UserController>();
  final String uid = Get.arguments;

  ProfilePageConnect({super.key});

  @override
  Widget build(BuildContext context) {
    final UserConnect user = userController.userConnectById(uid);
    profileController.nameController.text = user.name!;
    profileController.emailController.text = user.email!;
    profileController.phoneController.text = user.phone!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("PROFILE"),
        actions: [
          IconButton(
            onPressed: () => userController.delete(uid).then(
              (deleted) {
                if (deleted) Get.back();
              },
            ),
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TextField(
                controller: profileController.nameController,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: profileController.emailController,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: profileController.phoneController,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onEditingComplete: () => userController.edit(
                  uid,
                  profileController.nameController.text,
                  profileController.emailController.text,
                  profileController.phoneController.text,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => userController.edit(
                  uid,
                  profileController.nameController.text,
                  profileController.emailController.text,
                  profileController.phoneController.text,
                ),
                child: const Text("UPDATE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
