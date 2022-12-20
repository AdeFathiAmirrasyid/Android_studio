import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController(text: "adefathi.amirrasyid11@gmail.com");

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
