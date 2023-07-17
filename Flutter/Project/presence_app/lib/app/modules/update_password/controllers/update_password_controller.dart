import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdatePasswordController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController currentController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  void updatePassword() async {
    if (currentController.text.isNotEmpty &&
        newController.text.isNotEmpty &&
        confirmController.text.isNotEmpty) {
      if (newController.text == confirmController.text) {
        try {
          String emailUser = auth.currentUser!.email!;
          await auth.signInWithEmailAndPassword(email: emailUser, password: currentController.text);
          await auth.currentUser!.updatePassword(newController.text);
          Get.back();
          Get.snackbar("Berhasil", "Berhasil update password");
        } on FirebaseException catch (e) {
          if (e.code == "wrong-password") {
            Get.snackbar("Terjadi Kesalahan",
                "Password yang dimasukan salah. Tidak dapat update password");
          } else {
            Get.snackbar("Terjadi Kesalahan", e.code.toLowerCase());
          }
        } catch (e) {
          Get.snackbar("Terjadi Kesalahan", "Tidak dapat update password");
        } finally {
          isLoading.value = false;
        }
      } else {
        Get.snackbar("Terjadi Kesalahan", "Confirm password tidak cocok.");
      }
    } else {
      Get.snackbar("Terjadi Kesalahan", "Semua input harus diisi");
    }
  }
}
