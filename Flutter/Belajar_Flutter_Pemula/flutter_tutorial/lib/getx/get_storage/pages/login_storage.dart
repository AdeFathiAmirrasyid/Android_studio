import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/login_controller.dart';

class LoginStorage extends StatelessWidget {
  final loginController = Get.find<LoginControllerStorage>();
  final authController = Get.find<AuthControllerStorage>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Storage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: loginController.emailController,
              decoration: const InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            Obx(
              () => TextField(
                controller: loginController.passwordController,
                obscureText: loginController.hidden.value,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () => loginController.hidden.toggle(),
                        icon: loginController.hidden.isTrue
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.remove_red_eye_outlined)),
                    labelText: 'Password',
                    border: const OutlineInputBorder()),
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => CheckboxListTile(
                value: loginController.rememberme.value,
                onChanged: (value) => loginController.rememberme.toggle(),
                title: const Text("Remember me"),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            ElevatedButton(
                onPressed: () => authController.login(
                    loginController.emailController.text,
                    loginController.passwordController.text,
                    loginController.rememberme.value),
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
