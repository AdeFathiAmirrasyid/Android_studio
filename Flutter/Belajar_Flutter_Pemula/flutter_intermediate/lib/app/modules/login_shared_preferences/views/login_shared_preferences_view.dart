import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_shared_preferences_controller.dart';

class LoginSharedPreferencesView
    extends GetView<LoginSharedPreferencesController> {
  const LoginSharedPreferencesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Shared Preferences'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            autocorrect: false,
            controller: controller.emailController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(height: 10),
          Obx(
            () => TextField(
              autocorrect: false,
              controller: controller.passwordController,
              obscureText: controller.isHidden.value,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  suffixIcon: IconButton(
                    onPressed: () => controller.showPassword(),
                    icon: controller.isHidden.isTrue
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.remove_red_eye_outlined),
                  )),
            ),
          ),
          const SizedBox(height: 10),
          Obx(() => CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text("remember me"),
              value: controller.rememberme.value,
              onChanged: (value) => controller.rememberme.toggle(),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => controller.login(),
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(12)),
            child: const Text(
              "Login",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
