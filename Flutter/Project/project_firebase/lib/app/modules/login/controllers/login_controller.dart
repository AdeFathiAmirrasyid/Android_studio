import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController(text: "adefathi.amirrasyid11@gmail.com");
  TextEditingController passwordController = TextEditingController(text: '123123');

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
