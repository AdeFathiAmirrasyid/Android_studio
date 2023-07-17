import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class LoginSharedPreferencesController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isHidden = true.obs;
  RxBool rememberme = false.obs;
  void showPassword() => isHidden.toggle();

  void login() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      if (emailController.text == "admin@gmail.com" &&
          passwordController.text == "admin") {
        if (prefs.getStringList('data') != null) {
          await prefs.remove('data');
        }

        if (rememberme.isTrue) {
          await prefs.setStringList(
              'data', <String>[
                emailController.text,
            passwordController.text,
          ]);
        }

        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar("Terjadi Kesalahan", "Email atau Password salah",
            backgroundColor: Colors.grey[300],
            duration: const Duration(seconds: 2));
      }
    } catch (error) {
      print(error);
    }
  }

  loadData() async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getStringList("data") != null){
      final List<String>? items = prefs.getStringList('data');
      rememberme.value = true;
      emailController.text = items![0];
      passwordController.text = items[1];
    }
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
