import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void sendEmail() async {
    if (emailController.text.isNotEmpty) {
      isLoading.value = true;
      try {
        await auth.sendPasswordResetEmail(email: emailController.text);
        Get.snackbar(
            "Berhasil", "Kami telah mengirimkan email reset password. Periksa email kamu");
        Get.back();
      } catch (e) {
        Get.snackbar(
            "Terjadi Kesalahan", "Tidak dapat mengirim email reser password");
      } finally {
        isLoading.value = false;
      }
    }
  }
}
