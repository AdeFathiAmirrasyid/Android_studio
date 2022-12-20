import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/login_controller.dart';

class HomeStorage extends StatelessWidget {
  final loginController = Get.find<LoginControllerStorage>();
  final authController = Get.find<AuthControllerStorage>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Storage"),),
      floatingActionButton: FloatingActionButton(
        onPressed: () => authController.logout(loginController.rememberme.value),
        child: const Icon(Icons.logout),
      ),
    );
  }
}
