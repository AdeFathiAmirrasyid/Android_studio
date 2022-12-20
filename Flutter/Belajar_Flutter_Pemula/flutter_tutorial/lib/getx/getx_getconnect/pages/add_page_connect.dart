import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_controller.dart';
import '../controllers/user_controller.dart';

class AddPageConnect extends StatelessWidget {
  final addController = Get.find<AddController>();
  final usersController = Get.find<UserController>();

  AddPageConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD USER"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TextField(
                controller: addController.nameController,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: addController.emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Email Address",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: addController.phoneController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
                onEditingComplete: () => usersController.add(
                  addController.nameController.text,
                  addController.emailController.text,
                  addController.phoneController.text,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => usersController.add(
                  addController.nameController.text,
                  addController.emailController.text,
                  addController.phoneController.text,
                ),
                child: const Text("ADD USER"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
