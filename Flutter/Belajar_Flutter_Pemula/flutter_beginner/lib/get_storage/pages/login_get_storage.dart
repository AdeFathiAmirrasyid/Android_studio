import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/login_controller.dart';

class LoginGetStorage extends StatelessWidget {
  LoginGetStorage({super.key});

  final box = GetStorage();
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    if (box.read('keyRememberMe') != null) {
      loginController.rememberMe.value = true;
      loginController.emailController.text = box.read("keyRememberMe")['email'];
      loginController.passwordController.text = box.read("keyRememberMe")['password'];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Get Storage"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: loginController.emailController,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
          const SizedBox(height: 10),
          Obx(
            () => TextField(
              controller: loginController.passwordController,
              autocorrect: false,
              keyboardType: TextInputType.text,
              obscureText: loginController.isHidden.value,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      loginController.isHidden.toggle();
                    },
                    icon: loginController.isHidden.isTrue
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.remove_red_eye_outlined),
                  ),
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => CheckboxListTile(
                title: const Text("Remember me"),
                controlAffinity: ListTileControlAffinity.leading,
                value: loginController.rememberMe.value,
                onChanged: (value) {
                  loginController.rememberMe.toggle();
                }),
          ),
          ElevatedButton(
            onPressed: () {
              loginController.loginPage();
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15)),
            child: const Text(
              "Login",
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
