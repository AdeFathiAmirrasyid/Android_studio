import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginControllerStorage extends GetxController {
  var hidden = true.obs;
  var rememberme = false.obs;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() async {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    final box = GetStorage();
    if (box.read('dataUser') != null) {
      final data = box.read('dataUser') as Map<String, dynamic>;
      emailController.text = data['email'];
      passwordController.text = data['password'];
      rememberme.value = data['rememberme'];
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
