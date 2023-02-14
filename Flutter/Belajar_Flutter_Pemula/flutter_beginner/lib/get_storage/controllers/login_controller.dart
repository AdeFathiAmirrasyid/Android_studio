import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isHidden = true.obs;
  RxBool rememberMe = false.obs;

  void loginPage() async {
    final box = GetStorage();
    try {
      if (emailController.text == "admin@gmail.com" &&
          passwordController.text == "admin") {
        if (box.read('keyRememberMe') != null) {
          box.remove('keyRememberMe');
        }

        if (rememberMe.isTrue) {
          // simpan data email dan password
          box.write("keyRememberMe", {
            "email": emailController.text,
            "password": passwordController.text
          });
        }
        Get.offAllNamed('/home');
      } else {
        Get.snackbar("Error", "Email dan password tidak sesuai ",
            backgroundColor: Colors.grey[300]);
      }
    } catch (error) {
      print(error);
      Get.defaultDialog(title: "Error", content: Text("$error"));
    }
  }
}
