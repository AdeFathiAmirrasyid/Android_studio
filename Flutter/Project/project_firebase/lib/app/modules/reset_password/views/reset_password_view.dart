import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_firebase/app/controllers/auth_controller.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  ResetPasswordView({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () => authController.resetPassword(
                      controller.emailController.text,
                    ),
                child: const Text("Reset")),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Sudah punya akun ? "),
                TextButton(
                    onPressed: () => Get.back(), child: const Text("Login"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
