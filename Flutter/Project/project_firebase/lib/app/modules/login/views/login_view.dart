import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_firebase/app/controllers/auth_controller.dart';
import 'package:project_firebase/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
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
            const SizedBox(height: 10),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () => Get.toNamed(Routes.RESET_PASSWORD), child: const Text("Reset Password"),

                )),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () => authController.login(
                    controller.emailController.text,
                    controller.passwordController.text),
                child: const Text("Login")),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Belum punya akun ? "),
                TextButton(
                    onPressed: () => Get.toNamed(Routes.SIGNUP),
                    child: const Text("DAFTAR SEKARANG"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
