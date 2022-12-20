import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_firebase/app/controllers/auth_controller.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  SignupView({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupView'),
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
            TextField(
              controller: controller.passwordController,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () => authController.signup(
                    controller.emailController.text,
                    controller.passwordController.text),
                child: const Text("Daftar")),
            const SizedBox(
              height: 10,
            ),
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
